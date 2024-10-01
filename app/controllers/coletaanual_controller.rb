class ColetaanualController < ApplicationController
  def fazeruf
    
    tipoColeta = params[:tipoColeta]
    project_id = params[:project_id]
    ano = params[:ano]
    tituloColeta = params[:titulo]

    @coleta = Coleta.new    
    @coleta.tipoColeta = tipoColeta
    @coleta.project_id = project_id
    @coleta.ano = ano
    @coleta.tituloColeta - tituloColeta

    @ufs = []
    @municipios = []

    require 'net/http'
    require 'json'
    
    # URL da API externa de UFs e cidades
    external_api_url_ufs = 'https://servicodados.ibge.gov.br/api/v1/localidades/estados'
    external_api_url_cidades = 'https://servicodados.ibge.gov.br/api/v1/localidades/estados/'
    
    # Fazendo a requisição para a API externa
    uri = URI(external_api_url_ufs)
    response = Net::HTTP.get(uri)
    array =  JSON.parse(response)    
    array.each do |ufJson|
        # do something with element
        uf = Uf.new
        uf.id = ufJson["id"]
        uf.nome = ufJson["nome"]
        uf.sigla = ufJson["sigla"]
        @ufs << uf
    end

  end

  def fazercidadesuf
  
      paramsColeta = params[:coleta]
      @coleta = Coleta.new    
      @coletas = nil
      @coleta.safe_attributes = paramsColeta

      @ufs = []
      @municipios = []

      require 'net/http'
      require 'json'
      
      # URL da API externa de UFs e cidades
      external_api_url_ufs = 'https://servicodados.ibge.gov.br/api/v1/localidades/estados'
      external_api_url_cidades = 'https://servicodados.ibge.gov.br/api/v1/localidades/estados/'
      
      # Fazendo a requisição para a API externa
      uri = URI(external_api_url_ufs)
      response = Net::HTTP.get(uri)
      array =  JSON.parse(response)    
      array.each do |ufJson|
        # do something with element
        uf = Uf.new
        uf.id = ufJson["id"]
        uf.nome = ufJson["nome"]
        uf.sigla = ufJson["sigla"]
        @ufs << uf
      end

      external_api_url_cidades_completa = external_api_url_cidades + params[:coleta][:uf] + "/municipios"
      uri = URI(external_api_url_cidades_completa)
      response = Net::HTTP.get(uri)
    
      array =  JSON.parse(response)    
      array.each do |municipioJson|
        # do something with element
        municipio = Municipio.new
        municipio.id = municipioJson["id"]
        municipio.nome = municipioJson["nome"]
        @municipios << municipio
      end        

  end

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
      @coleta.tituloColeta - titulo
    end

    @coletas = Coleta.where(tipoColeta:  @coleta.tipoColeta, project_id:  @coleta.project_id, ano: @coleta.ano, tituloColeta: @coleta.tituloColeta )
  end

 def atualizar
    @coleta = Coleta.new    
    @coleta.safe_attributes = params[:coleta]

    @coleta.dataRealizacao = Time.current
    @coleta.dataCriacao = Time.current


    @coleta.save

    if @coleta.tipoColeta == "Estação"
        redirect_to coleta_anual_fazeruf_path(tipoColeta:  @coleta.tipoColeta, project_id:  @coleta.project_id, ano: @coleta.ano, tituloColeta: @coleta.tituloColeta)
    else
        redirect_to coleta_anual_fazer_path(tipoColeta:  @coleta.tipoColeta, project_id:  @coleta.project_id, ano: @coleta.ano, tituloColeta: @coleta.tituloColeta)
    end
 end
  
end
