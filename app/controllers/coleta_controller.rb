class ColetaController < ApplicationController

    def gerarcsv
      coleta = Coleta.find(params[:id_coleta])
      coletas = Coleta.where(
          tituloColeta: coleta.tituloColeta, tipoColeta: coleta.tipoColeta,
          ano: coleta.ano, mes: coleta.mes, semestre: coleta.semestre, 
          project_id:  coleta.project_id
      )
      Rails.logger.info "Conferindo: coleta-#{coleta.project.name}-#{coleta.tituloColeta}-#{coleta.tipoColeta}-#{coleta.textoData}.csv" 
      Rails.logger.info "Conferindo where: #{coleta.tipoColeta}-#{coleta.tituloColeta}-#{coleta.ano}-#{coleta.mes}-#{coleta.semestre}-#{coleta.project_id}" 

      csv_data = ExportCsv.export_coleta_to_csv(coleta.tituloColeta, coleta.tipoColeta, coletas)
      send_data csv_data, filename: "coleta-#{coleta.project.name}-#{coleta.tituloColeta}-#{coleta.tipoColeta}-#{coleta.textoData}.csv", type: 'text/csv'

    end


end
