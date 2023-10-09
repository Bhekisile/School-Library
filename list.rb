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

  def list_all_rentals(people)
    print 'ID of person: '
    person_id = gets.chomp.to_i

    person_obj = people.find { |person| person.id == person_id }

    if person_obj.nil?
      puts 'Person not found'
      return
    end

    puts 'Rentals: '
    person_obj.rentals.each do |rental|
      puts "Date: #{rental.date} Book: #{rental.book.title} by #{rental.book.author}"
    end
  end
end
