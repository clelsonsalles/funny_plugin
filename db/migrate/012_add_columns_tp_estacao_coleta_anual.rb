class AddColumnsTpEstacaoColetaAnual < ActiveRecord::Migration[6.1]

   def up
    add_column(:coleta, :tpEstacao, :integer) 
  end

  def down
    # no-op
  end
  
end
