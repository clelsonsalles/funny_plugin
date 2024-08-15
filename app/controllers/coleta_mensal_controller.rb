class ColetaMensalController < ApplicationController

  def index
  end

  def create
    redirect_to coleta_mensal_create_path(project_id: params[:project_id])
  end

  def criar
    @coleta = Coleta.new
    @projeto = Project.find(params[:id_projeto])
  end
end
