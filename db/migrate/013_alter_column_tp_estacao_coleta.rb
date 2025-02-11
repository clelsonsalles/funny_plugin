class AlterColumnTpEstacaoColeta < ActiveRecord::Migration[6.1]
  def up
    change_column(:coleta, :tpEstacao, :text) 
  end

  def down
    # no-op
  end
end
