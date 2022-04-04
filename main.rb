
require_relative 'lib/product'
require_relative 'lib/film'
require_relative 'lib/book'
require_relative 'lib/product_collection'
require_relative 'lib/disc'




# film1 = Film.new(title: "Леон", year: 1994, director: "Люк Бессон", price: 990, amount: 5)
# film2 = Film.new(title: "Дурак", director: "Юрий Быков", price: 390)
# book1 = Book.new(title: "Идиот", author: "Федор Достоевский", genre: "роман", price: 1500, amount: 10)
# book1.title= "Братья Карамазовы"
# film1.update(amount: 11)
# film2.update(year: 2000, amount: 6)
# puts film1
# puts film2
# puts book1
# path_film = File.join(__dir__, 'data', 'films', '01.txt')
# path_book = File.join(__dir__, 'data', 'books', '01.txt')
# film = Film.from_file(path_film)
# book = Book.from_file(path_book)
# puts film
# puts book
# product = Product.from_file
# puts product
products_folders = Dir.children(File.join(__dir__, 'data'))
paths = products_folders.map { |folder| Dir[File.join(__dir__, 'data', "#{folder}", '*.txt')]}.flatten
# paths_book = paths.select {|path| path.include?("books")}
# paths_film = paths.select {|path| path.include?("films")}
# products << paths_book.map { |path_book| Book.from_file(path_book) }
# products << paths_film.map { |path_film| Film.from_file(path_film) }

collection = ProductCollection.from_dir(paths)
puts collection.to_a
# binding.irb






# Фильм «Леон», 1994, реж. Люк Бессон, 990 руб. (осталось 5)
# Фильм «Дурак», 2014, реж. Юрий Быков, 390 руб. (осталось 1)
# Книга «Идиот», роман, автор — Федор Достоевский, 1500 руб. (осталось 10)