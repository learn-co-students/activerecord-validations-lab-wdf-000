class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  validate :bait?

  private
  def bait?
    if title == "True Facts"
      errors.add(:title,"lol no bait")
    end
  end
end
