{
  description = "dacquery -- query the capabilities of audio DACs and other USB devices";

  inputs = {
    nixpkgs.url = "https://channels.nixos.org/nixos-unstable/nixexprs.tar.zst";
  };

  outputs =
    { self, nixpkgs }:
    let
      systems = [
        "x86_64-linux"
        "aarch64-linux"
        "i686-linux"
      ];
      forAllSystems = nixpkgs.lib.genAttrs systems;
    in
    {
      packages = forAllSystems (
        system:
        let
          pkgs = nixpkgs.legacyPackages.${system};
        in
        {
          default = pkgs.stdenv.mkDerivation {
            pname = "dacquery";
            version = "1.0.1";

            src = self;

            strictDeps = true;

            nativeBuildInputs = with pkgs; [
              autoreconfHook
              pkg-config
            ];

            buildInputs = with pkgs; [
              alsa-lib
            ];

            meta = with pkgs.lib; {
              description = "Query the capabilities of audio DACs and other USB devices";
              homepage = "https://github.com/mikebrady/dacquery";
              license = licenses.gpl2Only;
              mainProgram = "dacquery";
              platforms = platforms.linux;
              maintainers = [ "shaver@off.net" ];
            };
          };
        }
      );

      devShells = forAllSystems (
        system:
        let
          pkgs = nixpkgs.legacyPackages.${system};
        in
        {
          default = pkgs.mkShell {
            packages = with pkgs; [
              autoreconfHook
              pkg-config
              alsa-lib
            ];
          };
        }
      );
    };
}
