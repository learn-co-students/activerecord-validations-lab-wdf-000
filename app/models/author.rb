class Author < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true, length: {minimum: 5}
  validates :phone_number, length: {minimum: 10}
end
