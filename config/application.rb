require_relative 'boot'

require 'rails'
require 'active_model/railtie'
require 'active_job/railtie'
require 'active_record/railtie'
require 'action_controller/railtie'
require 'action_mailer/railtie'

Bundler.require(*Rails.groups)

module Thorn
  class Application < Rails::Application
    config.load_defaults 6.0
    config.api_only = true
    config.middleware.use Rack::Attack
    config.active_record.schema_format = :sql
    config.autoload_paths << Rails.root.join('lib')
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.yml')]
    config.i18n.default_locale = :en
  end
end
