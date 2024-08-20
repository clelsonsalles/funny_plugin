class ColetaController < ApplicationController

  def index
  end

  def update
  end

  def mensalinserir
    valores = params.require(:coleta).permit(:mes, :tipoColeta)
    coleta = Coleta.create(valores)

    coleta.tituloColeta = "Coleta Mensal"
    coleta.ano = 2024
        
    coleta.user = User.current
    coleta.project = Project.find(params[:coleta][:id_projeto])
    coleta.save
    
    redirect_to analista_cliente_analista_path(id_projeto: params[:coleta][:id_projeto])
  end

  def mensalfazer
   @coleta = Coleta.find(params[:id_coleta])     
  end

  def mensalatualizar
    @coleta = Coleta.find(params[:coleta][:id_coleta])     

    @coleta.safe_attributes = params[:coleta]
    @coleta.dataRealizacao = Time.current
    if @coleta.save
      redirect_to cliente_cliente_path
    end
  end

  def mensalcriar
    @coleta = Coleta.new
    @projeto = Project.find(params[:id_projeto])
  end
end
