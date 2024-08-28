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

    coleta.project = Project.find(params[:coleta][:id_projeto])
    coleta.save
    
    redirect_to analista_cliente_analista_path(id_projeto: params[:coleta][:id_projeto])
  end




  def mensalfazer
      @coleta = Coleta.find(params[:id_coleta])     

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

      @coleta = Coleta.find(params[:coleta][:id])     
      @coleta.uf = params[:coleta][:uf]
      @coleta.cidade = params[:coleta][:cidade]
      @coleta.codigoIBGE = params[:coleta][:codigoIBGE]
      
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
      @coleta = Coleta.find(params[:coleta][:id])     
      @coleta.uf = params[:coleta][:uf]
      @coleta.cidade = params[:coleta][:cidade]

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
    @coleta = Coleta.find(params[:coleta][:id])    
    valores = params.require(:coleta).permit(:tituloColeta, :tipoColeta, :ano, :mes, :trimestre, :uf, :cidade, :codigoIBGE, :tipoCliente, :tipoAtendimento, :tipoMeio, :tipoTecnologia, :tipoProduto, :velocidade, :quantidadeAcesso, :dadoInformado, :valor, :cn)

    #@coleta.usuarioRealizacao = User.current

    @coleta.dataRealizacao = Time.current
    @coleta.update(valores)

    redirect_to cliente_cliente_path
  end


   def anualcriar
    @coleta = Coleta.new
    @projeto = Project.find(params[:id_projeto])
  end

  def anualinserir
    valores = params.require(:coleta).permit(:mes, :tipoColeta)
    coleta = Coleta.create(valores)

    coleta.tituloColeta = "Coleta Mensal"
    coleta.ano = 2024
    coleta.dataCriacao = Time.current
        
    #coleta.usuarioCriacao = User.current

    coleta.project = Project.find(params[:coleta][:id_projeto])
    coleta.save
    
    redirect_to analista_cliente_analista_path(id_projeto: params[:coleta][:id_projeto])
  end




  def anualfazer
      @coleta = Coleta.find(params[:id_coleta])     

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


  def anualcidadesuf
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

      @coleta = Coleta.find(params[:coleta][:id])     
      @coleta.uf = params[:coleta][:uf]
      @coleta.cidade = params[:coleta][:cidade]
      @coleta.codigoIBGE = params[:coleta][:codigoIBGE]
      
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
      @coleta = Coleta.find(params[:coleta][:id])     
      @coleta.uf = params[:coleta][:uf]
      @coleta.cidade = params[:coleta][:cidade]

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
    @coleta = Coleta.find(params[:coleta][:id])    
    valores = params.require(:coleta).permit(:tituloColeta, :tipoColeta, :ano, :mes, :trimestre, :uf, :cidade, :codigoIBGE, :tipoCliente, :tipoAtendimento, :tipoMeio, :tipoTecnologia, :tipoProduto, :velocidade, :quantidadeAcesso, :dadoInformado, :valor, :cn)

    #@coleta.usuarioRealizacao = User.current

    @coleta.dataRealizacao = Time.current
    @coleta.update(valores)

    redirect_to cliente_cliente_path
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
      @coleta = Coleta.find(params[:id_coleta])     

  end

  def semestralatualizar
    @coleta = Coleta.find(params[:coleta][:id])    

    @coleta.safe_attributes = params[:coleta]

    @coleta.dataRealizacao = Time.current
    #@coleta.usuarioRealizacao = User.current
    
    if @coleta.save
      redirect_to cliente_cliente_path
    end
  end
    


    def gerarcsv
      coleta = Coleta.find(params[:id_coleta])
    
      csv_data = ExportCsv.export_coleta_to_csv(coleta)
      
      send_data csv_data, filename: "coleta-#{coleta.project.name}-#{coleta.tituloColeta}-#{coleta.tipoColeta}-#{coleta.textoData}.csv", type: 'text/csv'

    end

 
  
  def updateOLD
    @coleta = Coleta.find(params[:coleta][:id_coleta])     

    @coleta.safe_attributes = params[:coleta]
    @coleta.dataRealizacao = Time.current
    if @coleta.save
      redirect_to cliente_cliente_path
    end
  end

 
  def mensalvisualizar
  end

end
