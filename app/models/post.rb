class Post < ActiveRecord::Base

  include ActiveModel::Validations


  validates :title, presence: true
  validates :content, length: { minimum: 250}
  validates :summary, length: { maximum: 250}
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
  validate :clickbaity


  #
#   def clickbaity
#     bait_word = ["Won't Believe", "Secret", "Top", "Guess"].find do |bait|
#       title.match(bait) unless title.nil?
#     end
# binding.
#     if !bait_word
#       errors.add(:title, "not clickbaity enough")
#     end
#   end


    def clickbaity
      if title.nil? || !(title.include?("Won't Believe") || title.include?("Secret") || title.include?("Top") || title.include?("Guess"))
        errors.add(:title, "not clickbaity enough")
      end
    end



end


#
# class MyValidator < ActiveModel::Validator
#
#
#   def validate(record)
#     if !record.title.include?("Won't Believe") || !record.title.include?("Secret") || !record.title.include?("Top") || !record.title.include?("Guess")
#       errors.add(:title, "not clickbaity enough")
#     end
#   end
