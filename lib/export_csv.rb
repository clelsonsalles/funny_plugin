
require 'csv'

module ExportCsv
    def self.export_coleta_to_csv(tituloColeta, tipoColeta, coletas)
      csv_string = "\uFEFF" + CSV.generate(headers: true, col_sep: ';', encoding: "UTF-8", row_sep: "\r\n") do |csv|
        case tituloColeta
            when Coleta.mensal
              case tipoColeta
                  when "SCM"
                        #MENSAL_SCM
                        #CNPJ	ANO 	MES  COD_IBGE TIPO_CLIENTE TIPO_ATENDIMENTO TIPO_MEIO TIPO_PRODUTO TIPO_TECNOLOGIA VELOCIDADE ACESSOS
                        # Adiciona o cabeçalho
                        csv << ['CNPJ', 'ANO', 'MES', 'COD_IBGE', 'TIPO_CLIENTE', 'TIPO_ATENDIMENTO', 'TIPO_MEIO', 'TIPO_PRODUTO', 'TIPO_TECNOLOGIA', 'VELOCIDADE', 'ACESSOS']
                        # Adiciona as coletas
                        for coleta in coletas
                            csv << [coleta.cnpj, coleta.anoInformado, coleta.mesInformado,  coleta.codigoIBGE, coleta.tipoCliente, coleta.tipoAtendimento,  coleta.tipoMeio, coleta.tipoProduto, coleta.tipoTecnologia, coleta.velocidade, coleta.quantidadeAcesso]
                        end
                  when "TvPA"
                        #MENSAL_TVPA
                        #CNPJ ANO MES  COD_IBGE TIPO_CLIENTE  TIPO_MEIO  TIPO_TECNOLOGIA  ACESSOS
                        # Adiciona o cabeçalho
                        csv << ['CNPJ', 'ANO', 'MES', 'COD_IBGE', 'TIPO_CLIENTE', 'TIPO_MEIO', 'TIPO_TECNOLOGIA', 'ACESSOS']
                        # Adiciona as coletas
                        for coleta in coletas
                           csv << [coleta.cnpj, coleta.anoInformado, coleta.mesInformado, coleta.codigoIBGE, coleta.tipoCliente, coleta.tipoMeio, coleta.tipoTecnologia, coleta.quantidadeAcesso]
                        end

                  when "STFC"
                        #MENSAL_STFC
                        #CNPJ	ANO 	MES 	UF	 COD_IBGE  TIPO_CLIENTE  TIPO_ATENDIMENTO  TIPO_MEIO  ACESSOS
                        # Adiciona o cabeçalho
                        csv << ['CNPJ', 'ANO', 'MES', 'UF', 'COD_IBGE', 'TIPO_CLIENTE', 'TIPO_ATENDIMENTO', 'TIPO_MEIO', 'ACESSOS']
                        # Adiciona as coletas
                        for coleta in coletas
                           csv << [coleta.cnpj, coleta.anoInformado, coleta.mesInformado, coleta.uf, coleta.codigoIBGE, coleta.tipoCliente, coleta.tipoAtendimento, coleta.tipoMeio, coleta.quantidadeAcesso]
                        end

                  else
                      csv << [coleta.id, coleta.tituloColeta, coleta.tipoColeta, "TIPO DE COLETA NÃO DEFINIDO"]
              end
            
            when Coleta.semestral
              case tipoColeta
                  when "SCM"
                        #SEMESTRAL_SCM
                        #DADO_INFORMADO SERVICO UF VALORES CNPJ
                        # Adiciona o cabeçalho
                        csv << ['DADO_INFORMADO', 'SERVICO', 'UF', 'VALORES', 'CNPJ']
                        # Adiciona as coletas
                        for coleta in coletas
                           csv << [coleta.dadoInformado, coleta.tipoColeta, coleta.uf, coleta.valor, coleta.cnpj]
                        end

                  when "SEAC"
                        #SEMESTRAL_SEAC
                        #DADO_INFORMADO SERVICO UF VALORES CNPJ	
                        # Adiciona o cabeçalho
                        csv << ['DADO_INFORMADO', 'SERVICO', 'UF', 'VALORES', 'CNPJ']
                        # Adiciona as coletas
                        for coleta in coletas
                           csv << [coleta.dadoInformado, coleta.tipoColeta, coleta.uf, coleta.valor, coleta.cnpj]
                        end

                  when "SMP"
                        #SEMESTRAL_SMP
                        #CN DADO_INFORMADO SERVICO UF VALORES CNPJ 
                        # Adiciona o cabeçalho
                        csv << ['CN', 'DADO_INFORMADO', 'SERVICO', 'UF' 'VALORES', 'CNPJ']
                        # Adiciona as coletas
                        for coleta in coletas
                           csv << [coleta.cn, coleta.dadoInformado, coleta.tipoColeta, coleta.uf, coleta.valor, coleta.cnpj]
                        end

                        else
                           csv << [coleta.id, coleta.tituloColeta, coleta.tipoColeta, "TIPO DE COLETA NÃO DEFINIDO"]
              end

            when Coleta.anual
              case tipoColeta
                  when "Estação"
                        # Adiciona o cabeçalho
                        csv << ['CNPJ', 'ANO', 'ID', 'NUMESTACAO', 'LAT', 'LONG', 'COD_IBGE', 'ENDERECO', 'ABERTURA']
                        # Adiciona as coletas
                        for coleta in coletas
                           csv << [coleta.cnpj, coleta.ano, coleta.idEstacao, coleta.nEstacao, coleta.latitude, coleta.longitude, coleta.codigoIBGE, coleta.numeroEndereco, coleta.abertura]
                        end
                  when "Enlaces próprios"
                        # Adiciona o cabeçalho
                        csv << ['CNPJ', 'ANO', 'ESTACAO_A_ID', 'ESTACAO_B_ID', 'ENLACE_PROPRIOS_TERRESTRES_ID', 'ENLACES_PROPRIOS_TERRESTRES_MEIO', 'ENLACES_CONTRATADOS_PRESTADORA']
                        # Adiciona as coletas
                        for coleta in coletas
                           csv << [coleta.cnpj, coleta.ano, coleta.idEstacaoOrigem, coleta.idEstacaoDestino, coleta.idEnlace, coleta.enlaceMeio, coleta.cnpj]
                        end
                  when "Encalces contratados"
                        # Adiciona o cabeçalho
                        csv << ['CNPJ', 'ANO', 'ESTACAO_A_ID', 'ESTACAO_B_ID', 'ENLACES_CONTRATADOS_ID', 'enlaceMeio', 'cnpjContratada']
                        # Adiciona as coletas
                        for coleta in coletas
                           csv << [coleta.cnpj, coleta.ano, coleta.idEstacaoOrigem, coleta.idEstacaoDestino, coleta.idEnlace, coleta.enlaceMeio, coleta.cnpjContratada]
                        end
                  when "Encalces via satélite"
                        # Adiciona o cabeçalho
                        csv << ['CNPJ', 'ANO', 'ESTACAO_A_ID', 'ENLACES_SATELITE_ID', 'ENLACES_SATELITES_COD_SATELITE', 'ENLACES_SATELITES_FREQ_CENTRAL_CANAL_UPLINK_MHZ', 'ENLACES_SATELITES_FREQ_CENTRAL_CANAL_DOWNLINK_MHZ', 'ENLACES_SATELITES_CAP_USO_CANAL_UPLINK_MHZ', 'ENLACES_SATELITES_CAP_USO_CANAL_UPLINK_MBPS', 'ENLACES_SATELITES_CAP_USO_CANAL_DOWNLINK_MHZ', 'ENLACES_SATELITES_CAP_USO_CANAL_DOWNLINK_MBPS']
                        # Adiciona as coletas
                        for coleta in coletas
                           csv << [coleta.cnpj, coleta.ano, coleta.idEstacaoOrigem, coleta.idSatelite, coleta.codigoSatelite, coleta.freqUplink, coleta.freqDownlink, coleta.largCanalUplink, coleta.capCanalUplink, coleta.largCanalDownlink, coleta.capCanalDownlink]
                        end
                  else
                      csv << [tituloColeta, tipoColeta, "TIPO DE COLETA NÃO DEFINIDO"]
              end
            else
              csv << [tituloColeta, tipoColeta, "TÍTULO DE COLETA NÃO DEFINIDO"]
        end          
      end

      csv_string
    end


end
