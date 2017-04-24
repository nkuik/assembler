Rails.application.routes.draw do
  root to: 'pages#home'

  resources :member_project_associations
  resources :projects do
    resources :matches
  end
  resources :project_requirements
  resources :team_members do
    resources :skills
  end
end
