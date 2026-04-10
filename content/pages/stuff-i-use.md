---
layout: layouts/base.njk
title: Stuff I Use
---
<h1>Everyday stuff I use</h1>

<h2>Main OS: Fedora 41 Cinnamon</h2>

<h2>Software/Configurations for Arch</h2>
<strong>I no longer use Arch on my main machine, I run Fedora 41 Cinnamon now. This section is still here for whenever I do end up using my Arch installs again tho.</strong>

<p>
<strong id="warning">WARNING:</strong>
My configurations take into account the fact that you are also using the other apps I use.
All the important apps are listed below. Don't just copy paste my configs.
Look at them and edit them to your liking before actually using them as your own.
I am not responsible for any breakage of your system.
</p>

<p>Command to install all the packages below that are in the Arch Official repos:</p>

<code class="pacman" style="margin-bottom: 20px">
sudo pacman -S stow rofi mtpfs gvfs-mtp gvfs-gphoto2 p7zip zip unzip file-roller blueberry bluez bluez-utils
networkmanager ifplugd xfce4 thunar ntfs-3g xorg-xrandr arandr alacritty flameshot dunst
simple-scan copyq code sxhkd peek shotcut losslesscut obs-studio mpv
</code>



<table>
  <thead>
    <tr>
      <th>Category</th>
      <th>App / Package</th>
      <th>Links</th>
      <th>Notes</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Dotfiles</td>
      <td>Stow</td>
      <td><a href="https://github.com/ShahriyarShawon/stow" target="_blank">GitHub</a></td>
      <td></td>
    </tr>
    <tr>
      <td>App Launcher</td>
      <td>rofi</td>
      <td>
        <a href="https://github.com/davatorium/rofi" target="_blank">GitHub</a>
        <a href="https://wiki.archlinux.org/index.php/Rofi" target="_blank">ArchWiki</a>
      </td>
      <td></td>
    </tr>
    <tr>
      <td>Android Mounter</td>
      <td>mtpfs, gvfs-mtp, gvfs-gphoto2</td>
      <td></td>
      <td></td>
    </tr>
    <tr>
      <td>Archiving / Compression</td>
      <td>p7zip, zip, unzip, unrar, rar</td>
      <td><a href="https://aur.archlinux.org/packages/rar/" target="_blank">AUR</a></td>
      <td></td>
    </tr>
    <tr>
      <td>Archive Manager</td>
      <td>file-roller</td>
      <td></td>
      <td></td>
    </tr>
    <tr>
      <td>AUR Helper</td>
      <td>yay</td>
      <td><a href="https://aur.archlinux.org/packages/yay/" target="_blank">AUR</a></td>
      <td></td>
    </tr>
    <tr>
      <td>Bluetooth</td>
      <td>blueberry, bluez, bluez-utils</td>
      <td></td>
      <td></td>
    </tr>
    <tr>
      <td>Network</td>
      <td>networkmanager</td>
      <td></td>
      <td></td>
    </tr>
    <tr>
      <td>Ethernet Daemon</td>
      <td>ifplugd</td>
      <td></td>
      <td>Have not needed this in a while</td>
    </tr>
    <tr>
      <td>Desktop Environment</td>
      <td>xfce4</td>
      <td></td>
      <td></td>
    </tr>
    <tr>
      <td>File Explorer</td>
      <td>Thunar</td>
      <td></td>
      <td>Install ntfs-3g for NTFS drives. Install gvfs for auto mount (likely preinstalled).</td>
    </tr>
    <tr>
      <td>Display Manager</td>
      <td>xorg-xrandr, arandr</td>
      <td></td>
      <td>arandr is the GUI for xrandr. xfce4 handles most monitor configs. Only useful with multiple monitors.</td>
    </tr>
    <tr>
      <td>Shell</td>
      <td>bash</td>
      <td></td>
      <td></td>
    </tr>
    <tr>
      <td>Terminal Emulator</td>
      <td>alacritty</td>
      <td></td>
      <td></td>
    </tr>
    <tr>
      <td>Screenshot</td>
      <td>flameshot</td>
      <td></td>
      <td></td>
    </tr>
    <tr>
      <td>Notification Daemon</td>
      <td>dunst</td>
      <td></td>
      <td></td>
    </tr>
    <tr>
      <td>Scanning</td>
      <td>simple-scan</td>
      <td></td>
      <td></td>
    </tr>
    <tr>
      <td>Clipboard Manager</td>
      <td>copyq</td>
      <td></td>
      <td></td>
    </tr>
    <tr>
      <td>Monospace Font</td>
      <td>JetBrains Mono</td>
      <td><a href="https://www.jetbrains.com/lp/mono/" target="_blank">JetBrains Site</a></td>
      <td></td>
    </tr>
    <tr>
      <td>Editor</td>
      <td>VSCode / VSCodium</td>
      <td><a href="https://aur.archlinux.org/packages/vscodium-bin/" target="_blank">AUR</a></td>
      <td></td>
    </tr>
    <tr>
      <td>VSCode Theme</td>
      <td>One Dark Pro</td>
      <td></td>
      <td></td>
    </tr>
    <tr>
      <td>GTK Theme</td>
      <td>Arc Dark</td>
      <td></td>
      <td></td>
    </tr>
    <tr>
      <td>Hotkeys</td>
      <td>sxhkd</td>
      <td>
        <a href="https://github.com/baskerville/sxhkd" target="_blank">GitHub</a>
        <a href="https://wiki.archlinux.org/index.php/Sxhkd" target="_blank">ArchWiki</a>
      </td>
      <td>Uses <a href="https://www.tcl.tk/man/tcl8.4/TkCmd/keysyms.htm" target="_blank">KeySym</a> to represent keys</td>
    </tr>
    <tr>
      <td>GIF Recorder</td>
      <td>peek</td>
      <td></td>
      <td></td>
    </tr>
    <tr>
      <td>Video Editor</td>
      <td>shotcut, losslesscut</td>
      <td></td>
      <td></td>
    </tr>
    <tr>
      <td>Video Recorder</td>
      <td>obs-studio</td>
      <td></td>
      <td></td>
    </tr>
    <tr>
      <td>Video Player</td>
      <td>mpv</td>
      <td></td>
      <td></td>
    </tr>
    <tr>
      <td>Music</td>
      <td>Spotify</td>
      <td></td>
      <td></td>
    </tr>
  </tbody>
</table>

<h2>Devices I have/use</h2>

<h3>Computers</h3>
<table>
  <thead>
    <tr>
      <th>Device</th>
      <th>CPU</th>
      <th>RAM</th>
      <th>OS</th>
      <th>Notes</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Desktop</td>
      <td>AMD Ryzen 7 5800X3D</td>
      <td>32GB</td>
      <td>Linux Mint</td>
      <td>Gaming PC, also main programming machine at home. NVIDIA GeForce GTX 3060Ti.</td>
    </tr>
    <tr>
      <td>Framework Laptop</td>
      <td>AMD Ryzen 7 7840U</td>
      <td>32GB</td>
      <td>Fedora</td>
      <td>Dedicated programming/school laptop</td>
    </tr>
    <tr>
      <td>Framework Laptop (old mobo)</td>
      <td>i7-1165G7</td>
      <td>32GB</td>
      <td>Fedora</td>
      <td>Media Server (Jellyfin)</td>
    </tr>
    <tr>
      <td>Steam Deck</td>
      <td></td>
      <td></td>
      <td>SteamOS</td>
      <td>Linux based handheld gaming</td>
    </tr>
    <tr>
      <td>Thinkpad T430</td>
      <td>i5-3230M</td>
      <td>12GB</td>
      <td>Arch</td>
      <td>Dust gatherer</td>
    </tr>
    <tr>
      <td>MacBook Pro 13" Late 2017</td>
      <td>i5</td>
      <td>8GB</td>
      <td>macOS Catalina</td>
      <td>Dust gatherer</td>
    </tr>
    <tr>
      <td>Raspberry Pi 5</td>
      <td></td>
      <td></td>
      <td></td>
      <td>File Server</td>
    </tr>
    <tr>
      <td>Raspberry Pi 4</td>
      <td></td>
      <td></td>
      <td></td>
      <td>Home Assistant</td>
    </tr>
    <tr>
      <td>Raspberry Pi 3B+</td>
      <td></td>
      <td></td>
      <td></td>
      <td>Literally nothing right now</td>
    </tr>
  </tbody>
</table>

<h3>Tablet</h3>
<table>
  <thead>
    <tr>
      <th>Device</th>
      <th>Accessory</th>
      <th>Notes</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Samsung Galaxy S6</td>
      <td>Wacom One Pen</td>
      <td>Used for media and practicing different writing systems</td>
    </tr>
  </tbody>
</table>

<h3>Printer</h3>
<table>
  <thead>
    <tr>
      <th>Device</th>
      <th>Links</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Brother MFC-L2710DW</td>
      <td>
        <a href="https://www.youtube.com/watch?v=R3X2HcEYEmE">Printing setup on Arch</a>
        <a href="https://www.youtube.com/watch?v=FRj9Vm90UFg">Scanning setup on Arch</a>
      </td>
    </tr>
  </tbody>
</table>

<h3>Misc</h3>
<table>
  <thead>
    <tr>
      <th>Device</th>
      <th>Notes</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Shanwan PS3/XBOX/Android/PC USB Controller</td>
      <td>Cheapo controller bought for emulation</td>
    </tr>
  </tbody>
</table>
