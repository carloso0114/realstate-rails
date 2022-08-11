Rails.application.routes.draw do
  root :to => redirect('/properties/1')
  get "/properties/:id", to: "properties#index"
  get '/property/:id', to: 'properties#show'
end
