{ helix-fork }:
final: prev: {
  helix = final.callPackage "${helix-fork}/default.nix" { };
}
