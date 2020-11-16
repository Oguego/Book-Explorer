require 'csv'
class Book < ApplicationRecord
  belongs_to :author
  validates_uniqueness_of :uuid, :allow_blank => true, :allow_nil => true

end
