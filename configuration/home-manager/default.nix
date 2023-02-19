{ pkgs, ... }:

{
  # Removes dependency on NIX_PATH
  home-manager.useGlobalPkgs = true;
  # home-manager.useUserPackages = true;

  home-manager.users.rolfst = import ./home.nix;

  # Use .profile used by home-manager
  environment.loginShellInit = ''
    if [ -e $HOME/.profile ]
    then
        . $HOME/.profile
    fi
  '';
}
