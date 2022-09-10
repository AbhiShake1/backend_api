{ lib
, python
, poetry2nix
}:

poetry2nix.mkPoetryApplication rec {
  inherit python;

  projectDir = ./.;
  src = ./.;
  pyproject = ./pyproject.toml;
  poetrylock = ./poetry.lock;

  pythonImportsCheck = [ "backend_api" ];

  meta = with lib; {
    homepage = "https://your.repo.url.here";
    description = "This project was generated with fastapi-mvc.";
  };
}
