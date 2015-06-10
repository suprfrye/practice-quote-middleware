require 'rack'
require 'rack/lobster'
require_relative 'lib/random_quote'

use RandomQuote
run Rack::Lobster.new