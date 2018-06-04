## Ubuntu 18.04

## Installation
- if Ubuntu installation doesn't from USB then it might be because of GPU drivers (in my case GTX 1070) then see this: https://askubuntu.com/a/946310
- set full disk encryption

## Set up vi / vim
- get latest vi by getting vim: sudo apt-get install vim 
- fix arrow keys: http://askubuntu.com/a/353944 

## Set up Mac wireless keyboard
- commands (https://help.ubuntu.com/community/AppleKeyboard):
  - echo options hid_apple iso_layout=0 | sudo tee -a /etc/modprobe.d/hid_apple.conf
  - add to /etc/modprobe.d/hid_apple.conf: 'options hid_apple fnmode=2'
  - sudo update-initramfs -u -k all
  - sudo reboot
- if needed - swap Cmd with Ctrl keys:
  - http://askubuntu.com/a/766216 (change in pc105 keyboard)
  - more details: https://wiki.archlinux.org/index.php/X_KeyBoard_extension)
- if needed - allow Ctrl-Alt-F* keys:
  - http://unix.stackexchange.com/a/34164
  - http://unix.stackexchange.com/a/242293
  - http://askubuntu.com/a/582498 

## Terminator terminal
- sudo apt install terminator
- use config file: https://github.com/adamwojdecki/config/blob/master/.config/terminator/config
- I tried using tmux (+ tmuxp) but encountered somes annoying issues with copy pasting using mouse when mouse scrolling is enabled
- alternative:Tilix

## Firewall GUI
- sudo apt-get install gufw 

## Set up VPN
Guide: https://help.ubuntu.com/lts/serverguide/openvpn.html
- copy your keys to ~/.ssh
- sudo apt install openvpn easy-rsa network-manager-openvpn network-manager-openvpn-gnome 
- sudo service network-manager restart
- copy config & certificate to ~/.config/openvpn
- add profile in Settings -> Network
- route only needed traffic via VPNm check `Use this connection only for resources on its network` (IPv4+IPv6) 
- fix DNS issues: https://askubuntu.com/a/1036209
- fix DNS issues with .local addresses: http://superuser.com/a/706318

## Apps (from www)
- Chrome
- Visual Studio Code (disable telemetry & reporting: https://code.visualstudio.com/docs/supporting/faq#_how-to-disable-telemetry-reporting)
- Smartgit
- Jetbrains Toolbox

## Apps (sudo apt install)
- openjdk-8-jdk
- git-core
- visualvm (+ VisualVM-Mbeans plugin)
- docker.io, don't require sudo: https://askubuntu.com/a/739861
- net-tools to get 'ifconfig'

## NPM
- sudo apt install nodejs
- sudo apt install npm
-- give new path for global packages so that sudo is not needed: https://github.com/sindresorhus/guides/blob/master/npm-global-without-sudo.md
-- (not sure if it is needed in the end) fix permissions so that we don't need sudo: https://stackoverflow.com/a/16151707
- npm install -g yarn
- npm install -g gulp

# ZSH + Z
- sudo apt install zsh
- install oh-my-zsh from https://github.com/robbyrussell/oh-my-zsh
- install powerlevel9k (git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k)
- copy .zshrc to ~/ from https://github.com/adamwojdecki/config/blob/master/.zshrc
- install z.sh (wget https://raw.githubusercontent.com/rupa/z/master/z.sh -O ~/z.sh)

## SSHFS (to be able to mount via ssh)
- https://www.digitalocean.com/community/tutorials/how-to-use-sshfs-to-mount-remote-file-systems-over-ssh 
- sudo apt-get install sshfs 
- sudo sshfs -o allow_other adamwojdecki@192.168.3.180:/Users/adamwojdecki/Desktop/ /mnt/mac/ 

## Window management
- install jump script to /usr/local/bin/jump, https://askubuntu.com/a/189603
- install switch-monitor script to /usr/local/bin/switch-monitor, https://github.com/ntowbinj/switch-monitor
- add shortcut for Terminator: jump terminator
- add shortcut for switch-monitor: switch-monitor 1
- add shortcut to Home Folder
- add shortcut for screenshot (Shift+Ctrl+3, Shift+Ctrl+4)

## Synergy
- use Synergy 1, set config from https://github.com/adamwojdecki/config/blob/master/.synergy.conf
-- it might be needed to reset cerfiticates on the client (set error level to debug for the modal to appear), firewall port: 2480
- set up startup on boot: https://askubuntu.com/a/896659 + https://askubuntu.com/a/195036 (5s)

## Make Intellij shortcuts work as on Mac
- swap ctrl and cmd key in mappings http://stackoverflow.com/a/14119752
  - get mac mappings from `/opt/idea-IU-***.****.*/lib/resources.jar` -> `idea/Keymap_Mac.xml`
  - update it, swap `control` with `meta`
  - then copy over to /home/adam/.IntelliJIdea****.*/config/keymaps
  - issue with `id=TestGestureAction`: better to remove it due to `com.intellij.openapi.util.InvalidDataException: Attribute 'keystroke' cannot be null; Action's id=TestGestureAction;`
- in Intellij add this to Custom Properties (menu Help -> Edit VM Custom Properties): `keymap.windows.as.meta=true`

## Adjust max watched files (for Intellij)
- current limit (8k): cat /proc/sys/fs/inotify/max_user_watches 
- increase limit to 512k: https://confluence.jetbrains.com/display/IDEADEV/Inotify+Watches+Limit 

## Install KeyPass2
- sudo apt-add-repository ppa:jtaylor/keepass
- sudo apt-get install keepass2

## Gnome
- install gnome-tweak-tool (apt)
- install gnome-shell-extensions (apt) then reboot
- install chrome-gnome-shell (apt), then install browser extension for snome shell extenions by browsing: https://extensions.gnome.org/ and licking 'install'
- change placement of titlebar buttons to left: Tweaks -> Windows -> Placement -> left
- move dock to the bottom and enable autohide: Tweaks -> Dock
- install extension: https://extensions.gnome.org/extension/1139/apt-update-indicator/
- install extension: https://extensions.gnome.org/extension/779/clipboard-indicator/
- install extension: https://extensions.gnome.org/extension/744/hide-activities-button/
- install extension: https://extensions.gnome.org/extension/750/openweather/
- install extension: https://extensions.gnome.org/extension/800/remove-dropdown-arrows/
- install extension: https://extensions.gnome.org/extension/355/status-area-horizontal-spacing/ then set horizontal padding to 6 (gnome-shell-extension-prefs)
- install extension: https://extensions.gnome.org/extension/104/netspeed/
- install extension: https://extensions.gnome.org/extension/120/system-monitor/, prerequistes required can be found here: https://github.com/paradoxxxzero/gnome-shell-system-monitor-applet (reboot needed)
- install extension: https://extensions.gnome.org/extension/1145/sensory-perception/, lm-sensors install needed (apt))
- install extension: https://extensions.gnome.org/extension/15/alternatetab/
- install extension: https://extensions.gnome.org/extension/7/removable-drive-menu/
- install extension: https://extensions.gnome.org/extension/723/pixel-saver/
- install extension: https://extensions.gnome.org/extension/1173/datetime-format/
- install extension: https://extensions.gnome.org/extension/1276/night-light-slider/ (change 2500k to 4000k)
