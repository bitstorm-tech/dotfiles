# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a customized Neovim configuration based on kickstart.nvim with extensive modifications and additional plugins. It's designed for web development with support for Laravel Blade, Go (templ), TypeScript, HTML, CSS, and PHP.

## Commands

### Starting Neovim
```bash
nvim
```

### Plugin Management
```bash
# Update all plugins
:Lazy update

# View plugin status
:Lazy

# Health check
:checkhealth
```

### Formatting
The configuration uses `conform.nvim` for formatting with the following formatters:
- Lua: `stylua`
- JavaScript/TypeScript: `prettierd`
- Go: `gopls`
- templ: `templ` + `prettierd`
- PHP: `pint`
- Blade: `prettierd`

Format on save is enabled by default.

### LSP Health Check
```bash
:Mason  # Manage LSP servers and tools
```

## Architecture

### Core Structure
- `init.lua` - Main entry point with plugin configuration
- `lua/custom/` - Custom configurations and plugins
- `lua/kickstart/` - Base kickstart functionality

### Custom Configuration Modules
- `lua/custom/options.lua` - Neovim options (tabstop=2, no relative numbers, etc.)
- `lua/custom/keymaps.lua` - Custom key mappings
- `lua/custom/commands.lua` - Custom commands
- `lua/custom/neovide.lua` - Neovide-specific settings
- `lua/custom/themes.lua` - Color scheme definitions
- `lua/custom/snippets.lua` - Custom snippets

### Plugin Organization
Custom plugins are modularized in `lua/custom/plugins/`:
- File explorer: nvim-tree (floating window)
- Terminal: toggleterm
- Git: lazygit integration, git-blame
- Session management: auto-session
- UI enhancements: lualine, bufferline, noice
- Development: autopairs, emmet, multicursors, indent_line

### Language Support
- **Go**: gopls LSP, templ support for Go templating
- **Web Development**: HTML, CSS, JavaScript/TypeScript with prettierd formatting
- **Laravel**: Blade template support with custom treesitter parser and comment configuration
- **PHP**: Intelephense LSP, Laravel Pint formatter
- **Lua**: lua_ls with Neovim-specific configuration

### Key Features
- Lazy loading for fast startup
- Format on save enabled
- Auto-save on focus loss and ESC in insert mode
- Floating file explorer (nvim-tree)
- Integrated terminal support
- Multiple colorscheme options (currently using catppuccin-frappe)
- Custom Laravel Blade syntax highlighting and commenting

### Default Theme
Uses `catppuccin-frappe` colorscheme by default, with multiple themes available via `<leader>T`.

### Key Mappings Notable Patterns
- Leader key: `<Space>`
- Save shortcuts: `s`, `<C-s>`, `<D-s>` (auto-saves on ESC in insert mode)
- File explorer: `<leader>e` (toggles nvim-tree)
- Terminal: `<leader>t` (toggles terminal)
- Git: `<leader>lg` (LazyGit), `<leader>gb` (Git blame)
- Buffer navigation: `<C-h>/<C-l>` for previous/next buffer