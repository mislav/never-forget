module NeverForget
  module Sinatra
    module Helpers
      def log_error(boom = $!, env = nil)
        env = request.env if env.nil? and respond_to? :request
        NeverForget.log(boom, env || {})
      end
    end

    def self.registered(app)
      app.use NeverForget::ExceptionHandler
      app.helpers Helpers
    end

    ::Sinatra.register self
  end
end
