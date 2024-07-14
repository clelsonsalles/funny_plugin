class CreateColetaSemestrals < ActiveRecord::Migration[6.1]
  def change
    create_table :coleta_semestrals do |t|
      t.text :razaoSocial
      t.integer :cnpj
      t.integer :ano
    end
  end
end
