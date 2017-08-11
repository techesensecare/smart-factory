require 'test_helper'

class MateriaPrimaTest < ActiveSupport::TestCase
  test "produto_usado deve ser obrigatório" do
    m = MateriaPrima.new
    assert !m.save
    assert_equal ["não pode ficar em branco"], m.errors[:produto_usado_id]
  end

  test "produto deve ser obrigatório" do
    m = MateriaPrima.new
    assert !m.save
    assert_equal ["não pode ficar em branco"], m.errors[:produto_id]
  end

  test "quantidade deve ser obrigatório" do
    m = MateriaPrima.new
    assert !m.save
    assert_equal ["não pode ficar em branco"], m.errors[:quantidade]
  end
end
