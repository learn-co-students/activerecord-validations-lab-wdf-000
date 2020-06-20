class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction),  message: "%{value} is not a valid category" }
  validate :click_bait, if: :title

  CLICK_BAIT_WORDS = ["Won't Believe", "Secret", "Top", "Guess"]

  def click_bait
    if !CLICK_BAIT_WORDS.find {|click_bait| title.match(click_bait)}
      errors.add(:title, "can't be click bait")
    end
  end

end
