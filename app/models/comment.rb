class Comment < ApplicationRecord
  mount_uploader :audio, AudioUploader
  validates :content, presence: true, length: { maximum: 255 }
  belongs_to :song
  belongs_to :user
  scope :published, -> {where(publiccomment: true)}
  scope :unpublished, -> {where(publiccomment: false)}
end
