class CreateVeterinaryOffices < ActiveRecord::Migration[7.0]
  def change
    create_table :veterinary_offices do |t|
      t.string :name
      t.integer :max_patient_capacity
      t.boolean :boarding_services

      t.timestamps
    end
  end
end
