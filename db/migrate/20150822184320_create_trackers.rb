class CreateTrackers < ActiveRecord::Migration
  def change
    create_table :trackers do |t|
      t.boolean :nutrition
      t.boolean :workout
      t.boolean :goals
      t.boolean :weight
      t.boolean :health
      t.date :day
      t.integer :day_points
      t.integer :overall_points
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
