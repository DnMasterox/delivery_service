# frozen_string_literal: true

RSpec.describe 'Confirmations', type: :request do
  let(:package) { FactoryBot.create(:package, :valid_confirmation_token) }
  let(:invalid_package) { FactoryBot.create(:package, :invalid_confirmation_token) }

  path '/confirmations/{id}' do
    get 'anyone confirms the delivery of package' do
      tags 'packages'
      produces 'application/json'
      parameter name: :id, in: :path, type: :string

      response '200', 'package delivered' do
        schema type: :object,
               properties: {
                 tracking_number: { type: :string },
                 delivery_status: { type: :string },
                 estimated_delivery_date: { type: :string, nullable: true },
                 confirmation_token: { type: :string },
                 confirmation_expiration: { type: :string }
               },
               required: %w[tracking_number
                            delivery_status
                            estimated_delivery_date
                            confirmation_token
                            confirmation_expiration]

        let(:id) { package.confirmation_token }
        run_test!
      end
      response '404', 'Error: package not found' do
        let(:id) { 'invalid' }
        run_test!
      end
      response '422', 'Validation failed' do
        let(:id) { invalid_package.confirmation_token }
        run_test!
      end
    end
  end
end
