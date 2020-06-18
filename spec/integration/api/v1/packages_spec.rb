# frozen_string_literal: true

RSpec.describe 'Packages', type: :request do
  let(:courier) { FactoryBot.create(:courier, :real) }
  let(:auth_headers) { courier.create_new_auth_token }
  let(:'access-token') { auth_headers['access-token'] }
  let(:'token-type') { auth_headers['token-type'] }
  let(:client) { auth_headers['client'] }
  let(:expiry) { auth_headers['expiry'] }
  let(:uid) { auth_headers['uid'] }

  path '/packages/{id}' do
    get 'courier retrieves a package' do
      tags 'packages'
      produces 'application/json'
      parameter name: :id, in: :path, type: :string
      parameter name: 'access-token', in: :header, type: :string
      parameter name: 'token-type', in: :header, type: :string
      parameter name: 'client', in: :header, type: :string
      parameter name: 'expiry', in: :header, type: :string
      parameter name: 'uid', in: :header, type: :string

      response '200', 'package found' do
        schema type: :object,
               properties: {
                 tracking_number: { type: :string },
                 delivery_status: { type: :string },
                 estimated_delivery_date: { type: :string, nullable: true }
               },
               required: %w[tracking_number
                            delivery_status
                            estimated_delivery_date]

        let(:id) { Package.create!.id }
        run_test!
      end
      response '401', 'Error: unauthorized' do
        let(:id) { Package.create!.id }
        let(:'access-token') { nil }
        let(:'token-type') { nil }
        let(:client) { nil }
        let(:expiry) { nil }
        let(:uid) { nil }
        run_test!
      end
      response '404', 'Error: package not found' do
        let(:id) { 'invalid' }
        parameter name: 'access-token', in: :header, type: :string
        parameter name: 'token-type', in: :header, type: :string
        parameter name: 'client', in: :header, type: :string
        parameter name: 'expiry', in: :header, type: :string
        parameter name: 'uid', in: :header, type: :string
        run_test!
      end
    end
  end
end
