## Ubuntu 16.04

## Set up Mac wireless keyboard
- article: https://help.ubuntu.com/community/AppleKeyboard 
- these commands should do: 
	-- echo options hid_apple fnmode=2 | sudo tee -a /etc/modprobe.d/hid_apple.conf 
	-- echo options hid_apple iso_layout=0 | sudo tee -a /etc/modprobe.d/hid_apple.conf 
	-- sudo update-initramfs -u -k all 
	-- sudo reboot 
- swap Cmd with Ctrl keys:
	-- http://askubuntu.com/a/766216 (change in pc105 keyboard)
	-- more details: https://wiki.archlinux.org/index.php/X_KeyBoard_extension) 
- allow Ctrl-Alt-F* keys:
	-- http://unix.stackexchange.com/a/34164
	-- http://unix.stackexchange.com/a/242293
	-- http://askubuntu.com/a/582498 

## Install Nvidia drivers
- http://askubuntu.com/a/760935 

## Install firewall GUI
- sudo apt-get install gufw 

## Install terminator terminal
- very good iTerm2 replacement 
- set up colours, layouts etc to make it nice
- I tried using tmux (+ tmuxp) but encountered somes annoying issues with copy pasting using mouse when mouse scrolling is enabled

## Install and fix vi / vim
- get latest vi by getting vim: sudo apt-get install vim 
- fix arrow keys: http://askubuntu.com/a/353944 

## Set up VPN
Guide: https://help.ubuntu.com/lts/serverguide/openvpn.html
- copy your keys to ~/.ssh
- install openvpn: sudo apt install openvpn easy-rsa 
- install vpn gui in network manager: sudo apt install network-manager-openvpn-gnome, then add in GUIedit  
- route only needed traffic via VPN: edit connections -> IPv4 Settings -> Routes -> check `Use this connection only for resources on its network` (then the same in IPv6) 
- fix DNS issue (dnsmasq as local dns cache, https://wiki.archlinux.org/index.php/dnsmasq) 
	-- `/etc/NetworkManager/NetworkManager.conf` -> comment out `#dns=dnsmasq` 
	-- then restart computer (restarting network service is not enough, I wasted so much time because of it…) 
	-- more details: https://bugs.launchpad.net/ubuntu/+source/openvpn/+bug/1211110 
	-- even more details: http://www.ubuntugeek.com/how-to-disable-dnsmasq-in-ubuntu-12-04precise.html
- fix DNS issues with .local addresses: http://superuser.com/a/706318 

## Install Java JDK
- sudo add-apt-repository ppa:webupd8team/java 
- sudo apt update; sudo apt install oracle-java8-installer 
- sudo apt install oracle-java8-set-default 

## Vagrant
- install latest versions of virtualbox and vagrant 
- add firewall rule to allow mounting /vagrant (source: 192.168.33.15, target: 192.168.33.1) 
- install needed dependency: sudo apt-get install nfs-kernel-server

## Nginx
- install it
- to make Intellij apps run on 8080 uncomment and change the following in `jetty/start.init`: `jetty.host=192.168.33.1`, vagrant has to be running 
- run nginx as sudo 

## Adjust max watched files
- current limit (8k): cat /proc/sys/fs/inotify/max_user_watches 
- increase limit to 512k: https://confluence.jetbrains.com/display/IDEADEV/Inotify+Watches+Limit 

## SSH key
- we don’t have to do anything other than having the key in `~/.ssh/`, ubuntu has key-ring 
- testing: https://developer.github.com/guides/using-ssh-agent-forwarding/ 

## Make Intellij shortcuts work as on Mac
- swap ctrl and cmd key in mappings http://stackoverflow.com/a/14119752
	-- get mac mappings from `/opt/idea-IU-162.2032.8/lib/resources.jar` -> `idea/Keymap_Mac.xml`
	-- update it, swap `control` with `meta` 
	-- then copy over to /home/adam/.IntelliJIdea2016.2/config/keymaps 
	-- issue with `id=TestGestureAction` - better to remove it due to `com.intellij.openapi.util.InvalidDataException: Attribute 'keystroke' cannot be null; Action's id=TestGestureAction;`
- in Intellij add this to Custom Properties (menu Help -> Edit VM Custom Properties): `keymap.windows.as.meta=true`


## Install NodeJS
- PPA: https://www.digitalocean.com/community/tutorials/how-to-install-node-js-on-ubuntu-16-04 

## Git client
- SmartGit (not free but very good) 
- GitKraken (really bad UI, even though it seems nice) 
- GitEye (no good files changes view)
- git-cola (very basic) 

## Install font manager
- sudo add-apt-repository ppa:font-manager/staging 
- apt-get install font-manager 

## Install some nice indicators
- indicator network speed: https://github.com/GGleb/indicator-netspeed-unity 
- indicator sysmonitor: https://github.com/fossfreedom/indicator-sysmonitor 
- indicator multiload: https://launchpad.net/~indicator-multiload/+archive/ubuntu/stable-daily

## Install keypass2
- sudo apt-add-repository ppa:jtaylor/keepass 
- sudo apt-get update s 
- udo apt-get install keepass2 

## Install Unity tweak tool
- sudo apt-get install unity-tweak-tool 

## Change colors during night
- Redshift as Flux alternative (it doesn’t work for me for some reason) 
- http://jonls.dk/redshift/

## Install Synergy
- PC as server
- MacBook as client
- replace `Ctrl` with `Super` (PC Synergy -> client screen)
- make mouse back and forth key work fines: https://github.com/symless/synergy/issues/58#issuecomment-248043811 
	— save config 
	— add mousebutton stuff to options section 
	— use that config in server synergy app 

## Install SSHFS to be able to mount via ssh
- https://www.digitalocean.com/community/tutorials/how-to-use-sshfs-to-mount-remote-file-systems-over-ssh 
- sudo apt-get install sshfs 
- sudo sshfs -o allow_other adamwojdecki@192.168.3.180:/Users/adamwojdecki/Desktop/ /mnt/mac/ 

## Set up remote desktop (if needed)
- NoMachine: https://www.nomachine.com/
- I tried using VNC server, but it turned out rather slow (I tried TigerVNC)
- x2go doesn't work with Unity (even on latest versions of Gnome / KDE)

## Window management
- jump (open or restore window): http://askubuntu.com/a/189603 
- switch monitor: https://github.com/ntowbinj/switch-monitor

## Encryption
- encrypt ~/Private directory:
	— https://help.ubuntu.com/community/EncryptedPrivateDirectory 
	— this has issues with long paths..
- encrypt partitions: http://thesimplecomputer.info/full-disk-encryption-with-ubuntu
