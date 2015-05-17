class OpenCommand
  require 'Launchy'
  def execute(subdomain)
    # Launchy.open( "http://#{subdomain}.therokubalance.com" )
    Launchy.open("http://#{subdomain}.therokubalance.com")
  end
end