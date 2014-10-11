module Echosign

  class Services

    class <<self

      def services
        {
          'agreements' => {
            'index' => {
              '/agreements' => :get,
            },
            'create' => {
              '/agreements' => :post,
            }
          },
          'libraryDocuments' => {
            'index' => {
              '/libraryDocuments' => :get,
            }
          },
          'tokens' => {
            'create' => {
              '/auth/tokens' => :post
            }
          }
        }.freeze
      end

    end

  end

end