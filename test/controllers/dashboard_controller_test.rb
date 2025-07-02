require "test_helper"

class DashboardControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    # Simula um usuário logado para o teste de controller
    # Em testes reais, você geralmente criaria um usuário ou usaria fixtures
    user = users(:admin) # Assumindo que você tem um fixture 'admin' em test/fixtures/users.yml
    post login_path, params: { username: user.username, password: "123" } # Login do admin

    get dashboard_path # Alterado de dashboard_show_url para dashboard_path
    assert_response :success
  end
end
