class ProdutosController < ApplicationController

  def index
    # mesmo nome da pag index
    @produtos = Produto.order(nome: :desc).limit(5)
    # o @ significa que é uma variável de instância
    # que é compartilhado com todo o objeto
    @produto_com_desconto = Produto.order(:preco).limit(1)
  end

  def create
    produto = params.require(:produto).permit(:nome, :descricao, :preco, :quantidade)
    Produto.create produto
    redirect_to root_path
  end

end
