class ColetaanualController < ApplicationController
  def fazerEncalcesContratados
    tipoColeta = params[:tipoColeta]
    project_id = params[:project_id]
    ano = params[:ano]

    Rails.logger.info "Conferindo: #{tipoColeta} - #{project_id} - #{ano}" 

    if params.nil?
      Rails.logger.info "Params: NULO" 
    else
      Rails.logger.info "Params: #{params.inspect}" 
    end

    if @coleta.nil?
      Rails.logger.info "coleta: NULO"
      Rails.logger.info "Params: #{params.inspect}" 
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

    Rails.logger.info "coleta: #{@coleta.tipoColeta} #{@coleta.project_id} #{@coleta.mes} #{@coleta.ano}" 

    redirect_to coleta_anual_fazerencalcescontratados_path(tipoColeta:  @coleta.tipoColeta, project_id:  @coleta.project_id, ano: @coleta.ano)


  
 end
  
end
