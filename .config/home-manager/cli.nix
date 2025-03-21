{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    # nix-related
    #nox
    nix-diff

    # coreutils & new coreutils
    bat # cat with style
    eza # ls with style
    fd # friendly find
    fzf # fuzzy finder
    man
    man-pages
    gdu
    zsh
    nix-tree
    # better command history
    atuin

    # git
    git
    delta

    # programming
    # python3 will doubtless already be installed on the system
    pipx
    pre-commit
    ascii

    # system monitor
    htop
    atop
    iftop
    nethogs
    sysstat
    usbutils
    btop
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

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];
}
