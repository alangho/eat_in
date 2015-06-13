class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :micropost

  validates :body, presence: true, length: { maximum: 2000 }
  validates :user_id, presence: true
  validates :micropost_id, presence: true 
end
