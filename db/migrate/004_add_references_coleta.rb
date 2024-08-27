class AddReferencesColeta < ActiveRecord::Migration[6.1]
  def up
    remove_reference(:coleta, :user, foreign_key: true )
    add_reference(:coleta, :usuarioCriacao, class_name: "User", foreign_key: true )
    add_reference(:coleta, :usuarioRealizacao, class_name: "User", foreign_key: true )
    add_reference(:coleta, :usuarioEnvio, class_name: "User", foreign_key: true)

    add_column(:coleta, :cnpj, :integer) 
    add_column(:coleta, :anoInformado, :integer) 

  end

  def down
    # no-op
  end

end
