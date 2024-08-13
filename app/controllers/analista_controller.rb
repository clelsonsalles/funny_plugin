class AnalistaController < ApplicationController

  def index_analista
      @projects = User.current.projects.to_a
  end

  def cliente_analista
    @organizacao = Organizacao.new(Project.find(params[:id_projeto]))

    
  end

  def create
  end
  
end
