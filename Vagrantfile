# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.require_version ">= 2.2.19"

boxes = [
    {
        :name => "dev01",
        :eth1 => "192.168.144.11",
        :mem => "4096",
        :cpu => "2"
    },
    {
        :name => "dev02",
        :eth1 => "192.168.144.12",
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
      config.vm.network :private_network, ip: opts[:eth1]
    end
  end
  
  config.vm.synced_folder "./www", "/www", create:true, type: "nfs" 
    
  config.vm.provision "shell", privileged: true, path: "./setup.sh"
end


