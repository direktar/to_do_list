# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  resources :projects, except: :index do
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
