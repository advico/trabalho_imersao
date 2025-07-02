require "test_helper"

class ChamadosControllerTest < ActionDispatch::IntegrationTest
  setup do
    # Simula um usuário logado para todos os testes neste controller
    @user = users(:admin) # Assumindo que você tem um fixture 'admin' em test/fixtures/users.yml
    post login_path, params: { username: @user.username, password: "123" }
  end

  test "should get new" do
    get new_chamado_path # Alterado de chamados_new_url para new_chamado_path
    assert_response :success
  end

  test "should create chamado" do
    assert_difference("Chamado.count") do
      post chamados_path, params: { chamado: { tipo: "Incidente", categoria: "Computador com problema", titulo: "Problema Teste", descricao: "Descricao do problema" } } # Alterado de chamados_create_url para chamados_path
    end
    assert_redirected_to dashboard_path # Redireciona para o dashboard após criar
  end

  test "should get index" do
    get chamados_path # Alterado de chamados_index_url para chamados_path
    assert_response :success
  end

  test "should show chamado" do
    chamado = chamados(:one) # Assumindo que você tem um fixture 'one' em test/fixtures/chamados.yml
    get chamado_path(chamado) # Alterado de chamados_show_url para chamado_path(chamado)
    assert_response :success
  end

  test "should destroy chamado" do
    chamado = chamados(:one) # Assumindo que você tem um fixture 'one' em test/fixtures/chamados.yml
    assert_difference("Chamado.count", -1) do
      delete chamado_path(chamado) # Alterado de chamados_destroy_url para chamado_path(chamado)
    end
    assert_redirected_to chamados_path
  end
end
