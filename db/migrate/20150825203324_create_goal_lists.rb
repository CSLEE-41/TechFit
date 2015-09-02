class CreateGoalLists < ActiveRecord::Migration
  def change
    create_table :goal_lists do |t|
      t.string :title
      t.integer :current_weight
      t.integer :goal_weight
      t.date :start_date
      t.date :end_date
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
