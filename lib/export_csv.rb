# lib/redmine/export_csv.rb
require 'csv'

module Redmine
  module ExportCSV
    def self.export_coletas_to_csv(coletas)
      CSV.generate(headers: true) do |csv|
        # Adiciona o cabeçalho
        csv << ['ID', 'tituloColeta', 'tipoColeta', 'ano', 'mes', 'trimestre', 'uf', 'cidade', 'codigoIBGE', 'tipoCliente', 'tipoAtendimento', 'tipoMeio', 'tipoTecnologia', 'tipoProduto', 'velocidade', 'quantidadeAcesso', 'dadoInformado', 'valor', 'cn']

        # Adiciona as linhas
        coletas.each do |coleta|
          csv << [coleta.id, coleta.tituloColeta, coleta.tipoColeta, coleta.ano, coleta.mes, coleta.trimestre, coleta.uf, coleta.cidade, coleta.codigoIBGE, coleta.tipoCliente, coleta.tipoAtendimento, coleta.tipoMeio, coleta.tipoTecnologia, coleta.tipoProduto, coleta.velocidade, coleta.quantidadeAcesso, coleta.dadoInformado, coleta.valor, coleta.cn]
        end
      end
    end
  end
end
