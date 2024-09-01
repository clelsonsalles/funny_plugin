class AddColumnsCepColetaAnual < ActiveRecord::Migration[6.1]

   def up
    add_column(:coleta, :cep, :integer) 
    

  end

  def down
    # no-op
  end
  
end
