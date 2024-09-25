class ColetaanualController < ApplicationController
  

  def fazerEncalcesContratados
    if params.nil?
      Rails.logger.info "Params: NULO" 
    else
      Rails.logger.info "Params: " + #{params} 
    end

    if @coleta.nil?
      Rails.logger.info "coleta: NULO"
    else
      Rails.logger.info "coleta: "  + @coleta.tipoColeta +  @coleta.project_id.to_s +  @coleta.mes.to_s + @coleta.ano.to_s 
    end
    
    if @coleta.nil?
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

    redirect_to :back, :@coleta => @coleta

  
 end
  
end
