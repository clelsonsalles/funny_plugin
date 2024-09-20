module ColetaHelper



  def self.montaColetasMensais (servicosTelecom)
        tituloColeta = Coleta.mensal
        anoAtual = Time.current.year
        mesAtual = Time.current.month
        mesAtualNome = Time.current.strftime("%B")
    
        dataMesPassado = Time.current - 1.month
        anoAnterior = dataMesPassado.year
        mesAnterior = dataMesPassado.month
        mesAnteriorNome = dataMesPassado.strftime("%B")
    
        coletaMesAnteriorSCM = coletaMesAnteriorTvPA = coletaMesAnteriorSTFC = coletaMesAtualSCM = coletaMesAtualTvPA = coletaMesAtualSTFC = nil
        coletasMensais = [ ]
        if !servicosTelecom.nil? 
          if servicosTelecom.include? 'Mensal - SCM'
            coletaMesAnteriorSCM = montaColetasGravadas (Coleta.where(mes: mesAnterior, ano: anoAnterior, tituloColeta: tituloColeta, tipoColeta: 'SCM', :project_id => params[:id_projeto]))
            coletaMesAtualSCM = montaColetasGravadas (Coleta.where(mes: mesAtual, ano: anoAtual,  tituloColeta: tituloColeta, tipoColeta: 'SCM', :project_id => params[:id_projeto]))
            coletaMesAnteriorSCM = coletaMesAnteriorSCM.nil? ? 
                montaColeta(mesAnterior, anoAnterior, tituloColeta, 'SCM', params[:id_projeto]) : coletaMesAnteriorSCM
            coletaMesAtualSCM = coletaMesAtualSCM.nil? ? 
                montaColeta(mesAtual, anoAtual, tituloColeta, 'SCM', params[:id_projeto]) : coletaMesAtualSCM

            coletasMensais << coletaMesAnteriorSCM
            coletasMensais << coletaMesAtualSCM
          end
          if servicosTelecom.include? 'Mensal - TvPA'
            coletaMesAnteriorTvPA = montaColetasGravadas (Coleta.where(mes: mesAnterior, ano: anoAnterior,  tituloColeta: tituloColeta, tipoColeta: 'TvPA', :project_id => params[:id_projeto]))
            coletaMesAtualTvPA = montaColetasGravadas (Coleta.where(mes: mesAtual, ano: anoAtual,  tituloColeta: tituloColeta, tipoColeta: 'TvPA', :project_id => params[:id_projeto]))
            coletaMesAnteriorTvPA = coletaMesAnteriorTvPA.nil? ? 
                montaColeta(mesAnterior, anoAnterior, tituloColeta, 'TvPA', params[:id_projeto]) : coletaMesAnteriorTvPA
            coletaMesAtualTvPA = coletaMesAtualTvPA.nil? ? 
                montaColeta(mesAtual, anoAtual, tituloColeta, 'TvPA', params[:id_projeto]) : coletaMesAtualTvPA

            coletasMensais << coletaMesAnteriorTvPA
            coletasMensais << coletaMesAtualTvPA
          end
          if servicosTelecom.include? 'Mensal - STFC'
            coletaMesAnteriorSTFC = montaColetasGravadas (Coleta.where(mes: mesAnterior, ano: anoAnterior,  tituloColeta: tituloColeta, tipoColeta: 'STFC', :project_id => params[:id_projeto]))
            coletaMesAtualSTFC = montaColetasGravadas (Coleta.where(mes: mesAtual, ano: anoAtual,  tituloColeta: tituloColeta, tipoColeta: 'STFC', :project_id => params[:id_projeto]))
            coletaMesAnteriorSTFC = coletaMesAnteriorSTFC.nil? ? 
                montaColeta(mesAnterior, anoAnterior, tituloColeta, 'STFC', params[:id_projeto]) : coletaMesAnteriorSTFC
            coletaMesAtualSTFC = coletaMesAtualSTFC.nil? ? 
                montaColeta(mesAtual, anoAtual, tituloColeta, 'STFC', params[:id_projeto]) : coletaMesAtualSTFC

            coletasMensais << coletaMesAnteriorSTFC
            coletasMensais << coletaMesAtualSTFC
          end
        end

        coletasMensais
  end

  def montaColeta (mesAnterior, anoAnterior, tituloColeta, tipoColeta, id_projeto)
      coleta = Coleta.new
      coleta.mes = mesAnterior
      coleta.ano = anoAnterior
      coleta.tituloColeta =  tituloColeta
      coleta.tipoColeta = tipoColeta
      coleta.project_id = id_projeto

      coleta

  end

  def montaColetaSemestral (mesAnterior, anoAnterior, tituloColeta, tipoColeta, id_projeto, semestre)
      coleta = Coleta.new
      coleta.mes = mesAnterior
      coleta.ano = anoAnterior
      coleta.tituloColeta =  tituloColeta
      coleta.tipoColeta = tipoColeta
      coleta.project_id = id_projeto
      coleta.semestre = semestre

      coleta

  end  

  def montaColetasGravadas (coletasGravadas)
    for coletaGravada in coletasGravadas
      coleta = Coleta.new
      coleta.mes = coletaGravada.mes
      coleta.ano = coletaGravada.ano
      coleta.tituloColeta =  coletaGravada.tituloColeta
      coleta.tipoColeta = coletaGravada.tipoColeta
      coleta.project_id = coletaGravada.project.id
    end

    coleta

  end
  
  def self.montaColetasSemestrais (servicosTelecom)
        tituloColeta = Coleta.semestral
        anoAtual = Time.current.year
        mesAtual = Time.current.month
        mesAtualNome = Time.current.strftime("%B")
    
        coletaSemestralPrimSCM = coletaSemestralSegSCM = coletaSemestralPrimSEAC = coletaSemestralSegSEAC = coletaSemestralPrimSMP = coletaSemestralSegSMP = nil
        coletasSemestrais = []

        if !servicosTelecom.nil? 
          if servicosTelecom.include? 'Semestral - SCM'
            coletaSemestralPrimSCM = montaColetasGravadas (Coleta.where(semestre: 1, mes: mesAtual, ano: anoAtual, tituloColeta: tituloColeta, tipoColeta: 'SCM', :project_id => params[:id_projeto]))
            coletaSemestralSegSCM = montaColetasGravadas (Coleta.where(semestre: 2, mes: mesAtual, ano: anoAtual,  tituloColeta: tituloColeta, tipoColeta: 'SCM', :project_id => params[:id_projeto]))
            coletaSemestralPrimSCM = coletaSemestralPrimSCM.nil? ? 
                montaColetaSemestral(mesAtual, anoAtual, tituloColeta, 'SCM', params[:id_projeto], 1) : coletaSemestralPrimSCM
            coletaSemestralSegSCM = coletaSemestralSegSCM.nil? ? 
                montaColetaSemestral(mesAtual, anoAtual, tituloColeta, 'SCM', params[:id_projeto], 2) : coletaSemestralSegSCM

            coletasSemestrais << coletaSemestralPrimSCM
            coletasSemestrais << coletaSemestralSegSCM
          end
          if servicosTelecom.include? 'Semestral - SEAC'
            coletaSemestralPrimSEAC = montaColetasGravadas (Coleta.where(semestre: 1, mes: mesAtual, ano: anoAtual,  tituloColeta: tituloColeta, tipoColeta: 'SEAC', :project_id => params[:id_projeto]))
            coletaSemestralSegSEAC = montaColetasGravadas (Coleta.where(semestre: 2, mes: mesAtual, ano: anoAtual,  tituloColeta: tituloColeta, tipoColeta: 'SEAC', :project_id => params[:id_projeto]))
            coletaSemestralPrimSEAC = coletaSemestralPrimSEAC.nil? ? 
                montaColetaSemestral(mesAtual, anoAtual, tituloColeta, 'SEAC', params[:id_projeto], 1) : coletaSemestralPrimSEAC
            coletaSemestralSegSEAC = coletaSemestralSegSEAC.nil? ? 
                montaColetaSemestral(mesAtual, anoAtual, tituloColeta, 'SEAC', params[:id_projeto], 2) : coletaSemestralSegSEAC

            coletasSemestrais << coletaSemestralPrimSEAC
            coletasSemestrais << coletaSemestralSegSEAC
          end
          if servicosTelecom.include? 'Semestral - SMP'
            coletaSemestralPrimSMP = montaColetasGravadas (Coleta.where(semestre: 1, mes: mesAtual, ano: anoAtual,  tituloColeta: tituloColeta, tipoColeta: 'SMP', :project_id => params[:id_projeto]))
            coletaSemestralSegSMP = montaColetasGravadas (Coleta.where(semestre: 2, mes: mesAtual, ano: anoAtual,  tituloColeta: tituloColeta, tipoColeta: 'SMP', :project_id => params[:id_projeto]))
            coletaSemestralPrimSMP = coletaSemestralPrimSMP.nil? ? 
                montaColetaSemestral(mesAtual, anoAtual, tituloColeta, 'SMP', params[:id_projeto], 1) : coletaSemestralPrimSMP
            coletaSemestralSegSMP = coletaSemestralSegSMP.nil? ? 
                montaColetaSemestral(mesAtual, anoAtual, tituloColeta, 'SMP', params[:id_projeto], 2) : coletaSemestralSegSMP

            coletasSemestrais << coletaSemestralPrimSMP
            coletasSemestrais << coletaSemestralSegSMP
          end
        end

        coletasSemestrais
  end
  
  def self.montaColetasAnuais (servicosTelecom)
        tituloColeta = Coleta.anual
        anoAtual = Time.current.year
        mesAtual = Time.current.month
        mesAtualNome = Time.current.strftime("%B")
    
        coletaAnualESTACAO = coletaAnualENLACESPROPRIOS = coletaAnualENCALCESCONTRATADOS = coletaAnualENCALCESVIASATELITE = nil
        coletasAnuais = []

        if !servicosTelecom.nil? 
          if servicosTelecom.include? 'Anual - Estação'
            coletaAnualESTACAO = montaColetasGravadas (Coleta.where(mes: mesAtual, ano: anoAtual, tituloColeta: tituloColeta, tipoColeta: 'Estação', :project_id => params[:id_projeto]))
            coletaAnualESTACAO = coletaAnualESTACAO.nil? ? 
                montaColeta(mesAtual, anoAtual, tituloColeta, 'Estação', params[:id_projeto]) : coletaAnualESTACAO

            coletasAnuais << coletaAnualESTACAO
          end
          if servicosTelecom.include? 'Anual - Enlaces próprios'
            coletaAnualENLACESPROPRIOS = montaColetasGravadas (Coleta.where(mes: mesAtual, ano: anoAtual, tituloColeta: tituloColeta, tipoColeta: 'Enlaces próprios', :project_id => params[:id_projeto]))
            coletaAnualENLACESPROPRIOS = coletaAnualENLACESPROPRIOS.nil? ? 
                montaColeta(mesAtual, anoAtual, tituloColeta, 'Enlaces próprios', params[:id_projeto]) : coletaAnualENLACESPROPRIOS

            coletasAnuais << coletaAnualENLACESPROPRIOS
          end
          if servicosTelecom.include? 'Anual - Encalces contratados'
            coletaAnualENCALCESCONTRATADOS = montaColetasGravadas (Coleta.where(mes: mesAtual, ano: anoAtual, tituloColeta: tituloColeta, tipoColeta: 'Encalces contratados', :project_id => params[:id_projeto]))
            coletaAnualENCALCESCONTRATADOS = coletaAnualENCALCESCONTRATADOS.nil? ? 
                montaColeta(mesAtual, anoAtual, tituloColeta, 'Encalces contratados', params[:id_projeto]) : coletaAnualENCALCESCONTRATADOS

            coletasAnuais << coletaAnualENCALCESCONTRATADOS
          end
          if servicosTelecom.include? 'Anual - Encalces via satélite'
            coletaAnualENCALCESVIASATELITE = montaColetasGravadas (Coleta.where(mes: mesAtual, ano: anoAtual, tituloColeta: tituloColeta, tipoColeta: 'Encalces via satélite', :project_id => params[:id_projeto]))
            coletaAnualENCALCESVIASATELITE = coletaAnualENCALCESVIASATELITE.nil? ? 
                montaColeta(mesAtual, anoAtual, tituloColeta, 'Encalces via satélite', params[:id_projeto]) : coletaAnualENCALCESVIASATELITE

            coletasAnuais << coletaAnualENCALCESVIASATELITE
          end
        end

    coletasAnuais
    
  end
  
end
