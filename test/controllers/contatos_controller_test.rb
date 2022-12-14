require 'test_helper'

class ContatosControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    sign_in usuarios(:alexandre)
    @contato = contatos(:one)
  end

  test "should get index" do
    get contatos_url
    assert_response :success
  end

  test "should get new" do
    get new_contato_url
    assert_response :success
  end

  test "should create contato" do
    assert_difference('Contato.count') do
      post contatos_url, params: { contato: { 
        cargo: @contato.cargo, 
        cliente_id: @contato.cliente_id, 
        departamento: @contato.departamento, 
        email: @contato.email, 
        nome: @contato.nome, 
        observacoes: @contato.observacoes, 
        telefone_celular: @contato.telefone_celular, 
        telefone_fixo: @contato.telefone_fixo
      } }
    end

    assert_redirected_to cliente_url(Contato.reorder('id DESC').first.cliente)
  end

  test "should show contato" do
    get contato_url(@contato)
    assert_response :success
  end

  test "should get edit" do
    get edit_contato_url(@contato)
    assert_response :success
  end

  test "should update contato" do
    patch contato_url(@contato), params: { contato: { 
      cargo: @contato.cargo, 
      cliente_id: @contato.cliente_id, 
      departamento: @contato.departamento, 
      email: @contato.email, 
      nome: @contato.nome, 
      observacoes: @contato.observacoes, 
      telefone_celular: @contato.telefone_celular, 
      telefone_fixo: @contato.telefone_fixo 
    } }
    assert_redirected_to cliente_url(@contato.cliente)
  end

  test "should destroy contato" do
    assert_difference('Contato.count', -1) do
      delete contato_url(@contato)
    end

    assert_redirected_to cliente_url(@contato.cliente)
  end
end
