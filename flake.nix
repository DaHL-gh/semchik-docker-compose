{
	inputs = {
		nixpkgs.url = "github:NixOS/nixpkgs?ref=nixos-unstable";
	};

	outputs = { self, nixpkgs, ... }:
	let 
		system = "x86_64-linux";
		pkgs = nixpkgs.legacyPackages.${system};
	in
	{
		devShells.${system}.default = import ./shell.nix ( pkgs );
	};
}
