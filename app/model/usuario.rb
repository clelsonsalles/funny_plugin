class Usuario
  attr_accessor :nome, :email, :telefone


  def initialize(user)
    self.nome = user.name
    self.email = user.mail
  end

end
