class Usuario
  attr_accessor :nome, :email, :telefone


  def initialize(user)
    self.nome = user.name
    self.email = user.mail
   
     projeto.custom_field_values.each do |custom_value|
        if !custom_value.value.blank? 
            if custom_value.custom_field.name == 'Telefone'
              self.telefone = custom_value.value.to_s
            end
        end
     end
  end

end
