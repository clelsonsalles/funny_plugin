class AnalistaController < ApplicationController

  def index_analista
    @projects = []  
    projetosUsuario = User.current.projects.to_a
    for projeto in projetosUsuario
        for membresia in projeto.memberships
          for papel in membresia.roles
             if papel.id == 6 && membresia.user_id == User.current.id
               @projects << projeto
             end
          end 
        end
    end
  end

  def cliente_analista
    projeto = Project.find(params[:id_projeto])
    @organizacao = Organizacao.new(projeto)
    @responsavelEmpresa = nil
    @responsavelPreenchimento = nil
    
    @coletas = []

    @tituloColeta = params[:titulo_coleta]

    servicosTelecom = nil
    projeto.visible_custom_field_values.each do |custom_value|
      if !custom_value.value.blank? 
          if custom_value.custom_field.name == 'Serviços de Telecom'
            servicosTelecom = custom_value.value.to_s
          end
      end
    end
          
    case @tituloColeta
      when "ColetaMensal"
        @coletas = montaColetasMensais(servicosTelecom)
      when "ColetaSemestral"
        @coletas = montaColetasSemestrais(servicosTelecom)
      when "ColetaAnual"
        @coletas = montaColetasAnuais(servicosTelecom)
      else
        @coletas = montaColetasMensais(servicosTelecom)
    end
    

    for membresia in projeto.memberships
      for papel in membresia.roles
         if papel.id == 5 
           @responsavelEmpresa = Usuario.new(User.find_by_id(membresia.user_id))
         end
         if papel.id == 7 
           @responsavelPreenchimento = Usuario.new(User.find_by_id(membresia.user_id) )
         end
        
      end 
    end

    
    projeto.visible_custom_field_values.each do |custom_value|
        if !custom_value.value.blank? 
            if custom_value.custom_field.name == 'CNPJ'
              @organizacao.cnpj = custom_value.value.to_s
            end
            if custom_value.custom_field.name == 'UF'
              @organizacao.uf = custom_value.value.to_s
            end
            if custom_value.custom_field.name == 'Endereço'
              @organizacao.endereco = custom_value.value.to_s
            end
            if custom_value.custom_field.name == 'CEP'
              @organizacao.cep = custom_value.value.to_s
            end
            if custom_value.custom_field.name == 'Cidade'
              @organizacao.cidade = custom_value.value.to_s
            end
            if custom_value.custom_field.name == 'Telefone'
              @organizacao.telefone = custom_value.value.to_s
            end
            if custom_value.custom_field.name == 'Email'
              @organizacao.email = custom_value.value.to_s
            end
            if custom_value.custom_field.name == 'Serviços de Telecom'
              @organizacao.servicos = custom_value.value.to_s
            end
        end
    end

    
  end

  def create
  end



  def montaColetasMensais (servicosTelecom)
        hoje = Time.current
        dataMesPassado = Time.current - 1.month
        
        anoAtual = hoje.year
        mesAtual = hoje.month
        mesAtualNome = hoje.strftime("%B")
    
        anoAnterior = dataMesPassado.year
        mesAnterior = dataMesPassado.month
        mesAnteriorNome = dataMesPassado.strftime("%B")
    
        coletaMesAnteriorSCM = nil
        coletaMesAnteriorTvPA = nil
        coletaMesAnteriorSTFC = nil
        coletaMesAtualSCM = nil
        coletaMesAtualTvPA = nil
        coletaMesAtualSTFC = nil
      
        if !servicosTelecom.nil? 
          if servicosTelecom.include? 'Mensal - SCM'
            coletaMesAnteriorSCM = montaColeta (Coleta.where(:mes => mesAnterior, :ano => anoAnterior, :tituloColeta => 'Coleta Mensal', :tipoColeta => 'SCM', :project_id => params[:id_projeto]))
            coletaMesAtualSCM = montaColeta (Coleta.where(:mes => mesAtual, :ano => anoAtual, :tituloColeta => 'Coleta Mensal', :tipoColeta => 'SCM', :project_id => params[:id_projeto]))
          end
          if servicosTelecom.include? 'Mensal - TvPA'
            coletaMesAnteriorTvPA = montaColeta (Coleta.where(:mes => mesAnterior, :ano => anoAnterior, :tituloColeta => 'Coleta Mensal', :tipoColeta => 'TvPA', :project_id => params[:id_projeto]))
            coletaMesAtualTvPA = montaColeta (Coleta.where(:mes => mesAtual, :ano => anoAtual, :tituloColeta => 'Coleta Mensal', :tipoColeta => 'TvPA', :project_id => params[:id_projeto]))
          end
          if servicosTelecom.include? 'Mensal - STFC'
            coletaMesAnteriorSTFC = montaColeta (Coleta.where(:mes => mesAnterior, :ano => anoAnterior, :tituloColeta => 'Coleta Mensal', :tipoColeta => 'STFC', :project_id => params[:id_projeto]))
            coletaMesAtualSTFC = montaColeta (Coleta.where(:mes => mesAtual, :ano => anoAtual, :tituloColeta => 'Coleta Mensal', :tipoColeta => 'STFC', :project_id => params[:id_projeto]))
          end
        end
        if coletaMesAnteriorSCM.nil?
            coletaMesAnteriorSCM = montaColeta(mesAnterior, anoAnterior, 'Coleta Mensal', 'SCM', params[:id_projeto])
        end
        if coletaMesAnteriorTvPA.nil?
            coletaMesAnteriorTvPA = montaColeta(mesAnterior, anoAnterior, 'Coleta Mensal', 'TvPA', params[:id_projeto])
        end
        if coletaMesAnteriorSTFC.nil?
            coletaMesAnteriorSTFC = montaColeta(mesAnterior, anoAnterior, 'Coleta Mensal', 'STFC', params[:id_projeto])
        end

        if coletaMesAtualSCM.nil?
            coletaMesAtualSCM = montaColeta(mesAtual, anoAtual, 'Coleta Mensal', 'SCM', params[:id_projeto])
        end
        if coletaMesAtualTvPA.nil?
            coletaMesAtualTvPA = montaColeta(mesAtual, anoAtual, 'Coleta Mensal', 'TvPA', params[:id_projeto])
        end
        if coletaMesAtualSTFC.nil?
            coletaMesAtualSTFC = montaColeta(mesAtual, anoAtual, 'Coleta Mensal', 'STFC', params[:id_projeto])
        end
      
      
   
        coletasMensais = [        coletaMesAnteriorSCM, coletaMesAnteriorTvPA, coletaMesAnteriorSTFC, coletaMesAtualSCM, coletaMesAtualTvPA, coletaMesAtualSTFC ]

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

  def montaColeta (coletaGravada)
      coleta = Coleta.new
      coleta.mes = coletaGravada.mes
      coleta.ano = coletaGravada.ano
      coleta.tituloColeta =  coletaGravada.tituloColeta
      coleta.tipoColeta = coletaGravada.tipoColeta
      coleta.project_id = coletaGravada.project.id

      coleta

  end
  
  def montaColetasSemestrais (servicosTelecom)

    coletasSemestrais = []
    coletasSemestrais

  end
  
  def montaColetasAnuais (servicosTelecom)

    coletasAnuais = []
    coletasAnuais
    
  end
  
end
