class ColetaMensalController < ApplicationController

  def index
  end

  def inserir
    redirect_to coleta_mensal_criar_path(id_projeto: params[:id_projeto])
  end

  def criar
    @coleta = Coleta.new
    @projeto = Project.find(params[:id_projeto])
  end
end
