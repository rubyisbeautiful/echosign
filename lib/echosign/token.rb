require 'httpi'
require 'multi_json'

module Echosign

  class Token

    attr_accessor :value, :expires

    class <<self

      def blank_user_hash
        {
            userCredentials: {
                apiKey: Echosign.config.api_key
            },
            applicationCredentials: {
                applicationSecret: Echosign.config.application_secret,
                applicationId: Echosign.config.application_id
            }
        }
      end

      def obtain(user_hash=Echosign::Token.blank_user_hash)
        request = Echosign::Request.token_request(user_hash)
        method = Echosign.services['tokens']['create'].values[0]
        raw_response = HTTPI.request(method, request.request)
        response = Echosign::Response.new(raw_response.body)
        token = new(response.response_object.accessToken, response.response_object.expiresIn)
      end

    end


    def initialize(val, ex)
      @value = val
      @expires = ex
    end

    def to_s
      value
    end


  end

end