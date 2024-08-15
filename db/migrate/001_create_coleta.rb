class CreateColeta < ActiveRecord::Migration
  def change
    create_table :coleta do |t|
      t.text :tituloColeta
      t.text :tipoColeta
      t.integer :ano
      t.integer :mes
      t.text :trimestre
      t.text :uf
      t.text :cidade
      t.integer :codigoIBGE
      t.text :tipoCliente
      t.text :tipoAtendimento
      t.text :tipoMeio
      t.text :tipoTecnologia
      t.text :tipoProduto
      t.text :velocidade
      t.integer :quantidadeAcesso
      t.text :dadoInformado
      t.interger :valor
      t.text :cn


      t.references :project, foreign_key: true
      t.references :user, foreign_key: true
    end
  end
end
