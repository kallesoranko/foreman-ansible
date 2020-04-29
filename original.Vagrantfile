# This guide is optimized for Vagrant 1.8 and above.
# Older versions of Vagrant put less info in the inventory they generate.
Vagrant.require_version ">= 1.8.0"

Vagrant.configure(2) do |config|

  config.vm.box = "ubuntu/bionic64"
  config.vm.synced_folder "./", "/foreman-ansible"
  config.vm.network "private_network", ip: "192.168.50.4"

  config.vm.provision "shell", inline: <<-SHELL
    apt-get update
    apt-get install -y make ansible
  SHELL

  
end