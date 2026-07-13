{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    vulkan-tools
    mesa-demos
  ];
}
