# Push this to the local host like this:
# $ rackup config.ru

# ...and you should see something this in bash:

# > [2019-08-29 15:00:05] INFO  WEBrick 1.x.x
# > [2019-08-29 15:00:05] INFO  ruby 2.5.1 (2018-03-29) [xxxxxx]
# > [2019-08-29 15:00:05] INFO  WEBrick::HTTPServer#start: pid=xxxx port=9292

# Then go to the browser (IN THE VM) and type this in the URL:

# http://localhost:9292/

# ...since the server was started on "port=9292" as shown above on line 5.

# TO CLOSE: type: Ctrl+C

# ...and you should see something this in bash:

# [2019-08-29 17:37:04] INFO  WEBrick 1.x.x
# [2019-08-29 17:37:04] INFO  ruby 2.5.1 (2018-03-29) [xxxxxx]
# [2019-08-29 17:37:04] INFO  WEBrick::HTTPServer#start: pid=3097 port=9292
# ^C[2019-08-29 17:37:08] INFO  going to shutdown ...
# 2019-08-29 17:37:08] INFO  WEBrick::HTTPServer#start done.

# The class name here must match the class name in this line:
# run MyFirstApplication.new
# located in config.ru
class MyFirstApplication
 
  def call(env)
    resp = Rack::Response.new
    resp.write "The \"#{self.class.name}\" class is working just fine"
    resp.finish
  end
 
end
