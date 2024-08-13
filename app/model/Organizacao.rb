class Organizacao
  attr_accessor :nome, :cnpj, :uf, :endereco, :cep, :cidade, :telefone, :email, :servicos, :userResponsavel, :userPreenchimento


  def inicia(projeto)
    self.nome = projeto.name
  end

end
