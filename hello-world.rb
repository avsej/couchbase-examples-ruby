require 'rubygems'
require 'couchbase'

client = Couchbase.new "http://127.0.0.1:8091/pools/default"
client.quiet = false
begin
  spoon = client.get "spoon"
  puts spoon
rescue Couchbase::Error::NotFound => e
  puts "There is no spoon."
  client.set "spoon", "Hello World!", :ttl => 10
end

