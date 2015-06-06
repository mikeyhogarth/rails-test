Rails.application.routes.draw do

  resources :sales, only: [:show, :create, :destroy]

end
