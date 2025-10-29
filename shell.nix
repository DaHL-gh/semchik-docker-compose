{ pkgs, ... }:
pkgs.mkShell {
  packages =
    with pkgs;
    [
      uv
      python312
    ]
    ++ (with python312Packages; [
      pip
      django
      psycopg2-binary
    ]);

  env = {
    UV_PYTHON = "${pkgs.python312}/bin/python";
  };

  shellHook = ''
    export PATH=$PWD/.venv/bin/:$PATH
  '';
}
