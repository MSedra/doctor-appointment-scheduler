class CreateAppointments < ActiveRecord::Migration[7.0]
  def change
    create_table :appointments do |t|
      t.references :doctor, null: false, foreign_key: true
      t.references :user, null: true, foreign_key: true
      t.datetime :starting_time
      t.datetime :ending_time

      t.timestamps
    end
  end
end
