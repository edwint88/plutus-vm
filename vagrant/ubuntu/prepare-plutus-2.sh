mkdir -p /home/$1/.config/nix
cat >> /home/$1/.config/nix/nix.conf <<EOF
substituters        = https://hydra.iohk.io https://iohk.cachix.org https://cache.nixos.org/
trusted-public-keys = hydra.iohk.io:f/Ea+s+dFdN+3Y/G+FDgSq+a5NEWhJGzdjvKNGv0/EQ= iohk.cachix.org-1:DpRUyj7h7V830dp/i6Nti+NEO2/nhblbov/8MW7Rqoo= cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY=
EOF
mkdir -p /home/$1/plutus/git
cd /home/$1/plutus/git
git clone https://github.com/input-output-hk/plutus
git clone https://github.com/input-output-hk/plutus-starter.git
git clone https://github.com/input-output-hk/plutus-pioneer-program.git
touch updatePlutus.sh
echo "nix build -f default.nix plutus.haskell.packages.plutus-core.components.library" >> updatePlutus.sh
echo "nix-build -A plutus-playground.client" >> updatePlutus.sh
echo "nix-build -A plutus-playground.server" >> updatePlutus.sh
echo "nix-build -A plutus-playground.generate-purescript" >> updatePlutus.sh
echo "nix-build -A plutus-playground.start-backend" >> updatePlutus.sh
echo "nix-build -A plutus-pab" >> updatePlutus.sh
echo "nix-shell --command \"cd plutus-pab; plutus-playground-generate-purs; cd ..; cd plutus-playground-server; plutus-playground-generate-purs\"" >> updatePlutus.sh
cd ./plutus
/bin/bash ../updatePlutus.sh
# Add host 0.0.0.0 -> to access the frontend in browser 192.168.5.x
cp plutus-playground-client/package.json plutus-playground-client/package.json.bak 
sed 's/--mode=development/--mode=development --host 0.0.0.0/g' plutus-playground-client/package.json.bak > plutus-playground-client/package.json