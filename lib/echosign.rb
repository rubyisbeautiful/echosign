require 'cupcakinator'
require 'forwardable'
require 'byebug'

module Echosign
  extend SingleForwardable
  include Cupcakinator
  require_relative 'echosign/version'
  require_relative 'echosign/token'
  require_relative 'echosign/request'
  require_relative 'echosign/response'
  require_relative 'echosign/operation'
  require_relative 'echosign/services'
  require_relative 'echosign/agreement'

  cupcakinate file: 'echosign.yml', dir: 'config'

  def_delegator Echosign::Services, :services

  if const_defined?('Rake')
    Rake.application.add_import '/Users/bryan/apps/echosign/lib/tasks/echosign.rake'
  end


end
