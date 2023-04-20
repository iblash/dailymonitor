class CreatePatients < ActiveRecord::Migration[6.0]
  def change
    create_table :patients do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone_number
      t.string :transplant_type
      t.string :transplant_date
      t.integer :doctor_id
      t.integer :nurse_id
      t.integer :other_team_id
      t.integer :medicine_id
      t.integer :hospital_id

      t.timestamps
    end
  end
end
