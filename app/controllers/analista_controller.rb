class AnalistaController < ApplicationController

  def index_analista
      @projects = User.current.projects.to_a
  end

  def cliente_analista
    organizacao = Project.find(params[:id_projeto])
    membros = organizacao.memberships.sorted.to_a
  end

  def create
  end
  
end
