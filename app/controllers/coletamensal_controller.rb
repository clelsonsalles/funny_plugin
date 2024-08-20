class ColetamensalController < ApplicationController

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
   @coleta = Coleta.find(params[:id_coleta])     
  end

  def atualizar
    @coleta.safe_attributes = params[:coleta]
    @coleta.dataRealizacao = Time.current
    if @coleta.save
      redirect_to cliente_cliente_path
    end
  end

  def criar
    @coleta = Coleta.new
    @projeto = Project.find(params[:id_projeto])
  end
end
