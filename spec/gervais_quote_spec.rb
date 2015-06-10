require 'rack/test'
require_relative '../lib/gervais_quote'

describe GervaisQuote do
  include Rack::Test::Methods

  let(:app) do
    lambda do |env|
      [200, {'Content-Type' => 'text/html'}, ['This is the content of app.']]
    end
  end

end