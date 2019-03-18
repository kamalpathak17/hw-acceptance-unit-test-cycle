require 'rails_helper'

describe Movie do
    
    describe 'a method that get the movies from the director' do
        
        it 'should find movies by the same director' do
            movie=FactoryGirl.create(:movie,:title => 'Star Wars', :director => 'George Lucas', :id => '1')
            movie1=FactoryGirl.create(:movie,:title => 'Blade Runner', :director => 'Ridley Scott')
            movie2=FactoryGirl.create(:movie,:title => 'Alien', :director => '')
            movie3=FactoryGirl.create(:movie,:title => 'THX-1138', :director => 'George Lucas')
            expect(Movie.same_director_list(movie.id)).to match_array(Movie.where(title: 'THX-1138'))
        end
        it 'should not find movies by different directors' do
            movie=FactoryGirl.create(:movie,:title => 'Star Wars', :director => 'George Lucas', :id => '1')
            movie1=FactoryGirl.create(:movie,:title => 'Blade Runner', :director => 'Ridley Scott')
            movie2=FactoryGirl.create(:movie,:title => 'Alien', :director => '')
            movie3=FactoryGirl.create(:movie,:title => 'THX-1138', :director => 'George Lucas')
            expect(Movie.same_director_list(movie.id)).not_to match_array(Movie.where(title: ['Star Wars', 'Blade Runner', 'Alien']))
        end
    end
        
end
    