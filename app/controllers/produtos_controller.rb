class ProdutosController < ApplicationController

  def index
    # mesmo nome da pag index
    @produtos = Produto.order(nome: :asc).limit(5)
    # o @ significa que é uma variável de instância
    # que é compartilhado com todo o objeto e dá pra acessar a variável na view, por exemplo
    @produto_com_desconto = Produto.order(:preco).limit(1)
  end

  def new
    @produto = Produto.new
    @departamentos = Departamento.all
  end

  def create
    valores = params.require(:produto).permit(:nome, :descricao, :preco, :quantidade, :departamento_id)
    @produto = Produto.new valores
    if @produto.save
      flash[:notice] = "Produto salvo com sucesso!"
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    id = params[:id]
    Produto.destroy id
    redirect_to root_path
  end

  def busca
    @nome = params[:nome]
    @produtos = Produto.where "nome like ? ", "%#{@nome}%"
  end

end
