{ pkgs, ... }:

{
  services.xserver.xautolock = {
    enable = true;
    extraOptions = [ "-detectsleep" ];

    # Save energy by entering sleep state
    killer = "/run/current-system/systemd/bin/systemctl suspend-then-hibernate";
    # Time in minutes before `killer` command is run
    killtime = 15;

    # Lock the screen
    locker = "${pkgs.i3lock-fancy}/bin/i3lock-fancy";
    # Time before `locker` command is run
    time = 10;
  };

  # Delay between suspending to RAM and suspending to disk when using suspend-then-hibernate
  # See: https://wiki.archlinux.org/title/Power_management#Suspend_and_hibernate
  systemd.sleep.extraConfig = ''
    HibernateDelaySec=30m
  '';

  # First suspend and then hibernate when pressing power key
  services.logind.extraConfig = ''
    HandlePowerKey=suspend-then-hibernate
    HandleSuspendKey=suspend-then-hibernate
  '';
}
