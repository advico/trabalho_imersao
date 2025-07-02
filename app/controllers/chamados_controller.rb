class ChamadosController < ApplicationController
  def new
    @chamado = Chamado.new
  end

  def create
    @chamado = current_user.chamados.build(chamado_params)
    @chamado.status = "Em atendimento"

    if @chamado.save
      redirect_to dashboard_path, notice: "Chamado criado com sucesso!"
    else
      flash.now[:alert] = "Não foi possível criar o chamado. Verifique os campos."
      render :new, status: :unprocessable_entity
    end
  end

  def index
    # Busca apenas os chamados criados pelo usuário logado, ordenados do mais recente para o mais antigo
    @chamados = current_user.chamados.order(created_at: :desc)
  end

  def show
    # BUSCA O CHAMADO E GARANTE QUE PERTENCE AO USUÁRIO
    @chamado = current_user.chamados.find_by(id: params[:id])

    # SE NÃO ENCONTRAR OU NÃO PERTENCER AO USUÁRIO, REDIRECIONA
    unless @chamado
      flash[:alert] = "Chamado não encontrado ou você não tem permissão para visualizá-lo."
      redirect_to chamados_path
    end
  end

  def update
    # Busca o chamado pelo ID e garante que ele pertence ao usuário logado
    @chamado = current_user.chamados.find_by(id: params[:id])

    unless @chamado
      flash[:alert] = "Chamado não encontrado ou você não tem permissão para editá-lo."
      return redirect_to chamados_path
    end

    # Prepara os parâmetros permitidos para atualização
    # Incluímos :resposta e :solucao aqui
    permitted_params = params.require(:chamado).permit(:resposta, :solucao)

    # Se houver uma solução, automaticamente define o status como "Fechado"
    if permitted_params[:solucao].present?
      @chamado.status = "Fechado"
    end

    if @chamado.update(permitted_params)
      redirect_to @chamado, notice: "Chamado atualizado com sucesso!"
    else
      flash.now[:alert] = "Não foi possível atualizar o chamado. Verifique os campos."
      render :show, status: :unprocessable_entity # Renderiza a tela de detalhes com erros
    end
  end

  def destroy
    # Busca o chamado pelo ID e garante que ele pertence ao usuário logado
    @chamado = current_user.chamados.find_by(id: params[:id])

    if @chamado
      @chamado.destroy
      redirect_to chamados_path, notice: "Chamado excluído com sucesso!"
    else
      flash[:alert] = "Chamado não encontrado ou você não tem permissão para excluí-lo."
      redirect_to chamados_path
    end
  end

 private

def chamado_params
  params.require(:chamado).permit(:tipo, :categoria, :titulo, :descricao, :resposta, :solucao, :arquivo)
end
end
