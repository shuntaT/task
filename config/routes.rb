Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "schedules#index"
  post "schedules/new" ,to:"schedules#create"
  delete "schedules/id" , to:"schedules#destroy"
  resources :schedules
end
