{
  description = "Gleam dev env";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
      in
      {
        devShells.default = pkgs.mkShell {
          buildInputs = with pkgs; [
            gleam
            erlang
            rebar3
            # entr 
          ];

          shellHook = ''
            echo "Gleam Dev Shell"
            echo "Gleam version: $(gleam --version)"
            echo "Erlang version: $(erl -noshell -eval 'io:format("~s~n", [erlang:system_info(otp_release)]), halt().')"
          '';
        };
      }
    );
}
