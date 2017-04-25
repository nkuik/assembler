Rails.application.routes.draw do
  root to: 'pages#home'

  resources :projects do
    post '/create_matches',
      controller: 'matches',
      to: 'matches#create_matches'
  end
  post '/assign_member',
    controller: 'member_project_associations',
    to: 'member_project_associations#assign_member'
  post '/assign_manager',
    controller: 'member_project_associations',
    to: 'member_project_associations#assign_manager'
  resources :team_members do
    resources :skills
  end
end
