class CreateStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :students do |t|
      t.string :name
      t.string :last_name
      t.string :email
      t.string :address
      t.string :city
      t.string :state
      t.integer :zip
      t.text :about
      t.boolean :agree
      t.integer :age
      t.string :education
      t.integer :cohort_id
      t.integer :course_id
      t.string :sid
      t.boolean :reviewed, default: false
      t.boolean :accepted, default: false
      t.text :rewards

      t.timestamps
    end
    add_index :students, :sid, unique: true
  end
end
