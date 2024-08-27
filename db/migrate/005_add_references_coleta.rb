class AddReferencesColeta < ActiveRecord::Migration[6.1]
  def up
    remove_reference(:coleta, :user, foreign_key: true )
    add_reference(:coleta, :usuarioCriacao, foreign_key: { to_table: :users } )
    add_reference(:coleta, :usuarioRealizacao, foreign_key: { to_table: :users } )
    add_reference(:coleta, :usuarioEnvio, foreign_key: { to_table: :users } )
  end

  def down
    # no-op
  end

end
