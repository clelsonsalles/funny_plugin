class Organizacao
  attr_accessor :nome, :cnpj, :uf, :endereco, :cep, :cidade, :telefone, :email, :servicos, :userResponsavel, :userPreenchimento, :idProject


  def initialize(projeto)
    self.nome = projeto.name
    self.idProject = projeto.id
  end

end
