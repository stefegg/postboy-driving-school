class CreateApplicants < ActiveRecord::Migration[5.2]
  def change
    create_table :applicants do |t|
      t.string :name
      t.string :last_name
      t.string :email
      t.text :address
      t.string :city
      t.text :state
      t.integer :zip
      t.integer :age
      t.string :education
      t.string :course_id
      t.string :cohort_id
      t.string :aid
      t.text :about
      t.boolean :agree

      t.timestamps
    end
    add_index :applicants, :email, unique: true
    add_index :applicants, :aid, unique: true
  end
end
