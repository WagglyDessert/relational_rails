class AvianOrder < ApplicationRecord
  has_many :birds, dependent: :destroy

 def sort_birds_by_name
  birds.order([:name])
 end
 
end