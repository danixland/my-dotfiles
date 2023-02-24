# My Dotfiles

This is the collection of dotfiles that I use on my laptop for ricing pourposes

## Getting Started

Most of these files will go in your home directory. See [Installing](#installing) for a brief description of where to put each file in this repository.

### Prerequisites

You should know how linux works at least a little bit, but you can use this setup as your starting point, so Bash is a must.
I work on [Slackware](http://www.slackware.com/) since 2006, so you'll have to adapt everything if you're using another distro. As for the software used here you have it:

* [i3-gaps](https://github.com/Airblader/i3) - My window manager of choice.
* [feh](https://feh.finalrewind.org/) - wallpaper setter. Fast and lightweight.
* [conky](https://github.com/brndnmtthws/conky) - system monitor, I use it for my desk clock, but it can do so so much more.
* [rofi](https://github.com/davatorium/rofi) - Extremely customizable dmenu replacement, I use the git version.
* [tint2](https://gitlab.com/o9000/tint2) - Great lightweight bar that can run custom scripts.
* [compton](https://github.com/chjj/compton) - Lightweight compositor.

### Installing

The **bin** directory is where we'll store all executables, so you may want to add it to your path, otherwhise you could use something like `/usr/local/bin`, but make sure to fix every reference to your executables in the other files.

**i3**, **conky**, **rofi** and **tint2** directories must go inside your `~/.config` directory, this is standard and you shouldn't have any problems with it.

**Xresources**, **bash_profile**, **bashrc** and **xinitrc** are all hidden files and you should place them in your home prepending a dot to their names, so everything should look like this:
```
$> ls /home/danix
.Xresources
.bash_profile
.bashrc
.xinitrc
[...]
```
Here's how it looks for me on a fresh install:
```
$> tree /home/danix
├── .Xresources
├── .bash_profile
├── .bashrc
├── bin/
│   ├── blackpearl-appsmenu.sh
│   ├── blackpearl-powermenu.sh
│   ├── blackpearl-runner.sh
│   ├── blackpearl-scrotmenu.sh
│   ├── blackpearl-sshmenu.sh
│   ├── blackpearl-utilsmenu.sh
│   ├── blackpearl-window.sh
│   └── executors/
│       ├── caps
│       ├── inet
│       ├── mail-check
│       ├── psuinfo.py
│       └── wifi-name
├── .config/
│   ├── compton.conf
│   ├── i3/
│   |   └── config
│   ├── conky/
│   |   └── qlocktwo.conkyrc
│   ├── rofi/
│   |   └── blackpearl/
│   |       ├── appmenu.rasi
│   |       ├── i3exit.rasi
│   |       ├── powermenu.rasi
│   |       ├── runner.rasi
│   |       ├── scrotmenu.rasi
│   |       ├── shared/
│   |       │   ├── reset.rasi
│   |       │   └── settings.rasi
│   |       └── utilsmenu.rasi
│   └── tint2/
│       ├── i3status.tint2rc
│       └── minima.tint2rc
└── .xinitrc
```

## Authors

* **danix** - [danix.xyz](https://danix.xyz)

## License and Acknowledgments

This project is free to use as it is, if you need help you can contact me on my site and I'll try and help you, but you maybe luckier asking your questions on the [unixporn thread on reddit](https://www.reddit.com/r/unixporn/), which is where I found the inspiration and most of the links to make all this work. 
