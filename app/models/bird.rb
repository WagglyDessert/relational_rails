class Bird < ApplicationRecord
  belongs_to :avian_order

  def self.display_true
    where("migratory = true")
  end

  def self.filter_by_population(threshold)
    where('population > ?', threshold)
  end
end