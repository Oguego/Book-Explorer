json.extract! book, :id, :title, :author_id, :published_at, :uuid, :publisher_name, :created_at, :updated_at
json.url book_url(book, format: :json)
