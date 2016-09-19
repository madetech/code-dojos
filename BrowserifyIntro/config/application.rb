require File.expand_path('../boot', __FILE__)
require "rails"

require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "sprockets/railtie"

Bundler.require(*Rails.groups)

module BrowserifyIntro
  class Application < Rails::Application
    config.active_record.raise_in_transactional_callbacks = true

    config.browserify_rails.source_map_environments << 'development'
    config.browserify_rails.commandline_options = [
      '-t babelify --extension=".js.es6"'
    ]
  end
end