class GervaisQuote
  def initialize(app)
    @app = app
  end

  def call(env)
    if env['PATH_INFO'] == '/quote'
      [200, {'Content-Type' => 'text/plain'}, ['Ricky quote.']]
    else
      @app.call(env)
    end
  end
end