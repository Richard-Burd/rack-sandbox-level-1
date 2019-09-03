# this file must be a <.ru> in order for the Ruby Rack gem to run.

# First it calls on the file containing the MySecondApplication class
require_relative "./second_app.rb"

# Then it runs the Rack gem
run MySecondApplication.new