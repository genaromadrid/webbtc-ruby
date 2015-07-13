module Webbtc

  class API

    def initialize(network='bitcoin')
      @network = network
      @connection = Connection.new(url)
    end

    def url
      @url ||= if @network == 'bitcoin'
          ENV['WEBBTC_URL'] || Webbtc::WEBBTC_URL
        else
          ENV['WEBBTC_TEST_URL'] || Webbtc::WEBBTC_TEST_URL
        end
    end

    def network=(bc)
      unless ['bitcoin', 'testnet3'].include?(bc)
        raise "#{bc} is not one of ['bitcoin', 'testnet3']"
      end
      @network = bc
      @connection = Connection.new(url)
    end

    # Returns the block including all its transactions.
    # @param hash [String] Block hash
    # @param format='json' [String] json or bin
    #
    # @return [HASH] {
    #   hash: Hash of the block header,
    #   ver: Block Version,
    #   prev_block: Hash of the previous block this one builds upon,
    #   next_block: Hash of the next (main-chain) block that builds upon this one,
    #   mrkl_root: Merkle Root used to connect transactions to the block header,
    #   time: Unix Timestamp when the block was created. Note: This may vary up to a few hours!,
    #   bits: Encoded difficulty target this block satisfies,
    #   nonce: Number-to-be-used-once; This value is incremented when mining,
    #   n_tx: Number of transactions included in this block,
    #   size: Size of the block in bytes,
    #   tx: List of transactions @see http://webbtc.com/api/tx
    # }
    def block(hash, format='json')
      @connection.get("/block/#{hash}.#{format}")
    end

    # Returns the transaction.
    # @param hash [String] Transaction hash
    # @param format='json' [String] json or bin
    #
    # @return [HASH] TODO
    def transaction(hash, format='json')
      @connection.get("/tx/#{hash}.#{format}")
    end

    # Returns information for this address, and a list of all transactions relevant to it.
    # @param address [String] The address
    #
    # @return [HASH] TODO
    def address(address)
      @connection.get("/address/#{address}.json")
    end

    # Returns the tx hash and propagation information.
    #
    # @return [HASH] TODO
    def stats
      @connection.get('/stats.json')
    end

    # Relay transaction
    # @param tx [String] The transaction to relay, in json, binary or hex format
    # @param wait=3 [Integer] Time to wait before estimating propagation through the network, in seconds (default 3, max 10)
    #
    # @return [HASH] {
    #   success: Whether tx was successfully relayed (true or false),
    #   error: If there is an error relaying the transaction,
    #   detail: If the transaction is invalid, information about the validation error.
    #   hash: The transaction hash
    #   propagation: {
    #     sent: How many peers the transaction was sent to,
    #     received: How many peers the transaction was received from,
    #     percent: Estimated propagation of the transaction through the network
    #   }
    # }
    def relay(tx, wait=3)
      @connection.post('/relay_tx.json', {
        tx: tx,
        wait: wait
      })
    end

  end

end
