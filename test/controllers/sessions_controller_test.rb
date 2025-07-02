require "test_helper"

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new (login page)" do
    get login_path # Alterado de sessions_new_url para login_path
    assert_response :success
  end

  test "should create session (login)" do
    # Assume que o usuário 'admin' existe no banco de dados de teste (ou fixtures)
    # para simular um login bem-sucedido
    user = users(:admin) # Assumindo que você tem um fixture 'admin' em test/fixtures/users.yml
    post login_path, params: { username: user.username, password: "123" } # Alterado de sessions_create_url para login_path (POST)
    assert_redirected_to dashboard_path
    assert_equal user.id, session[:user_id] # Verifica se o ID do usuário está na sessão
  end

  test "should destroy session (logout)" do
    # Primeiro, faz login para ter uma sessão para destruir
    user = users(:admin) # Assumindo que você tem um fixture 'admin' em test/fixtures/users.yml
    post login_path, params: { username: user.username, password: "123" }
    assert_equal user.id, session[:user_id]

    delete logout_path # Alterado de sessions_destroy_url para logout_path
    assert_redirected_to login_path
    assert_nil session[:user_id] # Verifica se o ID do usuário foi removido da sessão
  end

  test "should not login with invalid credentials" do
    post login_path, params: { username: "admin", password: "wrongpassword" }
    assert_response :unauthorized # Espera um status 401
    assert_nil session[:user_id]
    assert_select "div", text: "Usuário ou senha inválidos." # Verifica a mensagem de erro
  end
end
