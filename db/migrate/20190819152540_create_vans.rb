class CreateVans < ActiveRecord::Migration[5.2]
  def change
    create_table :vans do |t|
      t.string :title
      t.text :description
      t.string :address
      t.string :van_model
      t.integer :sleeping_capacity
      t.integer :price_cents
      t.string :photo
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
