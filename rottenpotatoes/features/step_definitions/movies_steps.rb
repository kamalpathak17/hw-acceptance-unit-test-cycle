
Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
    Movie.create movie
  end
end


Then /the (.*) of "(.*)" should be "(.*)"/ do |attribute, title, value|
  
  details = page.all('ul li')
  #details is an array variable which will holds the value given by all(method) which gets "elements on the page matching the given selector and options" 
  case attribute
  
  when "rating"
    index = 0
  when "release date"
    index = 1
  when "director"
    index = 2
  end
  
  #%h3 Details about #{@movie.title}
  
  # True if there is a anchor tag with text matching regex
  #expect(page).to have_xpath("//a")
  
  expect(details[index].text.match(/.*:\s(.*)/)[1]).to eq value
  expect(page.find('h3').text.match(/Details about (.*)/)[1]).to eq title
end
    
  


Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  #  ensure that that e1 occurs before e2.
  #  page.body is the entire content of the page as a string.
  expect(page.body.index(e1) < page.body.index(e2))
end

When /I (un)?check the following ratings: (.*)/ do |uncheck, rating_list|
  rating_list.split(', ').each do |rating|
    step %{I #{uncheck.nil? ? '' : 'un'}check "ratings_#{rating}"}
  end
end

Then /I should see all the movies/ do
  # Make sure that all the movies in the app are visible in the table
  Movie.all.each do |movie|
    step %{I should see "#{movie.title}"}
  end
end