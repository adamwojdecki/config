# Fedora 40

## Installation
- disable SCM (Compatibility Support Module) in BIOS
- if Ubuntu installation doesn't work from USB then it might be because of GPU drivers (in my case GTX 1070) then see this: https://askubuntu.com/a/946310
- set full disk encryption (LVM)
- if needed: update grub menu using grub-customizer (apt)
- if needed: set boot drive to nvme UEFI
- if needed: fix login appearing on incorrect screen: https://askubuntu.com/questions/1043337/is-there-to-make-the-login-screen-appear-on-the-external-display-in-18-04

## NVidia drivers
- https://rpmfusion.org/Howto/NVIDIA#About_this_Howto

## ZSH
- install zsh (dnf)
- make it default shell: _chsh -s $(which zsh)_, then logout and in
- install oh-my-zsh (https://github.com/ohmyzsh/ohmyzsh)
- in ~/.zshrc:
  - set _plugins_: git z sdk sudo history history-substring-search timer
  - set _reminder_ as update mode
  - copy content (to .zshrc) from https://github.com/adamwojdecki/config/blob/master/.zshrc
  - set theme: macovsky (with changes: no double blank space, blue '$')

## Apps / libs
- terminator (dnf)
  - config: https://github.com/adamwojdecki/config/blob/master/.config/terminator/config
- chrome
  - https://docs.fedoraproject.org/en-US/quick-docs/installing-chromium-or-google-chrome-browsers/
- keepassXC (flatpack)
- veracrypt
- visual studio code
  - disable telemetry & reporting: https://code.visualstudio.com/docs/supporting/faq#_how-to-disable-telemetry-reporting)
- smartgit (installer)
- jetbrains toolbox (installer)
- sdkman (installer)
- htop & iotop (dnf)
- sshfs (apt), https://www.digitalocean.com/community/tutorials/how-to-use-sshfs-to-mount-remote-file-systems-over-ssh
- handbrake
- mkvtoolnix
- spotify
- pinta

## Docker
- install using the instructions from their website (sudo should't be required)
  - https://docs.docker.com/engine/install/fedora/
- postinstall
  - https://docs.docker.com/engine/install/linux-postinstall/
  - setup systemd startup


## Synergy (X11 only)
- use Synergy 1
- set config from https://github.com/adamwojdecki/config/blob/master/.synergy.conf
  - it might be needed to reset cerfiticates on the client (set error level to debug for the modal to appear), firewall port: 24800
- add to startup applications in gnome tweaks

## Window management
- install jump script to /usr/local/bin/jump, https://askubuntu.com/a/189603
- add shortcut for Terminator: jump terminator
- add shortcut to Home Folder (Super + E)
- add shortcut for screenshot (Shift+Ctrl+3, Shift+Ctrl+4)
- remove shortcut for 'Move window' (Alt + F7) as it's used by Intellij

## Increase scroll speed in Chrome
- install imwheel (dnf)
- copy https://github.com/adamwojdecki/config/blob/master/.imwheelrc to home directory
- add to systemd: https://wiki.archlinux.org/title/IMWheel
  - add param: --buttons 45
- sudo systemctl daemon-reload
- systemctl --user enable imwheel.service

## Firewalld
- frontend: firewall-config
- https://firewalld.org/documentation/utilities/firewall-config.html

## Gnome
- install gnome-tweaks (dnf)
- install dconf-editor (dnf)
- install gnome-shell-extension-appindicator
- install gnome-shell-extension-dash-to-dock
- install gnome-shell-extension-netspead
- install gnome-shell-extension-openweather

## Gnome
- dark mode: Settings -> Appearance -> Dark
- change placement of titlebar buttons to left: Tweaks -> Titlebars -> Titlebar Buttons -> Placement: Left
- remove maximize titlebar button: Tweaks -> Titlebars -> Maximize: false
- disable middle click paste: Tweaks -> Middle Click Paste -> disable
- add weekday to date: Settings -> System -> Date & TIme
- auto-hide dock: Settings -> Appearance -> Auto-hide Dock
- minimize on app click in dock: gsettings set org.gnome.shell.extensions.dash-to-dock click-action minimize
- enable automatic Night Light: Settings -> Displays

## Gnome shortcuts
- standard Gnome dash: Fn+[number]
- extra shortcuts using dconf-config:
  - /org/gnome/shell/extensions/dash-to-dock/
  - app-hotkey-5
  - add another shortcut, i.e.: ['<Super>5', '<Super>q']

## Gnome Extensions
- Install "Extension Manager" from Software
- Just Perfection
  - animation speed: Almost None
  - hide Activities button
- Vitals
- OpenWeather
- NetSpeed
- System-monitor (check prerequistes)
- Sensory Perception (check prerequistes)

## Set up VPN
Guide: https://help.ubuntu.com/lts/serverguide/openvpn.html
- copy your keys to ~/.ssh
- add profile in Settings -> Network
- route only needed traffic via VPN check `Use this connection only for resources on its network` (IPv4+IPv6)
- enable .local addresses: http://superuser.com/a/706318
- in case of DNS issue with VPN (split DNS not configured, see [this](https://blogs.gnome.org/mcatanzaro/2020/12/17/understanding-systemd-resolved-split-dns-and-vpn-configuration/) and [this](https://askubuntu.com/questions/1147134/dns-settings-on-network-manager-when-using-vpn)) you can disable systemd-resolved:
```
  sudo systemctl disable systemd-resolved.service
  sudo service systemd-resolved stop
  sudo rm /etc/resolv.conf
  sudo vi /etc/NetworkManager/NetworkManager.conf
  -> add "dns=default" under [main]
  sudo service NetworkManager restart
```

## Make Intellij shortcuts work as on Mac (last checked in Ubuntu 18.04)
- swap ctrl and cmd key in mappings http://stackoverflow.com/a/14119752
  - get mac mappings from `home/adam/.local/share/JetBrains/Toolbox/apps/IDEA-C/ch-0/***.****.**/lib/resources.jar` -> `idea/Keymap_Mac.xml`
  - update it, swap `control` with `meta`
  - then copy over to /home/adam/.IntelliJIdea****.*/config/keymaps
  - issue with `id=TestGestureAction`: better to remove it due to `com.intellij.openapi.util.InvalidDataException: Attribute 'keystroke' cannot be null; Action's id=TestGestureAction;`
- in Intellij add this to Custom Properties (menu Help -> Edit VM Custom Properties`): `keymap.windows.as.meta=true`

## Adjust file limits if needed (for Intellij and Chrome)
- increase max watched files limit to 512k: https://youtrack.jetbrains.com/articles/IDEA-A-2/Inotify-Watches-Limit
  - current limit (64k): cat /proc/sys/fs/inotify/max_user_watches 
- increase max open files to 65535: https://superuser.com/questions/1200539/
  - current linit (1024): ulimit -n
