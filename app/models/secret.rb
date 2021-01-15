class Secret < ApplicationRecord
    has_many :comments

    validates :title, presence: true, length: { in: 6..40 }
    validates :content, presence: true, length: { in: 12..400 }
    
end
