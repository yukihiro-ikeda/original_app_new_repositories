class Comment < ApplicationRecord
  mount_uploader :audio, AudioUploader
  belongs_to :song
end
