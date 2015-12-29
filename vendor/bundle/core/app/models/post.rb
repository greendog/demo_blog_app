require 'acts-as-taggable-on'

class Post < ActiveRecord::Base
  include Slugable
  extend FriendlyId

  friendly_id :title, use: [:slugged, :finders]

  acts_as_taggable
  searchkick

  has_and_belongs_to_many :categories
  has_many :comments, :dependent => :destroy

  accepts_nested_attributes_for :comments

  scope :published, -> { where(draft: false) }
  scope :drafts, -> { where(draft: true) }
  scope :newest_first, -> { order("published_at DESC") }
  scope :published_dates_older_than, ->(date) { newest_first.published_before(date).select(:published_at).map(&:published_at) }
  scope :recent, ->(count) { newest_first.live.limit(count) }
  scope :popular, ->(count) { order("access_count DESC").limit(count) }
  scope :previous, ->(item) { newest_first.published_before(item.published_at).first }
  scope :next, ->(current_record) { where(arel_table[:published_at].gt(current_record.published_at))
                                      .where(:draft => false).order('published_at ASC').first }

  validates :title, presence: true, :uniqueness => true
  validates :body, presence: true
  validates :published_at, :presence => true

  def live?
    !draft && published_at <= Time.now
  end

  class << self
    def published_before(date=Time.now)
      where(arel_table[:published_at].lt(date)).where(:draft => false)
    end
    alias_method :live, :published_before
  end

end
