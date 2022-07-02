# spec/swagger_helper.rb
RSpec.configure do |config|
  config.swagger_root = "#{Rails.root}/swagger"

  config.swagger_docs = {
    'v1/swagger.json' => {
      openapi: '3.0.1',
      info: {
        title: 'API V1',
        version: 'v1',
        description: 'This is the first version of my API'
      },
      servers: [
        {
          url: 'https://{defaultHost}',
          variables: {
            defaultHost: {
              default: 'www.example.com'
            }
          }
        }
      ]
    },

    'v2/swagger.yaml' => {
      openapi: '3.0.1',
      info: {
        title: 'API V2',
        version: 'v2',
        description: 'This is the second version of my API'
      },
      servers: [
        {
          url: 'https://{defaultHost}',
          variables: {
            defaultHost: {
              default: 'www.example.com'
            }
          }
        }
      ]
    }
  }
end
