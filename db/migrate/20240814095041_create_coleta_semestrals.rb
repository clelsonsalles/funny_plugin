class CreateColetaSemestrals < ActiveRecord::Migration[6.1]
  def change
    create_table :coleta_semestrals do |t|
      t.text :razaoSocial
      t.integer :cnpj
      t.integer :ano
      t.text :trimestre
      t.text :uf
      t.text :operacao
      t.interger :valor
      t.text :tipoDeServico

      t.references :project, foreign_key: true
      
    end
  end
end
