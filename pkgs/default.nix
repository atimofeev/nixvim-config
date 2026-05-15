self: _super:
let
  callPackage = self.lib.callPackageWith (self // { inherit callPackage; });
in
{
  # ansible-language-server = callPackage ./ansible-language-server { };
}
