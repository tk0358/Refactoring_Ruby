class NetworkResult
  attr_reader :old_networks, :nodes

  def initialize
    @old_networks, @nodes = [], []
  end

  def name
    @old_networks.collect { |network| network.name }.join(" - ")
  end
end

new_network = NetworkResult.new

new_network.old_networks << node.network 
new_network.nodes << node
