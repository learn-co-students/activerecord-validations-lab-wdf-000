class Post < ActiveRecord::Base


  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction || Non-Fiction) }
  validate :click_bait?

  ARR = ["Won't Believe", "Secret", "Top", "Guess"]





  def click_bait?                           #spent so long trying to figure this out wonder why#
    if title                                #to create clickbaits which are my own custom validations
      if ARR.find do |word|                 #i used find to find the string and match it to my title.
        title.match(word)                   #match checks an entire string and matches to see in another
      end                                   #is included in the original string. this is all while validating
    else                                    #that the title exists. because this can only compare while the title exists.
        errors.add(:title, "no clickbait")
      end
    end
  end









end
