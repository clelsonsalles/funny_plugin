class ColetasemestralController < ApplicationController
  def fazer
    tipoColeta = params[:tipoColeta]
    project_id = params[:project_id]
    ano = params[:ano]
    semestre = params[:semestre]
    tituloColeta = params[:tituloColeta]

    paramsColeta = params[:coleta]
    @coleta = Coleta.new    
    @coletas = nil
    
    if !paramsColeta.nil?
      @coleta.safe_attributes = paramsColeta
    else
      @coleta.tipoColeta = tipoColeta
      @coleta.project_id = project_id
      @coleta.ano = ano
      @coleta.semestre = semestre
      @coleta.tituloColeta = tituloColeta
    end

    # Recupera a última coleta
    coleta = Coleta.where(tipoColeta:  @coleta.tipoColeta, project_id:  @coleta.project_id, ano: @coleta.ano, semestre: @coleta.semestre, tituloColeta: @coleta.tituloColeta ).last
    if (!coleta.nil?)
        @coleta = coleta
        @coleta.id = nil
    end
    # Recupera o CNPJ da Organização
    projeto = Project.find(@coleta.project_id)
    organizacao = Organizacao.new(projeto)
    @coleta.cnpj = organizacao.cnpj.tr('^0-9', '')

    @coletas = Coleta.where(tipoColeta:  @coleta.tipoColeta, project_id:  @coleta.project_id, ano: @coleta.ano, semestre: @coleta.semestre, tituloColeta: @coleta.tituloColeta )
  end

 def atualizar
    @coleta = Coleta.new    
    @coleta.safe_attributes = params[:coleta]

    @coleta.dataRealizacao = Time.current
    @coleta.dataCriacao = Time.current


    @coleta.save

    redirect_to coleta_semestral_fazer_path(tipoColeta:  @coleta.tipoColeta, project_id:  @coleta.project_id, ano: @coleta.ano, semestre: @coleta.semestre, tituloColeta: @coleta.tituloColeta  )
 end
  
end
