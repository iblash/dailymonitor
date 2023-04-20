class CreateDailyMonitorings < ActiveRecord::Migration[6.0]
  def change
    create_table :daily_monitorings do |t|
      t.string :title
     
      t.text :description
      t.integer :patient_id

      t.timestamps
    end
  end
end
