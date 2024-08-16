class Coleta < ActiveRecord::Base
  belongs_to :user
  belongs_to :project

  def textoData
      self.mes + "/" + self.ano
  end
end
