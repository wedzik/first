class AddPositionToUsersAndAdmins < ActiveRecord::Migration
  def change
    add_column :admins, :position, :integer, :default => 0
    add_column :users, :position, :integer, :default => 0
  end
end
