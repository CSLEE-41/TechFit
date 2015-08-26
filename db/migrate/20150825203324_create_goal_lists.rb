class CreateGoalLists < ActiveRecord::Migration
  def change
    create_table :goal_lists do |t|
      t.string :title
      t.integer :current_weight
      t.integer :goal_weight
      t.text :goal_one
      t.text :goal_two
      t.text :goal_three
      t.text :goal_four
      t.date :start_date
      t.date :end_date
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
