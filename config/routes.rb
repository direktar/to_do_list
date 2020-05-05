# frozen_string_literal: true

Rails.application.routes.draw do
  resources :projects do
    resources :tasks do
      member do
        patch :uncomplete
        patch :complete
        patch :prioritize
      end
      post :sorting, on: :collection
    end
  end

  root 'projects#index'
end
