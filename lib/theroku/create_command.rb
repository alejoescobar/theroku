class CreateCommand
  require 'httparty'
  require 'byebug'
  def execute(url1, url2, subdomain)
    if File.exists?('.theroku')
      puts "Creating #{subdomain}..."
      file = File.open(".theroku", "rb")
      token = file.read
      response = HTTParty.post("#{Theroku::base_url}apps",
        body: { "url1" => "#{url1}", "url2" => "#{url2}", "subdomain" => "#{subdomain}" }.to_json,
        headers: { 'Authorization' => "Token token=#{token}", 'Content-Type' => 'application/json', 'Accept' => 'application/json'}
      )
      if response.code == 200
        puts "Success!"
      else
        puts "Sorry, something went wrong..."
      end
    else
      puts "You have to login before making any changes you can do that with $ theroku login"
    end
  end
end