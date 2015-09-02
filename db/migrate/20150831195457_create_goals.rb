class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.text :goal
      t.boolean :complete
      t.references :user, index: true, foreign_key: true
      t.references :goal_list, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
