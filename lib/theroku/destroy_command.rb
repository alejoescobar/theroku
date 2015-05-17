class DestroyCommand
  def execute(subdomain)
    if File.exists?('.theroku')
      puts "Deleting #{subdomain}..."
      file = File.open(".theroku", "rb")
      token = file.read
      response = HTTParty.delete("#{Theroku::base_url}apps/#{subdomain}",
        body: { "subdomain" => "#{subdomain}" }.to_json,
        headers: { 'Authorization' => "Token token=#{token}", 'Content-Type' => 'application/json', 'Accept' => 'application/json'}
      )
      puts response
      puts response.message
      if response.code == 200
        puts "You have successfully destroyed #{subdomain} app"
      else
        puts "There were the following errors:"
        puts response["errors"].capitalize
      end
    else
      puts "You have to login before making any changes you can do that with $ theroku login"
    end
  end
end