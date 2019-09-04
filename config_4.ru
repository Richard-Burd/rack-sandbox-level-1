# this file must be a <.ru> in order for the Ruby Rack gem to run.
# this is the default naming convention

# it calls on the file containing the MyFirstApplication class
# then it runs the Rack gem
require_relative "./fourth_app.rb"

require_relative "./song_class.rb"

run MyFourthApplication.new
