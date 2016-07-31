Rails.application.routes.draw do


  resources :rules
  resources :program_rules
  resources :stations
  resources :ports

  get 'programs/:id/enable/:enable', to: 'programs#enable', as: 'enable_program'
  get 'ports/:id/test_gpio', to: 'ports#test_gpio', as: 'test_gpio'

  resources :programs
  
  root 'pages#welcome'

  
end
