## vim: set fenc=utf-8 ts=2 sw=0 sts=0 sr et si tw=0 fdm=marker fmr={{{,}}}:
##
## XDG portal config
##

{ config, lib, pkgs, ... }:

let
  module = config.custom.xdg.portal;
in
{
  options =
  {
    custom.xdg.portal.enable = lib.mkEnableOption "enables XDG portals";
  };

  config = lib.mkIf module.enable
  {
    xdg.portal =
    {
      enable = true;
      extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
      config =
      {
        common =
        {
          default = "*";
        };
      };
    };
  };
}
