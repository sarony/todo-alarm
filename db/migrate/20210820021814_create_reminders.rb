class CreateReminders < ActiveRecord::Migration[6.0]
  def change
    create_table :reminders do |t|
      t.time :scheduled_for
      t.references :todo, null: false, foreign_key: true

      t.timestamps
    end
  end
end
