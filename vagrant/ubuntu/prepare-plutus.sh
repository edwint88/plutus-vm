mkdir -p /home/$1/plutus/git
cd /home/$1/plutus/git
git clone https://github.com/input-output-hk/plutus
git clone https://github.com/input-output-hk/plutus-starter.git
git clone https://github.com/input-output-hk/plutus-pioneer-program.git
cd ./plutus
nix build -f default.nix plutus.haskell.packages.plutus-core.components.library
nix-build -A plutus-playground.client
nix-build -A plutus-playground.server
nix-build -A plutus-playground.generate-purescript
nix-build -A plutus-playground.start-backend
nix-build -A plutus-pab
nix-shell --command "cd plutus-pab; plutus-playground-generate-purs; cd ..; cd plutus-playground-server; plutus-playground-generate-purs"
# Add host 0.0.0.0 -> to access the frontend in browser 192.168.5.x
cp plutus-playground-client/package.json plutus-playground-client/package.json.bak 
sed 's/--mode=development/--mode=development --host 0.0.0.0/g' plutus-playground-client/package.json.bak > plutus-playground-client/package.json