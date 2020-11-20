require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console
s1 = Startup.new("Spotify", "Daniel Ek", "Domain1")
s2 = Startup.new("Flatiron", "Ix", "Domain2")
s3 = Startup.new("Instagram", "Adam", "Domain3")
binding.pry
0 #leave this here to ensure binding.pry isn't the last line