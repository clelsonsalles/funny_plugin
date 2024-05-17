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

    usuario = User.create(valoresUsuario)
    cliente = Cliente.create(valoresCliente)
    cliente.user = usuario
    cliente.save

    redirect_to cliente_aguarde_path()

  end

  def aguarde

  end


  def list
  end


  def find_issues_with_query(query)
  end

end
