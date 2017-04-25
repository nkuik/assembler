Rails.application.routes.draw do
  root to: 'pages#home'

  resources :member_project_associations
  resources :projects do
    post '/create_matches',
      controller: 'matches',
      to: 'matches#create_matches'
  end
  resources :project_requirements
  resources :team_members do
    resources :skills
  end
end
