**Many** is a terminal extended into a workspace with relevant widgets. It is
an imitation of [Wave Terminal](https://www.waveterm.dev/) made from existing
components. Linux-only.

![Many-terminal screenshot](https://perso.crans.org/grande/pub/Many_Screenshot_20250508_113911.png)

## Dependencies
### Mandatory

* A KDE Linux desktop or another Linux desktop with KWin 6 installed (tested with KWin 6.1), using Wayland.

* Adapt if not on Ubuntu:

```shell
sudo apt-get install default-jre  # Java >= 17
sudo apt-get install sed swaybg wofi zsh
sudo snap install --classic task  # Taskfile
```

* [Kröhnkite](https://github.com/anametologin/krohnkite/releases) tiling extension for KWin
  * Install with `kpackagetool6 -t KWin/Script -i krohnkite-x.x.x.x.kwinscript`

### Recommended

* `sudo apt-get install dolphin falkon kate konsole`
  * (or replace them in `many-launcher.zsh`)

* [Breeze Active Accent Dusk](https://store.kde.org/p/1709569) window-decoration theme
  * (or replace/delete it in `kwinrc`)
  * Put it in `~/.local/share/aurorae/themes/`
  * Run `sed -i -r 's/^(TitleAlignment=)\w+$/\1Left/' ~/.local/share/aurorae/themes/ActiveAccentDusk/ActiveAccentDuskrc`

### Clipboard

We use [ClipCascade](https://github.com/Sathvik-Rao/ClipCascade) to be able to
copy & paste between Many and the rest of the system. This basic feature takes
a few steps to set up:

* `task clipcascade`
* `systemctl --user start clipcascade`
  * (takes 10+ seconds to start)
* Ignore the client dialog at first (there may be a login error).
* Log in to http://localhost:15186/ with Username `admin` and Password `admin123`.
* Create a user with a password, e.g. `user` and `user123`.
  * Close the web admin.
* Log in in the client dialog without changing any settings.

When running Many, you may be asked:

> Another instance of ClipCascade is already running. Do you want to run anyway?

Say yes.

#### Also considered

* https://github.com/dnut/clipboard-sync : kinda works but makes the host clipboard buggy
* https://github.com/quackduck/uniclip : doesn't sync anything
* https://snapcraft.io/clipboard-synced : online service, privacy uncertain, looks unmaintained

## Installing Many

Check in `Taskfile.yml` that `BIN_DIR` is in your `PATH`, then do:

* `task lninstall`
