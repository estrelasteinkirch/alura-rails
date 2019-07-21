Rails.application.routes.draw do
 resources :produtos, only: [:new, :create, :destroy]


  root to: "produtos#index"
  



   # post "produtos", to: "produtos#create"
  # get "produtos/new", to: "produtos#new"
  # delete "produtos/:id", to: "produtos#destroy", as: :produto
end
