{ config, pkgs, ... }:

let

  python-with-global-packages = pkgs.python3;

  vim-with-python = (pkgs.vim_configurable.override { python = python-with-global-packages; });

in

{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "hex";
  home.homeDirectory = "/Users/hex";

  home.packages = [
    # pkgs is the set of all packages in the default home.nix implementation
    pkgs.ag
    pkgs.exa
    pkgs.git
    pkgs.htop
    pkgs.httpie
    pkgs.jq
    pkgs.mc
    pkgs.neovim
    pkgs.parallel
    pkgs.ripgrep
    pkgs.rsync
    pkgs.tmux
    pkgs.tree
    pkgs.wget
    python-with-global-packages
    vim-with-python
    (pkgs.ffmpeg-full.override {
      nonfreeLicensing = true;
      fdkaacExtlib = true;
      fdk_aac = pkgs.fdk_aac;
    })
  ];

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "21.05";
}
