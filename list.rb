class List
  def list_all_books(books)
    puts 'Books unavailable' if books.empty?
    puts
    books.each do |book|
      puts "Title: #{book.title}, Author: #{book.author}"
    end
  end

  def list_all_people(people)
    puts 'List is empty' if people.empty?
    puts
    people.each do |person|
      puts "[#{person.class}] ID: #{person.id}, Name: #{person.name}, Age: #{person.age}"
      puts
    end
  end

  def list_all_rentals(people, rentals)
    print 'ID of person: '
    person_id = gets.chomp.to_i

    puts 'Rentals: '
    rental = rentals.find { |rental| rental.person.id == person_id}
    if rental.nil?
      puts 'Person not found'
    else
      rental.person.rentals.each do |rent|
        puts "Date: #{rent.date} Book: #{rent.book.title} by #{rent.book.author}"
      end
    end
  end
end
