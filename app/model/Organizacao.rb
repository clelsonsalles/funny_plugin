class Organizacao
  attr_accessor :nome, :cnpj, :uf, :endereco, :cep, :cidade, :telefone, :email, :servicos, :userResponsavel, :userPreenchimento, :idProject


  def initialize(projeto)
    self.nome = projeto.name
    self.idProject = projeto.id

    projeto.custom_field_values.each do |custom_value|
        if !custom_value.value.blank? 
            if custom_value.custom_field.name == 'CNPJ'
              self.cnpj = custom_value.value.to_s
            end
        end
     end

    
  end

end
