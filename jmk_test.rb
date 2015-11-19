require 'rubygems'
require 'twitter_oauth'
require 'resolv-replace.rb'
require 'pp'

def prepare_access_token(oauth_token, oauth_token_secret)
    consumer = OAuth::Consumer.new('EEDHGG0XT6oDCDdwbW6Ib7woR', 'uoXiRTrfMIuyDCiPYyA071fQioueJlQynsmMf8LTPZRoYHdicQ', { :site => "https://api.twitter.com", :scheme => :header })
     
    token_hash = { :oauth_token => oauth_token, :oauth_token_secret => oauth_token_secret }
    access_token = OAuth::AccessToken.from_hash(consumer, token_hash )
 
    return access_token
end

def json_to_hash(json_string)
	elements = json_string.split(",")
	elements.each do |segment|
		pair = segment.split(":")
		json_hash = {pair[0] => [pair[1}}
	end
	return json_hash
end
 
access_token = prepare_access_token('3802678881-W9aw9XDDU42kaujISTkkoV6SzgZWpXzRo9oSDZc', 'xsGAeVuypdffoFNnFW9CTgaQnU4iWNohK7laC4DIA7D2S')
 
response = access_token.request(:get,"https://stream.twitter.com/1.1/statuses/sample.json")

json_hash = json_to_hash(response.body)

pp json_hash["username"]
pp json_hash["datetime"]
pp json_hash["tweet"]