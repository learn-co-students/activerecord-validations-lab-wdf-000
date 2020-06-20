class Author < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  validates :phone_number, presence: true, uniqueness: true, length: {minimum: 10}
end
