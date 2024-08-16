class AddDatasToColeta < ActiveRecord::Migration[6.1]
  def change
    add_column :coleta, :dataCriacao, :datetime
    add_column :coleta, :dataRealizacao, :datetime
    add_column :coleta, :dataInformacaoEnvio, :datetime
  end
end
