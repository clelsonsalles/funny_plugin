class ClienteController < ApplicationController

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
    
    @user.save
    @papel = Role.find(6)
    @projeto = Project.find(1) 

    member = Member.new(:project => @project, :user_id => @user.id)
    member.set_editable_role_ids([6])
    member.save
    members = []
    members << member
    @project.members << members
    @project.save



      
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
