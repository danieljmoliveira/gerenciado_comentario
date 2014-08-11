require 'test_helper'

class BancoIdeiaControllerTest < ActionController::TestCase
  setup do
    @banco_ideium = banco_ideia(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:banco_ideia)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create banco_ideium" do
    assert_difference('BancoIdeium.count') do
      post :create, banco_ideium: { cidade: @banco_ideium.cidade, email: @banco_ideium.email, estado: @banco_ideium.estado, lista_tipo: @banco_ideium.lista_tipo, nome: @banco_ideium.nome, telefone: @banco_ideium.telefone, texto_ideia: @banco_ideium.texto_ideia, titulo: @banco_ideium.titulo }
    end

    assert_redirected_to banco_ideium_path(assigns(:banco_ideium))
  end

  test "should show banco_ideium" do
    get :show, id: @banco_ideium
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @banco_ideium
    assert_response :success
  end

  test "should update banco_ideium" do
    patch :update, id: @banco_ideium, banco_ideium: { cidade: @banco_ideium.cidade, email: @banco_ideium.email, estado: @banco_ideium.estado, lista_tipo: @banco_ideium.lista_tipo, nome: @banco_ideium.nome, telefone: @banco_ideium.telefone, texto_ideia: @banco_ideium.texto_ideia, titulo: @banco_ideium.titulo }
    assert_redirected_to banco_ideium_path(assigns(:banco_ideium))
  end

  test "should destroy banco_ideium" do
    assert_difference('BancoIdeium.count', -1) do
      delete :destroy, id: @banco_ideium
    end

    assert_redirected_to banco_ideia_path
  end
end
