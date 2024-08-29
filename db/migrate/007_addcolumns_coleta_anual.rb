class AddColumnsColetaAnual < ActiveRecord::Migration[6.1]

   def up
    add_column(:coleta, :idEstacao, :integer) 
    add_column(:coleta, :idEstacaoOrigem, :integer) 
    add_column(:coleta, :idEstacaoDestino, :integer) 
    add_column(:coleta, :idEnlace, :integer) 
    add_column(:coleta, :codigoSatelite, :integer) 
    add_column(:coleta, :freqUplink, :text) 
    add_column(:coleta, :freqDownlink, :text) 

  end

  def down
    # no-op
  end
  
end
