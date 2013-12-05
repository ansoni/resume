require 'bundler/setup'
lib_dir = File.join(File.dirname(__FILE__),"lib")
$: << lib_dir
require 'resume_app'


map "/" do
    run ResumeApp.new
end

