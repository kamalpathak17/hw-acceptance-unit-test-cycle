# spec/factories/movie.rb

FactoryGirl.define do
    factory :movie do
        title 'A fake Title'
        rating 'PG'
        release_date { 10.years.ago }
        director 'NA'
    end
end