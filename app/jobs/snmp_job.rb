class SnmpJob
  def self.perform(host, params = {})
    results = []
    SNMP::Manager.open(:host => host.address) do |manager|
      response = manager.get(params[:oids])
      response.each_varbind do |vb|
	results << {:name => vb.name.to_s, :value => vb.value.to_s}
      end
    end
    results
  end
  
  def self.graph(results)
    
  end
end