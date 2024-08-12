class AddDetailsToPrototypes < ActiveRecord::Migration[7.0]
  def change
    add_column :prototypes, :name, :string unless column_exists?(:prototypes, :name)
    add_column :prototypes, :catch_copy, :string unless column_exists?(:prototypes, :catch_copy)
    add_column :prototypes, :concept, :string unless column_exists?(:prototypes, :concept)
    add_column :prototypes, :image, :string unless column_exists?(:prototypes, :image)
  end
end