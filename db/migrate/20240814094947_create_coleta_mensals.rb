class CreateColetaMensals < ActiveRecord::Migration[6.1]
  def change
    create_table :coleta_mensals do |t|
      t.text :razaoSocial
      t.integer :cnpj
      t.integer :ano

      t.references :project, foreign_key: true

    end
  end
end
