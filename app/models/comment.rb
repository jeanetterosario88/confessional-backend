class Comment < ApplicationRecord
  belongs_to :secret

  validates :content, presence: true, length: { in: 5..100 }

end
