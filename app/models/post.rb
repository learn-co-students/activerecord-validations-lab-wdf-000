class Post < ActiveRecord::Base
	validates :title, presence: true
  	validates :content, length: { minimum: 250 }
  	validates :summary, length: { maximum: 250 }
  	validates :category, inclusion: { in: %w(Fiction || Non-Fiction) }
  	validate :click_bait?

  	ARR = ["Won't Believe", "Secret", "Top", "Guess"]

  def click_bait?
    if title
      if ARR.find do |word|
        title.match(word)
      end
    else
      errors.add(:title, "no clickbait")
      end
    end
  end
end
