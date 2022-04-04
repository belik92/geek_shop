require_relative 'product'
class Film < Product
attr_accessor :title, :year, :director

def self.from_file(path_film)
  strings = File.readlines(path_film, chomp: true)
  Film.new(title: strings[0], director: strings[1], year: strings[2], price: strings[3], amount: strings[4])
end



def initialize(params)
  super
  @title = params[:title]
  @year = params[:year].to_i
  @director = params[:director]
end

def to_s
  "Фильм #{@title}, #{@year}, реж. #{@director}, #{super}"
end

def update(params)
  super
  @title = params[:title] if params[:title]
  @year = params[:year] if params[:year]
  @director = params[:director] if params[:director]
end

end
