{

  plugins.cmp-cmdline.enable = true;

  extraConfigLua = # lua
    ''
      local cmp = require "cmp"
      cmp.setup.cmdline({ "/", "?" }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = { { name = "buffer" } },
      })

      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = { { name = "path" }, {
          name = "cmdline",
          option = { ignore_cmds = { "Man", "!" } },
        } },
      })
    '';

}
