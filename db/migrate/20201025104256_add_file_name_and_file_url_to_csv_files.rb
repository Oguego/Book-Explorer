class AddFileNameAndFileUrlToCsvFiles < ActiveRecord::Migration[5.0]
  def change
    add_column :csv_files, :file_name, :string
    add_column :csv_files, :file_url, :string
  end
end
