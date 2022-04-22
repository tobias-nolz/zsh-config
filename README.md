# ZSH installation with plugins and config
Afer executing the `setup.sh` file, the installation script will start executing.
Once in the zsh prompt, type `exit` to continue the installation.

## Windows Terminal Configuration
### Font
FiraMono Nerd Font: [Download](https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/FiraMono.zip)

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


