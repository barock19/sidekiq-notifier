
require "sidekiq/notifier/version"
require "sidekiq/notifier/middleware"
module Sidekiq
	def self.notifier_default_receiver=(setting)
		raise NotifierConfigerror.new("notifier_default_receiver is required") if setting.nil?
		@notifier_default_receiver = setting
	end
	
	def self.notifier_email_setting=(setting)
		raise NotifierConfigerror.new("notifier_email_setting is required") if setting.nil?
		@notifier_email_setting = setting
	end

  module Notifier
	# Your code goes here...
  end

  class NotifierConfigerror <Exception ; end
end
