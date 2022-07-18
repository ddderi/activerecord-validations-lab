class Post < ActiveRecord::Base
validates :title, presence: true
validates :content, length: {minimum: 250}
validates :summary, length: {maximum: 250}
validates :category, inclusion: {in: %w(fiction non-fiction)}
validate :is_clickbait?
  
    CLICKBAIT_PATTERNS = [
      /Won't Believe/,
      /Secret/,
      /Top [0-9]*/,
      /Guess/
    ]
  
    def is_clickbait?
      if CLICKBAIT_PATTERNS.none? { |pat| pat.match title }
        errors.add(:title, "must be clickbait")
      end
    end


end
