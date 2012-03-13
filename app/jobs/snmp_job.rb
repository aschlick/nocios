require "snmp"

class SnmpJob
  def self.perform(host, params = {})
    results = []
    puts "#{params["oid"]}"
    SNMP::Manager.open(:host => host.address, :community => host.snmp_community) do |manager|
      manager.walk(params["oid"]){|vb|puts vb}
      params["oid"].each do |oid|
	results << {:name => oid, :value => manager.get_value(oid)}
      end
    end
    results
  end
  
  def self.graph(results)
    d = []
    results.each do |r|
      if r.successful and r.
	d << [r.created_at.to_i*1000,r.output.first[:value].to_s.to_f]
      end
    end
    {:name => results.first.output.first[:name], :data => d}
  end
end