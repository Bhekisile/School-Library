class Person
  attr_accessor :name, :age
  attr_reader :id

  def initialize(age, parent_permission: true, name = 'Unknown')
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  private 
  def of_age?
    if age.to_i >= 18
      return true
    end
  end
end

# person_1 = Person.new(17)
# person_2 = Person.new("Nolu", 30)

# puts person_1.can_use_services?
# puts person_2.can_use_services?
# puts person_1.name
