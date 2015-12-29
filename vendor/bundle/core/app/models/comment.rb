class Comment < ActiveRecord::Base
  extend Enumerize

  belongs_to :post

  enumerize :state, in: [:unmoderated, :approved, :rejected], default: :unmoderated, predicates: true

  scope :unmoderated, ->() { where(state: 'unmoderated').order("created_at DESC") }
  scope :approved, ->() { where(state: 'approved').order("created_at DESC") }
  scope :rejected, ->() { where(state: 'rejected').order("created_at DESC") }

  validates :body, presence: true
  validates :name, presence: true
  validates :email, email_format: {message: I18n.t(:not_valid_email)}, allow_nil: true, allow_blank: true
end
