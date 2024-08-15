class ColetaMensalController < ApplicationController

  def index
  end

  def inserir
    valores = params.require(:coleta).permit(:mes)
    coleta = Coleta.create(valores)

    coleta.tituloColeta = "Coleta Mensal"
    coleta.tipoColeta = params[:tipoColeta]
    coleta.ano = 2024
        
    coleta.responsavelPreenchimento = User.current
    coleta.project = Project.find(params[:id_projeto])
    coleta.save
    
    redirect_to coleta_mensal_criar_path(id_projeto: params[:id_projeto])
  end

  def criar
    @coleta = Coleta.new
    @projeto = Project.find(params[:id_projeto])
  end
end
