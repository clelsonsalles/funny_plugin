
require 'csv'

module ExportCs
    def self.export_coleta_to_csv(tipoColeta, coletas)
      csv_string = "\uFEFF" + CSV.generate(headers: true, col_sep: ';', encoding: "UTF-8", row_sep: "\r\n") do |csv|
        case tipoColeta
            when Coleta.mensal
              case coleta.tipoColeta
                  when "SCM"
                        #MENSAL_SCM
                        #cnpj prestadora	ano	mês	uf	cidade	tipoCliente	tipoAtendimento	tipoMeio	tipoTecnologia	tipoProduto	velocidade	quantidadeAcesso	codigoIBGE
                        # Adiciona o cabeçalho
                        csv << ['cnpj prestadora', 'ano', 'mês', 'uf', 'cidade', 'tipoCliente', 'tipoAtendimento', 'tipoMeio', 'tipoTecnologia', 'tipoProduto', 'velocidade', 'quantidadeAcesso', 'codigoIBGE']
                        # Adiciona as coletas
                        for coleta in coletas
                            csv << [coleta.cnpj, coleta.anoInformado, coleta.mesInformado, coleta.uf, coleta.cidade, coleta.tipoCliente, coleta.tipoAtendimento, coleta.tipoMeio, coleta.tipoTecnologia, coleta.tipoProduto, coleta.velocidade, coleta.quantidadeAcesso, coleta.codigoIBGE]
                        end
                  when "TvPA"
                        #MENSAL_TVPA
                        #cnpj prestadora	ano	mês	uf	cidade	tipoCliente	tipoAtendimento	tipoMeio	codigoIBGE	quantidadeAcesso
                        # Adiciona o cabeçalho
                        csv << ['cnpj prestadora', 'ano', 'mês', 'uf', 'cidade', 'tipoCliente', 'tipoAtendimento', 'tipoMeio', 'codigoIBGE', 'quantidadeAcesso']
                        # Adiciona as coletas
                        for coleta in coletas
                           csv << [coleta.cnpj, coleta.anoInformado, coleta.mesInformado, coleta.uf, coleta.cidade, coleta.tipoCliente, coleta.tipoAtendimento, coleta.tipoMeio, coleta.codigoIBGE, coleta.quantidadeAcesso]
                        end

                  when "STFC"
                        #MENSAL_STFC
                        #cnpj prestadora	ano	mês	uf	cidade	tipoCliente	tipoAtendimento	tipoMeio	codigoIBGE	quantidadeAcesso
                        # Adiciona o cabeçalho
                        csv << ['cnpj prestadora', 'ano', 'mês', 'uf', 'cidade', 'tipoCliente', 'tipoAtendimento', 'tipoMeio', 'codigoIBGE', 'quantidadeAcesso']
                        # Adiciona as coletas
                        for coleta in coletas
                           csv << [coleta.cnpj, coleta.anoInformado, coleta.mesInformado, coleta.uf, coleta.cidade, coleta.tipoCliente, coleta.tipoAtendimento, coleta.tipoMeio, coleta.codigoIBGE, coleta.quantidadeAcesso]
                        end

                  else
                      csv << [coleta.id, coleta.tituloColeta, coleta.tipoColeta, "TIPO DE COLETA NÃO DEFINIDO"]
              end
            
            when Coleta.semestral
              case coleta.tipoColeta
                  when "SCM"
                        #SEMESTRAL_SCM
                        #cnpj	anoInformado	trimestre	uf	dadoInformado	valor
                        # Adiciona o cabeçalho
                        csv << ['cnpj', 'anoInformado', 'trimestre', 'uf', 'dadoInformado', 'valor']
                        # Adiciona as coletas
                        for coleta in coletas
                           csv << [coleta.cnpj, coleta.anoInformado, coleta.trimestre, coleta.uf, coleta.dadoInformado, coleta.valor]
                        end

                  when "SEAC"
                        #SEMESTRAL_SEAC
                        #cnpj	anoInformado	trimestre	uf	dadoInformado	valor
                        # Adiciona o cabeçalho
                        csv << ['cnpj', 'anoInformado', 'trimestre', 'uf', 'dadoInformado', 'valor']
                        # Adiciona as coletas
                        for coleta in coletas
                           csv << [coleta.cnpj, coleta.anoInformado, coleta.trimestre, coleta.uf, coleta.dadoInformado, coleta.valor]
                        end

                  when "SMP"
                        #SEMESTRAL_SMP
                        #cnpj	anoInformado	trimestre	uf	dadoInformado	valor	cn
                        # Adiciona o cabeçalho
                        csv << ['cnpj', 'anoInformado', 'trimestre', 'uf', 'dadoInformado', 'valor', 'cn']
                        # Adiciona as coletas
                        for coleta in coletas
                           csv << [coleta.cnpj, coleta.anoInformado, coleta.trimestre, coleta.uf, coleta.dadoInformado, coleta.valor, coleta.cn]
                        end

                  else
                      csv << [coleta.id, coleta.tituloColeta, coleta.tipoColeta, "TIPO DE COLETA NÃO DEFINIDO"]
              end

            when Coleta.anual
              case coleta.tipoColeta
                  when "Estação"
                        # Adiciona o cabeçalho
                        csv << ['cnpj', 'ano', 'idEstacao', 'nEstacao', 'codigoIBGE', 'abertura', 'cep', 'cidade', 'rua', 'numeroEndereco', 'latitude', 'longitude']
                        # Adiciona as coletas
                        for coleta in coletas
                           csv << [coleta.cnpj, coleta.ano, coleta.idEstacao, coleta.nEstacao, coleta.codigoIBGE, coleta.abertura, coleta.cep, coleta.cidade, coleta.rua, coleta.numeroEndereco, coleta.latitude, coleta.longitude]
                        end
                  when "Enlaces próprios"
                        # Adiciona o cabeçalho
                        csv << ['cnpj', 'ano', 'idEstacaoOrigem', 'idEstacaoDestino', 'idEnlace', 'enlaceMeio', 'enlaceNominal', 'enlaceSwap', 'geometriaWkt', 'srid']
                        # Adiciona as coletas
                        for coleta in coletas
                           csv << [coleta.cnpj, coleta.ano, coleta.idEstacaoOrigem, coleta.idEstacaoDestino, coleta.idEnlace, coleta.enlaceMeio, coleta.enlaceNominal, coleta.enlaceSwap, coleta.geometriaWkt, coleta.srid]
                        end
                  when "Encalces contratados"
                        # Adiciona o cabeçalho
                        csv << ['cnpj', 'ano', 'idEstacaoOrigem', 'idEstacaoDestino', 'idEnlace', 'enlaceMeio', 'cnpjContratada']
                        # Adiciona as coletas
                        for coleta in coletas
                           csv << [coleta.cnpj, coleta.ano, coleta.idEstacaoOrigem, coleta.idEstacaoDestino, coleta.idEnlace, coleta.enlaceMeio, coleta.cnpjContratada]
                        end
                  when "Encalces via satélite"
                        # Adiciona o cabeçalho
                        csv << ['cnpj', 'ano', 'idEstacaoOrigem', 'idSatelite', 'codigoSatelite', 'freqUplink', 'freqDownlink', 'largCanalUplink', 'capCanalUplink', 'largCanalDownlink', 'capCanalDownlink']
                        # Adiciona as coletas
                        for coleta in coletas
                           csv << [coleta.cnpj, coleta.ano, coleta.idEstacaoOrigem, coleta.idSatelite, coleta.codigoSatelite, coleta.freqUplink, coleta.freqDownlink, coleta.largCanalUplink, coleta.capCanalUplink, coleta.largCanalDownlink, coleta.capCanalDownlink]
                        end
                  else
                      csv << [coleta.id, coleta.tituloColeta, coleta.tipoColeta, "TIPO DE COLETA NÃO DEFINIDO"]
              end
            else
              csv << [coleta.id, coleta.tituloColeta, "TÍTULO DE COLETA NÃO DEFINIDO"]
        end          
      end

      csv_string
    end


end
