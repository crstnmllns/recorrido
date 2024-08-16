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
    resources :availabilities, only: [:index, :edit, :update] do
      collection do
        get ':service_id/:week_id', to: 'availabilities#index', as: 'by_service_and_week'
        get 'edit_multiple', to: 'availabilities#edit_multiple', as: 'edit_multiple'
        post 'update_multiple', to: 'availabilities#update_multiple', as: 'update_multiple'
      end
    end
    resources :shifts, only: [:index]
  end
end
