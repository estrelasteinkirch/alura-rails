Rails.application.routes.draw do
  resources :departamentos
  get "produtos/busca", to: "produtos#busca", as: :busca_produto
 resources :produtos, only: [:new, :create, :destroy, :edit, :update]


  root to: "produtos#index"
  



   # post "produtos", to: "produtos#create"
  # get "produtos/new", to: "produtos#new"
  # delete "produtos/:id", to: "produtos#destroy", as: :produto
end
