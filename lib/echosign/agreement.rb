module Echosign

  class Agreement < Echosign::Operation

    SERVICE = 'agreements'

    class <<self


      # @return [Hashie::Mash]
      def boilerplate_agreement
        Hashie::Mash.new(
        {
          documentCreationInfo: {
            signatureType: 'ESIGN',
            recipients: {
              email: nil,
              role: 'SIGNER'
            },
            signatureFlow: 'SENDER_SIGNS_LAST',
            fileInfos: {
              documentURL: {
                name: 'testing.txt',
                url: 'http://localhost/testing.txt',
                mimeType: 'text/plain'
              }
            },
            name: 'Testing API'
          }
        })
      end


      def create(token, h=Echosign::Agreement.boilerplate_agreement)
        agreement = new
        agreement.data = Hashie::Mash.new(
        # {
          # x_user_id: h.delete(:user_id),
          # x_user_email: h.delete(:user_email),
          # agreementCreationInfo: h
            h
        # }
        )

        agreement.request = Echosign::Request.api_request(token, Echosign::Agreement::SERVICE, 'create')
        agreement.method = Echosign.services[Echosign::Agreement::SERVICE]['create'].values[0]
        agreement.request.request.body = MultiJson.encode(agreement.data)
        agreement
      end

    end


  end

end
