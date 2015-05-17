class ListCommand
  require 'httparty'
  def execute
    if File.exists?('.theroku')
      puts "Listing all subdomains"
      file = File.open(".theroku", "rb")
      token = file.read
      response = HTTParty.get("#{Theroku::base_url}apps",
        headers: { 'Authorization' => "Token token=#{token}", 'Content-Type' => 'application/json', 'Accept' => 'application/json'}
      )
      if response.code == 200
        puts "These are your current subdomains:"
        list_array = JSON.parse(response.body)
        list_array.each do |app|
          puts "app_name: #{app['subdomain']}, url1: #{app['url1']}, url2: #{app['url2']}"
        end
      else
        puts "Sorry, something went wrong..."
      end
    else
      puts "You have to login before making any changes you can do that with $ theroku login"
    end
  end
end