class Application
  @@items = [Item.new("Tacos", 2.00)]
  def call(env)
    resp = Rack::Response.new 
    req = Rack::Request.new(env)
    
    if req.path.split('/')[1] == 'items'
      item_name = req.path.split('/').last 
      @@items.each do |item| 
        if item.name == item_name
        resp.write item.price
        end
      end
    else 
      resp.write "Items only stupid"
      resp.status = 400
    end
    # binding.pry 
    
    resp.finish
  end
end