# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: Decidim.config.mailer_sender
  layout 'mailer'
end
