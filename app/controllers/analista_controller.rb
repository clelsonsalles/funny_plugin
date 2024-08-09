class AnalistaController < ApplicationController

  def index_analista
      @projects = User.current.projects.to_a
  end

  def create
  end
  
end
