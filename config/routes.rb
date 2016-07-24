Rails.application.routes.draw do


  resources :rules
  resources :program_rules
  resources :stations

  get 'programs/:id/enable/:enable', to: 'programs#enable', as: 'enable_program'
  get 'programs/:id/test_gpio', to: 'programs#test_gpio'

  resources :programs
  
  root 'pages#welcome'

  
end
