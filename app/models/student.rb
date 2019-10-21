class Student < ApplicationRecord
  has_many :instructor_students
  has_many :instructors, through: :instructor_students

  validates_presence_of :name
  validates_presence_of :cohort
  validates_presence_of :age

  def self.average_age
    average(:age).round(2)
  end
end
