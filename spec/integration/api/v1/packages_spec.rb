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

  path '/packages' do
    get 'courier retrieves a list of Assigned packages' do
      tags 'packages'
      produces 'application/json'
      parameter name: 'access-token', in: :header, type: :string
      parameter name: 'token-type', in: :header, type: :string
      parameter name: 'client', in: :header, type: :string
      parameter name: 'expiry', in: :header, type: :string
      parameter name: 'uid', in: :header, type: :string

      response '200', 'Assigned packages found' do
        schema type: :object,
               properties: {
                 packages: {
                   type: :array,
                   items: {
                     type: :object,
                     properties: {
                       id: { type: :string },
                       estimated_delivery_date: { type: :string, nullable: true },
                       tracking_number: { type: :string }
                     }, required: %w[id
                                     estimated_delivery_date
                                     tracking_number]
                   }
                 }
               }
        let!(:package) { FactoryBot.create(:package, :assigned) }
        run_test!
      end
      response '401', 'Error: unauthorized' do
        let(:'access-token') { nil }
        let(:'token-type') { nil }
        let(:client) { nil }
        let(:expiry) { nil }
        let(:uid) { nil }
        run_test!
      end
    end
  end

  path '/packages/{id}' do
    put 'courier pick up a package' do
      tags 'packages'
      produces 'application/json'

      parameter name: :id, in: :path, type: :string
      parameter name: 'access-token', in: :header, type: :string
      parameter name: 'token-type', in: :header, type: :string
      parameter name: 'client', in: :header, type: :string
      parameter name: 'expiry', in: :header, type: :string
      parameter name: 'uid', in: :header, type: :string

      response '200', 'package status successfully changed' do
        schema type: :object,
               properties: {
                 tracking_number: { type: :string },
                 delivery_status: { type: :string },
                 estimated_delivery_date: { type: :string, nullable: true }
               },
               required: %w[tracking_number
                            delivery_status
                            estimated_delivery_date]
        let!(:id) { FactoryBot.create(:package, :assigned).id }
        run_test!
      end

      response '401', 'Error: unauthorized' do
        let(:id) { 'invalid' }
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

      # This needs to be updated and fixed or removed
      #
      # response '422', 'Validation failed' do
      #   schema type: :object,
      #          properties: {
      #              message: { type: :string }
      #          }
      #   let!(:id) { FactoryBot.create(:package).id }
      #   let!(:package) { FactoryBot.create(:package) }
      #   parameter name: 'access-token', in: :header, type: :string
      #   parameter name: 'token-type', in: :header, type: :string
      #   parameter name: 'client', in: :header, type: :string
      #   parameter name: 'expiry', in: :header, type: :string
      #   parameter name: 'uid', in: :header, type: :string
      #   run_test!
      # end
    end
  end

  path '/packages/{id}' do
    delete 'courier cancel a package' do
      tags 'packages'
      produces 'application/json'

      parameter name: :id, in: :path, type: :string

      response '200', 'package successfully deleted' do
        let!(:id) { FactoryBot.create(:package, :assigned).id }
        parameter name: 'access-token', in: :header, type: :string
        parameter name: 'token-type', in: :header, type: :string
        parameter name: 'client', in: :header, type: :string
        parameter name: 'expiry', in: :header, type: :string
        parameter name: 'uid', in: :header, type: :string
        run_test!
      end

      response '401', 'Error: unauthorized' do
        let(:id) { 'invalid' }
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
