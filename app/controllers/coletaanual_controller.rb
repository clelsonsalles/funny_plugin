class ColetaanualController < ApplicationController
  def fazerEncalcesContratados
    tipoColeta = params[:tipoColeta]
    project_id = params[:project_id]
    ano = params[:ano]

    paramsColeta = params[:coleta]
    @coleta = Coleta.new    
    @coletas = nil
    if !paramsColeta.nil?
      @coleta.safe_attributes = paramsColeta
    else
      @coleta.tipoColeta = tipoColeta
      @coleta.project_id = project_id
      @coleta.ano = ano
    end

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
