require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module FunBoxTestApp
  class Application < Rails::Application
    config.enable_dependency_loading = true

    config.autoload_paths += %W[
      #{config.root}/lib
    ]

    config.time_zone = 'Krasnoyarsk'

    config.active_job.queue_adapter = :sidekiq
  end
end
