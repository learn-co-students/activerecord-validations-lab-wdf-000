class Post < ActiveRecord::Base
	validates :title, presence: true
	validates :content, length: {minimum: 250}
	validates :summary, length: {maximum: 250}
	validates :category, inclusion: {in: %w(Fiction Non-Fiction), message: "%{value} is not a valid category"}

	validate :clickbait_y

	def clickbait_y
		unless title =~ /Won't Believe|Secret|Guess|Top/
			errors.add(:title, "This is not clickbait")
		end
	end
end
