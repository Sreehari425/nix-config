{
  pkgs,
  nixgl,
  quantumLauncher,
  ...
}:

{
  #for now commented out

  # home.packages = [
  #   (pkgs.writeShellScriptBin "quantum_launcher" ''
  #     exec ${nixgl.packages.${pkgs.stdenv.hostPlatform.system}.nixGLIntel}/bin/nixGLIntel ${
  #       quantumLauncher.packages.${pkgs.stdenv.hostPlatform.system}.release
  #     }/bin/quantum_launcher "$@"
  #   '')
  # ];

}
