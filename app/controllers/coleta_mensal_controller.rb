class ColetaMensalController < ApplicationController

  def index
  end

  def inserir
    valores = params.require(:coleta).permit(:mes, :tipoColeta)
    coleta = Coleta.create(valores)

    coleta.tituloColeta = "Coleta Mensal"
    coleta.ano = 2024
        
    coleta.user = User.current
    coleta.project = Project.find(params[:coleta][:id_projeto])
    coleta.save
    
    redirect_to analista_cliente_analista_path(id_projeto: params[:coleta][:id_projeto])
  end

  def fazer
   @coletas = Coleta.where(:project_id => params[:id_projeto])
   @coleta = Coleta.new 
    
  end

  def atualizar
    @coleta = Coleta.where(:id => params[:id_projeto])
  end

  def criar
    @coleta = Coleta.new
    @projeto = Project.find(params[:id_projeto])
  end
end
