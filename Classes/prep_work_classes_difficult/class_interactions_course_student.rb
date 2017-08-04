class Student

  attr_accessor :first_name, :last_name, :name, :courses

  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name = last_name
    @name = "#{@first_name} #{@last_name}"
    #below is an array of all course instances, not just the names of courses
    @courses = []
  end

  def enroll(course) #course refers to entire object/instance of Course class, not just the name
    @courses << course
    @courses.uniq!

    course.students << self
    course.students.uniq!
    #this can also be written as course.students << self.name
    #same thing
  end

  def course_load #this returns a hash of departs and credits
    @course_load = Hash.new(0)
    @courses.each do |course_object| #this refers to entire instance/object
      @course_load[course_object.department] += course_object.credits
    end #hence, instance methods work on them
    @course_load
  end

end

class Course

  attr_reader :name, :department, :credits
  attr_accessor :students

  @@all_courses = []

  def initialize(name, department, credits)
    #resist urge to create a hash within the class.
    #the instance itself can be a kind of object
    @name = name
    @@all_courses << self #creating list of all instances for Student class to interact with
    @department = department
    @credits = credits
    @students = []
  end

  def add_student(student) #this arg refers to the entire instance/object of class Student
    #relies completely on another class
    student.enroll(self)# passing instance to different method
  end

  def self.all_courses
    @@all_courses
  end

end
