# frozen_string_literal: true

RSpec.describe 'Couriers', type: :request do
  let(:courier) { FactoryBot.create(:courier, :real) }
  let(:courier_with_image) { FactoryBot.create(:courier, :image) }
  let(:auth_headers) { courier.create_new_auth_token }
  let(:'access-token') { auth_headers['access-token'] }
  let(:'token-type') { auth_headers['token-type'] }
  let(:client) { auth_headers['client'] }
  let(:expiry) { auth_headers['expiry'] }
  let(:uid) { auth_headers['uid'] }
  path '/auth/sign_in/' do
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
  path '/couriers/{id}' do
    put 'courier uploads lisence' do
      tags 'couriers'
      consumes 'multipart/form-data'
      produces 'application/json'

      parameter name: :id, in: :path, type: :string
      parameter name: :image, in: :formData, type: :file

      response '200', 'lisence successfully uploaded' do
        schema type: :object,
               properties: {
                 id: { type: :string },
                 name: { type: :string, nullable: true },
                 email: { type: :string },
                 avatar: { type: :string }
               },
               required: %w[id
                            name
                            email
                            avatar]
        let!(:id) { courier.id }
        let!(:image) do
          fixture_file_upload(Rails
                                                .root.join('spec/support/fixtures/avatar.jpg'), 'image/jpg')
        end
        parameter name: 'access-token', in: :header, type: :string
        parameter name: 'token-type', in: :header, type: :string
        parameter name: 'client', in: :header, type: :string
        parameter name: 'expiry', in: :header, type: :string
        parameter name: 'uid', in: :header, type: :string
        run_test!
      end

      response '404', 'Error: unauthorized' do
        let(:id) { 'invalid' }
        let!(:image) do
          fixture_file_upload(Rails
                                                .root.join('spec/support/fixtures/avatar.jpg'), 'image/jpg')
        end
        parameter name: 'access-token', in: :header, type: :string
        parameter name: 'token-type', in: :header, type: :string
        parameter name: 'client', in: :header, type: :string
        parameter name: 'expiry', in: :header, type: :string
        parameter name: 'uid', in: :header, type: :string
        run_test!
      end

      response '422', 'Second license upload unavailable' do
        let(:id) { courier_with_image.id }
        let!(:image) do
          fixture_file_upload(Rails
                                                .root.join('spec/support/fixtures/avatar.jpg'), 'image/jpg')
        end
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
