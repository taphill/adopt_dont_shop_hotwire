class CreateVeterinarians < ActiveRecord::Migration[7.0]
  def change
    create_table :veterinarians do |t|
      t.references :veterinary_office, null: false, foreign_key: true
      t.string :first_name
      t.string :last_name
      t.integer :review_rating
      t.boolean :on_call

      t.timestamps
    end
  end
end
