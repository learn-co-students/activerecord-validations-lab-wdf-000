class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: ["Fiction", "Non-Fiction"]}

  validate :title_clickbait


  def title_clickbait
    clickbait = ["Won't Believe", "Secret", "Top[number]", "Guess"]
    if Regexp.union(clickbait) =~ title
      return true
    else
      errors.add(:title, "is not clickbait-y")
      return false
    end
  end
end
