Rails.application.routes.draw do
  root to: 'cocktails#index'
  mount Attachinary::Engine => "/attachinary"
  resources :cocktails, only: [ :show, :index, :new, :create] do
    resources :doses, only: [ :create]
  end
  resources :doses, only: [:destroy]
end

#https://mr-cocktail-piergiofont.herokuapp.com/
