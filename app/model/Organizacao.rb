class Organizacao
  attr_accessor :nome, :cnpj, :uf, :endereco, :cep, :cidade, :telefone, :email, :servicos, :userResponsavel, :userPreenchimento


    def initialize(projeto)
      self.nome = projeto.name
    end

end
