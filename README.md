# plutus-vm
Vagrant VM for developing plutus

1. Install Vagrant and VBox on your machine (you may want to install vagrant scp at some point of time => vagrant plugin install vagrant-scp)
2. In the Vagrantfile directory run: vagrant up (& wait to finish provisioning)
3. When it finished provisioning run: vagrant ssh
4. Run: tmux
5. Add a new pane: C + " (C = Ctrl + b) / Move up/down C + up/down
6. Pane1 - Start Backend: cd /home/vagrant/plutus/git/plutus => nix-shell => cd plutus-playground-server => plutus-playground-server
7. Pane2 - Start Frontend: cd /home/vagrant/plutus/git/plutus => nix-shell => cd plutus-playground-client => npm run start
8. Go in your browser at https://192.168.5.21:8009 (if you changed the VM IP go to that IP)