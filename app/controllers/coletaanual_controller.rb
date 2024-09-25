class ColetaanualController < ApplicationController

  def fazerEncalcesContratados
    @id_coleta = nil 
    
    if params[:coleta].nil?
      @coleta = Coleta.find(@id_coleta)
    else
      @coleta = Coleta.new    
      @coleta.safe_attributes = params[:coleta]
    end
    
    @coletas = Coleta.where(:tipoColeta =>  @coleta.tipoColeta, :project_id =>  @coleta.project_id, :mes => @coleta.mes, :ano => @coleta.ano  )
  
  end

 def atualizarEncalcesContratados
    @coleta = Coleta.new    
    @coleta.safe_attributes = params[:coleta]

    @coleta.dataRealizacao = Time.current

    @coleta.save


    @coletas = Coleta.where(:tipoColeta =>  @coleta.tipoColeta, :project_id =>  @coleta.project_id, :mes => @coleta.mes, :ano => @coleta.ano  )

    redirect_to :back, :@id_coleta => @coleta.id

  
 end
  
end
