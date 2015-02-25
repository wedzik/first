class UserFile < ActiveRecord::Base
  belongs_to :user
  attr_accessible :name, :size, :display_name
  mount_uploader :name, FilesUploader
  USER_FILE_LIMIT = 10 #10MB

  #validates_uniqueness_of :display_name,  message: "%{value} file already exists."
  validate :file_size
  validate :file_uniq


  def file_size
    if name.file.size.to_f/(1000*1000) > USER_FILE_LIMIT
      errors.add(:base  , "You cannot upload a file greater than #{USER_FILE_LIMIT.to_f}MB")
    end
  end

  def file_uniq
    if user.user_files.find_by_display_name(display_name)
      errors.add(:base  , "File already exists.")
    end
  end

  def as_json(options={})
    res = {:name => self.display_name,
        :size => self.size,
        :url =>  self.name.url,
        :thumbnailUrl => self.name.url(:thumb ),
        :deleteUrl => "./delete_file/"+self.id.to_s,
        :deleteType => "DELETE"
        }
    if self.errors.any?
      res[:error] = self.errors.full_messages
    end
    res
  end
end
