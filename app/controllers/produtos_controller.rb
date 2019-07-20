class ProdutosController < ApplicationController

  def index
    # mesmo nome da pag index
    @produtos = Produto.order(nome: :desc).limit 2
    # o @ significa que é uma variável de instância
    @produto_com_desconto = Produto.order(:preco).limit 1
  end
end
