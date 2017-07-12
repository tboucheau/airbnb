Rails.application.routes.draw do
  devise_for :users, :path => '',
                     :path_names => { :sign_in => 'login', :sign_out => 'logout', :edit => 'profil' },
                     :controllers => { :registrations => 'registrations' }
  root 'pages#home'
  
  resources :users, only: [ :show ]
end
