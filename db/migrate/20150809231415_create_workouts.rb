class CreateWorkouts < ActiveRecord::Migration
  def change
    create_table :workouts do |t|
      t.string :title
      t.string :muscle_group
      t.text :body
      t.date :day
      t.text :notes
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
