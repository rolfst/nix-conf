{ lib, pkgs, ... }:
{
  
  programs.kitty = {
    enable = true;
    extraConfig = ''
      include theme.conf
    '';
    font = {
      name = "Iosevka Term";
      # package = (pkgs.nerdfonts.override {fonts = ["Iosevka"]; });
    };
    keybindings = {
      "kitty_mod+enter" = "new_window_with_cmd";
      "kitty_mod+k" = ''
        combine : clear_terminal scrollback active : send_text normal \x0c
      '';
    };
    settings = {
      editor = "nvim";
      font_size = lib.mkDefault 24;
      kitty_mod = "ctrl-shift";
      scrollback_lines = -1;
      shell = ".";
      term = "xterm";
      window_border_width = 0;
    };
  };
  xdg.configFile."kitty/theme.conf".source = pkgs.fetcurl {
    url = "https://raw.githubusercontent.com/rose-pine/kitty/main/dist/rose-pine.conf";
    sha = "0000000000000000000000000000000000000000000000000000";
  };
}
