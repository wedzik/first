class RemoveFilesFromUser < ActiveRecord::Migration
  def change
    remove_column :users, :files
  end
end
