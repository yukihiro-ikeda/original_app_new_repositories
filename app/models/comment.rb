class Comment < ApplicationRecord
  mount_uploader :audio, AudioUploader
end
