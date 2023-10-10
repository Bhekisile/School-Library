require './nameable'
require './capitalize_decorator'
require './trimmer_decorator'

class Person < Nameable
  @@count = 1
  attr_accessor :id, :name, :age, :rentals

  def initialize(age = 0, name = 'Unknown', parent_permission: true)
    super()
    @id = @@count
    @@count += 1
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def correct_name
    @name
  end

  def add_rental(date, book)
    Rental.new(date, book, self)
  end

  private

  def of_age?
    age.to_i >= 18
  end
end
