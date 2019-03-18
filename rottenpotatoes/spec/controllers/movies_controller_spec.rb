require 'rails_helper'

describe MoviesController do
    
    describe 'find_same_director' do
        before :each do
            @fake_results= [double('movie1'), double('movie2')]
        end
    
        it 'call a model method that returns movies with same director' do
            #fake_results = [double('movie1'), double('movie2')]
            expect(Movie).to receive(:same_director_list).and_return(@fake_results)
            post :find_same_director, {:id => '1'}
        end
        it 'select the find_same_director template for rendering' do
            #fake_results = [double('movie1'), double('movie2')]
            allow(Movie).to receive(:same_director_list).and_return(@fake_results)
            post :find_same_director, {:id => '1'}
            expect(response).to render_template('find_same_director')
        end
        it 'makes the find_same_director results available to the template' do
            #fake_results = [double('movie1'), double('movie2')]
            allow(Movie).to receive(:same_director_list).and_return(@fake_results)
            post :find_same_director, {:id => '1'}
            expect(assigns(:movies)).to eq(@fake_results)
        end
    end   
end

