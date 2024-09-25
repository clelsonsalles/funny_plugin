class ColetaanualController < ApplicationController
  tipoColeta = nil
  project_id = nil  
  ano = nil

  def fazerEncalcesContratados
    if params.nil?
      Rails.logger.info "Params: NULO" 
    else
      Rails.logger.info "Params: #{params.inspect}" 
    end

    if @coleta.nil?
      Rails.logger.info "coleta: NULO"
      @coleta = Coleta.new    
      @coleta.safe_attributes = params[:coleta]
    end
    
    Rails.logger.info "Parâmetros: #{tipoColeta}, #{project_id}, #{ano}" 
    Rails.logger.info "coleta: #{@coleta.tipoColeta} #{@coleta.project_id} #{@coleta.mes} #{@coleta.ano}" 

   
    @coletas = Coleta.where(tipoColeta:  @coleta.tipoColeta, project_id:  @coleta.project_id, ano: @coleta.ano  )
  
  end

 def atualizarEncalcesContratados
    @coleta = Coleta.new    
    @coleta.safe_attributes = params[:coleta]

    @coleta.dataRealizacao = Time.current

    @coleta.save


    @coletas = Coleta.where(tipoColeta:  @coleta.tipoColeta, project_id:  @coleta.project_id, ano: @coleta.ano  )

    redirect_to coleta_anual_fazerencalcescontratados_path(@coleta)

  
 end
  
end
