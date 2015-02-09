class ChangeFilesTypeInUsers < ActiveRecord::Migration
  def change
    change_column :users, :files, :text
  end

end
