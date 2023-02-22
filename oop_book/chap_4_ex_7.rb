=begin
Create a class 'Student' with attributes name and grade.
Do NOT make the grade getter public, so joe.grade will raise an error.
Create a better_grade_than? method, that you can call like so.

puts "Well done!" if joe.better_grade_than?(bob)
=end

class Student
  attr_writer :grade
  def initialize(name, grade)
    @name = name
    @grade = grade
  end

  def better_grade_than?(other_student)
    grade > other_student.grade
  end

  protected
  attr_reader :grade
end

joe = Student.new('Joe', 45)
bob = Student.new('Bob', 32)

puts "Well done!" if joe.better_grade_than?(bob)