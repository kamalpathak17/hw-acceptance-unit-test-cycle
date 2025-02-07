# TL;DR: YOU SHOULD DELETE THIS FILE
#
# This file is used by web_steps.rb, which you should also delete
#
# You have been warned
module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
    case page_name

   when /^the (RottenPotatoes )?home\s?page$/ then 
     '/movies'
      

    # Add more mappings here.
    # Here is an example that pulls values out of the Regexp:
    #
    #   when /^(.*)'s profile page$/i
    #     user_profile_path(User.find_by_login($1))

    when  /^the edit page for "(.*)"/
      edit_movie_path(Movie.where(:title => $1)[0])
      #Movie.where will give an array of movies which will get filtered based on the title ["$1" is used for regex of the movie title]
      #[0] will be only the first value of the array 

    when /^the details page for "(.*)"/
      movie_path(Movie.where(:title => $1)[0])
      
    when /^the Similar Movies page for "(.*)"/
      search_directors_path(Movie.where(:title => $1)[0])

  

    else
      begin
        page_name =~ /^the (.*) page$/
        path_components = $1.split(/\s+/)
        self.send(path_components.push('path').join('_').to_sym)
      rescue NoMethodError, ArgumentError
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end
end

World(NavigationHelpers)
