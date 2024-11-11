class AiResponse < ApplicationRecord
  belongs_to :user
  belongs_to :cv, class_name: "ActiveStorage::Blob", foreign_key: "blob_id"
end
