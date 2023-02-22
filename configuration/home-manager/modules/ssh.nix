{ super, ... }:

{
  programs.ssh = {
    enable = true;

    matchBlocks = {
      "nixos-desktop" = {
        user = "rolfst";
        # hostname = "100.90.83.22";
        # identityFile = [ super.sops.secrets.desktop-ssh-key.path ];
        # identitiesOnly = true;
      };
      "nixos-vm" = {
        user = "rolfst";
        # hostname = "100.90.83.22";
        # identityFile = [ super.sops.secrets.desktop-ssh-key.path ];
        # identitiesOnly = true;
      };

      "nixos-macbook" = {
        user = "rolfst";
        hostname = "100.73.233.50";
      };
    };
  };
}
