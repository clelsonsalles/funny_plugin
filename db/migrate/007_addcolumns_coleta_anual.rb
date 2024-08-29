class AddColumnsColetaAnual < ActiveRecord::Migration[6.1]

   def up
    add_column(:coleta, :idEstacao, :integer) 
    add_column(:coleta, :nEstacao, :integer) 
    add_column(:coleta, :abertura, :text) 
    add_column(:coleta, :rua, :text) 
    add_column(:coleta, :numeroEndereco, :text) 
    add_column(:coleta, :latitude, :text) 
    add_column(:coleta, :longitude, :text) 
    add_column(:coleta, :enlaceMeio, :text) 
    add_column(:coleta, :enlaceNominal, :text) 
    add_column(:coleta, :enlaceSwap, :text) 
    add_column(:coleta, :geometriaWkt, :text) 
    add_column(:coleta, :srid, :text) 
    add_column(:coleta, :largCanalUplink, :text) 
    add_column(:coleta, :capCanalUplink, :text) 
    add_column(:coleta, :largCanalDownlink, :text) 
    add_column(:coleta, :capCanalDownlink, :text) 
    add_column(:coleta, :cnpjContratada, :integer) 
      
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
