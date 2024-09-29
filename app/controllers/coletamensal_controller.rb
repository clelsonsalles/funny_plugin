class ColetamensalController < ApplicationController
  def fazeruf
    paramsColeta = params[:coleta]
    @coleta = Coleta.new    
    @coletas = nil
    @coleta.safe_attributes = paramsColeta
    Rails.logger.info "CSR paramsColeta: #{paramsColeta}" 
    Rails.logger.info "CSR params: #{params}" 
    Rails.logger.info "CSR coleta: #{@coleta}" 


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

    @coletas = Coleta.where(tipoColeta:  @coleta.tipoColeta, project_id:  @coleta.project_id, ano: @coleta.ano, mes: @coleta.mes  )
  end

  def fazercidadesuf
  
      paramsColeta = params[:coleta]
      @coleta = Coleta.new    
      @coletas = nil
      @coleta.safe_attributes = paramsColeta
    Rails.logger.info "CSR paramsColeta: #{paramsColeta}" 
    Rails.logger.info "CSR params: #{params}" 
    Rails.logger.info "CSR coleta: #{@coleta}" 

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
    paramsColeta = params[:coleta]
    @coleta = Coleta.new    
    @coletas = nil
    @coleta.safe_attributes = paramsColeta
    Rails.logger.info "CSR paramsColeta: #{paramsColeta}" 
    Rails.logger.info "CSR params: #{params}" 
    Rails.logger.info "CSR coleta: #{@coleta}" 
    
    require 'net/http'
    require 'json'
    
    # URL da API externa de UFs e cidades
    external_api_url_cidades = 'https://servicodados.ibge.gov.br/api/v1/localidades/estados/'
    external_api_url_cidades_completa = external_api_url_cidades + params[:coleta][:uf] + "/municipios"
    uri = URI(external_api_url_cidades_completa)
    response = Net::HTTP.get(uri)
  
    array =  JSON.parse(response)    
    array.each do |municipioJson|
      if municipioJson["nome"] == params[:coleta][:cidade]
          @coleta.codigoIBGE = municipioJson["id"]
          break
      end
    end        

    
    @coletas = Coleta.where(tipoColeta:  @coleta.tipoColeta, project_id:  @coleta.project_id, ano: @coleta.ano, mes: @coleta.mes)

  end

  def atualizar
    @coleta = Coleta.new    
    @coleta.safe_attributes = params[:coleta]
    Rails.logger.info "CSR paramsColeta: #{paramsColeta}" 
    Rails.logger.info "CSR params: #{params}" 
    Rails.logger.info "CSR coleta: #{@coleta}" 

    @coleta.dataRealizacao = Time.current
    @coleta.dataCriacao = Time.current


    @coleta.save

    redirect_to coleta_mensal_fazer_path(titulo: @coleta.tituloColeta, tipoColeta:  @coleta.tipoColeta, project_id:  @coleta.project_id, ano: @coleta.ano, mes: @coleta.mes  )
   end
  
end
