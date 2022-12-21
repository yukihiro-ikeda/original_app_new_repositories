class Team < ApplicationRecord
  validates :name, presence: true, length: { maximum: 20 }
  has_many :songs, dependent: :destroy
  has_many :assigns, dependent: :destroy
  has_many :assign_users, through: :assigns, source: :user
  belongs_to :owner, class_name: 'User', foreign_key: :owner_id
end
