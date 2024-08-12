class RemovePrototypesNameFromPrototypes < ActiveRecord::Migration[7.0]
  def change
    remove_column :prototypes, :prototypes_name, :string
  end
end