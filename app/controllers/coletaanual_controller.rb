class ColetaanualController < ApplicationController

  def fazerEncalcesContratados
    if (id_coleta.nil?)
          @coleta = Coleta.new    
          @coleta.safe_attributes = params[:coleta]
      else
          @coleta = Coleta.where(:id => id_coleta)
      end
  
  end

 def atualizarEncalcesContratados
    @coleta = Coleta.new    
    @coleta.safe_attributes = params[:coleta]

    @coleta.dataRealizacao = Time.current

    @coleta.save


    @coletas = Coleta.where(:tipoColeta =>  @coleta.tipoColeta, :project_id =>  @coleta.project_id, :mes => @coleta.mes, :ano => @coleta.ano  )
  
 end
  
end
