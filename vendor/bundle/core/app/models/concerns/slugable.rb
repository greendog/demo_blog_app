module Slugable
  extend ActiveSupport::Concern

  included do
    before_save :set_slug

    private

    def set_slug
      self.slug = generate_slug
    end

    def generate_slug
      Russian::transliterate(title.downcase).mb_chars.normalize(:kd).gsub(/[^\x00-\x7F]/n, '')
          .to_s.downcase.gsub(/[']+/, '').gsub(/\W+/, ' ').strip.gsub(' ', '-')
    end
  end

  module ClassMethods

  end
end