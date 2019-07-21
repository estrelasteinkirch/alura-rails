Rails.application.routes.draw do
  post "produtos", to: "produtos#create"
  get "produtos/new", to: "produtos#new"
  delete "produtos/:id", to: "produtos#destroy", as: :produto


  root to: "produtos#index"
  # resource :produtos
end
