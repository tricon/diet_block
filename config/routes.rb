DietBlock::Engine.routes.draw do
  resources :diets
  resources :users do
    resources :diets
  end
end
