class CreateColeta < ActiveRecord::Migration[6.1]
  def change
    create_table :coleta do |t|
      t.interger :cnpj
      t.interger :idEstacao
      t.integer :ano
      t.integer :idEstacaoOrigem
      t.interger :idEstacaoOrigem
      t.interger :idEstacaoDestino
      t.interger :idEnlace
      t.interger :codigoSatelite
      t.text :freqUplink
      t.text :freqDownlink
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
      t.integer :valor
      t.text :cn


      t.references :project, foreign_key: true
      t.references :user, foreign_key: true
    end
  end
end
