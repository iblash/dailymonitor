class CreateOtherTeams < ActiveRecord::Migration[6.0]
  def change
    create_table :other_teams do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone_number
      t.string :position
      t.string :specialty

      t.timestamps
    end
  end
end
