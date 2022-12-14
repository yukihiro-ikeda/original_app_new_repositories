class Team < ApplicationRecord
  has_many :songs, dependent: :destroy
  has_many :assigns, dependent: :destroy
  belongs_to :owner, class_name: 'User', foreign_key: :owner_id
end
