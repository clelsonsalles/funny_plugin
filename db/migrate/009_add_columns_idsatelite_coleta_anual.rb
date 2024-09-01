class AddColumnsIdsateliteColetaAnual < ActiveRecord::Migration[6.1]

   def up
    add_column(:coleta, :idSatelite, :text) 
    

  end

  def down
    # no-op
  end
  
end
