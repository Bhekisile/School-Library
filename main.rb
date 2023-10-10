require './app'
require_relative 'list'
require_relative 'book_app'
require_relative 'rental_app'

class Main
  def initialize
    @app = App.new
    run
  end

  def list_of_options
    puts 'Please choose an option by entering a number: '
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Exit'
  end

  def user_option
    gets.chomp
  end

  def choose_option(option)
    list = List.new
    actions = {
      '1' => -> { list.list_all_books(@app.books) },
      '2' => -> { list.list_all_people(@app.people) },
      '3' => -> { @app.create_a_person },
      '4' => -> { BookApp.new.create_a_book(@app.books) },
      '5' => -> { RentalApp.new.create_a_rental(@app.books, @app.people, @app.rentals) },
      '6' => -> { list.list_all_rentals(@app.people, @app.rentals) },
      '7' => lambda {
        @app.save_data
        puts 'Exiting...'
        @running = false
      },
      'default' => -> { puts 'Invalid value' }
    }

    action = actions[option] || actions['default']
    action.call
  end

  def run
    puts 'Welcome to the school library App!'
    @running = true

    while @running
      list_of_options
      selected_option = user_option
      choose_option(selected_option)
    end
  end
end

Main.new
