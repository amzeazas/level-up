class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.string :description, null: false
      t.string :details
      t.integer :current_number
      t.integer :target_number
      t.boolean :complete?, default: false
      t.string :completion_details
      t.date :completion_date
      t.integer :category_id

      t.timestamps null: false
    end
  end
end
