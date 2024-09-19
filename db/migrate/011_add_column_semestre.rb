class AddColumnSemestre < ActiveRecord::Migration[6.1]
  def up
    add_column(:coleta, :semestre, :integer) 
  end

  def down
    # no-op
  end
end
