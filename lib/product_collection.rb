require_relative 'film'
require_relative 'book'
require_relative 'product'
require_relative 'disc'

class ProductCollection
  attr_accessor :products 

  def self.from_dir(paths)
    products = []
    paths_book = paths.select {|path| path.include?("books")}
    paths_disc = paths.select {|path| path.include?("discs")}
    paths_film = paths.select {|path| path.include?("films")}
    products << paths_book.map { |path_book| Book.from_file(path_book) }
    products << paths_disc.map { |path_disc| Disc.from_file(path_disc) }
    products << paths_film.map { |path_film| Film.from_file(path_film) }
    self.new(products.flatten)
  end

  def initialize(products= [])
    @products = products
  end

  def to_a
  products.map.with_index(1) { |product, index| puts"#{index}. #{product}" }
  
  end

  def sort!(params)
    case params[:by]
    when :price
      @products.sort_by(&:price)
    when :amount
      @products.sort_by(&:amount)
    when :title
      @products.sort_by(&:title)
    end
  #   @products.reverse! if params[:order] == :asc
  #   self
  end
end