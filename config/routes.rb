Rails.application.routes.draw do

  get 'allapplicants' => 'students#all'
root 'pages#home'

resources :instructors

resources :courses do
  resources :cohorts
  resources :students
end

get 'new_course' => 'courses#new'
get 'mycourses' => 'courses#index'
get 'courses/show'
get 'courses/edit'


get 'cohorts/new'
get 'cohorts/edit'
get 'show_cohort' => 'cohorts#show'
get 'mycohorts' => 'cohorts#index'

get '/login' => 'sessions#new'
post '/login' => 'sessions#create'
delete '/logout' => 'sessions#destroy'

  get 'all_courses' => 'pages#course_book'
  get 'about' => 'pages#about'
  get 'oops' => 'pages#oops'

  get 'register' => 'instructors#new'
  get 'instructors/edit'
  get 'show' => 'instructors#show'
  get 'all_inst' => 'instructors#index'
  get 'profile' => 'instructors#profile'

  get 'sessions/new'

  get '/search' => 'students#search'
  get '/results' => 'students#results'
  get 'students/new'
  get 'students/edit'
  get 'students/show'
  get 'allstudents' => 'students#index'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
