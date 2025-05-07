**`Many`**, an imitation of Wave Terminal made using KWin and other existing components.

## Dependencies
### Mandatory

* A KDE desktop with Wayland, systemd. This was tested on Plasma 6.1.

* `sudo apt-get install make sed swaybg wofi zsh`

* `sudo snap install --classic task`

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

Check in `Taskfile.yml` that `BIN_DIR` is in your `PATH`.

```shell
task lninstall
```

### Clipboard synchronization

* `task clipcascade`
  * `systemctl --user start clipcascade`
  * Ignore the client dialog at first.
  * After 10s or so, connect to http://localhost:15186/ with Username `admin` and Password `admin123`
  * Create a user with a password, e.g. `user` and `user123`
  * Close the web admin and log in in the client dialog.


[ClipCascade](https://github.com/Sathvik-Rao/ClipCascade) works great, at least for text.

### Also considered

* https://github.com/dnut/clipboard-sync : kinda works but makes the host clipboard buggy
* https://github.com/quackduck/uniclip : doesn't sync anything
* https://snapcraft.io/clipboard-synced : online service, privacy uncertain, looks unmaintained
