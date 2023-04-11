Rails.application.routes.draw do



  resources :todos
  #get 'welcome/index'
  root to: 'welcome#index'
end
