class AddDeafultValueToTypeAdmins < ActiveRecord::Migration
  def change
    change_column :admins, :type, :string, :default => 'Admin'
  end
end
