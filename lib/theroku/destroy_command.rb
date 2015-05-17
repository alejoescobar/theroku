class DestroyCommand
  def exectute(args)
    if File.exists?('.theroku')
      puts "Creating #{app_name}..."
      file = File.open(".theroku", "rb")
      token = file.read
      response = HTTParty.delete("#{Theroku::base_url}apps/#{app_name}",
        body: { "url1" => "#{url1}", "url2" => "#{url2}", "app_name" => "#{app_name}" }.to_json,
        headers: { 'Authorization' => "Token token=#{token}", 'Content-Type' => 'application/json', 'Accept' => 'application/json'}
      )
      puts "Success!"
    else
      puts "You have to login before making any changes you can do that with $ theroku login"
    end
  end
end