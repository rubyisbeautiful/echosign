module Echosign

  class Request

    HTTPI.log_level = :debug

    attr_accessor :request, :method

    # @return [Echosign::Request]
    def self.boilerplate_request
      raw_request = HTTPI::Request.new
      raw_request.headers['Content-Type'] = 'application/json;charset=UTF-8'
      request = new
      request.request = raw_request
      request
    end


    # @return [Echosign::Request]
    def self.token_request(user_hash=Echosign::Token.blank_user_hash)
      request = boilerplate_request
      path = Echosign.services['tokens']['create'].keys[0]
      request.request.url = "#{Echosign.config.api_endpoint}#{path}"
      request.request.body = MultiJson.encode(user_hash)
      request
    end


    # @param [Echosign::Token,String] token
    # @param [Hash] data_hash
    # @return [HTTPI::Request]
    def self.api_request(token, service, operation)
      request = boilerplate_request
      path = Echosign.services[service][operation].keys[0]
      request.request.url = "#{Echosign.config.api_endpoint}#{path}"
      if Echosign::Token === token
        request.request.headers['Access-Token'] = token.value
      else
        request.request.headers['Access-Token'] = token
      end
      request
    end




  end

end
