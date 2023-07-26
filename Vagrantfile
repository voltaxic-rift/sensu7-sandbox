# -*- mode: ruby -*-
# vi: set ft=ruby :

cpus = 2
memory = 2048

ENV['VAGRANT_DEFAULT_PROVIDER'] = 'libvirt'

Vagrant.configure('2') do |config|
    config.vm.box = 'almalinux/8'
    config.ssh.insert_key = false

    config.vm.provider 'libvirt' do |provider|
        provider.driver = 'kvm'
        provider.memory = memory
        provider.cpus = cpus
        provider.storage :file, size: '20G'
    end

    ['sensu-backend', 'postgres', 'grafana'].each_with_index do |machine_name, index| do
        config.vm.define machine_name do |n|
            n.vm.hostname = machine_name
            n.vm.network 'private_network', ip: "192.168.57.20#{index}"
            n.vm.synced_folder '.', '/vagrant', create: true,
                owner: 'vagrant', group: 'vagrant', type: 'sshfs'
        end
    end

    config.vm.define 'sensu-agent' do |n|
        n.vm.hostname = 'sensu-agent'
        n.vm.network 'private_network', ip: '192.168.57.101'
        n.vm.synced_folder '.', '/vagrant', create: true,
            owner: 'vagrant', group: 'vagrant', type: 'sshfs'
    end
end
