# frozen_string_literal: true

# Application Service
class ApplicationService
  def self.call(*args, &block)
    new(*args, &block).call
  end
end
