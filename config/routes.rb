Rails.application.routes.draw do
root 'pages#home'

resources :instructors

resources :courses do
  resources :cohorts
  resources :students
end


get '/login' => 'sessions#new'
post '/login' => 'sessions#create'
delete '/logout' => 'sessions#destroy'

  get 'pages/home'
  get 'pages/about'

  get 'register' => 'instructors#new'
  get 'instructors/edit'
  get 'instructors/show'
  get 'instructors/index'

  get 'sessions/new'
  get 'students/new'
  get 'students/edit'
  get 'students/show'
  get 'students/index'
  get 'cohorts/new'
  get 'cohorts/edit'
  get 'cohorts/show'
  get 'cohorts/index'
  get 'courses/new'
  get 'courses/edit'
  get 'courses/show'
  get 'courses/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
