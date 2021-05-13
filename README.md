# plutus-vm for Plutus Pioneer Program 
Vagrant + VBox for plutus playground

1. Install Vagrant and VBox on your machine (you may want to install vagrant scp at some point of time => vagrant plugin install vagrant-scp)
2. In the Vagrantfile directory run: `cd vagrant && vagrant up` (& wait to finish provisioning)
3. When it finished provisioning run: `vagrant ssh`
4. Run: `tmux`
5. Add a new pane: `C + "` (`C = Ctrl + b`) / Move up/down `C + up/down`
6. Pane1 - Start Backend: `cd /home/vagrant/plutus/git/plutus` => `nix-shell` => `cd plutus-playground-client` => `plutus-playground-server`
7. Pane2 - Start Frontend (wait for the server to start): `cd /home/vagrant/plutus/git/plutus` => `nix-shell` => `cd plutus-playground-client` => `npm run start`
8. Go in your browser at https://192.168.5.21:8009 (if you changed the VM IP go to that IP)
9. How to SSH-Remote: https://medium.com/@lopezgand/connect-visual-studio-code-with-vagrant-in-your-local-machine-24903fb4a9de

## Update and recompile Plutus-playground for a running VM 
Go to `cd /home/vagrant/plutus/git/plutus` => run `git pull` => run update `/bin/bash ../updatePlutus.sh`
## Tips & Tricks
1. If you need ghc or cabal you can enter a folder with `default.nix` and run `nix-shell` over there and then change to your directory where you need to run cabal. E.g. `cd /home/vagrant/plutus/git/plutus` => `nix-shell` => `cd ../plutus-pioneer-program/code/week1` => `cabal build`
2. If you want to use auto-complete function, then enter `nix-shell` as above and then run `vim`. (This doesn't work with `vscode`). You could open a Terminal window in `vscode` and run `vim` from there.