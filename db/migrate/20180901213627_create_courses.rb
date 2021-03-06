class CreateCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :courses do |t|
      t.string :name
      t.text :description
      t.integer :hours
      t.string :reward
      t.integer :cost
      t.integer :user_id

      t.timestamps
    end
  end
end
