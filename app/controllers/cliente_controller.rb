class ClienteController < ApplicationController
  include ColetaHelper

  def index_cliente
    @responsavelEmpresa = nil
    @responsavelPreenchimento = nil
    @projetoPreenchimento = nil

    if !User.current.nil?
      projects = User.current.projects.to_a
      for projeto in projects
          for membresia in projeto.memberships
            if (membresia.user_id == User.current.id)
              for papel in membresia.roles
                 if papel.id == 5 
                     @responsavelEmpresa = Usuario.new(User.find_by_id(membresia.user_id))
                     @projetoPreenchimento = projeto 
                     @coletas = Coleta.where(:project_id => @projetoPreenchimento.id)
                     @organizacao = Organizacao.new(projeto)
                 end
                 if papel.id == 7 
                     @responsavelPreenchimento = Usuario.new(User.find_by_id(membresia.user_id) )
                     @projetoPreenchimento = projeto 
                     @coletas = Coleta.where(:project_id => @projetoPreenchimento.id)
                     @organizacao = Organizacao.new(projeto)
                 end
              end 
            end 
          end 
        end 
     end
    projeto = @projetoPreenchimento
    
    @organizacao = Organizacao.new(projeto)
    @coletas = []
    @tituloColeta = params[:titulo_coleta]
    @tituloColeta = @tituloColeta.nil? ? "ColetaMensal" : @tituloColeta;

    case @tituloColeta
      when "ColetaMensal"
        @coletas = ColetaHelper.montaColetasMensais(@projetoPreenchimento)
      when "ColetaSemestral"
        @coletas = ColetaHelper.montaColetasSemestrais(@projetoPreenchimento)
      when "ColetaAnual"
        @coletas = ColetaHelper.montaColetasAnuais(@projetoPreenchimento)
      else
        @coletas = ColetaHelper.montaColetasMensais(@projetoPreenchimento)
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
    

  
  def index
  end

  def edit
  end

  def update
  end


  def destroy
  end

  def new
    @clienteUser =   ClienteUser.new
  end

  def create
    valoresUsuario = params.require(:clienteUser).permit(:firstname, :lastname, :mail, :login, :password, :password_confirmation)
    valoresCliente = params.require(:clienteUser).permit(:empresaNome)

    @user = User.new(:language => Setting.default_language,
                     :mail_notification => Setting.default_notification_option,
                     :admin => false)

    
    unless @user.auth_source_id
      @user.password              = params[:clienteUsUer][:password]
      @user.password_confirmation = params[:clienteser][:password_confirmation]
    end

    @user.firstname = params[:clienteUser][:firstname]
    @user.lastname = params[:clienteUser][:lastname]
    @user.mail = params[:clienteUser][:mail]
    @user.login = params[:clienteUser][:login]
    
    if @user.save
      projeto = Project.find(1) 
  
      member = Member.new(:project => projeto, :user_id => @user.id)
      member.set_editable_role_ids([6])
      member.save
      members = []
      members << member
      projeto.members << members
      projeto.save
    end



      
    cliente = Cliente.new
    cliente.empresaNome = params.require(:clienteUser).permit(:empresaNome)
    cliente.user = @user
    cliente.save

    redirect_to aguarde_path()

  end

  def aguarde

  end


  def list
  end


  def find_issues_with_query(query)
  end



  
  # User self-registration
  def register
    (redirect_to(home_url); return) unless Setting.self_registration? || session[:auth_source_registration]
    if !request.post?
      session[:auth_source_registration] = nil
      @user = User.new(:language => current_language.to_s)
      @cliente_user = ClienteUser.new(:language => current_language.to_s)
    else
      user_params = params[:cliente_user] || {}
      @cliente_user = ClienteUser.new
      @user = User.new
      
      @user.safe_attributes = params.require(:cliente_user).permit(:login, :password, :password_confirmation, :firstname, :lastname, :mail)
      @user.pref.safe_attributes = params[:pref]
      @user.admin = false
      @user.register
      if session[:auth_source_registration]
        @user.activate
        @user.login = session[:auth_source_registration][:login]
        @user.auth_source_id = session[:auth_source_registration][:auth_source_id]
        if @user.save
          session[:auth_source_registration] = nil
          self.logged_user = @user
          flash[:notice] = l(:notice_account_activated)


          redirect_to aguarde_path()

        end
      else
        unless user_params[:password].blank? && user_params[:password_confirmation].blank?
          @user.password, @user.password_confirmation = user_params[:password], user_params[:password_confirmation]
        end

        case Setting.self_registration
        when '1'
          register_by_email_activation(@user)
        when '3'
          register_automatically(@user)
        else
          register_manually_by_administrator(@user)
        end
      end
    end
  end

end
