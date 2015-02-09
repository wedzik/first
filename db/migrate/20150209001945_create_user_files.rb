class CreateUserFiles < ActiveRecord::Migration
  def change
    create_table :user_files do |t|
      t.string :name
      t.string :size
      t.references :user, index: true
      t.timestamps
    end
  end
end
