class AlterColumnCnpjColeta < ActiveRecord::Migration[6.1]
  def up
    change_column(:coleta, :cnpj, :bigint) 
    change_column(:coleta, :cnpjContratada, :bigint) 
  end

  def down
    # no-op
  end
end
