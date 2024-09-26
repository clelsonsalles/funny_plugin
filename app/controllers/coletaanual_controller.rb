class ColetaanualController < ApplicationController
  def fazer
    tipoColeta = params[:tipoColeta]
    project_id = params[:project_id]
    ano = params[:ano]
    titulo = params[:titulo]

    paramsColeta = params[:coleta]
    @coleta = Coleta.new    
    @coletas = nil
    
    if !paramsColeta.nil?
      @coleta.safe_attributes = paramsColeta
    else
      @coleta.tipoColeta = tipoColeta
      @coleta.project_id = project_id
      @coleta.ano = ano
      @coleta.titulo - titulo
    end

    @coletas = Coleta.where(tipoColeta:  @coleta.tipoColeta, project_id:  @coleta.project_id, ano: @coleta.ano )
  end

 def atualizar
    @coleta = Coleta.new    
    @coleta.safe_attributes = params[:coleta]

    @coleta.dataRealizacao = Time.current
    @coleta.dataCriacao = Time.current


    @coleta.save

    redirect_to coleta_anual_fazer_path(tipoColeta:  @coleta.tipoColeta, project_id:  @coleta.project_id, ano: @coleta.ano)
 end
  
end
