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

    File.open('rentals.json', 'w') do |file|
      file.write(JSON.generate(rentals_json))
    end
  end

  def load_rentals(rentals, books, people)
    if File.exist?('rentals.json')
      rentals_data = JSON.parse(File.read('rentals.json'))

      rentals_data.each do |rental|
        duplicate_file = rentals.find do |data|
          rental['date'] == data.date && rental['book']['author'] == data.book.author && rental['book']['title'] == data.book.title
        end

        unless duplicate_file
          date = rental['date']
          book_instance = books.find do |book|
            rental['book']['title'] == book.title && rental['book']['author'] == book.author
          end

          person_instance = people.find do |person|
            rental['person']['id'] == person.id
          end
          rentals << Rental.new(date, book_instance, person_instance)
        end
      end

    end
  end
end