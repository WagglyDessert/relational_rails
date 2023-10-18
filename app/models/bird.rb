class Bird < ApplicationRecord
  belongs_to :avian_order

  def self.display_true
    where("migratory = true")
  end

  def self.population_over_threshold
    
  end
end