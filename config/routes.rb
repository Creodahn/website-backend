Rails.application.routes.draw do
  namespace :api do
    jsonapi_resources :albums
    jsonapi_resources :blog_posts
    jsonapi_resources :educations
    jsonapi_resources :images
    jsonapi_resources :people
    jsonapi_resources :projects
    jsonapi_resources :skills
    jsonapi_resources :users
    jsonapi_resources :work_experiences
  end

  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
