#!/usr/bin/env ruby
require 'chronic'
require 'sinatra'
require 'firebase'

set :bind, '0.0.0.0'
set :port, 8080


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
