class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 100}
  validates :summary, length: {maximum: 25}
  validate :category_is_valid
  validate :not_clickbait

  def category_is_valid
    if category == "Bowling Ball"
      errors.add(:category, "invalid category")
    end
  end

  def not_clickbait
    if title == "True Facts"
      errors.add(:title, "no clickbait please")
    end
  end 


end
