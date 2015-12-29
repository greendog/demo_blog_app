class User < ActiveRecord::Base
  extend Enumerize

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable,
         :confirmable

  enumerize :role, in: [:admin, :user], default: nil, predicates: true

  validates :role, presence: true
end
