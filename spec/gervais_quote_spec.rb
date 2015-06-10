require 'rack/test'
require_relative '../lib/gervais_quote'

QUOTES = []
File.open('./fixtures/rickygervais.txt', 'r') do |f|
  f.each_line do |line|
    QUOTES << line
  end
end

describe GervaisQuote do
  include Rack::Test::Methods

  let(:app) do
    lambda do |env|
      [200, {'Content-Type' => 'text/html'}, ['This is the content of app.']]
    end
  end

  let(:gervais_app) { GervaisQuote.new(app) }

  it 'shows body of app when path is not "/quote"' do
    get '/'
    expect(last_response.body).to eq('This is the content of app.')
  end

  it 'shows a random Ricky Gervais quote when path is "/quote"' do
    get '/quote'
    expect(QUOTES).to include(last_response.body)
  end
end