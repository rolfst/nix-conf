{ config, ... }: # TODO add secrets when I've figured those out

let
  # secretsPath = /secrets/nixos-configuration/secrets;
  user = config.users.users.rolfst.name;
in {
  # sops.validateSopsFiles = false;

  # sops.defaultSopsFile = secrets + "/secrets.yaml";

  # Allow user to read keys
  users.users.rolfst.extraGroups = [ config.users.groups.keys.name ];

  # sops.secrets.freedns = { };
  # sops.secrets.desktop-ssh-key = {
  #   format = "binary";
  #   # sopsFile = secretsPath + "/secret-desktop-ssh-key";
  #   sopsFile = secrets + "/secrets/secret-desktop-ssh-key";
  #   owner = user;
  # };
}
