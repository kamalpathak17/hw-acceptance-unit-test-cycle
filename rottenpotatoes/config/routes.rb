Rottenpotatoes::Application.routes.draw do
  get '/movies/find_same_director/:id', to: 'movies#find_same_director', as: 'search_directors'
  
  resources :movies
  # map '/' to be a redirect to '/movies'
  root :to => redirect('/movies')
end
