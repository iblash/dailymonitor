class CreateMedicines < ActiveRecord::Migration[6.0]
  def change
    create_table :medicines do |t|
      t.string :med_name
      t.string :strength
      t.string :dosage
      t.integer :patient_id
      t.integer :doctor_id

      t.timestamps
    end
  end
end
