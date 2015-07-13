module Webbtc

  class Connection

    class << self
      def get(path, payload={})
        query :get, path, payload
      end

      def post(path, payload={})
        query :post, path, payload
      end

      def query(method, path, payload={})
        uri = Webbtc.endpoint_uri(path)
        begin
          response = RestClient::Request.execute(:method => method, :url => uri, :payload => payload, :ssl_version => 'SSLv23')
        rescue Exception => e
          response = e.response
        end
        JSON.parse response, :symbolize_names => true
      end
    end

  end

end
