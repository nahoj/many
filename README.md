After a good 7-day run, this is going to the archive. Closing notes:

* Sway would be a better choice than KWin for this. It is natively tiling, with
  a more "human" tiling style that allows just drag&dropping windows where one
  wants them. It also displays virtual desktops by default, which can act as
  tabs.
* Intercepting a close event from the outside WM (`xdg_toplevel.close`) is
  difficult. On the other hand, it is possible to configure an outside WM (at
  least KWin) to prevent accidental closing of the nested WM. Then the Many WM
  could only be closed from the inside, thus in a more controlled way.
* Clipboard issues remain.

---

**Many** is a terminal extended into a workspace with relevant widgets: text
editor, file manager, browser, AI assistant, additional terminal.

It is a proof-of-concept clone of [Wave Terminal](https://www.waveterm.dev/) made
from existing parts. Linux-only.

![Many-terminal screenshot](https://perso.crans.org/grande/pub/Many_Screenshot_20250508_113911.png)

## Usage (subject to change)

Many starts with a single terminal.

* `Meta+F2` opens a new widget
* `Ctrl+F4` closes the current widget
* `Ctrl+Tab` and `Ctrl+Shift+Tab` cycle through widgets

> **Note!** In this prototype stage, closing Many (e.g. typing Alt+F4) immediately closes all widgets. Be sure to save your work, such as any file you're editing, before closing.

Two widgets can be swapped by dragging one into the other.

[Khrönkite key bindings](https://github.com/anametologin/krohnkite?tab=readme-ov-file#default-key-bindings) can be used to switch widgets (windows) and layouts.

## Design

Many uses a windowed KWin instance as a "frame", and simple KDE apps, configured
into simple layouts, as "widgets".

Many runs on a separate DBus session and its own XDG_CONFIG_HOME to avoid
interference. This prevents the clipboard from being shared between Many and
the rest of the system, so we use a separate tool to synchronize them.

## Dependencies
### Mandatory

* A KDE Linux desktop or another Linux desktop with KWin 6 installed (tested with KWin 6.1), using Wayland.

* Adapt if not on Ubuntu:

```shell
sudo apt-get install sed swaybg wofi zsh
sudo snap install --classic task  # Taskfile
```

* [Kröhnkite](https://github.com/anametologin/krohnkite/releases) tiling extension for KWin
  * Download and install with `kpackagetool6 -t KWin/Script -i krohnkite-x.x.x.x.kwinscript`

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

* Java JRE ≥ 17 and Python venv: `sudo apt-get install default-jre python3-venv`
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
