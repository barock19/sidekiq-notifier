#******************* DUMMY WORKER *******************
SampleEx = Class.new(StandardError)
ShutdownEx = Class.new(Sidekiq::Shutdown)

class DummyWorker
	include Sidekiq::Worker

	def perform(args)
		$invokes += 1
    raise SampleEx if args.to_sym == :test
    raise Shutdown if args.to_sym == :shutdown
	end
end
#******************* DUMMY WORKER *******************

#****************** SHARED EXAMPLE ******************
shared_examples "recorded exception" do
	it "must be invocated" do
		$invocation.should > 0 
	end
end

shared_examples "unrecorded exception" do
end
#****************** SHARED EXAMPLE ******************