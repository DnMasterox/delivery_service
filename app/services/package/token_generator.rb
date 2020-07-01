# frozen_string_literal: true

# app/services/package/token_generator.rb
class Package
  class TokenGenerator
    def initialize(id)
      @id = id
    end

    def call
      package.update(confirmation_expiration: Time.current + 10.minutes,
                     confirmation_token: SecureRandom.hex)
    end

    def package
      @package ||= Package.find_by(id: @id)
    end

    def success?
      package && package.confirmation_token.present?
    end
  end
end
