# NixVim Configuration

A comprehensive Neovim configuration built with [NixVim](https://github.com/nix-community/nixvim) and Nix Flakes.

## Features

- **Package Manager**: Nix (via NixVim)
- **Colorscheme**: [Catppuccin](https://github.com/catppuccin/nvim)
- **LSP & Completion**: Full LSP support with `blink.cmp` / `nvim-cmp`, `lspkind`, and language-specific configurations.
- **UI**: `lualine`, `noice`, `barbar`, `which-key`, and `indent-blankline`.
- **Navigation**: [snacks.nvim](https://github.com/folke/snacks.nvim) (picker), `harpoon`, `oil.nvim`, and `flash.nvim`.
- **Git**: `neogit`, `gitsigns`, and `diffview`.
- **Editing**: `conform.nvim` (formatting), `nvim-lint`, `autopairs`, and `comment.nvim`.
- **Others**: `obsidian.nvim`, `markdown-preview`, `undotree`, and more.

## Usage

### Run directly

You can try this configuration without installing it:

```bash
nix run github:atimofeev/nixvim-config
```

### Use as a Flake Input

Add this to your `flake.nix`:

```nix
{
  inputs.nixvim-config.url = "github:atimofeev/nixvim-config";

  outputs = { self, nixvim-config, ... }: {
    # Use nixvim-config.packages.${system}.default
  };
}
```

## Structure

- `nvim/`: Core Neovim configuration.
  - `plugins/`: Plugin-specific modules.
  - `keymap.nix`: Custom keybindings.
  - `options.nix`: Standard Neovim options.
- `flake.nix`: Flake entry point and system definitions.
