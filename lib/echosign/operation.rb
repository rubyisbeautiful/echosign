module Echosign


  class Operation

    attr_accessor :data, :method, :request, :response

    def send
      raw_response = HTTPI.request(self.method, request.request)
      self.response = Echosign::Response.new(raw_response.body)
    end


  end


end