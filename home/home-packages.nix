{
  nixpkgs = {
    overlays = import ./overlays;
    config = {
      allowUnfree = true;
    };
  };
}
