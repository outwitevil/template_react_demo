require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Reactapp
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Redis as the back-end for the cache.
    config.cache_store = :redis_store, ENV['REDIS_CACHE_URL']
    # Set Sidekiq as the back-end for Active Job.
    config.active_job.queue_adapter = :sidekiq
    config.active_job.queue_name_prefix =
      "#{ENV['ACTIVE_JOB_QUEUE_PREFIX']}_#{Rails.env}"

      # Action Cable setting to de-couple it from the main Rails process.
    #config.action_cable.url = ENV['ACTION_CABLE_FRONTEND_URL']

    # Action Cable setting to allow connections from these domains.
    #origins = ENV['ACTION_CABLE_ALLOWED_REQUEST_ORIGINS'].split(',')
    #origins.map! { |url| /#{url}/ }
    #config.action_cable.allowed_request_origins = origins

  end
end

# Show in-line form errors.
ActionView::Base.field_error_proc = proc do |html_tag, instance|
  if html_tag =~ /\<label/
    html_tag
  else
    errors = Array(instance.error_message).join(',')
    %(#{html_tag}<p class="validation-error"> #{errors}</p>).html_safe
  end
end
