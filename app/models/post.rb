class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction),
    message: "%{value} is not a valid category" }

  validate :title_is_clickbait

  def title_is_clickbait
    unless title =~ /Won't Believe|Secret|Guess|Top\d+/
      errors.add(:title, "This title is not clickbait")
    end
  end

end
