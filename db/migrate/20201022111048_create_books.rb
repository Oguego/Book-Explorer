class CreateBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :books do |t|
      t.string :title
      t.belongs_to :author, foreign_key: true
      t.datetime :published_at
      t.string :uuid
      t.string :publisher_name

      t.timestamps
    end
  end
end
