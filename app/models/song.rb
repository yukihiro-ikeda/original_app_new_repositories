class Song < ApplicationRecord
  validates :title, presence: true, length: { maximum: 20 }
  has_many :comments, dependent: :destroy
  belongs_to :team
end
