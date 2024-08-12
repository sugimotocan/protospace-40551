class RenameAndChangeTypeForPrototypesName < ActiveRecord::Migration[7.0]
  def up
    if column_exists?(:prototypes, :prototypes_name) && !column_exists?(:prototypes, :title)
      rename_column :prototypes, :prototypes_name, :title
      change_column :prototypes, :title, :string
    end
  end

  def down
    if column_exists?(:prototypes, :title) && !column_exists?(:prototypes, :prototypes_name)
      change_column :prototypes, :title, :text
      rename_column :prototypes, :title, :prototypes_name
    end
  end
end