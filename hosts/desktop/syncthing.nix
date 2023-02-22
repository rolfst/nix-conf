{ ... }:

{
  services.syncthing = rec {
    enable = false;
    user = "rolfst";

    dataDir = "/home/${user}";

    # declarative.cert = "";
    # declarative.key = "";

    devices.nixos-laptop = {
      id = "ECDUSSX-C5OOXG6-RBIJK2F-377MBFH-WKCMJ5N-FVEOKG4-PC7A5RY-HUUMIQ7";
    };

    folders = {
      "/home/${user}/Documents/Cohesion".devices = [ "nixos-laptop" ];
      # TODO: declaratively configure "ignore patterns" instead of imperatively
      "/home/${user}/Media/Music".devices = [ "nixos-laptop" ];
      "/home/${user}/.password-store".devices = [ "nixos-laptop" ];
    };
  };
}
