require 'httparty'

When(/^I post to "(.*?)" with:$/) do |path, json|
	@last_response = Segment_api.post(path, :body => json, :headers => {'Content-Type' => 'text/plain'})
end

Then(/^the response should be JSON:$/) do |json|
	JSON.parse(@last_response.body).should == JSON.parse(json)
end