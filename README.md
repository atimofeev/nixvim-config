# nixvim-config

Coding is just an excuse to use Vim!

## Features

## TODOs

### Builtins

- `smartindent` fix behavior with #\
  In many occasions entering # (i) will reset current indent
- `window` implement keybind for resize based on window position

### Plugins

#### Configure

- `none-ls` migrate to [conform.nvim](https://github.com/stevearc/conform.nvim) and [nvim-lint](https://github.com/mfussenegger/nvim-lint)
- `obsidian.nvim` disable UI and use [render-markdown.nvim](https://github.com/MeanderingProgrammer/render-markdown.nvim) instead
- `toggleterm` add keymap to kill term OR exit from :TermExec app
- `toggleterm` more useful terminal name template (as seen in `:Telescope toggleterm`)
- `telescope` check [Configuration-Recipes](https://github.com/nvim-telescope/telescope.nvim/wiki/Configuration-Recipes) for useful info
- `treesitter-refactor` keymaps for actions. [gh](https://github.com/nvim-treesitter/nvim-treesitter-refactor)
- `yaml-companion` KB to show current yaml schema
- `yaml-companion` integrate [actual](https://github.com/yannh/kubernetes-json-schema) k8s schemas

#### Upgrade

- `cursorline` [Issue](https://github.com/yamatsum/nvim-cursorline/issues/10)

#### Etc

- Learn best practices from [hardtime.nvim](https://github.com/m4xshen/hardtime.nvim?tab=readme-ov-file#%EF%B8%8F--features)
- Good nixvim [template](https://github.com/elythh/nixvim)

## Issues

- `treesitter` ensureInstalled list has no effect\
  All langs are installed anyway (at least according to :TSInstallInfo)
- `builtin terminal` does not support _proper_ reflow (both render & copy)
- `terraformls` can't load completion schema from providers: \
  `2024/08/01 22:35:09 module_ops.go:301: preloaded schema not available for registry.terraform.io/hashicorp/aws`
