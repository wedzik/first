class UserFile < ActiveRecord::Base
  belongs_to :user
  attr_accessible :name, :size
  mount_uploader :name, FilesUploader

  def as_json(options={})
    {:files => [
        {:name => self.name.identifier,
        :size => self.size,
        :url =>  self.name.url,
        :thumbnailUrl => self.name.url(:thumb ),
        :deleteUrl => "http:\/\/example.org\/files\/picture1.jpg",
        :deleteType => "DELETE"
        }
        ]
    }

  end
end
