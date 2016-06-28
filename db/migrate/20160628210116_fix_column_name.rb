class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :quotes, :name, :character
  end
end
