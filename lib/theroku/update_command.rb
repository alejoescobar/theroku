class UpdateCommand
  require 'httparty'
  def execute(*args)
    if File.exists?('.theroku')
      puts "Creating #{subdomain}..."
      file = File.open(".theroku", "rb")
      token = file.read
      body = {}
      body[:url1] = args[1] if args[1]
      body[:url2] = args[2] if args[2]
      body[:subdomain] = args[0] if args[0]

      response = HTTParty.patch("#{Theroku::base_url}apps",
        body: body.to_json,
        headers: { 'Authorization' => "Token token=#{token}", 'Content-Type' => 'application/json', 'Accept' => 'application/json'}
      )
      if response.code == 200
        puts "#{args[0]}, succesfully updated!"
      else
        puts "Sorry, something went wrong..."
      end
    else
      puts "You have to login before making any changes you can do that with $ theroku login"
    end
  end
end
