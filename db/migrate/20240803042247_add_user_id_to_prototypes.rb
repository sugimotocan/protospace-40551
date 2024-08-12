class AddUserIdToPrototypes < ActiveRecord::Migration[7.0]
  def change
    add_column :prototypes, :user_id, :integer
    add_index :prototypes, :user_id
  end
end