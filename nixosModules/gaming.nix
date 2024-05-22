## vim: set fenc=utf-8 ts=2 sw=0 sts=0 sr et si tw=0 fdm=marker fmr={{{,}}}:
##
## Gaming config
##

{ config, lib, pkgs, ... }:

let
  cfg = config.custom.gaming;
in
{
  options.custom.gaming.enable = lib.mkEnableOption "enables various gaming things";

  config = lib.mkIf cfg.enable
  {
    custom.programs.steam.enable = lib.mkDefault true;
    programs.gamemode.enable     = lib.mkDefault true;
  };
}
