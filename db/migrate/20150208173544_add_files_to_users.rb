class AddFilesToUsers < ActiveRecord::Migration
  def change
    add_column :users, :files, :string
  end
end
