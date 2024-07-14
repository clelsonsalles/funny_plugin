class CreateColetaSemestrals < ActiveRecord::Migration[6.1]
  def change
    create_table :coleta_semestrals do |t|
      t.String :cnpj
      t.text :razoSocial
      t.integer :ano
    end
  end
end
