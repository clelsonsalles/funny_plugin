class CreateClientes < ActiveRecord::Migration[5.2] 
  def change
    create_table :clientes do |t|
      t.string :empresaNome
      t.string :uf
      t.string :cnpj
      t.string :outorgas
	  
      t.string :nomeResponsavelEmpresa
      t.string :emailResponsavelEmpresa
      t.string :celularResponsavelEmpresa
	  
      t.string :celularResponsavelCadastro

      t.references :user, foreign_key: true
      
    end
  end
end
