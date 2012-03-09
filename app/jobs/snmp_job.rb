class SnmpJob
  def self.perform(host, params = {})
   SNMP::Manager.open(:host => host.address) do |manager|
     
   end
  end
  
  def self.graph(results)
    
  end
end