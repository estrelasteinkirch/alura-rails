class ProdutosController < ApplicationController

  before_action :set_produto, only: [:edit, :update, :destroy]

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
    @produto = Produto.new produto_params
    if @produto.save
      flash[:notice] = "Produto salvo com sucesso!"
      redirect_to root_path
    else
      renderiza
    end
  end

  def edit
    renderiza
  end

  def update
    if @produto.update produto_params
      flash[:notice] = "Produto atualizado com sucesso!"
      redirect_to root_path
    else
      renderiza
    end

  end

  def destroy
    @produto.destroy
    redirect_to root_path
  end

  def busca
    @nome = params[:nome]
    @produtos = Produto.where "nome like ? ", "%#{@nome}%"
  end

  def produto_params
    params.require(:produto).permit(:nome, :descricao, :preco, :quantidade, :departamento_id)
  end

  def set_produto
    @produto = Produto.find(params[:id])
  end

  def renderiza
    @departamentos = Departamento.all
    render :new
  end
end
