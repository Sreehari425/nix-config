final: prev: {
  pear-desktop = prev.pear-desktop.overrideAttrs (old: {
    src = prev.fetchFromGitHub {
      owner = "sreehari425";
      repo = "pear-desktop";
      rev = "85a8a3cf9825cc1173afe8c2d842a460385b58aa";
      hash = "sha256-IbZ2B68eFH0KrjyflLRPF9xjyPw91REoWzk1DZRVIt4=";
    };

    patches = [ ];

    nativeBuildInputs = (builtins.filter (x: x.pname or "" != "pnpm") old.nativeBuildInputs) ++ [
      prev.pnpm_11
    ];

    pnpmDeps = prev.fetchPnpmDeps {
      pname = old.pname;
      version = old.version;
      src = final.pear-desktop.src;

      pnpm = prev.pnpm_11;
      fetcherVersion = 4;

      pnpmInstallFlags = [
        "--network-concurrency=4"
        "--fetch-retries=5"
        "--fetch-timeout=120000"
      ];

      hash = "sha256-+LDu58IINOFcpWwkPMr2EMiJ5/3h69dkrJSZkTGF+lI=";
    };
  });
}
