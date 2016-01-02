# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrant configuration is done below.
Vagrant.configure(2) do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://atlas.hashicorp.com/search.
  config.vm.box = "ubuntu/trusty64"

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  config.vm.network "forwarded_port", guest: 80, host: 8080 #nginx
  config.vm.network "forwarded_port", guest: 3000, host: 3000 #rails

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  config.vm.provider "virtualbox" do |vb|
    # Display the VirtualBox GUI when booting the machine
    # vb.gui = true

    # Customize the amount of memory on the VM:
    vb.memory = "2048"

    # Customize the amount of cpus on the VM:
    vb.cpus= 2
  end

  # View the documentation for the provider you are using for more
  # information on available options.

  # Define a Vagrant Push strategy for pushing to Atlas. Other push strategies
  # such as FTP and Heroku are also available. See the documentation at
  # https://docs.vagrantup.com/v2/push/atlas.html for more information.
  # config.push.define "atlas" do |push|
  #   push.app = "YOUR_ATLAS_USERNAME/YOUR_APPLICATION_NAME"
  # end

  # Provision our virtual machine
  config.vm.provision "shell", inline: <<-SHELL
    sudo apt-get update
    sudo apt-get upgrade -y
    sudo apt-get autoremove -y
    sudo apt-get autoclean -y

    sudo apt-get install -y build-essential
    sudo apt-get install -y curl
    sudo apt-get install -y git
    sudo apt-get install -y nodejs
  SHELL

  # Install postgresql
  config.vm.provision "shell", privileged: false, inline: <<-SHELL
    sudo /usr/sbin/update-locale LANG=en_US.UTF-8 LC_ALL=en_US.UTF-8

    sudo apt-get install -y postgresql libpq-dev

    sudo mkdir -p /usr/local/pgsql/data
    sudo chown postgres:postgres /usr/local/pgsql/data

    sudo -u postgres /usr/lib/postgresql/9.3/bin/initdb -D /usr/local/pgsql/data

    sudo -u postgres createuser -s -d walle
    sudo -u postgres psql -c "ALTER USER walle with encrypted password 'eve';"

    sudo sed -i 's/local   all             all                                     peer/local   all             all                                     md5/' /etc/postgresql/9.3/main/pg_hba.conf
    sudo service postgresql restart
  SHELL

  # Install nginx
  config.vm.provision "shell", privileged: false, inline: <<-SHELL
    sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys ABF5BD827BD9BF62
    echo 'deb http://nginx.org/packages/ubuntu/ trusty nginx' > /tmp/nginx.list
    sudo cp /tmp/nginx.list /etc/apt/sources.list.d/nginx.list

    sudo apt-get update
    sudo apt-get install -y nginx

    sudo rm /etc/nginx/conf.d/*.conf
    sudo ln -s /vagrant/config/nginx/development.conf /etc/nginx/conf.d/wine-pex.conf
  SHELL

  # Install rvm and latest ruby 2.2
  config.vm.provision "shell", privileged: false, inline: <<-SHELL
    cd /tmp/
    curl -#LO https://rvm.io/mpapis.asc
    gpg --import mpapis.asc
    cd

    curl -sSL https://get.rvm.io | bash -s stable

    source /home/vagrant/.bash_profile
    source /home/vagrant/.bashrc

    rvm install ruby --latest
    cd /vagrant && bundle install

    RAILS_ENV=development rake db:create
    RAILS_ENV=development rake db:migrate
    RAILS_ENV=development rake db:seed
    RAILS_ENV=development rake assets:precompile
  SHELL

  # Startup puma and nginx servers
  config.vm.provision "shell", privileged: false, run: "always", inline: <<-SHELL
    sudo service nginx stop
    cd /vagrant && puma -b unix:///tmp/wine-pex-puma.sock -d
    sudo service nginx start
  SHELL

end
