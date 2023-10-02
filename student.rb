require './person'

class Student < Person
  attr_accessor :classroom

  def initialize(age, parent_permission: true, name = 'Unknown')
    super(name, age, parent_permission)
    @classroom = classroom
  end

  def play_hooky
    return "¯\(ツ)/¯"
  end
end

# st_1 = Student.new("Ree", 15)
# st_2 = Student.new("Jacky", 20)

# puts st_1.can_use_services?
# puts st_2.can_use_services?
# puts st_1.name
# puts st_2.play_hooky
