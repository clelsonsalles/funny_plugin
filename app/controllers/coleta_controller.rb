class ColetaController < ApplicationController

  def index
  end


  def mensalcriar
    @coleta = Coleta.new
    @projeto = Project.find(params[:id_projeto])
  end

  def mensalinserir
    valores = params.require(:coleta).permit(:mes, :tipoColeta)
    coleta = Coleta.create(valores)

    coleta.tituloColeta = "Coleta Mensal"
    coleta.ano = 2024
    coleta.dataCriacao = Time.current
        
    #coleta.usuarioCriacao = User.current

    coleta.project = Project.find(params[:coleta][:project_id])
    coleta.save
    
    redirect_to analista_cliente_analista_path(id_projeto: params[:coleta][:project_id])
  end




  def mensalfazer
      @coleta = Coleta.new    
      @coleta.safe_attributes = params[:coleta]

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


  def mensalcidadesuf
      @coleta = Coleta.new    
      @coleta.safe_attributes = params[:coleta]

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

  
    def mensalinformar
      @coleta = Coleta.new    
      @coleta.safe_attributes = params[:coleta]
      
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

  end

  def mensalatualizar
    @coleta = Coleta.new    
    @coleta.safe_attributes = params[:coleta]

    @coleta.dataRealizacao = Time.current

    @coleta.save

    redirect_to cliente_cliente_path
  end


  def anualcriar
    @coleta = Coleta.new
    @projeto = Project.find(params[:id_projeto])
  end

  def anualinserir
    valores = params.require(:coleta).permit(:mes, :tipoColeta)
    coleta = Coleta.create(valores)

    coleta.tituloColeta = "Coleta Anual"
    coleta.ano = 2024
    coleta.dataCriacao = Time.current
        
    coleta.project = Project.find(params[:coleta][:id_projeto])
    coleta.save
    
    redirect_to analista_cliente_analista_path(id_projeto: params[:coleta][:id_projeto])
  end




  def anualfazer
      if (@coleta.nil?)
        @coleta = Coleta.new    
        @coleta.safe_attributes = params[:coleta]
      end
    
      @ufs = []
      @municipios = []
      require 'net/http'
      require 'json'

      @coletas = Coleta.where(:tipoColeta =>  @coleta.tipoColeta, :project_id =>  @coleta.project_id, :mes => @coleta.mes, :ano => @coleta.ano  )

      if (@coleta.tipoColeta == 'Estação')
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
    
  end


  def anualcidadesuf
      @coleta = Coleta.new    
      @coleta.safe_attributes = params[:coleta]

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

  
    def anualinformar
      if (@coleta.nil?)
        @coleta = Coleta.new    
        @coleta.safe_attributes = params[:coleta]
      end
      
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

      
  end

  def anualatualizar
    @coleta = Coleta.new    
    @coleta.safe_attributes = params[:coleta]

    @coleta.dataRealizacao = Time.current

    @coleta.save


    # redirect_to coleta_anualfazer_path(@coleta)
    @coletas = Coleta.where(:tipoColeta =>  @coleta.tipoColeta, :project_id =>  @coleta.project_id, :mes => @coleta.mes, :ano => @coleta.ano  )
  end


  def semestralcriar
    @coleta = Coleta.new
    @projeto = Project.find(params[:id_projeto])
  end

  def semestralinserir
    valores = params.require(:coleta).permit(:mes, :tipoColeta)
    coleta = Coleta.create(valores)

    coleta.tituloColeta = "Coleta Semestral"
    coleta.ano = 2024
    coleta.dataCriacao = Time.current
        
    #coleta.usuarioCriacao = User.current
        
    coleta.project = Project.find(params[:coleta][:id_projeto])
    coleta.save
    
    redirect_to analista_cliente_analista_path(id_projeto: params[:coleta][:id_projeto])
  end

  def semestralfazer
      @coleta = Coleta.new    
      @coleta.safe_attributes = params[:coleta]

  end

  def semestralatualizar
    @coleta = Coleta.new    
    @coleta.safe_attributes = params[:coleta]

    @coleta.dataRealizacao = Time.current
    
    if @coleta.save
      redirect_to cliente_cliente_path
    end
  end
    


    def gerarcsv
      coleta = Coleta.find(params[:id_coleta])
    
      csv_data = ExportCsv.export_coleta_to_csv(coleta)
      
      send_data csv_data, filename: "coleta-#{coleta.project.name}-#{coleta.tituloColeta}-#{coleta.tipoColeta}-#{coleta.textoData}.csv", type: 'text/csv'

    end

 
  
  def mensalvisualizar
  end

end
