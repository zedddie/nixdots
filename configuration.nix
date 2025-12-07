{ config, pkgs, ... }:

{
  imports = [
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; 

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Warsaw";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  users.users.zedddie = {
    isNormalUser = true;
    description = "zedddie";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
    shell = pkgs.fish;
  };

  nixpkgs.config.allowUnfree = true;

  programs = {
  fish.enable = true;
  firefox.enable = true;
  };

security.sudo.extraRules = [
  {
    users = [ "zedddie" ];
    commands = [
      {
command = "/run/current-system/sw/bin/cp /etc/nixos/configuration.nix /home/zedddie/nixdots/";
        options = [ "NOPASSWD" ];
      }
    ];
  }
];



services.keyd = {
  enable = true;
  keyboards = {
    default = {
      ids = [ "*" ]; 
      settings = {
        main = {
          capslock = "esc"; 
	  escape = "capslock";
        };
        otherlayer = {};
      };
      extraConfig = ''there can be path to config
      '';
    };
  };
};

services.pulseaudio.enable = false;
services.pipewire = {
enable = true;
alsa.enable = true;
alsa.support32Bit = true;
pulse.enable = true;
};
  programs.hyprland.enable = true;
  environment.systemPackages = with pkgs; [
  neovim
  obsidian 
  unzip
  zig
  fish
  fishPlugins.done
  fishPlugins.fzf-fish
  fishPlugins.forgit
  keychain
  fishPlugins.plugin-git
  fzf
  vesktop
  fishPlugins.grc
  fishPlugins.z
  grc
  tmux
  waybar
  rofi
  swww
  dunst
  telegram-desktop
  cargo
  rustc
  spotify
  fastfetch
  pavucontrol
  bluez
  blueman
  git
  slurp
  grim
  wl-clipboard
  kitty
firefox
  ];
virtualisation.docker = {
	enable = true;
};
  programs.steam = {
  enable = true;
  dedicatedServer.openFirewall = true;
  };
  fonts.fontconfig.enable = true;
  fonts.packages = with pkgs; [
  nerd-fonts.fira-code
  nerd-fonts.droid-sans-mono
  nerd-fonts.noto
  nerd-fonts.hack
  nerd-fonts.ubuntu
  ];

environment.sessionVariables.NIXOS_OZONE_WL = "1";
environment.sessionVariables.EDITOR = "nvim";
hardware.bluetooth.enable = true;  
  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };
 

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.11"; # Did you read the comment?

}
