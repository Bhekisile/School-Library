require_relative 'book'

class BookApp
  def create_a_book(books)
    print 'Title: '
    title = gets.chomp
    puts 'Author: '
    author = gets.chomp
    books << Book.new(title, author)
    puts 'Book created successfully'
  end
end
