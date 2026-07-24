{ helix-fork }:
{
  overlays = import ./overlays { inherit helix-fork; };
  config = {
    allowUnfree = true;
  };
}
