{ lib
, buildGoModule
, fetchFromGitHub
, argocd
}:

buildGoModule rec {
  pname = "argonaut";
  version = "2.6.0";

  src = fetchFromGitHub {
    owner = "darksworm";
    repo = "argonaut";
    rev = "v${version}";
    hash = "sha256-SkbgzaUK7Ew7ZMZysbdiPCoCVUqEopJNvzlZJt5j5MM=";
  };

  vendorHash = "sha256-bjWzZ9DPrp7B5VGbwtkn0C8u8gm5RWhAVMCkgS0U2NI=";

  # Skip tests as they require access to certificate files
  doCheck = false;

  # Build from cmd/app directory
  subPackages = [ "cmd/app" ];

  ldflags = [ "-s" "-w" ];

  # Runtime dependencies
  propagatedBuildInputs = [ argocd ];

  # Rename the binary from "app" to "argonaut"
  postInstall = ''
    mv $out/bin/app $out/bin/argonaut
  '';

  # Optional dependencies for enhanced features
  # delta is used for better diffs, but is optional so we don't need to wrap
  # Users can install delta separately if they want enhanced diffs

  meta = with lib; {
    description = "A keyboard-first terminal UI for Argo CD, built with Bubbletea";
    homepage = "https://github.com/darksworm/argonaut";
    license = licenses.mit;
    maintainers = [ ];
    mainProgram = "argonaut";
    platforms = platforms.unix;
  };
}
