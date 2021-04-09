cd /tmp
# for --no-daemon uncomment aka single user
mkdir /nix
chown vagrant /nix
sh <(curl -L https://nixos.org/nix/install) --no-daemon
