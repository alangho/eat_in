class Table < ActiveRecord::Base
  belongs_to :user
  has_many :messages

def self.search(cuisine, keywords)
  if cuisine || keywords
  	where("lower(cuisine) like ? AND lower(cuisine) like ?", "%#{cuisine.downcase}%", "%#{keywords.downcase}%")
  else
    @tables = Table.all
  end
end

end