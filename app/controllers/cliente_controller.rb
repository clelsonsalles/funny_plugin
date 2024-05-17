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

end
