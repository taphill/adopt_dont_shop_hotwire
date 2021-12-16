class CreatePets < ActiveRecord::Migration[7.0]
  def change
    create_table :pets do |t|
      t.references :shelter, null: false, foreign_key: true
      t.string :name
      t.integer :age
      t.string :breed
      t.boolean :adoptable

      t.timestamps
    end
  end
end
