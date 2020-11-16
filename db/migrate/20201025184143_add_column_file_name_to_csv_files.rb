class AddColumnFileNameToCsvFiles < ActiveRecord::Migration[5.0]
  def change
    add_column :csv_files, :name, :string
  end
end
