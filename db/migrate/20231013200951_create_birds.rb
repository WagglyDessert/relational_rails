class CreateBirds < ActiveRecord::Migration[7.0]
  def change
    create_table :birds do |t|
      t.string :name
      t.integer :population
      t.boolean :migratory
      t.boolean :sexual_dichromatism

      t.timestamps
    end
  end
end
