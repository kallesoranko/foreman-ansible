# This guide is optimized for Vagrant 1.8 and above.
# Older versions of Vagrant put less info in the inventory they generate.
Vagrant.require_version ">= 1.8.0"

Vagrant.configure(2) do |config|

  config.vm.box = "ubuntu/bionic64"
  config.vm.network "forwarded_port", guest: 80, host: 80, host_ip: "127.0.0.1"
  config.vm.synced_folder "./", "/foreman-ansible"

  config.vm.provider "hyper-v" do |hyperv|
    # allow nested virtualization
    hyperv.enable_virtualization_extensions = true
  end

  config.vm.provision "shell", inline: <<-SHELL
    apt-get update
    apt-get install -y make ansible
  SHELL

  
end