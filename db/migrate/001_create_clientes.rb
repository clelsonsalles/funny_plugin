class CreateClientes < ActiveRecord::Migration
  def change
    create_table :cliente do |t|
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
