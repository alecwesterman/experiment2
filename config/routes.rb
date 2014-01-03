Experiment2::Application.routes.draw do
  resources :words

  resources :facts

  resources :user_inputs

  root :to => "user_inputs#new"
end
