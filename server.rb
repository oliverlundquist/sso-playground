require 'rubygems'
require 'bundler/setup'
require 'sinatra'
require 'sinatra/cookies'
require 'json'

set :port, 9393
set :protection, :except => :frame_options
set :token, 'asdv324234fsfsdf'

get '/' do
  if params[:token]
    cookies[:token] = params[:token]
    redirect 'http://' + request.host + ':' + "#{settings.port}"
  end
  if cookies[:token].nil?
    redirect 'http://auth.dev:' + "#{settings.port}" + '/auth?url=' + request.host
  end
  return cookies.to_json
end

get '/auth' do
  if cookies[:token].nil?
    cookies[:token] = settings.token
  end
  if params[:show_cookies]
    return cookies.to_json
  end
  redirect 'http://' + params[:url] + ':' + "#{settings.port}" + '/?token=' + cookies[:token]
end
