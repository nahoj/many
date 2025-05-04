**`many`**, an imitation of Wave Terminal made using KWin and other existing components.

## Dependencies
### Mandatory

* A KDE desktop using Wayland. This was tested on Plasma 6.1.

* `sudo apt-get install make sed wofi zsh`

* [Kröhnkite](https://github.com/anametologin/krohnkite/releases) tiling extension for KWin
  * Install with `kpackagetool6 -t KWin/Script -i krohnkite-x.x.x.x.kwinscript`

### Recommended

* `sudo apt-get install dolphin falkon kate konsole`
  * (or replace them in `many-launcher.zsh`)

* [Breeze Active Accent Dusk](https://store.kde.org/p/1709569) window-decoration theme
  * (or replace/delete it in `kwinrc`)
  * Put it in `~/.local/share/aurorae/themes/`
  * Run `sed -i -r 's/^(TitleAlignment=)\w+$/\1Left/' ~/.local/share/aurorae/themes/ActiveAccentDusk/ActiveAccentDuskrc`

## Installation

Check in the `Makefile` that `BIN_DIR` is in your `PATH`.

```bash
make lninstall
```

## Clipboard synchronization

[ClipCascade](https://github.com/Sathvik-Rao/ClipCascade) works great, at least for text.

Setup was easy enough for me (despite the scary README).

To avoid pipx, create a venv for the client:

```bash
cd ClipCascade
python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt
python main.py
```

### Also considered

* https://github.com/dnut/clipboard-sync : kinda works but makes the host clipboard buggy
* https://github.com/quackduck/uniclip : doesn't sync anything
* https://snapcraft.io/clipboard-synced : online service, privacy uncertain, looks unmaintained
