class AddIndexToUsers < ActiveRecord::Migration[7.0]
  def change
    change_table :users do |t|
      t.index :username, unique: true
    end
  end
end
