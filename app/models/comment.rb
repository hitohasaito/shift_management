class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :shift

  validates :content, presence: true
end
