require "test_helper"

class ChamadosControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get chamados_new_url
    assert_response :success
  end

  test "should get create" do
    get chamados_create_url
    assert_response :success
  end

  test "should get index" do
    get chamados_index_url
    assert_response :success
  end

  test "should get show" do
    get chamados_show_url
    assert_response :success
  end

  test "should get destroy" do
    get chamados_destroy_url
    assert_response :success
  end
end
