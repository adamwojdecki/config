## Ubuntu 21.10 / 22.04

## Installation
- disable SCM (Compatibility Support Module) in BIOS
- if Ubuntu installation doesn't work from USB then it might be because of GPU drivers (in my case GTX 1070) then see this: https://askubuntu.com/a/946310
- set full disk encryption (LVM)
- if needed: update grub menu using grub-customizer (apt)
- if needed: set boot drive to nvme UEFI
- switch to nvidia-driver-495
- if needed: fix login appearing on incorrect screen: https://askubuntu.com/questions/1043337/is-there-to-make-the-login-screen-appear-on-the-external-display-in-18-04

## Apps / libs
- terminator (apt)
  - config: https://github.com/adamwojdecki/config/blob/master/.config/terminator/config
  - set as default terminal: https://askubuntu.com/questions/1261901/unable-to-set-terminator-as-default-terminal-in-ubuntu-with-cinnamon-desktop
- vim (apt) to get the latest
  - fix arrow keys: http://askubuntu.com/a/353944
- gufw (apt), firewall GUI
- chrome (deb)
- keepassxc (deb)
- veracrypt (deb)
- visual studio code (deb)
  - disable telemetry & reporting: https://code.visualstudio.com/docs/supporting/faq#_how-to-disable-telemetry-reporting)
- git (apt)
  - conditional .gitconfig: https://blog.jiayu.co/2019/02/conditional-git-configuration/
- smartgit (deb)
- jetbrains toolbox (installer)
- sdkman (installer)
- net-tools (apt) to get _ifconfig_
- htop (apt)
- iotop (apt)
- sshfs (apt), https://www.digitalocean.com/community/tutorials/how-to-use-sshfs-to-mount-remote-file-systems-over-ssh
- docker (installer, don't require sudo)
- imagemagick (apt) to get _convert_
   - give it more memory and disk space: https://stackoverflow.com/questions/31407010/cache-resources-exhausted-imagemagick/53699200
- ubuntu-restricted-extras (apt)
- sudo snap remove --purge firefox
- flatpak (https://flatpak.org/setup/Ubuntu/)
  - then _snap remove snap-store_ (as deb one gets installed)
  - then restart
- handbrake (flatpak)
- mkvtoolnix (flatpak)
- spotify (snap)
- pinta (snap)
- jq (apt)

## ZSH
- install zsh (apt)
- make it default shell: _chsh -s $(which zsh)_, then logout and in
- install oh-my-zsh (https://github.com/ohmyzsh/ohmyzsh)
- in ~/.zshrc:
  - set _plugins_: git z sdk sudo history history-substring-search timer
  - set _reminder_ as update mode
  - copy content (to .zshrc) from https://github.com/adamwojdecki/config/blob/master/.zshrc
  - set theme: macovsky (with changes: no double blank space, blue '$')

## Synergy
- use Synergy 1 Pro
- set config from https://github.com/adamwojdecki/config/blob/master/.synergy.conf
  - it might be needed to reset cerfiticates on the client (set error level to debug for the modal to appear), firewall port: 24800
- add the following command to Ubuntu Startup Applications: sh -c "sleep 5 && /usr/bin/synergy"

## Window management
- install jump script to /usr/local/bin/jump, https://askubuntu.com/a/189603
- add shortcut for Terminator: jump terminator
- add shortcut to Home Folder (Super + E)
- add shortcut for screenshot (Shift+Ctrl+3, Shift+Ctrl+4)
- remove shortcut for 'Move window' (Alt + F7) as it's used by Intellij

## Increase scroll speed in Chrome
- install imwheel (apt), https://wiki.archlinux.org/title/IMWheelhttps://wiki.archlinux.org/title/IMWheel
- copy https://github.com/adamwojdecki/config/blob/master/.imwheelrc to home directory
- add to Startup Applications: imwheel --buttons "4 5"
- disable smooth scrolling: chrome://flags/#smooth-scrolling

## Gnome Libs
- install gnome-shell-extension-prefs (apt)
- install gnome-tweaks (apt)
- install dconf-editor (apt)
- install chrome-gnome-shell (apt)
- install browser extension for snome shell extenions by browsing: https://extensions.gnome.org/ and clicking 'install'

## Gnome
- dark mode: Settings -> Appearance -> Dark
- change placement of titlebar buttons to left: Tweaks -> Titlebars -> Titlebar Buttons -> Placement: Left
- remove maximize titlebar button: Tweaks -> Titlebars -> Maximize: false
- disable middle click paste: Tweaks -> Middle Click Paste -> disable
- add weekday to date: Tweaks -> Clock -> Weekday -> enable
- auto-hide dock: Settings -> Appearance -> Auto-hide Dock
- buttom dock: Settings -> Appearance -> Dock: Bottom
- center dock panel: gsettings set org.gnome.shell.extensions.dash-to-dock extend-height false
- minimize on app click in dock: gsettings set org.gnome.shell.extensions.dash-to-dock click-action minimize

## Gnome Extensions
- Hide Activities button: https://extensions.gnome.org/extension/4325/hide-activities-button/
- OpenWeather: https://extensions.gnome.org/extension/750/openweather/
- NetSpeed: https://extensions.gnome.org/extension/104/netspeed/
- System-monitor: https://extensions.gnome.org/extension/120/system-monitor/ (check prerequistes)
- Sensory Perception: https://extensions.gnome.org/extension/1145/sensory-perception/ (check prerequistes)
- Removable Drive Menu: https://extensions.gnome.org/extension/7/removable-drive-menu/
- No Title Bar: https://extensions.gnome.org/extension/2015/no-title-bar-forked/
  - make title bar smaller: https://unix.stackexchange.com/a/291040
- Status Area Horizontal Spacing: https://extensions.gnome.org/extension/355/status-area-horizontal-spacing/

## Set up Mac wireless keyboard
- commands (https://help.ubuntu.com/community/AppleKeyboard):
  - echo options hid_apple iso_layout=0 | sudo tee -a /etc/modprobe.d/hid_apple.conf
  - add to /etc/modprobe.d/hid_apple.conf: 'options hid_apple fnmode=2'
  - sudo update-initramfs -u -k all
  - sudo reboot
- swap Cmd with Ctrl keys:
  - in Gnome Tweaks -> Ctrl position -> Swap Left Win with Left Ctrl
  - alternative: http://askubuntu.com/a/766216 (change in pc105 keyboard)
  - more details: https://wiki.archlinux.org/index.php/X_KeyBoard_extension)
- if needed - allow Ctrl-Alt-F* keys:
  - http://unix.stackexchange.com/a/34164
  - http://unix.stackexchange.com/a/242293
  - http://askubuntu.com/a/582498 

## Set up VPN (to be checked on 21.10)
Guide: https://help.ubuntu.com/lts/serverguide/openvpn.html
- copy your keys to ~/.ssh
- sudo apt install openvpn easy-rsa network-manager-openvpn network-manager-openvpn-gnome 
- sudo service NetworkManager restart
- copy config & certificate to ~/.config/openvpn
- add profile in Settings -> Network
- route only needed traffic via VPN check `Use this connection only for resources on its network` (IPv4+IPv6) 
- enable .local addresses: http://superuser.com/a/706318
- in case of DNS issue with VPN (see [this](https://systemd.io/RESOLVED-VPNS/)) you can disable systemd-resolved:
```
  sudo systemctl disable systemd-resolved.service
  sudo service systemd-resolved stop
  sudo rm /etc/resolv.conf
  sudo vi /etc/NetworkManager/NetworkManager.conf
  -> add "dns=default" under [main]
  sudo service NetworkManager restart
```

## Make Intellij shortcuts work as on Mac (to be checked on 21.10)
- swap ctrl and cmd key in mappings http://stackoverflow.com/a/14119752
  - get mac mappings from `home/adam/.local/share/JetBrains/Toolbox/apps/IDEA-C/ch-0/***.****.**/lib/resources.jar` -> `idea/Keymap_Mac.xml`
  - update it, swap `control` with `meta`
  - then copy over to /home/adam/.IntelliJIdea****.*/config/keymaps
  - issue with `id=TestGestureAction`: better to remove it due to `com.intellij.openapi.util.InvalidDataException: Attribute 'keystroke' cannot be null; Action's id=TestGestureAction;`
- in Intellij add this to Custom Properties (menu Help -> Edit VM Custom Properties`): `keymap.windows.as.meta=true`

## Adjust file limits (for Intellij and Chrome)
- increase max watched files limit to 512k: https://youtrack.jetbrains.com/articles/IDEA-A-2/Inotify-Watches-Limit
  - current limit (64k): cat /proc/sys/fs/inotify/max_user_watches 
- increase max open files to 65535: https://superuser.com/questions/1200539/
  - current linit (1024): ulimit -n
