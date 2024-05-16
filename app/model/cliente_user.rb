
class ClienteUser < User
  include Redmine::SafeAttributes

  safe_attributes(
      'empresaNome',
      'uf',
      'cnpj',
      'outorgas',
	  
      'nomeResponsavelEmpresa',
      'emailResponsavelEmpresa',
      'celularResponsavelEmpresa',
	  
      'celularResponsavelCadastro'

    )
  
end
