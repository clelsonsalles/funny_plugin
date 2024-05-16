
class ClienteUser < User
    attribute :empresaNome, :string
    attribute :uf, :string
    attribute :cnpj, :string
    attribute :outorgas, :string
    attribute :nomeResponsavelEmpresa, :string
    attribute :emailResponsavelEmpresa, :string
    attribute :celularResponsavelEmpresa, :string
    attribute :celularResponsavelCadastro, :string

	  
end
