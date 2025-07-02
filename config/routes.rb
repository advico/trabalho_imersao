Rails.application.routes.draw do
  # Define a rota raiz para a página de login
  root "sessions#new"

  # Rotas para Sessões (Login/Logout)
  get    "login",  to: "sessions#new"
  post   "login",  to: "sessions#create"
  delete "logout", to: "sessions#destroy"

  # Rota para o Dashboard
  get "dashboard", to: "dashboard#show"

  # Rotas para os Chamados (index, show, new, create, edit, update, destroy)
  resources :chamados
end
