class Instructor < ApplicationRecord
  has_many :instructor_students
  has_many :students, through: :instructor_students

  validates_presence_of :name
end
