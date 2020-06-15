# frozen_string_literal: true

RSpec.describe 'Couriers', type: :request do
  let(:courier) { FactoryBot.create(:courier, :real) }
  path '/api/v1/auth/sign_in/' do
    post 'courier sign_in' do
      tags 'couriers'
      consumes 'application/json'
      parameter name: :params, in: :body, schema: {
        type: :object,
        properties: {
          email: { type: :string },
          password: { type: :string }
        },
        required: %w[email password]
      }
      produces 'application/json'

      response '200', 'courier logged in' do
        let(:params) { { email: courier.email, password: courier.password } }
        header 'access-token', type: :string, description: 'Access token'
        header 'client', type: :string, description: 'Client id'
        header 'expiry', type: :string, description: 'Token expiry date'
        header 'uid', type: :string, description: 'User email'
        run_test!
      end

      response '401', 'courier not found' do
        let(:id) { 'invalid' }
        let(:params) { { email: id, password: courier.password } }
        run_test!
      end
    end
  end
end
