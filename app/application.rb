class Application
  
  def call(env)
    resp = Rack::Response.new 
    req = Rack::Request.new(env)
    
    if req.path.split('/')[1] == 'items'
      resp.write 
    end
    binding.pry 
    
    resp.finish
  end
end