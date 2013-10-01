Experiment2::Application.routes.draw do
  resources :facts

  resources :user_inputs

  root :to => "home#index"
end
