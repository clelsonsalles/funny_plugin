class AddReferencesColeta < ActiveRecord::Migration[6.1]
  def up
    remove_reference(:coleta, :user, foreign_key: true )
    add_reference(:coleta, :usuario_criacao, class_name: "User", foreign_key: true )
    add_reference(:coleta, :usuario_realizacao, class_name: "User", foreign_key: true )
    add_reference(:coleta, :usuario_envio, class_name: "User", foreign_key: true )

  end

  def down
    # no-op
  end

end
