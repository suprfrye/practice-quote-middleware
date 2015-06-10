require 'rack'
require 'rack/lobster'
require_relative 'lib/gervais_quote'

use GervaisQuote
run Rack::Lobster.new