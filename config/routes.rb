Rails.application.routes.draw do
  get 'static/home'
  get 'static/show'
  root 'static#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
