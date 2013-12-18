# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
Vagrant::Config.run do |config|
  config.vm.box = "precise32"
  config.vm.box_url = "http://files.vagrantup.com/precise32.box"

  config.vm.provision :chef_solo do |chef|
    chef.add_recipe "nfs"
  end
  config.vm.share_folder "vagrant-root", "/vagrant", ".", :nfs => true # nfs for performance
  config.vm.share_folder "v-src", "/home/vagrant/src", "~/Development", :nfs => true

  config.vm.network "hostonly", "192.168.56.10"
  # Install stuff with chef
  config.vm.provision :chef_solo do |chef|
    chef.add_recipe "build-essential"
    chef.add_recipe "apt"
    chef.add_recipe "git"
    chef.add_recipe "vim"
    chef.add_recipe "nodejs::install_from_package"
    chef.add_recipe "zsh"
    chef.add_recipe "java"
    chef.add_recipe "npm"
    chef.add_recipe "npmpackages"
  end

  # Copy gitconfig and ssh key
  config.vm.provision :shell, :inline => "echo -e '#{File.read("#{Dir.home}/.gitconfig")}' > '/home/vagrant/.gitconfig'"
  config.vm.provision :shell, :inline => "echo -e '#{File.read("#{Dir.home}/.ssh/id_rsa")}' > '/home/vagrant/.ssh/id_rsa'"
end
