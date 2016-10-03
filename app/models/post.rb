class MyValidator < ActiveModel::Validator
  def validate(post)
    if post.title != nil
      unless post.title.include? "Won't Believe" ||  "Secret" || "Top [number]" || "Guess"
        post.errors[:title] << 'Need a valid title'
      end
    end
  end
end

class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction),
    message: "%{value} is not a Genre" }
  include ActiveModel::Validations
  validates_with MyValidator
end
