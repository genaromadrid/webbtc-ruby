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
    @api ||= API.new(block_chain)
  end

  def self.method_missing(sym, *args, &block)
    api.send(sym, *args, &block)
  end

  def self.url
    @url ||= if block_chain == 'bitcoin'
        ENV['WEBBTC_URL'] || WEBBTC_URL
      else
        ENV['WEBBTC_TEST_URL'] || WEBBTC_TEST_URL
      end
  end

  def self.endpoint_uri(path='')
    if path[0] == '/'
      path[0] = ''
    end
    "#{url}/#{path}"
  end

  def self.block_chain
    @block_chain || ENV['BLOCK_CHAIN'] || BLOCK_CHAIN
  end

  def self.block_chain=(bc)
    unless ['bitcoin', 'testnet3'].include?(bc)
      raise "#{bc} is not one of ['bitcoin', 'testnet3']"
    end
    @block_chain ||= block_chain.to_sym
  end

end
