class CreateInstructorStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :instructor_students do |t|
      t.references :instructor, foreign_key: true
      t.references :student, foreign_key: true

      t.timestamps
    end
  end
end
