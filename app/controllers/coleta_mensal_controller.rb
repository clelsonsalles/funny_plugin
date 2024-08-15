class ColetaMensalController < ApplicationController

  def index
  end

  def create
  end

  def criar
    @coleta = Coleta.new
    @projeto = Project.find(params[:id_projeto])
  end
end
