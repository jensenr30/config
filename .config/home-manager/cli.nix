{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    # coreutils & new coreutils
    bat # cat with style
    eza # ls with style
    fd # friendly find
    fzf # fuzzy finder
    neovim # the new vim

    # git
    git
    gittyup


    # programming
    # python3 will doubtless already be installed on the system
    pipx
    pre-commit

    # embedded systems
    # TODO: add these to an embedded systems / programming flake?
    dfu-util
    openocd
    # gcc-arm-embedded
    # newlib
    # newlib-nano
    minicom
    gtkterm
    can-utils

    # system monitor
    htop
    atop
    iftop
    nethogs
    sysstat
    usbutils
    # btop
    usbtop
    # bashtop

    # networking tools
    nettools
    traceroute
    arp-scan
    nmap
    # sshfs

    # file systems
    dosfstools
    mtools

    # misc CLI tools
    rsync
    numlockx
    bash-completion
    exfatprogs
    xclip
    xsel
    neofetch
    lsb-release

    # compression
    atool # provides aunpack
    bzip2
    cpio
    gzip
    lha
    xz
    lzop
    p7zip
    gnutar
    unrar
    zip
    unzip

    # downloaders
    yt-dlp
    wget
    curl

    # terminal tools
    screen
    tmux
    yazi # file system explorer

    # media
    abcde


    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })
    # TODO: inconsolata?

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];
}
