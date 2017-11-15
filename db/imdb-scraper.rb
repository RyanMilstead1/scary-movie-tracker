require 'nokogiri'
require 'open-uri'
require 'byebug'

class IMDbScraper

	def initialize(site)
		imdb_html = open(site)
		@imdb_nokogiri = Nokogiri::HTML(imdb_html)
	end

	def get_all_info
    {
      director: get_director,
      rating: get_rating,
      storyline: get_storyline,
      duration: get_duration,
      poster: get_poster_url
    }
	end

	def get_director
		director = @imdb_nokogiri.css('span[itemprop=director]').children[1].text
	end

	def get_rating
		rating = @imdb_nokogiri.css('span[itemprop=ratingValue]').text
	end

	def get_storyline
		storyline = @imdb_nokogiri.css('div[itemprop=description] p').children.first.text.strip
	end

  def get_duration
    duration = @imdb_nokogiri.css('time[itemprop=duration]').children[1].text
  end

  def get_poster_url
    poster_url = @imdb_nokogiri.css('.poster [itemprop=image]')[0].attr('src')
  end
end
