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
    valoresUsuario = params.require(:cliente).permit(:empresaNome)
    valoresCliente = params.require(:cliente).permit(:empresaNome)

    usuario = User.create(valoresUsuario)
    cliente = Cliente.create(valoresCliente)
    cliente.user = usuario
    cliente.save

    redirect_to cliente_index_path()

  end


  def list
  end


  def find_issues_with_query(query)
  end

end
