class Coleta < ActiveRecord::Base
  belongs_to :responsavelPreenchimento, :class_name => 'User'
  belongs_to :project
end
