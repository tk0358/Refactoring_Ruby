new_network = { :nodes => [], :old_networks => [] }

new_network[:old_networks] << node.network
new_network[:nodes] << node

new_network[:name] = new_network[:old_networks].collect do |network|
	network.name
end.join(" - ")

# class Node
#   attr_reader :network
#   def initialize(network)
#     @network = network
#   end
# end

# p new_network[:nodes]