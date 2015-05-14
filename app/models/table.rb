class Table < ActiveRecord::Base
  belongs_to :user


def self.search(search, region)
  if search
    where("lower(cuisine) like ? AND lower(region) like ?", "%#{search}%", "%#{region}") 
  else
    @tables = Table.all
  end
end

end
