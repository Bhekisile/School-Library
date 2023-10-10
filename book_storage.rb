require_relative 'book'

class BookStorage
  def save_book(books)
    json_books = books.map do |book|
      {
        'title' => book.title,
        'author' => book.author
      }
    end
    File.open('books.json', 'w') do |file|
      file.write(JSON.generate(json_books))
    end
  end

  def load_books(books)
    if File.exist?('books.json')
      retrieved_books = JSON.parse(File.read('books.json'))
      retrieved_books.each do |book|
        books << Book.new(book['title'], book['author'])
      end
    end
  end
end