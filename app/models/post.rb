class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction),
    message: "%{value} is not a valid category" }

  validate :title_is_clickbait

  def title_is_clickbait
    unless title =~ /Won't Believe|Secret|Guess|Top \d+/
      errors.add(:title, "This title is not clickbait")
    end
  end



### what solution did:
# validate :is_clickbait?

#   CLICKBAIT_PATTERNS = [
#     /Won't Believe/i,
#     /Secret/i,
#     /Top [0-9]*/i,
#     /Guess/i
#   ]

#   def is_clickbait?
#     if CLICKBAIT_PATTERNS.none? { |pat| pat.match title }
#       errors.add(:title, "must be clickbait")
#     end
#   end

end

