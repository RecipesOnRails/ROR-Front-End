require 'base64'

class SessionsController < ApplicationController
  def create
    client_id = ENV['kroger_client_id']
    client_secret = ENV['kroger_client_secret']
    code = params[:code]
    redirect_uri = ENV['kroger_redirect_uri']

    conn = Faraday.new(url: 'https://api.kroger.com/v1/', )
    conn.basic_auth(client_id, client_secret)

    response = conn.post('connect/oauth2/token', "grant_type=authorization_code&code=#{code}&redirect_uri=#{redirect_uri}")

    data = JSON.parse(response.body, symbolize_names: true)
    access_token = data[:access_token]

    conn = Faraday.new(
    url: 'https://api.kroger.com/v1/',
    headers: {
        'Authorization': "Bearer #{access_token}"
    })

    response = conn.get('identity/profile')
    data = JSON.parse(response.body, symbolize_names: true)

    user          = User.find_or_create_by(uid: data[:data][:id])
    user.uid      = data[:data][:id]
    user.token    = access_token
    user.save

    session[:user_id] = user.id
    redirect_to dashboard_path
  end
end
