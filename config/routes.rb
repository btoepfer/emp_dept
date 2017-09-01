Rails.application.routes.draw do
  resources :users, only: [:create, :index, :show] do
    collection do
      post 'login'
    end
  end

  resources :departments do
    resources :employees
  end
  post "employees" => 'employees#create'
  delete "employees/:id" => 'employees#destroy'
  patch "employees/:id" => 'employees#update'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
