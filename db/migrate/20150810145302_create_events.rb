class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.datetime :start
      t.datetime :end
      t.string :title

      t.timestamps null: false
    end
  end
end
