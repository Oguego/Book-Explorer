require 'csv'
require 'open-uri'
require 'rest-client'

class CsvFile < ApplicationRecord
  mount_uploader :file, BookUploader
  after_create :import_books
  after_create :api_request
  validate :validate_books
  after_create :save_attr

  def import_books
    ActiveRecord::Base.transaction do
      begin
        csv_text = open(file.url)
        csv = CSV.parse(csv_text, :headers => true)
        csv.each do |row|
          book_hash = Book.new
          book_hash.title = row["Book title"]
          book_hash.author = Author.find_or_create_by(name: row["Book author"])
          book_hash.published_at = Date.parse(row["Date published"])
          book_hash.uuid = row["Unique identifier for the book"]
          book_hash.publisher_name = row["Publisher name"]
          book_hash.user_id = user_id
          book_hash.save!
        end
      rescue => error
        puts error
        raise ActiveRecord::Rollback, error
        puts "Can't open IO device."
      end
    end
  end


  private
  #==========Validating book, with unique UUID=================================================
  def validate_books
    csv_text = open(file.url)
    csv = CSV.parse(csv_text, :headers => true)
        csv.each do |row|
              book_hash = Book.new
              book_hash.title = row["Book title"]
              book_hash.author = Author.find_or_create_by(name: row["Book author"])
              book_hash.published_at = Date.parse(row["Date published"])
              book_hash.uuid = row["Unique identifier for the book"]
              book_hash.publisher_name =  row["Publisher name"]
              book_hash.user_id = user_id
          unless book_hash.valid?
            self.errors[:base] << "UUID Already exist for #{row["Unique identifier for the book"]}"
          end
        end
  end
  #===============================================================================================

  def api_request
    req = RestClient.post 'https://enbrtwpe490a7.x.pipedream.net', {s3_url: file.url}
    puts req
  end

  def save_attr
    self.update_attributes(file_name: file.file.filename, file_url: file.url.to_s)
  end
end
