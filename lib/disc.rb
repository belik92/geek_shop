require_relative 'product'
class Disc < Product
attr_accessor :title, :year, :singer, :genre

def self.from_file(path_film)
  strings = File.readlines(path_film, chomp: true)
  Disc.new(title: strings[0], singer: strings[1], genre: strings[2], year: strings[3], price: strings[4], amount: strings[5])
end

def initialize(params)
  super
  @title = params[:title]
  @year = params[:year].to_i
  @singer = params[:singer]
  @genre = params[:genre]
end

def to_s
  "Фильм #{@title}, #{@year}, реж. #{@singer}, #{super}"
end

def update(params)
  super
  @title = params[:title] if params[:title]
  @year = params[:year].to_i if params[:year]
  @singer = params[:singer] if params[:singer]
  @genre = params[:genre] if params[:genre]
end
end
