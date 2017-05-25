module Jimson
  class Client
    module Error
      class InvalidResponse < StandardError
        def initialize()
          super('Invalid or empty response from server.')
        end
      end

      class InvalidJSON < StandardError
        def initialize(json)
          @json = json
          super("Couldn't parse JSON string received from server:\n#{json}")
        end
      end

      class ServerError < StandardError
        def initialize(id, code, message, data)
          @id = id
          @code = code
          @message = message
          @data = data
          super("Server error #{code}: #{message}")
        end
      end
    end
  end
end
