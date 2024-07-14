class CreateColetaMensals < ActiveRecord::Migration[6.1]
  def change
    create_table :coleta_mensals do |t|
      t.String :cnpj
      t.text :razaoSocial
      t.integer :ano
    end
  end
end
