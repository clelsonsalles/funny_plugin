class ClienteController < ApplicationController

  helper :user

  def index
  end

  def edit
  end

  def update
  end


  def destroy
  end

  def new
  end

  def create
    valores = params.require(:contrato).permit(:numero, :objeto, :contratada, :cnpjContratada, :SEIcontratacao, :SEIedital, :SEIcontrato, :observacoes, :prazoContratacao, :valorTotal, :dataAssinatura, :dataPublicacao)
    contrato = Contrato.create(valores)

    projeto = Project.find(params[:contrato][:id_projeto])
    contrato.project = projeto
    contrato.save

    redirect_to contrato_index_path(project_id: projeto.id)

  end


  def list
  end


  def find_issues_with_query(query)
  end

end
