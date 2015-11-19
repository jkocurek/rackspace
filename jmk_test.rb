require 'rubygems'
require 'twitter_oauth'
require 'resolv-replace.rb'
require 'pp'
 
def json_to_hash(json_string)
	elements = json_string.split(",")
	elements.each do |segment|
		pair = segment.split(":")
		json_hash = {pair[0] => pair[1]}
	end
	return json_hash
end
 
client = TwitterOAuth::Client.new(
  :consumer_key => 'f1QaAnhmWyfLHkJMbQ1N3SkZX',
  :consumer_secret => 'rxPVRDouXHtYIOU4BvEIOkZiixY7k3DR4xFFxSRqWDILdz6cgV'
)

request_token = client.authentication_request_token(
	:oauth_callback => 'oob'
)

puts request_token.authorize_url

print 'Please visit the URL and enter the code: '
code = gets.strip

access_token = client.authorize(
  request_token.token,
  request_token.secret,
  :oauth_verifier => code
)

client.authorized?
=> true
 
response = access_token.request(:get,"https://stream.twitter.com/1.1/statuses/sample.json")

json_hash = json_to_hash(response.body)

pp json_hash["username"]
pp json_hash["datetime"]
pp json_hash["tweet"]
