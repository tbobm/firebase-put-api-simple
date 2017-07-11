require 'chronic'
require 'sinatra'
require 'firebase'

base_uri = ENV["FIREBASE_URI"]

firebase = Firebase::Client.new(base_uri)


get '/' do
        'hello world'
end

get '/test' do
        'this is a test'
end

get '/fb' do
        firebase.push("test/2", {:id => 1})
end

get '/analyze' do
        puts params
        res = Chronic.parse(params['sentence'])
        puts res
end

get '/info' do
        ENV["HELLO"]
end
