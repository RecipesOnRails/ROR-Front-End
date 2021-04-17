require 'base64'

class SessionsController < ApplicationController
  def create
    client_id = ENV['kroger_client_id']
    client_secret = ENV['kroger_client_secret']
    code = params[:code]
    redirect_uri = ENV['kroger_redirect_uri']
    authorization_hash = ("#{client_id}:#{client_secret}")

    conn = Faraday.new(url: 'https://api.kroger.com/v1/')

    response = conn.post('connect/oauth2/token') do |req|
      req.headers['authorization'] = Base64.strict_encode64(authorization_hash),
      # req.body['content-type'] = 'application/x-www-form-urlencoded',
      req.body = "grant_type=client_credentials&code=#{code}&redirect_uri=http://localhost:3000/auth/kroger/callback"
    end

    data = JSON.parse(response.body, symbolize_names: true)
    access_token = data[:access_token]

    binding.pry

  end
end
