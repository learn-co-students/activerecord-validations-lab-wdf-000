class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}

  validate :clickbaity

  def clickbaity
    bait_word = ["Won't Believe", "Secret", "Top", "Guess"].find do |bait|
      # binding.pry
      title.match(bait) unless title.nil?
    end

    if !bait_word
      errors.add(:title, "No clickbait-y enough of a title")
    end

  end

end
