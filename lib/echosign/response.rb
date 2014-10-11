require 'hashie'

module Echosign

  class Response

    attr_accessor :response_object

    def initialize(json_response)
      @response_object = Hashie::Mash.new(MultiJson.decode(json_response))
    end

  end

end