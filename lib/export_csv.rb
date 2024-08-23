
require 'csv'

module ExportCsv
    def self.export_coleta_to_csv(coleta)
      CSV.generate(headers: true) do |csv|
        # Adiciona o cabeçalho
        csv << ['ID', 'tituloColeta', 'tipoColeta', 'ano', 'mes', 'trimestre', 'uf', 'cidade', 'codigoIBGE', 'tipoCliente', 'tipoAtendimento', 'tipoMeio', 'tipoTecnologia', 'tipoProduto', 'velocidade', 'quantidadeAcesso', 'dadoInformado', 'valor', 'cn']

        # Adiciona a coleta
        csv << [coleta.id, coleta.tituloColeta, coleta.tipoColeta, coleta.ano, coleta.mes, coleta.trimestre, coleta.uf, coleta.cidade, coleta.codigoIBGE, coleta.tipoCliente, coleta.tipoAtendimento, coleta.tipoMeio, coleta.tipoTecnologia, coleta.tipoProduto, coleta.velocidade, coleta.quantidadeAcesso, coleta.dadoInformado, coleta.valor, coleta.cn]
      end
    end

      class Base < ::CSV
        include Redmine::I18n

        class << self
          def generate(options = {}, &)
            col_sep = (options[:field_separator].presence || l(:general_csv_separator))
            encoding = Encoding.find(options[:encoding]) rescue Encoding.find(l(:general_csv_encoding))

            str =
              if encoding == Encoding::UTF_8
                +"\xEF\xBB\xBF" # BOM
              else
                (+'').force_encoding(encoding)
              end

            super(str, :col_sep => col_sep, :encoding => encoding, &)
          end
        end

        def <<(row)
          row = row.map do |field|
            case field
            when String
              Redmine::CodesetUtil.from_utf8(field, self.encoding.name)
            when Float
              @decimal_separator ||= l(:general_csv_decimal_separator)
              ("%.2f" % field).gsub('.', @decimal_separator)
            else
              field
            end
          end
          super
        end
      end

end
