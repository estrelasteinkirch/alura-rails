Rails.application.routes.draw do
  post "produtos", to: "produtos#create"
  get "produtos/new", to: "produtos#new"
  root to: "produtos#index"
  # resource :produtos
end
