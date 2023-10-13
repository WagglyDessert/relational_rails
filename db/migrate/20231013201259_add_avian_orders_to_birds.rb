class AddAvianOrdersToBirds < ActiveRecord::Migration[7.0]
  def change
    add_reference :birds, :avian_order, null: false, foreign_key: true
  end
end
