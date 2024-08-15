class ColetaMensal < ActiveRecord::Base
  belongs_to :project
  belongs_to :responsavelPreenchimento, :class_name => 'User'
end
