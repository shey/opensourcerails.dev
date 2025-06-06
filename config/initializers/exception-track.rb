# frozen_string_literal: true

require "exception_notification/sidekiq"

ExceptionNotification.configure do |config|
  config.ignored_exceptions += %w[
    ActionView::TemplateError
    ActionController::InvalidAuthenticityToken
    ActionController::BadRequest
    ActionView::MissingTemplate
    ActionController::UrlGenerationError
    ActionController::UnknownFormat
    ActionController::InvalidCrossOriginRequest
    ActionController::ParameterMissing
    Mime::Type::InvalidMimeType
  ]
end
