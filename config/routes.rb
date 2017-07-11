Rails.application.routes.draw do
  devise_for :users, :path => '',
                     :path_names => { :sign_in => 'login', :sign_out => 'logout', :edit => 'profil' }
  root 'pages#home'
end
