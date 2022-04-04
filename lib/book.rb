require_relative 'product'
class Book  < Product
  attr_accessor :title, :genre, :author

def self.from_file(path_book)
  strings = File.readlines(path_book, chomp: true)
    Book.new(title: strings[0], genre: strings[1], author: strings[2], price: strings[3], amount: strings[4])
end
  
def initialize(params)
  super
  @title = params[:title]
  @genre = params[:genre]
  @author = params[:author]
end

def to_s
  "Книга #{@title}, #{@genre}, автор — #{@author}, #{super}"
end

def update(params)
  super
  @title = params[:title] if params[:title]
  @genre = params[:genre] if params[:genre]
  @author = params[:author] if params[:author]
end

end