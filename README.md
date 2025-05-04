

## Dependencies
### Mandatory

* A KDE desktop using Wayland. This was tested on Plasma 6.1.

* `sudo apt-get install make sed wofi zsh`

* [Kröhnkite](https://github.com/anametologin/krohnkite/releases) tiling extension for KWin
  * Install with `kpackagetool6 -t KWin/Script -i krohnkite-x.x.x.x.kwinscript`

### Recommended

* `sudo apt-get install falkon kate konsole`
  * (or replace them in `many-launcher.zsh`)

* [Breeze Active Accent Dusk](https://store.kde.org/p/1709569) window-decoration theme
  * (or replace/delete it in `kwinrc`)
  * Put it in `~/.local/share/aurorae/themes/`
  * Run `sed -i -r 's/^(TitleAlignment=)\w+$/\1Left/' ~/.local/share/aurorae/themes/ActiveAccentDusk/ActiveAccentDuskrc`
