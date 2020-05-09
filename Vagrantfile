# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.require_version ">= 2.2.8"

boxes = [
    {
        :name => "dev",
        :eth1 => "192.168.144.10",
        :mem => "4096",
        :cpu => "2"
    }
]

Vagrant.configure(2) do |config|
  config.vbguest.auto_update = false
  config.vm.box = "centos/7"
  boxes.each do |opts|
    config.vm.define opts[:name] do |config|
      config.vm.hostname = opts[:name]
      config.vm.provider "vmware_fusion" do |v|
        v.vmx["memsize"] = opts[:mem]
        v.vmx["numvcpus"] = opts[:cpu]
      end
      config.vm.provider "virtualbox" do |v|
        v.customize ["modifyvm", :id, "--memory", opts[:mem]]
        v.customize ["modifyvm", :id, "--cpus", opts[:cpu]]
      end
	  # config.vm.network "forwarded_port", guest: 80, host: 80
	  # config.vm.network "forwarded_port", guest: 22, host: 22
	  # config.vm.network "forwarded_port", guest: 9074, host: 9074
	  # config.vm.boot_timeout = 20
	  # config.ssh.host = "127.0.0.1"
	  # config.ssh.port = 22
	  # config.ssh.username = "root"
	  # config.ssh.password = "vagrant"
	  # config.ssh.private_key_path = "./id_rsa"
      config.vm.network :private_network, ip: opts[:eth1]
    end
  end
  
  #config.vm.synced_folder "./www", "/www", create:true, owner:"root", group: "root" #,:mount_options => ["dmode=775","fmode=644"]
  config.vm.synced_folder "./www", "/www", create:true, type: "nfs" 
    
  config.vm.provision "shell", privileged: true, path: "./setup.sh"
end


