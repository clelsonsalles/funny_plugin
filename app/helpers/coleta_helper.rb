module ColetaHelper



  def self.montaColetasMensais (projeto)
        servicosTelecom = nil
        projeto.visible_custom_field_values.each do |custom_value|
          if !custom_value.value.blank? 
              if custom_value.custom_field.name == 'Serviços de Telecom'
                servicosTelecom = custom_value.value.to_s
              end
          end
        end
    
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
            coletaMesAnteriorSCM = montaColetasGravadas (Coleta.where(mes: mesAnterior, ano: anoAnterior, tituloColeta: tituloColeta, tipoColeta: 'SCM', :project_id => projeto.id))
            coletaMesAtualSCM = montaColetasGravadas (Coleta.where(mes: mesAtual, ano: anoAtual,  tituloColeta: tituloColeta, tipoColeta: 'SCM', :project_id => projeto.id))
            coletaMesAnteriorSCM = coletaMesAnteriorSCM.nil? ? 
                montaColeta(mesAnterior, anoAnterior, tituloColeta, 'SCM', projeto.id) : coletaMesAnteriorSCM
            coletaMesAtualSCM = coletaMesAtualSCM.nil? ? 
                montaColeta(mesAtual, anoAtual, tituloColeta, 'SCM', projeto.id) : coletaMesAtualSCM

            coletasMensais << coletaMesAnteriorSCM
            coletasMensais << coletaMesAtualSCM
          end
          if servicosTelecom.include? 'Mensal - TvPA'
            coletaMesAnteriorTvPA = montaColetasGravadas (Coleta.where(mes: mesAnterior, ano: anoAnterior,  tituloColeta: tituloColeta, tipoColeta: 'TvPA', :project_id => projeto.id))
            coletaMesAtualTvPA = montaColetasGravadas (Coleta.where(mes: mesAtual, ano: anoAtual,  tituloColeta: tituloColeta, tipoColeta: 'TvPA', :project_id => projeto.id))
            coletaMesAnteriorTvPA = coletaMesAnteriorTvPA.nil? ? 
                montaColeta(mesAnterior, anoAnterior, tituloColeta, 'TvPA', projeto.id) : coletaMesAnteriorTvPA
            coletaMesAtualTvPA = coletaMesAtualTvPA.nil? ? 
                montaColeta(mesAtual, anoAtual, tituloColeta, 'TvPA', projeto.id) : coletaMesAtualTvPA

            coletasMensais << coletaMesAnteriorTvPA
            coletasMensais << coletaMesAtualTvPA
          end
          if servicosTelecom.include? 'Mensal - STFC'
            coletaMesAnteriorSTFC = montaColetasGravadas (Coleta.where(mes: mesAnterior, ano: anoAnterior,  tituloColeta: tituloColeta, tipoColeta: 'STFC', :project_id => projeto.id))
            coletaMesAtualSTFC = montaColetasGravadas (Coleta.where(mes: mesAtual, ano: anoAtual,  tituloColeta: tituloColeta, tipoColeta: 'STFC', :project_id => projeto.id))
            coletaMesAnteriorSTFC = coletaMesAnteriorSTFC.nil? ? 
                montaColeta(mesAnterior, anoAnterior, tituloColeta, 'STFC', projeto.id) : coletaMesAnteriorSTFC
            coletaMesAtualSTFC = coletaMesAtualSTFC.nil? ? 
                montaColeta(mesAtual, anoAtual, tituloColeta, 'STFC', projeto.id) : coletaMesAtualSTFC

            coletasMensais << coletaMesAnteriorSTFC
            coletasMensais << coletaMesAtualSTFC
          end
        end

        coletasMensais
  end

  def self.montaColeta (mesAnterior, anoAnterior, tituloColeta, tipoColeta, project_id)
      coleta = Coleta.new
      coleta.mes = mesAnterior
      coleta.ano = anoAnterior
      coleta.tituloColeta =  tituloColeta
      coleta.tipoColeta = tipoColeta
      coleta.project_id = project_id

      coleta

  end

  def self.montaColetaSemestral (mesAnterior, anoAnterior, tituloColeta, tipoColeta, project_id, semestre)
      coleta = Coleta.new
      coleta.mes = mesAnterior
      coleta.ano = anoAnterior
      coleta.tituloColeta =  tituloColeta
      coleta.tipoColeta = tipoColeta
      coleta.project_id = project_id
      coleta.semestre = semestre

      coleta

  end  

  def self.montaColetasGravadas (coletasGravadas)
    for coletaGravada in coletasGravadas
      coleta = Coleta.new
      coleta.id = coletaGravada.id
      coleta.mes = coletaGravada.mes
      coleta.ano = coletaGravada.ano
      coleta.tituloColeta =  coletaGravada.tituloColeta
      coleta.tipoColeta = coletaGravada.tipoColeta
      coleta.project_id = coletaGravada.project.id
      coleta.dataRealizacao = coletaGravada.dataRealizacao
    end

    coleta

  end
  
  def self.montaColetasSemestrais (projeto)
        servicosTelecom = nil
        projeto.visible_custom_field_values.each do |custom_value|
          if !custom_value.value.blank? 
              if custom_value.custom_field.name == 'Serviços de Telecom'
                servicosTelecom = custom_value.value.to_s
              end
          end
        end

        tituloColeta = Coleta.semestral
        anoAtual = Time.current.year
        mesAtual = Time.current.month
        mesAtualNome = Time.current.strftime("%B")
    
        coletaSemestralPrimSCM = coletaSemestralSegSCM = coletaSemestralPrimSEAC = coletaSemestralSegSEAC = coletaSemestralPrimSMP = coletaSemestralSegSMP = nil
        coletasSemestrais = []

        if !servicosTelecom.nil? 
          if servicosTelecom.include? 'Semestral - SCM'
            coletaSemestralPrimSCM = montaColetasGravadas (Coleta.where(semestre: 1, mes: mesAtual, ano: anoAtual, tituloColeta: tituloColeta, tipoColeta: 'SCM', :project_id => projeto.id))
            coletaSemestralSegSCM = montaColetasGravadas (Coleta.where(semestre: 2, mes: mesAtual, ano: anoAtual,  tituloColeta: tituloColeta, tipoColeta: 'SCM', :project_id => projeto.id))
            coletaSemestralPrimSCM = coletaSemestralPrimSCM.nil? ? 
                montaColetaSemestral(mesAtual, anoAtual, tituloColeta, 'SCM', projeto.id, 1) : coletaSemestralPrimSCM
            coletaSemestralSegSCM = coletaSemestralSegSCM.nil? ? 
                montaColetaSemestral(mesAtual, anoAtual, tituloColeta, 'SCM', projeto.id, 2) : coletaSemestralSegSCM

            coletasSemestrais << coletaSemestralPrimSCM
            coletasSemestrais << coletaSemestralSegSCM
          end
          if servicosTelecom.include? 'Semestral - SEAC'
            coletaSemestralPrimSEAC = montaColetasGravadas (Coleta.where(semestre: 1, mes: mesAtual, ano: anoAtual,  tituloColeta: tituloColeta, tipoColeta: 'SEAC', :project_id => projeto.id))
            coletaSemestralSegSEAC = montaColetasGravadas (Coleta.where(semestre: 2, mes: mesAtual, ano: anoAtual,  tituloColeta: tituloColeta, tipoColeta: 'SEAC', :project_id => projeto.id))
            coletaSemestralPrimSEAC = coletaSemestralPrimSEAC.nil? ? 
                montaColetaSemestral(mesAtual, anoAtual, tituloColeta, 'SEAC', projeto.id, 1) : coletaSemestralPrimSEAC
            coletaSemestralSegSEAC = coletaSemestralSegSEAC.nil? ? 
                montaColetaSemestral(mesAtual, anoAtual, tituloColeta, 'SEAC', projeto.id, 2) : coletaSemestralSegSEAC

            coletasSemestrais << coletaSemestralPrimSEAC
            coletasSemestrais << coletaSemestralSegSEAC
          end
          if servicosTelecom.include? 'Semestral - SMP'
            coletaSemestralPrimSMP = montaColetasGravadas (Coleta.where(semestre: 1, mes: mesAtual, ano: anoAtual,  tituloColeta: tituloColeta, tipoColeta: 'SMP', :project_id => projeto.id))
            coletaSemestralSegSMP = montaColetasGravadas (Coleta.where(semestre: 2, mes: mesAtual, ano: anoAtual,  tituloColeta: tituloColeta, tipoColeta: 'SMP', :project_id => projeto.id))
            coletaSemestralPrimSMP = coletaSemestralPrimSMP.nil? ? 
                montaColetaSemestral(mesAtual, anoAtual, tituloColeta, 'SMP', projeto.id, 1) : coletaSemestralPrimSMP
            coletaSemestralSegSMP = coletaSemestralSegSMP.nil? ? 
                montaColetaSemestral(mesAtual, anoAtual, tituloColeta, 'SMP', projeto.id, 2) : coletaSemestralSegSMP

            coletasSemestrais << coletaSemestralPrimSMP
            coletasSemestrais << coletaSemestralSegSMP
          end
        end

        coletasSemestrais
  end
  
  def self.montaColetasAnuais (projeto)
        servicosTelecom = nil
        projeto.visible_custom_field_values.each do |custom_value|
          if !custom_value.value.blank? 
              if custom_value.custom_field.name == 'Serviços de Telecom'
                servicosTelecom = custom_value.value.to_s
              end
          end
        end
    
        tituloColeta = Coleta.anual
        anoAtual = Time.current.year
        mesAtual = Time.current.month
        mesAtualNome = Time.current.strftime("%B")
    
        coletaAnualESTACAO = coletaAnualENLACESPROPRIOS = coletaAnualENCALCESCONTRATADOS = coletaAnualENCALCESVIASATELITE = nil
        coletasAnuais = []

        if !servicosTelecom.nil? 
          if servicosTelecom.include? 'Anual - Estação'
            coletaAnualESTACAO = montaColetasGravadas (Coleta.where(mes: mesAtual, ano: anoAtual, tituloColeta: tituloColeta, tipoColeta: 'Estação', :project_id => projeto.id))
            coletaAnualESTACAO = coletaAnualESTACAO.nil? ? 
                montaColeta(mesAtual, anoAtual, tituloColeta, 'Estação', projeto.id) : coletaAnualESTACAO

            coletasAnuais << coletaAnualESTACAO
          end
          if servicosTelecom.include? 'Anual - Enlaces próprios'
            coletaAnualENLACESPROPRIOS = montaColetasGravadas (Coleta.where(mes: mesAtual, ano: anoAtual, tituloColeta: tituloColeta, tipoColeta: 'Enlaces próprios', :project_id => projeto.id))
            coletaAnualENLACESPROPRIOS = coletaAnualENLACESPROPRIOS.nil? ? 
                montaColeta(mesAtual, anoAtual, tituloColeta, 'Enlaces próprios', projeto.id) : coletaAnualENLACESPROPRIOS

            coletasAnuais << coletaAnualENLACESPROPRIOS
          end
          if servicosTelecom.include? 'Anual - Encalces contratados'
            coletaAnualENCALCESCONTRATADOS = montaColetasGravadas (Coleta.where(mes: mesAtual, ano: anoAtual, tituloColeta: tituloColeta, tipoColeta: 'Encalces contratados', :project_id => projeto.id))
            coletaAnualENCALCESCONTRATADOS = coletaAnualENCALCESCONTRATADOS.nil? ? 
                montaColeta(mesAtual, anoAtual, tituloColeta, 'Encalces contratados', projeto.id) : coletaAnualENCALCESCONTRATADOS

            coletasAnuais << coletaAnualENCALCESCONTRATADOS
          end
          if servicosTelecom.include? 'Anual - Encalces via satélite'
            coletaAnualENCALCESVIASATELITE = montaColetasGravadas (Coleta.where(mes: mesAtual, ano: anoAtual, tituloColeta: tituloColeta, tipoColeta: 'Encalces via satélite', :project_id => projeto.id))
            coletaAnualENCALCESVIASATELITE = coletaAnualENCALCESVIASATELITE.nil? ? 
                montaColeta(mesAtual, anoAtual, tituloColeta, 'Encalces via satélite', projeto.id) : coletaAnualENCALCESVIASATELITE

            coletasAnuais << coletaAnualENCALCESVIASATELITE
          end
        end

    coletasAnuais
    
  end
  
end
