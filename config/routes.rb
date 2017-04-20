Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :cocktails do
    resources :dose, only: [ :index, :new, :create, :update ]
  end
  resources :dose, only: [ :show, :edit, :update, :destroy ]

end
