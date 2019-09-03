# Push this to the local host like this:
# $ rackup config_3.ru


# The class name here must match the class name in this line:
# run MyThirdApplication.new
# located in config_3.ru
# OK final layer...here we're making an app that can add stuff to it.
class MyThirdApplication

  # These are a couple of class variables that will let us:
  # a.) search for existing items in the store and ...
  @@items = ["Nuts","Bolts","Screws"]
  # b.) add new items to a shopping cart if they exist in the list above <@@items>
  @@cart = []

  # The #call method is called inside the Ruby Rack gem,
  # so if you change it below, Rack will break.
  def call(environment)
    responder = Rack::Response.new
    requirerer = Rack::Request.new(environment)


    if requirerer.path.match(/items/)
      @@items.each do |item|
        responder.write "#{item}\n"
      end
    elsif requirerer.path.match(/search/)
      # http://localhost:9292/search?q=Nuts
      # http://localhost:9292/search?q=Nails
      search_term = requirerer.params["q"]
      responder.write handle_search(search_term)
    elsif requirerer.path.match(/cart/)
      if @@cart.empty?
        # check your cart contents like this:
        # http://localhost:9292/cart
        responder.write "Your cart is empty"
      else
        @@cart.each do |item|
          responder.write "#{item}\n"
        end
      end
    # This is to add an item to the cart...do it like this:
    # http://localhost:9292/add?item=Nails
    elsif requirerer.path.match(/add/)
      item_to_add = requirerer.params["item"]
      if @@items.include? item_to_add
        @@cart << item_to_add
        responder.write "added #{item_to_add}"
      else
        responder.write "Sorry, but we don't have that one in our store!"
      end
    else
      responder.write "Sorry, but we can't find this path on our website"
    end

    responder.finish
  end

  def handle_search(search_term)
    if @@items.include?(search_term)
      return "Oh yay, #{search_term} is one of our items"
    else
      return "Sorry, we couldn't find #{search_term} in our store."
    end
  end
end
