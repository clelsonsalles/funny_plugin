class Coleta < ActiveRecord::Base
  include Redmine::SafeAttributes

safe_attributes(
      'tituloColeta',       'tipoColeta',      'ano',                  'mes',                    'trimestre',          'uf',
      'cidade',             'codigoIBGE',      'tipoCliente',          'tipoAtendimento',        'tipoMeio',           'tipoTecnologia',
      'tipoProduto',        'velocidade',      'quantidadeAcesso',     'dadoInformado',          'valor',              'cn',
                                                                        'cnpj',                   'anoInformado',       'mesInformado', 
      'idEstacao',          'nEstacao',        'abertura',             'rua',                    'numeroEndereco',     'latitude',  
      'longitude',          'enlaceMeio',      'enlaceNominal',        'enlaceSwap',             'geometriaWkt',       'srid',  
      'largCanalUplink',    'capCanalUplink',  'largCanalDownlink',    'capCanalDownlink',       'cnpjContratada',     'idEstacaoOrigem', 
      'idEstacaoDestino',   'idEnlace',        'codigoSatelite',        'freqUplink',            'freqDownlink',        'cep', 
      'idSatelite')





  
  belongs_to :user
  belongs_to :project

  def textoData      
      nomeMeses = ["Janeiro", "Fevereiro", "Março", "Abril", "Maio", "Junho", "Julho", "Agosto", "Setembro", "Outubro", "Novembro", "Dezembro", "NÃO DEFINIDO"]
      numeroMes = self.mes < 12 ? self.mes : 13  
      nomeMeses[numeroMes -1].to_s + "/" + self.ano.to_s
  end

  def status
      time = Time.new
      diaLimite = Setting['funny_plugin'][:limiteColetaMensal]
      if self.dataRealizacao.nil?
          status = self.ano < time.year ? "Coleta Atrasada" : 
                    self.mes < time.month && time.day > diaLimite ? "Coleta Atrasada" : "Aguardando Coleta"
      else 
        if self.dataInformacaoEnvio.nil?
            status = "Coleta Realizada"
        else
            status = "Coleta Enviada"
        end
      end

      status
  end



  
end
