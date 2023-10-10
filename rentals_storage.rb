class RentalsStorage
  def save_rentals(rentals)
    rentals_json = rentals.map do |rental|
      {
        'date' => rental.date,
        'book' => {
          'title' => rental.book.title,
          'author' => rental.book.author
        },
        'person' => {
          'id' => rental.person.id,
          'name' => rental.person.name,
          'type' => rental.person.class.to_s
        }
      }
    end

    File.write('rentals.json', JSON.generate(rentals_json))
  end

  def load_rentals(rentals, books, people)
    return unless File.exist?('rentals.json')

    rentals_data = JSON.parse(File.read('rentals.json'))

    rentals_data.each do |rental|
      duplicate_file = find_duplicate(rentals)

      next if duplicate_file

      date = rental['date']
      book_instance = find_book(books, rental)
      person_instance = find_person(people, rental)
      rentals << Rental.new(date, book_instance, person_instance)
    end
  end

  def find_book(books, rental)
    books.find do |book|
      rental['book']['title'] == book.title &&
        rental['book']['author'] == book.author
    end
  end

  def find_person(people, rental)
    people.find do |person|
      rental['person']['id'] == person.id
    end
  end

  def find_duplicate(rentals)
    rentals.find do |data|
      rental['date'] == data.date &&
        rental['book']['author'] == data.book.author &&
        rental['book']['title'] == data.book.title
    end
  end
end
