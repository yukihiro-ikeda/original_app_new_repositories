class Comment < ApplicationRecord
  mount_uploader :audio, AudioUploader
  belongs_to :song
  scope :published, -> {where(publiccomment: true)}
  scope :unpublished, -> {where(publiccomment: false)}
end
