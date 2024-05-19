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
    @cliente =   ClienteUser.new
  end

  def create
    valoresUsuario = params.require(:cliente_user).permit(:firstname, :lastname, :mail, :login, :password, :password_confirmation)
    valoresCliente = params.require(:cliente_user).permit(:empresaNome)

    @user = User.new(:language => Setting.default_language,
                     :mail_notification => Setting.default_notification_option,
                     :admin => false)

    
    unless @user.auth_source_id
      @user.password              = params[:cliente_user][:password]
      @user.password_confirmation = params[:cliente_user][:password_confirmation]
    end

    @user.firstname = params[:cliente_user][:firstname]
    @user.lastname = params[:cliente_user][:lastname]
    @user.mail = params[:cliente_user][:mail]
    @user.login = params[:cliente_user][:login]
    
    @user.save

      
    cliente = Cliente.create(valoresCliente)
    
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
      @user.safe_attributes = user_params
      @user.pref.safe_attributes = params[:pref]

      @user.login = params.require(:cliente_user).permit(:login)
      @user.password = params.require(:cliente_user).permit(:password)
      @user.password_confirmation = params.require(:cliente_user).permit(:password_confirmation)
      @user.firstname = params.require(:cliente_user).permit(:firstname)
      @user.lastname = params.require(:cliente_user).permit(:lastname)
      @user.mail = params.require(:cliente_user).permit(:mail)
        
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

          #TODO savar o cliente
          cliente = Cliente.create( params.require(:cliente_user).permit(:empresaNome, :uf, :cnpj, :outorgas, :nomeResponsavelEmpresa, :emailResponsavelEmpresa, :celularResponsavelEmpresa, :celularResponsavelCadastro))
          cliente.user = @user
          cliente.save

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
