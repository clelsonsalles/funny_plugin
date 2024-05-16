class ClienteController < ApplicationController

  def index
  end

  def edit
  end

  def update
  end


  def destroy
  end

  def new
    @cliente =   Cliente.new
  end

  def create
    valoresUsuario = params.require(:contrato).permit(:numero, :objeto, :contratada, :cnpjContratada, :SEIcontratacao, :SEIedital, :SEIcontrato, :observacoes, :prazoContratacao, :valorTotal, :dataAssinatura, :dataPublicacao)
    valoresCliente = params.require(:contrato).permit(:numero, :objeto, :contratada, :cnpjContratada, :SEIcontratacao, :SEIedital, :SEIcontrato, :observacoes, :prazoContratacao, :valorTotal, :dataAssinatura, :dataPublicacao)

    usuario = User.create(valoresUsuario)
    cliente = Cliente.create(valoresUsuario)
    cliente.user = usuario
    cliente.save

    redirect_to contrato_index_path(project_id: projeto.id)

  end


  def list
  end


  def find_issues_with_query(query)
  end

end
