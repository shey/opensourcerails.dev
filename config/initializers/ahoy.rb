# frozen_string_literal: true

module Ahoy
  class Store < Ahoy::DatabaseStore
    def user
      nil
    end

    def track_visit(data)
      return if skip_tracking?
      super
    end

    def track_event(name, properties, options)
      return if skip_tracking?
      super
    end

    def skip_tracking?
      request&.path&.start_with?("/feed.xml")
    rescue => e
      Rails.logger.warn("Ahoy tracking error: #{e.message}")
      false
    end
  end
end

Ahoy.api = false
Ahoy.geocode = true
Ahoy.server_side_visits = :when_needed
