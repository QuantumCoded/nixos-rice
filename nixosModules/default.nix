## vim: set fenc=utf-8 ts=2 sw=0 sts=0 sr et si tw=0 fdm=marker fmr={{{,}}}:
##
## Custom NixOS modules bundle
##

{ ... }:

{
  imports =
    [
      ./common.nix
      ./boot
      ./gui
      ./hardware
      ./programs
      ./services
      ./systemd
      ./users
      ./virtualisation
      ./xdg
    ];
}
