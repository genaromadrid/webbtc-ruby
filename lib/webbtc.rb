require 'rest-client'
require 'json'

module Webbtc
  autoload :API,        'webbtc/api'
  autoload :Connection, 'webbtc/connection'

  BLOCK_CHAIN     = 'bitcoin'
  WEBBTC_URL      = 'http://webbtc.com'
  WEBBTC_TEST_URL = 'http://test.webbtc.com'

  def self.api=(a)
    @api = a
  end

  def self.api
    @api ||= API.new(BLOCK_CHAIN)
  end

  def self.method_missing(sym, *args, &block)
    api.send(sym, *args, &block)
  end
end
