Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
    root to: 'devise/sessions#new'
  end

  authenticate :user, ->(user) { user.admin? } do
    namespace :admin do
      resources :users, except: [:show]
    end
  end

  authenticate :user, ->(user) { user.ingeniero? } do
    resources :availabilities, only: [:index, :edit, :update]
    resources :shifts, only: [:index]
  end
end
