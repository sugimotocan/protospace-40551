class AddPrototypesNameToPrototypes < ActiveRecord::Migration[7.0]
  def change
    add_column :prototypes, :prototypes_name, :text
  end
end
