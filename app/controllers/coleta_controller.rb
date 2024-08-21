class ColetaController < ApplicationController

  def index
  end

  def mensalvisualizar
      @ufs = []
      @municipios = []
      @coleta = nil
      require 'net/http'
      require 'json'
      
      # URL da API externa de UFs e cidades
      external_api_url_ufs = 'https://servicodados.ibge.gov.br/api/v1/localidades/estados'
      external_api_url_cidades = 'https://servicodados.ibge.gov.br/api/v1/localidades/estados/'
      
      # Fazendo a requisição para a API externa
      if @ufs.empty?  
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
    
      if @coleta.nil? || @coleta.empty?  
          @coleta = @coleta = Coleta.find(params[:id_coleta])
      else
          idUf = @coleta.uf
          @municipios = []
          external_api_url_cidades_completa = external_api_url_cidades + idUf + "/municipio"
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
  end

  def mensalcidadesuf

      # URL da API externa de UFs e cidades
      external_api_url_ufs = 'https://servicodados.ibge.gov.br/api/v1/localidades/estados'
      external_api_url_cidades = 'https://servicodados.ibge.gov.br/api/v1/localidades/estados/'

      @coleta = Coleta.new
      @coleta.safe_attributes = params[:coleta]
      
      idUf = nil
      if @coleta.uf.nil? 
          idUf = 'DF'
      else
        idUf = @coleta.uf
      end
      @municipios = []
      external_api_url_cidades_completa = external_api_url_cidades + idUf + "/municipios"
      Rails.logger.info "external_api_url_cidades_completa: #{external_api_url_cidades_completa}"
      uri = URI(external_api_url_cidades_completa)
      response = Net::HTTP.get(uri)
      Rails.logger.info "Response: #{response}"
    
      array =  JSON.parse(response)    
      array.each do |municipioJson|
        # do something with element
        municipio = Municipio.new
        municipio.id = municipioJson["id"]
        municipio.nome = municipioJson["nome"]
        @municipios << municipio
      end

      redirect_to coleta_mensalvisualizar_path
  end

  def recuperaUFsIBGE
      @ufs = []
      require 'net/http'
      require 'json'
      
      # URL da API externa de UFs
      external_api_url = 'https://servicodados.ibge.gov.br/api/v1/localidades/estados'
      
      # Fazendo a requisição para a API externa
      uri = URI(external_api_url)
      response = Net::HTTP.get(uri)
      

      for ufJson in JSON.parse(response)
          uf = Uf.new
          uf.from_json(ufJson)
          @ufs << uf
      end
  

  end

  def recuperaMunicipiosIBGE

  end
  
  def updateOLD
    @coleta = Coleta.find(params[:coleta][:id_coleta])     

    @coleta.safe_attributes = params[:coleta]
    @coleta.dataRealizacao = Time.current
    if @coleta.save
      redirect_to cliente_cliente_path
    end
  end

  def mensalinserir
    valores = params.require(:coleta).permit(:mes, :tipoColeta)
    coleta = Coleta.create(valores)

    coleta.tituloColeta = "Coleta Mensal"
    coleta.ano = 2024
        
    coleta.user = User.current
    coleta.project = Project.find(params[:coleta][:id_projeto])
    coleta.save
    
    redirect_to analista_cliente_analista_path(id_projeto: params[:coleta][:id_projeto])
  end

  def mensalfazer
   @coleta = Coleta.find(params[:id_coleta])     
  end

  def mensalatualizar
    @coleta = Coleta.find(params[:coleta][:id_coleta])     

    @coleta.safe_attributes = params[:coleta]
    @coleta.dataRealizacao = Time.current
    if @coleta.save
      redirect_to cliente_cliente_path
    end
  end

  def mensalcriar
    @coleta = Coleta.new
    @projeto = Project.find(params[:id_projeto])
  end
end
