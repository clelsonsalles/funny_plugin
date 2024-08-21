class ColetaController < ApplicationController

  def index
  end

  def mensalvisualizar
      @ufs = []
      require 'net/http'
      require 'json'
      
      # URL da API externa de UFs
      external_api_url = 'https://servicodados.ibge.gov.br/api/v1/localidades/estados'
      
      # Fazendo a requisição para a API externa
      uri = URI(external_api_url)
      response = Net::HTTP.get(uri)
      array =  JSON.parse(response)    
      array.each do |ufJson|
        # do something with element
        uf = Uf.new
        uf.from_json(ufJson)
        @ufs << uf
      end






class TaskImporter
  def import_tasks_from_api
    client = ApiClient.new
    api_data = client.get_data
 
    api_data.each do |task_data|
      Task.create(
        name: task_data['name'],             # Mapeando o campo 'name' da API para o model Task
        description: task_data['description'], # Mapeando 'description'
        status: task_data['status']
      )
    end
  end
end











    
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
  
  def update
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
    
  end

  def mensalcriar
    @coleta = Coleta.new
    @projeto = Project.find(params[:id_projeto])
  end
end
