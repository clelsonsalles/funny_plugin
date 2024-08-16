class Coleta < ActiveRecord::Base
  belongs_to :user
  belongs_to :project

  def textoData      
      self.mes.to_s + "/" + self.ano.to_s
  end
end
