class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :user

  validates :title, presence: true,
  					length: { minimum: 5 }
  validates :body, presence: true
end
