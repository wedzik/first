class AddLastNameAndAgeToUser < ActiveRecord::Migration
  def change
    add_column :users, :last_name, :string
    add_column :users, :age, :integer
  end
end
