class ColetaController < ApplicationController

    def gerarcsv
      coleta = Coleta.find(params[:id_coleta])
      coletas = Coleta.where(
          tituloColeta: coleta.tituloColeta, tipoColeta: coleta.tituloColeta,
          ano: coleta.ano, mes: coleta.mes, semestre: coleta.semeste, 
          project_id:  coleta.project_id
      )
      csv_data = ExportCsv.export_coleta_to_csv(coleta.tipoColeta, coletas)
      send_data csv_data, filename: "coleta-#{coleta.project.name}-#{coleta.tituloColeta}-#{coleta.tipoColeta}-#{coleta.textoData}.csv", type: 'text/csv'

    end


end
