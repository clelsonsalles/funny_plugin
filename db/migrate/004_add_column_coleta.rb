class AddColumnColeta < ActiveRecord::Migration[6.1]
  def up
    add_column(:coleta, :cnpj, :integer) 
    add_column(:coleta, :anoInformado, :integer) 
  end

  def down
    # no-op
  end
end
