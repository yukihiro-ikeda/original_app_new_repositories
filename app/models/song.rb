class Song < ApplicationRecord
  has_many :comments
  belongs_to :team
end
