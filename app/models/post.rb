class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 100}
  validates :summary, length: {maximum: 200}
  validate :outside_the_choice
  validate :not_clickbait

  def outside_the_choice
    if category != "Fiction" && category != "Non-Fiction"
      errors.add(:category, "can't be outside the choices")
    end
  end

  def not_clickbait
    if title== "True Facts"
      errors.add(:title, "No clickbait!!")
    end
  end

end
