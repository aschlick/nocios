class PingJob
  
  def self.perform(host, params = {})
    result = `ping -q -c 5 #{host.address}`
    ping = result.split("---").last
    ping = ping.sub!(/\n/," ")
    recieved = ping.split(",")[1].split()[0].to_i
    times = ping.split("=")[1].split(" ")[0].split("/")
    {:sent => 5, 
      :recieved => recieved, 
      :times => {:min => times[0].to_f, 
        :avg => times[1].to_f, 
        :max => times[2].to_f, 
        :stdev => times[3].to_f
        }
      }
  end
  
end