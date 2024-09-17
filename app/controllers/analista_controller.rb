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
    @coletas = Coleta.where(:project_id => params[:id_projeto])

    @coletasMensais = nil
    @coletasSemestrais = nil
    @coletasAnuais = nil
    
    @tituloColeta = params[:titulo_coleta]
    hoje = Time.current
    dataMesPassado = Time.current - 1.month
    
    anoAtual = hoje.year
    mesAtual = hoje.month
    mesAtualNome = hoje.strftime("%B")

    anoAnterior = dataMesPassado.year
    mesAnterior = dataMesPassado.month
    mesAnteriorNome = dataMesPassado.strftime("%B")
    
    case @tituloColeta
      when 'Coleta Mensal'
        coletaMesAnterior = Coleta.where(:mes => mesAnterior, :ano => anoAnterior, :tituloColeta => 'Coleta Mensal', :project_id => params[:id_projeto])
        if coletaMesAnterior.nil?
            coletaMesAnterior = Coleta.new
            coletaMesAnterior.mes = mesAnterior
            coletaMesAnterior.ano = anoAnterior
            coletaMesAnterior.tituloColeta =  'Coleta Mensal'
            coletaMesAnterior.project_id = params[:id_projeto]
        end
        coletaMesAtual = Coleta.where(:mes => mesAtual, :ano => anoAtual, :tituloColeta => 'Coleta Mensal', :project_id => params[:id_projeto])
        if coletaMesAtual.nil?
            coletaMesAtual = Coleta.new
            coletaMesAtual.mes = mesAtual
            coletaMesAtual.ano = anoAtual
            coletaMesAtual.tituloColeta =  'Coleta Mensal'
            coletaMesAtual.project_id = params[:id_projeto]
        end
        @coletasMensais = [coletaMesAnterior, coletaMesAtual]

      when 'Coleta Semestral'
        @coletasSemestrais = nil

      when 'Coleta Anual'
        @coletasAnuais = nil

      else
        @coletasMensais = nil
      
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
  
end
