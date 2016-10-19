class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250,
    too_short: "%{count} characters is the minimum allowed" }
  validates :summary, length: { maximum: 250,
    too_long: "%{count} characters is the maximum allowed" }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction),
    message: "%{value} is not a valid size" }
  validate :clickbait, if: :title



  def clickbait
    if !self.title.include? "Won't Believe" || "Secret" || "Top [number]" || "Guess"
      errors.add(:title, "Need a valid title")
    end
  end

end
