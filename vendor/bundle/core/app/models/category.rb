class Category < ActiveRecord::Base
  include Slugable
  extend FriendlyId

  friendly_id :title, use: [:slugged, :finders]

  has_ancestry

  has_and_belongs_to_many :posts

  validates :title, :presence => true, :uniqueness => true

  def post_count
    posts.live.count
  end

  def self.tree

  end
end