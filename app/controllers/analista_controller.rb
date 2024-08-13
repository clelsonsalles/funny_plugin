class AnalistaController < ApplicationController

  def index_analista
      @projects = User.current.projects.to_a
  end

  def cliente_analista
    @organizacao = Organizacao.new(Project.find(params[:id_projeto]))

    @organizacao.visible_custom_field_values.each do |custom_value|
        if !custom_value.value.blank? 
            if custom_value.name == 'CNPJ'
              @organizacao.cnpj(custom_value.value)
            end
        end
    end

    
  end

  def create
  end
  
end
