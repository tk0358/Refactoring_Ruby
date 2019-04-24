class NetworkResult

  def [](attribute)
    instance_variable_get "@#{attribute}"
  end

  def []=(attribute, value)
    instance_variable_set "@#{attribute}", value
  end
end

new_network = { :nodes => [], :old_networks => [] }

new_network[:old_networks] << node.network
new_network[:nodes] << node

new_network[:name] = new_network[:old_networks].collect do |network|
	network.name
end.join(" - ")