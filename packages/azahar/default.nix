{ azahar, lib, stdenv }:

azahar.overrideAttrs (oldAttrs: lib.optionalAttrs stdenv.hostPlatform.isDarwin {
  postInstall = (oldAttrs.postInstall or "") + ''
    mkdir -p $out/Applications
    cp -r bin/Release/azahar.app $out/Applications/Azahar.app
  '';
})
