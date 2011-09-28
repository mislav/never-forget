module NeverForget
  autoload :ExceptionHandler, 'never_forget/exception_handler'
  autoload :Exception, 'never_forget/exception'

  class << self
    attr_writer :enabled
    def enabled?() @enabled end
  end
  self.enabled = true

  def self.log(error, env = {}, &block)
    Exception.create(error, env, &block) if enabled?
  rescue
    warn "NeverForget: error saving exception (#{$!.class} #{$!})"
    warn $!.backtrace.first
  end
end

require 'never_forget/railtie' if defined? Rails::Railtie

if defined?(Sinatra) and Sinatra.respond_to? :register
  require 'never_forget/sinatra'
end
