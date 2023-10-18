class CreateAvianOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :avian_orders do |t|
      t.string :order
      t.string :families
      t.integer :species
      t.boolean :anisodactyl
      t.boolean :zygodactyl
      t.boolean :tridactyl
      t.boolean :didactyl

      t.timestamps
    end
  end
end
