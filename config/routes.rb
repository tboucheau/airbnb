Rails.application.routes.draw do
  devise_for :users, :path => '',
                     :path_names => { :sign_in => 'login', :sign_out => 'logout', :edit => 'profil' },
                     :controllers => { :registrations => 'registrations' }
  root 'pages#home'
  
  resources :users, only: [ :show ]
  resources :rooms, path: 'annonces' do
    resources :reservations, only: [ :create ]
    resources :reviews, only: [ :create, :destroy ]
  end
  resources :photos
  
  get '/preload' => 'reservations#preload'
  get '/preview' => 'reservations#preview'
  get 'your_trips' => 'reservations#your_trips', path: 'mes_voyages'
  get 'your_reservations' => 'reservations#your_reservations', path: 'mes_reservations'
  get '/search' => 'pages#search'

end
