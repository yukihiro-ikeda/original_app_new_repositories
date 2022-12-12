class Song < ApplicationRecord
  has_many :comments
  belong_to :team
end
