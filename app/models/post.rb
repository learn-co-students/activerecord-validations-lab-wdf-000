class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
  validate :click_bait, if: :title

  def click_bait
      array = self.title.split(" ")
      if array.grep(/Won't|Believe|Secret|Top\d+|Guess]/).empty?
        errors.add(:title, "can't be clickbait")
      end
  end

end
