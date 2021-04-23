class SessionService
  private
  def self.oauth_start(code)
    redirect_uri = ENV['kroger_redirect_uri']
    client_id = ENV['kroger_client_id']
    client_secret = ENV['kroger_client_secret']
    connection = Faraday.new(url: 'https://api.kroger.com/v1/', )
    connection.basic_auth(client_id, client_secret)
    response = connection.post('connect/oauth2/token', "grant_type=authorization_code&code=#{code}&redirect_uri=#{redirect_uri}")
    json_parse(response)[:access_token]
  end



  def self.access_token(code)
    access_token = self.oauth_start(code)
    conn = Faraday.new(
    url: 'https://api.kroger.com/v1/',
    headers: {
        'Authorization': "Bearer #{access_token}"
    })
    response = conn.get('identity/profile')
    json_parse(response)
    array =[access_token, json_parse(response)]
  end

  def self.json_parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
