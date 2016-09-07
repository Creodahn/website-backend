Rails.application.routes.draw do
  namespace :api do
    jsonapi_resources :work_experiences
    jsonapi_resources :skills
    jsonapi_resources :projects
    jsonapi_resources :images
    jsonapi_resources :educations
    jsonapi_resources :people
    jsonapi_resources :blog_posts
    jsonapi_resources :albums
  end

  post '/login', to: 'sessions#create'
end
