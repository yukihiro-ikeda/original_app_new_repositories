class Song < ApplicationRecord
  has_many :comments, dependent: :destroy
  belongs_to :team
end
