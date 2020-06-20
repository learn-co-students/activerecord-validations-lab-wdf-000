class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  # validate :clickbaity?

  validate :is_clickbait?

  def is_clickbait?
    #baits = [/Won't Believe/i, /Secret/i, /Top [0-9]*/i, /Guess/i]
    baits = [/Won't Believe/i, /Secret/i, /Top [0-9]*/i, /Guess/i]
    if baits.none? { |bait| bait.match title }
      errors.add(:title, "not quite clickbaity")
    end
  end
end
