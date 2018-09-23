# `~/.dotfiles`

This is a collection of dotfiles and scripts I use on my macOS. They should be cloned to your home directory so that the path is `~/dotfiles/`. The included setup script creates symlinks from your home directory to the files which are located in `~/dotfiles/shell/`.

### What's inside:

- Some CTF tools;
- Useful NPM packages;
- Useful Homebrew packages;

<div align="center" style="margin: 1rem 0">
  <img src="https://i.imgur.com/3OeGD9u.png" />
</div>

## `~/.dotfiles/setup`

**Warning:** If you want to give these dotfiles a try, you should first fork this repository, review the code, and remove things you don’t want or need. Don’t blindly use my settings unless you know what that entails. Use at your own risk!

```sh
$ git clone https://github.com/Bartozzz/dotfiles.git ~/dotfiles
$ ~/dotfiles/setup
```

## `~/.dotfiles/fonts`

### [Fira Code: monospaced font with programming ligatures](https://github.com/tonsky/FiraCode)

> _Programmers use a lot of symbols, often encoded with several characters. For the human brain, sequences like ->, <= or := are single logical tokens, even if they take two or three characters on the screen. Your eye spends a non-zero amount of energy to scan, parse and join multiple characters into a single logical one. Ideally, all programming languages should be designed with full-fledged Unicode symbols for operators, but that’s not the case yet._

## `~/.dotfiles/software`

### [chunkwm: tiling window manager](https://github.com/koekeishiya/chunkwm)

> _**chunkwm** is a tiling window manager for macOS that uses a plugin architecture, successor to kwm. It represents windows as the leaves of a binary tree, and supports binary space partitioned, monocle and floating desktops._

### [skhd: hotkey daemon](https://github.com/koekeishiya/skhd)

> _**skhd** is a simple hotkey daemon for macOS. It is a stripped version of khd (although rewritten from scratch), that sacrifices the more advanced features in favour of increased responsiveness and performance._

### [iTerm2: replacement for Terminal](https://www.iterm2.com/)

> \_**iTerm2** is a replacement for Terminal and the successor to iTerm. It works on Macs with macOS 10.10 or newer. iTerm2 brings the terminal into the modern age with features you never knew you always wanted.\_\_

### [Ubersicht: keep an eye on what is happening on your machine](http://tracesof.net/uebersicht/)

> \_**Übersicht** lets you run system commands and display their output on your desktop in little containers, called widgets. Widgets are written using HTML5, which means they.\_\_

## `~/.dotfiles/advices/security`

- Use [**Ungoogled Chrome**](https://github.com/Eloston/ungoogled-chromium) & [**DuckDuckGo**](https://duckduckgo.com) if you don't trust folks in Google and don't like Firefox & co.

  > _Modifications to Google Chromium for removing Google integration and enhancing privacy, control, and transparency_

- **Encrypt your hard drive** (full disk encryption, or FDE for short). Standard LVM encryption is the best option.

  > _For a disk that is not part of your operating system, a portable drive for example, dmcrypt/LUKS is the best option but veracrypt is available on all platforms. Keep in mind your installer may or may not encrypt your GRUB but there are several ways of dealing with that issue. Keep in mind disk encryption means nothing to an experienced attacker with physical access if you have not completely shut down your computer and wiped the RAM._

- **Install some useful plugins in your browser:**

  1. [**uBlock Origin**](https://chrome.google.com/webstore/detail/ublock-origin/cjpalhdlnbpafiamejdnhcphjbkeiagm)

     > _An efficient blocker: easy on memory and CPU footprint, and yet can load and enforce thousands more filters than other popular blockers out there._

  2. [**HTTPS Everywhere**](https://chrome.google.com/webstore/detail/https-everywhere/gcbommkclmclpchllfjekcdonpmejbdp)
     > _Created by EFF and the Tor Project which automatically switches thousands of sites from insecure "http" to secure "https". It will protect you against many forms of surveillance and account hijacking, and some forms of censorship._

- **Apply your filters:**

  1. [**easylist & easyprivacy**](https://easylist.to/)

     > _The EasyList filter lists are sets of rules originally designed for Adblock that automatically remove unwanted content from the internet, including annoying adverts, bothersome banners and troublesome tracking._

  2. [**Block malicious sites in your hosts file**](https://github.com/StevenBlack/hosts)
     > _Extending and consolidating hosts files from several well-curated sources like adaway.org, mvps.org, malwaredomainlist.com, someonewhocares.org, and potentially others. You can optionally invoke extensions to block additional sites by category._
