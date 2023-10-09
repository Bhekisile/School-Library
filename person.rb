require './nameable'
require './capitalize_decorator'
require './trimmer_decorator'

class Person < Nameable

  attr_accessor :id, :name, :age, :rentals

  def initialize(name = 'Unknown', age = 0, parent_permission: true)
    super()
    @id = Random.rand(1..1000)
    # @id = generate_id
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
