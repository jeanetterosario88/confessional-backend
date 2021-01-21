Rails.application.routes.draw do
  resources :secrets, only: %i[show index create update] do
    resources :comments, only: %i[show index create] 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  end
end