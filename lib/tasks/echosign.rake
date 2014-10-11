require 'rake'

directory 'config'

namespace :echosign do

  desc 'generate an echosign.yml'
  task :init => [ 'config' ] do
    FileUtils.cp File.expand_path(File.join(File.dirname(__FILE__),'../../templates/echosign.yml')), 'config/echosign.yml'
  end

end