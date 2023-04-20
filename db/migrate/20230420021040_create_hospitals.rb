class CreateHospitals < ActiveRecord::Migration[6.0]
  def change
    create_table :hospitals do |t|
      t.string :hospital_name
      t.string :address
      t.string :phone_number
      t.integer :patient_id
      t.integer :doctor_id
      t.integer :nurse_id
      t.integer :other_team_id

      t.timestamps
    end
  end
end
