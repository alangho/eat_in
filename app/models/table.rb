class Table < ActiveRecord::Base
  belongs_to :user
  has_many :messages

	scope :cuisine, -> cuisine { where(:cuisine => cuisine) }
  scope :keywords, -> keywords { where("lower(title) like ? OR lower(cuisine) like ?", 
  																"%#{keywords.downcase}%", "%#{keywords.downcase}%") }

end