# Push this to the local host like this:
# $ rackup config_2.ru


# The class name here must match the class name in this line:
# run MySecondApplication.new
# located in config_2.ru
class MySecondApplication
  
  @@items = ["Nuts","Bolts","Screws"]

  # The #call method is called inside the Ruby Rack gem,
  # so if you change it below, Rack will break.
  def call(my_env_var)
  	# This object represents the responses
    my_response_var = Rack::Response.new
    
    # This object represents the requests
    my_request_var = Rack::Request.new(my_env_var)
    
    # navigate to: 
    # http://localhost:9292/index (or http://localhost:9292/indexyz1234) <=# this will actually work
    # ...in the VM machine's web browser
    if my_request_var.path.match(/index/)
      my_response_var.write "The \"#{self.class.name}\" class is working just fine \n"
      my_response_var.write "This little web app features a list of 3 simple items\n"
      my_response_var.write "In order to see them, enter the following path in the URL:\n"
      my_response_var.write "http://localhost:9292/items"

    # navigate to: 
    # http://localhost:9292/items (or http://localhost:9292/itemstuvwxyz) <=# this will actually work
    # ...in the VM machine's web browser
    elsif my_request_var.path.match(/items/)
      @@items.each do |item|
        my_response_var.write "#{item}\n"
      end
    else 
    # navigate to: 
    # http://localhost:9292/something/else
    # ...in the VM machine's web browser
      my_response_var.write "Path Not Found"
    end 
    my_response_var.finish
  end
end
