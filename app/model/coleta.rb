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
      'idSatelite',         'semestre')

  def self.mensal
     "Coleta Mensal"
  end
  def self.semestral
    "Coleta Semestral"
  end
  def self.anual
    "Coleta Anual"
  end

  
  belongs_to :user
  belongs_to :project

  def textoData      
      nomeMeses = ["Janeiro", "Fevereiro", "Março", "Abril", "Maio", "Junho", "Julho", "Agosto", "Setembro", "Outubro", "Novembro", "Dezembro", "NÃO DEFINIDO"]
      numeroMes = self.mes < 12 ? self.mes : 13  
      nomeMeses[numeroMes -1].to_s + "/" + self.ano.to_s
  end

  def status
      time = Time.new
      limiteSetting = Setting['plugin_funny_plugin'][:limiteColetaMensal]
      limitePrimeiroSemestreSetting = Setting['plugin_funny_plugin'][:limiteColetaSemestralPrim]
      limiteSegundoSemestreSetting = Setting['plugin_funny_plugin'][:limiteColetaSemestralSeg]
      limiteAnualSetting = Setting['plugin_funny_plugin'][:limiteColetaAnual]
    
      diaLimite = Integer(limiteSetting.nil? ? 0 : limiteSetting)
      if self.dataRealizacao.nil?
          status =  "Aguardando Coleta"
          if self.ano < time.year
              status = "Coleta Atrasada"
          else 
            case self.tipoColeta
              when Coleta.mensal
                if self.mes < time.month && time.day > diaLimite 
                  status = "Coleta Atrasada" 
                end
              when Coleta.semestral
                if self.semestre == 1 && time > limitePrimeiroSemestreSetting
                  status = "Coleta Atrasada" 
                end
                if self.semestre == 2 && time > limiteSegundoSemestreSetting
                  status = "Coleta Atrasada" 
                end
              when Coleta.anual
                if time > limiteAnualSetting
                  status = "Coleta Atrasada" 
                end
            end

          end
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
