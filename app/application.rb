class Application
  @@items = [Item.new("tacos", 2.00)]
  def call(env)
    resp = Rack::Response.new 
    req = Rack::Request.new(env)
    
    if req.path.split('/')[1] == 'items'
      item_name = req.path.split('/').last 
      found_item_price = ''
      @@items.each do |item| 
        if item.name == item_name
          found_item_price = item.price 
        end
        if found_item_price = ''
          resp.write found_item_price
        else 
          resp.write "Item not found"
        end
      end
    else 
      resp.write "Route not found"
      resp.status = 404
    end
    # binding.pry 
    
    resp.finish
  end
end