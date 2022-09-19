class CreateDoctors < ActiveRecord::Migration[7.0]
  def change
    create_table :doctors do |t|
      t.string :name
      t.string :speciality
      t.string :city
      t.integer :price_per_visit

      t.timestamps
    end
  end
end
