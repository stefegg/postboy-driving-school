class CreateStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :students do |t|
      t.string :name
      t.string :last_name
      t.integer :age
      t.string :educaiton
      t.integer :cohort_id
      t.integer :course_id
      t.string :sid

      t.timestamps
    end
    add_index :students, :sid, unique: true
  end
end
