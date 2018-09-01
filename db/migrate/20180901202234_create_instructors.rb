class CreateInstructors < ActiveRecord::Migration[5.2]
  def change
    create_table :instructors do |t|
      t.string :name
      t.string :last_name
      t.string :email
      t.string :password_digest
      t.integer :age
      t.integer :salary
      t.string :education
      t.text :bio
      t.string :sid
      t.boolean :admin, default: false

      t.timestamps
    end
    add_index :instructors, :email, unique: true
    add_index :instructors, :sid, unique: true
  end
end
