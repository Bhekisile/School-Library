require './person'

class Teacher < Person
  attr_accessor :specialization

  def initialize(age, parent_permission: true, name = 'Unknown')
    super(name, age, parent_permission)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end

# teacher_1 = Teacher.new("Rulani", 35)
# teacher_2 = Teacher.new("Jack", 40)

# puts teacher_1.can_use_services?
# puts teacher_2.can_use_services?
# puts teacher_1.name
