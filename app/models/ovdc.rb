class Ovdc < ActiveRecord::Base
  alias_attribute :name,:ovdc
  attr_accessible :cpu_alloc, :cpu_limit, :cpu_pct, :cpu_used, :mem_alloc, :mem_free, :mem_limit, :mem_pct, :mem_used, :org, :ovdc, :st_alloc, :st_free, :st_limit, :st_used, :storage_pct

#SEARCHABLES
searchable do
  text :org
  text :ovdc
end
end
