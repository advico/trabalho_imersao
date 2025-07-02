class ApplicationController < ActionController::Base
  # Aplica o filtro de autenticação para todas as ações em todos os controllers por padrão
  before_action :require_login

  private

  # Método para verificar se o usuário está logado
  def require_login
    unless current_user
      flash[:alert] = "Você precisa estar logado para acessar esta página."
      redirect_to login_path
    end
  end

  # Método auxiliar para obter o usuário logado
  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end
  helper_method :current_user # Torna current_user disponível nas views
end
