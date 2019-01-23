Rails.application.routes.draw do
  get 'restaurants/index'
  resources:'dishes'
  resources:'restaurants'
  root to:'dishes#index'

  get 'dishes/:id' => "dishes#showpage"
  get 'search'=>'dishes#search'
  get 'map'=> 'dishes#map'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
