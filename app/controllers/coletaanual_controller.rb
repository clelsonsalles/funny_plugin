class ColetaanualController < ApplicationController
  

  def fazerEncalcesContratados
    if params[:coleta].nil?
      Rails.logger.info "Params: NULO" 
    else
      Rails.logger.info "Params: #{params}" 
    end

    if @coleta.nil?
      Rails.logger.info "coleta: NULO"
      @coleta = Coleta.new    
      @coleta.safe_attributes = params[:coleta]
    end
    
    Rails.logger.info "coleta: #{@coleta.tipoColeta} #{@coleta.project_id} #{@coleta.mes} #{@coleta.ano}" 

   
    @coletas = Coleta.where(tipoColeta:  @coleta.tipoColeta, project_id:  @coleta.project_id, ano: @coleta.ano  )
  
  end

 def atualizarEncalcesContratados
    @coleta = Coleta.new    
    @coleta.safe_attributes = params[:coleta]

    @coleta.dataRealizacao = Time.current

    @coleta.save


    @coletas = Coleta.where(tipoColeta:  @coleta.tipoColeta, project_id:  @coleta.project_id, ano: @coleta.ano  )

    redirect_back fallback_location: root_path, notice: "Coleta incluída com sucesso", coleta: :@coleta

  
 end
  
end
