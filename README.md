# zsh-config
Dotfiles for a zsh + Neovim console on Ubuntu / WSL, linked into `$HOME` with GNU stow.

## Installation
```sh
./setup.sh
```
The script is safe to re-run. It installs the packages, links `configs/` into `$HOME`, makes zsh the default shell and installs the Neovim plugins. Existing dotfiles that are in the way are moved to `~/.dotfiles-backup-<date>/`.

## What's included
| Tool | Purpose |
| --- | --- |
| [antidote](https://github.com/mattmc3/antidote) | zsh plugins (`configs/.zsh/plugins.txt`): fzf-tab, autosuggestions, syntax highlighting, oh-my-zsh git aliases |
| [starship](https://starship.rs) | prompt (`configs/.config/starship.toml`) |
| [eza](https://eza.rocks) | `ls`, `ll`, `la`, `lla`, `lt` |
| [fzf](https://github.com/junegunn/fzf) | `Ctrl-R` history, `Ctrl-T` files, `Alt-C` dirs, fuzzy tab completion |
| [zoxide](https://github.com/ajeetdsouza/zoxide) | `z <dir>` / `zi` |
| bat, fd, ripgrep, delta | modern `cat`, `find`, `grep`, `git diff` |
| Neovim + [lazy.nvim](https://lazy.folke.io) | `configs/.config/nvim`, native LSP via mason, blink.cmp, treesitter, snacks.nvim |

## Machine-specific settings
Anything that only applies to one machine (conda/mamba init, extra `PATH` entries, tool completions) goes into `~/.zshrc.local`. That file is sourced at the end of `.zshrc` and is not tracked. If a tool's installer appends to `~/.zshrc`, move those lines over to `~/.zshrc.local`.

## Windows Terminal Configuration
### Font
The prompt and Neovim icons need a **Nerd Font v3** (v2 fonts such as "FiraMono NF … Windows Compatible" show `?` for some icons). Either of these works:

- FiraMono Nerd Font: [Download](https://github.com/ryanoasis/nerd-fonts/releases/latest/download/FiraMono.zip) (face name `FiraMono Nerd Font`)
- FiraCode Nerd Font, with ligatures: [Download](https://github.com/ryanoasis/nerd-fonts/releases/latest/download/FiraCode.zip) (face name `FiraCode Nerd Font`)

Install the `.ttf`/`.otf` files (right-click → Install), set the face name below, and restart Windows Terminal.

### Profile Configuration
To be added to `settings.json` accordingly.
```json
{
    "language": "en-US",
    "launchMode": "maximized",
    "profiles": 
    {
        "list": 
        [
            {
                "colorScheme": "zsh-config",
                "cursorShape": "filledBox",
                "experimental.retroTerminalEffect": false,
                "font": 
                {
                    "face": "FiraMono Nerd Font"
                },
                "guid": "{51855cb2-8cce-5362-8f54-464b92b32386}",
                "hidden": false,
                "name": "Ubuntu",
                "opacity": 85,
                "padding": "14",
                "scrollbarState": "hidden",
                "source": "CanonicalGroupLimited.Ubuntu_79rhkp1fndgsc",
                "useAcrylic": true
            }
        ]
    },
    "schemes": 
    [
        {
            "background": "#161821",
            "black": "#0C0C0C",
            "blue": "#0037DA",
            "brightBlack": "#767676",
            "brightBlue": "#3B78FF",
            "brightCyan": "#61D6D6",
            "brightGreen": "#16C60C",
            "brightPurple": "#B4009E",
            "brightRed": "#E74856",
            "brightWhite": "#F2F2F2",
            "brightYellow": "#F9F1A5",
            "cursorColor": "#FFFFFF",
            "cyan": "#3A96DD",
            "foreground": "#C6C8D1",
            "green": "#13A10E",
            "name": "zsh-config",
            "purple": "#881798",
            "red": "#C50F1F",
            "selectionBackground": "#272C42",
            "white": "#CCCCCC",
            "yellow": "#C19C00"
        }
    ],
    "useAcrylicInTabRow": true
}
```

