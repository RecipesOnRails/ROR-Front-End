require 'base64'

class SessionsController < ApplicationController
  def create
    client_id = ENV['kroger_client_id']
    client_secret = ENV['kroger_client_secret']
    code = params[:code]
    redirect_uri = ENV['kroger_redirect_uri']

    conn = Faraday.new(url: 'https://api.kroger.com/v1/', )
    conn.basic_auth(client_id, client_secret)

    response = conn.post('connect/oauth2/token', "grant_type=client_credentials&code=#{code}&redirect_uri=#{redirect_uri}")

    data = JSON.parse(response.body, symbolize_names: true)
    access_token = data[:access_token]

    binding.pry

  end
end
