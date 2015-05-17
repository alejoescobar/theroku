class LoginCommand
  require 'httparty'
  def execute(email, password, token)
    puts "Your email is #{email}, and your password is supposed to be hidden but fuck it here it is #{password}."
    puts "Initiating post method..."
    response = HTTParty.post("#{Theroku::base_url}login",
      body: { "email" => "#{email}", "password" => "#{password}" }.to_json,
      headers: { 'Content-Type' => 'application/json', 'Accept' => 'application/json'}
    )
    puts "Finishing..."
    token = JSON.parse(response.body)["auth_token"]
    token_file = File.new(".theroku", "w")
    #to do: windows relative paths
    token_file.puts(token)
    token_file.close
  end
end