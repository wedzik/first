class AddDisplaynameToUserFiles < ActiveRecord::Migration
  def change
    add_column :user_files, :display_name, :string
  end
end
