require_relative 'rental'

class RentalApp
  def create_a_rental(books, people)
    puts 'Select a book from the following list by number'
    books.each_with_index do |book, index|
      puts "#{index}) Title: #{book.title}, Author: #{book.author}"
    end

    book_index = gets.chomp.to_i

    puts 'Select a person from the following list by number/index (not id)'
    puts
    people.each_with_index do |person, index|
      puts "#{index}) [#{person.class}] ID: #{person.id}, Name: #{person.name}, Age: #{person.age}"
    end

    person_index = gets.chomp.to_i

    print 'Date: '
    rental_date = gets.chomp

    if valid_indices?(person_index, book_index, books, people)
      Rental.new(rental_date, books[book_index], people[person_index])
      puts 'Rental created successfully'
    else
      puts 'Invalid person or book selected.'
    end
  end

  private

  def valid_indices?(person_index, book_index, books, people)
    person_index >= 0 && person_index < people.length && book_index >= 0 && book_index < books.length
  end
end
