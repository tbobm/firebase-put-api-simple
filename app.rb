#!/usr/bin/env ruby
require 'chronic'
require 'sinatra'
require 'firebase'

set :bind, '0.0.0.0'
set :port, 8080

base_uri = ENV['FIREBASE_URI']

firebase = Firebase::Client.new(base_uri)

get '/' do
  'hello world'
end

get '/analyze' do
  res = Chronic.parse(params['sentence'])
  if !res.nil?
    puts "users/#{params['id']}/conversations/#{params['convId']}/rdv/"
    firebase.push("users/#{params['id']}/conversations/#{params['convId']}/rdv/", date: res)
  else
    puts 'error'
  end
end
