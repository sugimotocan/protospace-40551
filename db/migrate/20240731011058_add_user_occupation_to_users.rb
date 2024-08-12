class AddUserOccupationToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :user_occupation, :string
  end
end
