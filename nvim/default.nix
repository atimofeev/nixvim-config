{ lib, ... }:
{

  imports = [
    ./autocmd.nix
    ./filetype.nix
    ./keymap.nix
    ./options.nix
  ]
  ++ lib.concatMap (
    dir:
    lib.pipe (builtins.readDir dir) [
      (lib.filterAttrs (path: _kind: !lib.hasPrefix "_" path))
      (lib.filterAttrs (
        _path: kind: kind == "directory" || (kind == "regular" && lib.hasSuffix ".nix" _path)
      ))
      (lib.mapAttrsToList (path: _kind: lib.path.append dir path))
    ]
  ) [ ./plugins ];

  plugins.lz-n.enable = true;

  clipboard = {
    providers.xclip.enable = true;
    register = "unnamedplus";
  };

}
