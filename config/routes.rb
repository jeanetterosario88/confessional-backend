Rails.application.routes.draw do
  resources :secrets, only: %i[show index create] do
    resources :comments, only: %i[index create] 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
