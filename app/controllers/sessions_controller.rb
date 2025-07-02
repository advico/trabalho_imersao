class SessionsController < ApplicationController
  # Permite que a tela de login seja acessada sem login prévio
  skip_before_action :require_login, only: [ :new, :create ]

  def new
    # Ação para exibir o formulário de login
  end

  def create
    user = User.find_by(username: params[:username])

    if user && user.authenticate(params[:password])
      # Login bem-sucedido
      session[:user_id] = user.id # Armazena o ID do usuário na sessão
      redirect_to dashboard_path, notice: "Login realizado com sucesso!"
    else
      # Login falhou
      flash.now[:alert] = "Usuário ou senha inválidos."
      render :new, status: :unauthorized # Mostra o formulário novamente com erro
    end
  end

  def destroy
    session[:user_id] = nil # Limpa a sessão
    redirect_to login_path, notice: "Logout realizado com sucesso!"
  end
end
