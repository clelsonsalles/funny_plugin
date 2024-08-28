
require 'csv'

module ExportCsv
    def self.export_coleta_to_csv(coleta)
      CSV.generate(headers: true, col_sep: ';') do |csv|
        # Adiciona o cabeçalho
        csv << ['ID', 'tituloColeta', 'tipoColeta', 'ano', 'mes', 'trimestre', 'uf', 'cidade', 'codigoIBGE', 'tipoCliente', 'tipoAtendimento', 'tipoMeio', 'tipoTecnologia', 'tipoProduto', 'velocidade', 'quantidadeAcesso', 'dadoInformado', 'valor', 'cn']

        # Adiciona a coleta
        csv << [coleta.id, coleta.tituloColeta, coleta.tipoColeta, coleta.ano, coleta.mes, coleta.trimestre, coleta.uf, coleta.cidade, coleta.codigoIBGE, coleta.tipoCliente, coleta.tipoAtendimento, coleta.tipoMeio, coleta.tipoTecnologia, coleta.tipoProduto, coleta.velocidade, coleta.quantidadeAcesso, coleta.dadoInformado, coleta.valor, coleta.cn]
      end
    end


end
