require 'csv'
require 'byebug'
require_relative 'imdb-scraper'

CSV.foreach('db/scary-movies.csv') do |row|
  movie = Movie.find_or_create_by!({title: row[0]})
  scraper = IMDbScraper.new(row[1])
  imdb_info = scraper.get_all_info
  movie.update({
    director: imdb_info[:director],
    rating: imdb_info[:rating],
    description: imdb_info[:storyline],
    duration: imdb_info[:duration],
    poster: imdb_info[:poster]
    })
end
