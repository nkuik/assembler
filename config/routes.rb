Rails.application.routes.draw do
  root to: 'pages#home'

  resources :matches
  resources :member_project_associations
  resources :member_skills
  resources :projects
  resources :project_requirements
  resources :team_members
end
