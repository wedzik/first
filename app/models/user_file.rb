class UserFile < ActiveRecord::Base
  belongs_to :user
  attr_accessible :name, :size, :display_name
  mount_uploader :name, FilesUploader

  def as_json(options={})
        {:name => self.display_name,
        :size => self.size,
        :url =>  self.name.url,
        :thumbnailUrl => self.name.url(:thumb ),
        :deleteUrl => "./delete_file/"+self.id.to_s,
        :deleteType => "DELETE"
        }
  end
end
