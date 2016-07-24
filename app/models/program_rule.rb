class ProgramRule < ActiveRecord::Base
  belongs_to :program
  belongs_to :rule
  
end
