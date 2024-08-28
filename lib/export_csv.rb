
require 'csv'

module ExportCsv
    def self.export_coleta_to_csv(coleta)
      CSV.generate(headers: true, col_sep: ';') do |csv|

        # Adiciona o cabeçalho
        csv << ['ID', 'tituloColeta', 'tipoColeta', 'ano', 'mes', 'trimestre', 'uf', 'cidade', 'codigoIBGE', 'tipoCliente', 'tipoAtendimento', 'tipoMeio', 'tipoTecnologia', 'tipoProduto', 'velocidade', 'quantidadeAcesso', 'dadoInformado', 'valor', 'cn']
        # Adiciona a coleta
        csv << [coleta.id, coleta.tituloColeta, coleta.tipoColeta, coleta.ano, coleta.mes, coleta.trimestre, coleta.uf, coleta.cidade, coleta.codigoIBGE, coleta.tipoCliente, coleta.tipoAtendimento, coleta.tipoMeio, coleta.tipoTecnologia, coleta.tipoProduto, coleta.velocidade, coleta.quantidadeAcesso, coleta.dadoInformado, coleta.valor, coleta.cn]

        case coleta.tituloColeta
            when "Coleta Mensal"
              case coleta.tipoColeta
                  when "SCM"
                        #MENSAL_SCM
                        #cnpj prestadora	ano	mês	uf	cidade	tipoCliente	tipoAtendimento	tipoMeio	tipoTecnologia	tipoProduto	velocidade	quantidadeAcesso	codigoIBGE
                        # Adiciona o cabeçalho
                        csv << ['cnpj prestadora', 'ano', 'mês', 'uf', 'cidade', 'tipoCliente', 'tipoAtendimento', 'tipoMeio', 'tipoTecnologia', 'tipoProduto', 'velocidade', 'quantidadeAcesso', 'codigoIBGE'
                        # Adiciona a coleta
                        csv << [coleta.cnpj, coleta.anoInformado, coleta.mesInformado, coleta.uf, coleta.cidade, coleta.tipoCliente, coleta.tipoAtendimento, coleta.tipoMeio, coleta.tipoTecnologia, coleta.tipoProduto, coleta.velocidade, coleta.quantidadeAcesso, coleta.codigoIBGE]
                  when "TVpA"
                        #MENSAL_TVPA
                        #cnpj prestadora	ano	mês	uf	cidade	tipoCliente	tipoAtendimento	tipoMeio	codigoIBGE	quantidadeAcesso
                        # Adiciona o cabeçalho
                        csv << ['cnpj prestadora', 'ano', 'mês', 'uf', 'cidade', 'tipoCliente', 'tipoAtendimento', 'tipoMeio', 'codigoIBGE', 'quantidadeAcesso'
                        # Adiciona a coleta
                        csv << [coleta.cnpj, coleta.anoInformado, coleta.mesInformado, coleta.uf, coleta.cidade, coleta.tipoCliente, coleta.tipoAtendimento, coleta.tipoMeio, coleta.codigoIBGE, coleta.quantidadeAcesso]

                  when "STFC"
                        #MENSAL_STFC
                        #cnpj prestadora	ano	mês	uf	cidade	tipoCliente	tipoAtendimento	tipoMeio	codigoIBGE	quantidadeAcesso
                        # Adiciona o cabeçalho
                        csv << ['cnpj prestadora', 'ano', 'mês', 'uf', 'cidade', 'tipoCliente', 'tipoAtendimento', 'tipoMeio', 'codigoIBGE', 'quantidadeAcesso'
                        # Adiciona a coleta
                        csv << [coleta.cnpj, coleta.anoInformado, coleta.mesInformado, coleta.uf, coleta.cidade, coleta.tipoCliente, coleta.tipoAtendimento, coleta.tipoMeio, coleta.codigoIBGE, coleta.quantidadeAcesso]

                  else
                      csv << [coleta.id, coleta.tituloColeta, coleta.tipoColeta, "TIPO DE COLETA NÃO DEFINIDO"]
              end
            
            when "Coleta Semestral"
              case coleta.tipoColeta
                  when "SCM"
                        #SEMESTRAL_SCM
                        #cnpj	anoInformado	trimestre	uf	dadoInformado	valor
                        # Adiciona o cabeçalho
                        csv << ['cnpj', 'anoInformado', 'trimestre', 'uf', 'dadoInformado', 'valor']
                        # Adiciona a coleta
                        csv << [coleta.cnpj, coleta.anoInformado, coleta.trimestre, coleta.uf, coleta.dadoInformado, coleta.valor]

                  when "SEAC"
                        #SEMESTRAL_SEAC
                        #cnpj	anoInformado	trimestre	uf	dadoInformado	valor
                        # Adiciona o cabeçalho
                        csv << ['cnpj', 'anoInformado', 'trimestre', 'uf', 'dadoInformado', 'valor']
                        # Adiciona a coleta
                        csv << [coleta.cnpj, coleta.anoInformado, coleta.trimestre, coleta.uf, coleta.dadoInformado, coleta.valor]

                  when "SMP"
                        #SEMESTRAL_SMP
                        #cnpj	anoInformado	trimestre	uf	dadoInformado	valor	cn
                        # Adiciona o cabeçalho
                        csv << ['cnpj', 'anoInformado', 'trimestre', 'uf', 'dadoInformado', 'valor', 'cn']
                        # Adiciona a coleta
                        csv << [coleta.cnpj, coleta.anoInformado, coleta.trimestre, coleta.uf, coleta.dadoInformado, coleta.valor, coleta.cn]

                  else
                      csv << [coleta.id, coleta.tituloColeta, coleta.tipoColeta, "TIPO DE COLETA NÃO DEFINIDO"]
              end

            when "Coleta Anual"
              case coleta.tipoColeta
                  when ""
                  
                        # Adiciona o cabeçalho
                        csv << ['ID', 'tituloColeta', 'tipoColeta', 'ano', 'mes', 'trimestre', 'uf', 'cidade', 'codigoIBGE', 'tipoCliente', 'tipoAtendimento', 'tipoMeio', 'tipoTecnologia', 'tipoProduto', 'velocidade', 'quantidadeAcesso', 'dadoInformado', 'valor', 'cn']
                        # Adiciona a coleta
                        csv << [coleta.id, coleta.tituloColeta, coleta.tipoColeta, coleta.ano, coleta.mes, coleta.trimestre, coleta.uf, coleta.cidade, coleta.codigoIBGE, coleta.tipoCliente, coleta.tipoAtendimento, coleta.tipoMeio, coleta.tipoTecnologia, coleta.tipoProduto, coleta.velocidade, coleta.quantidadeAcesso, coleta.dadoInformado, coleta.valor, coleta.cn]

                  else
                      csv << [coleta.id, coleta.tituloColeta, coleta.tipoColeta, "TIPO DE COLETA NÃO DEFINIDO"]
            else
              csv << [coleta.id, coleta.tituloColeta, "TÍTULO DE COLETA NÃO DEFINIDO"]
        end          
      end
    end


end
