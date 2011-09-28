module NeverForget
  module Sinatra
    module Helpers
      def log_error(boom = $!, env = nil, &block)
        env = request.env if env.nil? and respond_to? :request
        NeverForget.log(boom, env || {}, &block)
      end
    end

    def self.registered(app)
      if :production == app.environment or :staging == app.environment
        app.use NeverForget::ExceptionHandler
      end
      app.helpers Helpers
    end

    ::Sinatra.register self
  end
end
