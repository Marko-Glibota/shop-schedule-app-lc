class CreateSchedules < ActiveRecord::Migration[6.1]
  def change
    create_table :schedules do |t|
      t.integer :weekday
      t.time :morning_opening_hour
      t.time :morning_closing_hour
      t.time :afternoon_opening_hour
      t.time :afternoon_closing_hour
      t.references :shop, null: false, foreign_key: true

      t.timestamps
    end
  end
end
