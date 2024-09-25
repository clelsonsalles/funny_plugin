class ColetaanualController < ApplicationController
  tipoColeta = nil
  project_id = nil  
  ano = nil

  def fazerEncalcesContratados
    custom_data = session[:custom_data]
    tipoColeta = custom_data[:tipoColeta]
    project_id = custom_data[:project_id]
    ano = custom_data[:ano]
    
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

   session[:custom_data] = {tipoColeta:  @coleta.tipoColeta, project_id:  @coleta.project_id, ano: @coleta.ano}

    redirect_to coleta_anual_fazerencalcescontratados_path
  
 end
  
end
