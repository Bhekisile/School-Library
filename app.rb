require 'json'
require_relative 'student_app'
require_relative 'teacher_app'
require_relative 'book_storage'
require_relative 'people_storage'
require_relative 'rentals_storage'

class App
  attr_accessor :books, :people, :rentals

  def initialize
    @books = []
    @people = []
    @rentals = []
    load_data
  end

  def save_data
    puts 'saving data...'
    BookStorage.new.save_book(@books)
    PeopleStorage.new.save_people(@people)
    RentalsStorage.new.save_rentals(@rentals)
  end

  def load_data
    BookStorage.new.load_books(@books)
    PeopleStorage.new.load_people(@people)
    RentalsStorage.new.load_rentals(@rentals, @books, @people)
  end

  def create_a_person
    puts
    print 'Do you want to create a student (1) or a teacher (2)? (Input the number): '
    puts
    person_type = gets.chomp

    case person_type
    when '1'
      StudentApp.new.create_student(@people)
    when '2'
      TeacherApp.new.create_teacher(@people)
    else
      puts
      puts 'Option invalid, please try again'
      puts
    end
  end
end
