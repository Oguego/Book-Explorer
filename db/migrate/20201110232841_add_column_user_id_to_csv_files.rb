class AddColumnUserIdToCsvFiles < ActiveRecord::Migration[5.0]
  def change
    add_reference :csv_files, :user, foreign_key: true
  end
end
