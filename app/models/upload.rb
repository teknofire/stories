class Upload < ActiveRecord::Base
  has_many :chapters, dependent: :destroy
  belongs_to :user

  attachment :file, extension: "zip"
  validate :presence_of_file

  def presence_of_file
    if file.nil?
      errors.add(:file_id, "can't be blank")
    end
  end

  def queue_process
    return if file.nil?
    ProcessUploadJob.perform_later self
  end
end
