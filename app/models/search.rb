class Search < ActiveRecord::Base

def tables
  @tables ||= find_tables
end

private

def find_tables
  Table.find(:all, :conditions => conditions)
end

def keyword_conditions
  ["products.name LIKE ?", "%#{keywords}%"] unless keywords.blank?
end

def cuisine_conditions
  ["table.cuisine LIKE ?", "%#{keywords}%"] unless keywords.blank?
end

def region_conditons
  ["table.region LIKE ?", "%#{keywords}%"] unless keywords.blank?
end

def conditions
  [conditions_clauses.join(' AND '), *conditions_options]
end

def conditions_clauses
  conditions_parts.map { |condition| condition.first }
end

def conditions_options
  conditions_parts.map { |condition| condition[1..-1] }.flatten
end

def conditions_parts
  private_methods(false).grep(/_conditions$/).map { |m| send(m) }.compact
end

end