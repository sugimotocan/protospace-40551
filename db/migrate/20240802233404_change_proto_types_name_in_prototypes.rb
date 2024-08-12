class ChangeProtoTypesNameInPrototypes < ActiveRecord::Migration[7.0]
  def change
    change_column :prototypes, :prototypes_name, :string
  end
end