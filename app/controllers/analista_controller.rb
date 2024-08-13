class AnalistaController < ApplicationController

  def index_analista
      @projects = User.current.projects.to_a
  end

  def cliente_analista
    projeto = Project.find(params[:id_projeto])
    @organizacao = Organizacao.new(projeto)

    projeto.visible_custom_field_values.each do |custom_value|
        if !custom_value.value.blank? 
            if custom_value.custom_field.name == 'CNPJ'
              @organizacao.cnpj = custom_value.value.to_s
            end
        end
    end

    
  end

  def create
  end
  
end
