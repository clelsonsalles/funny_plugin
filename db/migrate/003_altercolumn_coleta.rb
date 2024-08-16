class AddDatasToColeta < ActiveRecord::Migration[6.1]
  def up
    add_column :coleta, :dataCriacao, :datetime
    add_column :coleta, :dataRealizacao, :datetime
    add_column :coleta, :dataInformacaoEnvio, :datetime
  end

  def down
    # no-op
  end

end
