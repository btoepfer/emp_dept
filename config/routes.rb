Rails.application.routes.draw do
  resources :departments do
    resources :employees
  end
  post "employees" => 'employees#create'
  delete "employees/:id" => 'employees#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
