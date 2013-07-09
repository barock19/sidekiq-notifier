require "spec_helper"



describe "Middleware" do
  before do
    ::Sidekiq.server_middleware {|chain| chain.add Sidekiq::Notifier::Middleware }
  end
  describe "configuration" do
  	it "must raise error when default receiver not defined or nil" do
  		expect do  
  			Sidekiq.configure_server do |config|
	  			config.notifier_default_receiver = nil
	  		end
  		end.to raise_error(Sidekiq::NotifierConfigerror)
  	end
  	it "must raise error when email setting not defined or nil" do
  		expect do
  			Sidekiq.configure_server do |config|
	  			config.notifier_email_setting = nil
	  		end 			
  		end.to raise_error(Sidekiq::NotifierConfigerror)
  	end
  end

  context "when running job" do
		before do
  		$invocation = 0
      @boss = mock()
      @processor = ::Sidekiq::Processor.new(@boss)
      Sidekiq.redis = REDIS_TEST
  	end

  	context "when exception raised" do
  		it_behaves_like "recorded exception" 
  		context "when Shutdown exception raised" do
  			it_behaves_like "unrecorded exception"
  		end
  	end

  	context "when exception not raised" do
  		it_behaves_like "unrecorded exception"
  	end
  end
end