
class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length:  { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
  validate :not_clickbait

  V = [ /Won't Believe/i, /Secret/i, /Top [0-9]*/i, /Guess/i ]

  def not_clickbait
     if  V.none? {|s| s.match title}
         errors.add(:title, "No clickbait!!")
     end
  end

end
