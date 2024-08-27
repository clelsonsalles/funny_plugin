class AddColumnColeta < ActiveRecord::Migration[6.1]
  def up
    add_column(:coleta, :mesInformado, :integer) 
    
  end

  def down
    # no-op
  end
end
