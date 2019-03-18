class Movie < ActiveRecord::Base
  def self.all_ratings
    %w(G PG PG-13 NC-17 R)
  end
  
  def self.same_director_list(id)
    Movie.where("title != '%s' and director = '%s'", Movie.find(id).title, Movie.find(id).director)
  end
end
