class GervaisQuote
  QUOTES = []
  File.open('./fixtures/rickygervais.txt', 'r') do |f|
    f.each_line do |line|
      QUOTES << line
    end
  end

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