{ pkgs, ... }:
{
  languages.opentofu.enable = true;
  packages = with pkgs; [
    ansible babashka curl doctl jq openssh rclone unzip
  ];
}
