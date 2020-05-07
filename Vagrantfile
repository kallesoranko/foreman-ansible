# -*- mode: ruby -*-
# vi: set ft=ruby :

# Builds single Foreman server and
# multiple Puppet Agent Nodes using JSON config file
# Gary A. Stafford - 01/15/2015
# Modified - 08/19/2015

# read vm and chef configurations from JSON files
nodes_config = (JSON.parse(File.read("nodes.json")))['nodes']

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  nodes_config.each do |node|
    node_name   = node[0] # name of node
    node_values = node[1] # content of node

    config.hostmanager.enabled = true
    config.hostmanager.manage_host = true
    config.hostmanager.ignore_private_ip = false
    config.hostmanager.include_offline = true

    config.vm.box = node_values[':box']
    config.vm.define node_name do |config|
      ports = node_values['ports']
      ports.each do |port|
        config.vm.network :forwarded_port,
          host:  port[':host'],
          guest: port[':guest'],
          id:    port[':id']
      end

      config.vm.hostname = node_name
      # config.vm.network "private_network", ip: node_values[':ip'], :name => 'vboxnet0', :adapter => 2
      config.vm.network "private_network", type: dhcp

      # config.vm.network "private_network", :type => 'dhcp', :name => 'vboxnet0', :adapter => 2
      # config.vm.network "public_network", :adapter => 2


      config.vm.provider :virtualbox do |vb|
        vb.customize ["modifyvm", :id, "--memory", node_values[':memory']]
        vb.customize ["modifyvm", :id, "--name", node_name]
        # vb.customize ["modifyvm", :id, "--nicpromisc2", "allow-all"]
      end

      config.vm.provision :shell, :path => node_values[':bootstrap']
      config.vm.synced_folder "./", "/foreman-ansible"
    end
  end
end