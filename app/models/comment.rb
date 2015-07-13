class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :micropost
  mount_uploader :picture, PictureUploader
  validates :body, presence: true, length: { maximum: 2000 }
  validates :user_id, presence: true
  validates :micropost_id, presence: true 
  validate  :picture_size

  private

    # Validates the size of an uploaded picture.
    def picture_size
      if picture.size > 5.megabytes
        errors.add(:picture, "should be less than 5MB")
      end
    end

end