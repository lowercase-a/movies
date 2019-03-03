Rails.application.routes.draw do
  # STEP 1: A ROUTE triggers a controller action
  # verb "/urls" => "namespace/controllers#action"
  namespace :api do
    get '/movies' => 'movies#index'
    get '/movies/:id' => 'movies#show'
  end
end
