{ pkgs, inputs, ... }:
{
  environment.systemPackages = with pkgs; [

    # (import ../../../customs/pkgs/river-ultitile {inherit pkgs;})
    (import ../../customs/pkgs/miniterm { inherit pkgs; })
    (import ../../customs/pkgs/modpoll { inherit pkgs; })
    (import ../../customs/pkgs/diagslave { inherit pkgs; })

    (import ../../customs/pkgs/shortcuts/control/volumeup.nix { inherit pkgs; })
    (import ../../customs/pkgs/shortcuts/control/volumedown.nix { inherit pkgs; })
    (import ../../customs/pkgs/shortcuts/control/volumemute.nix { inherit pkgs; })
    (import ../../customs/pkgs/shortcuts/control/brightnessup.nix { inherit pkgs; })
    (import ../../customs/pkgs/shortcuts/control/brightnessdown.nix { inherit pkgs; })

    (import ../../customs/pkgs/shortcuts/notify/volume.nix { inherit pkgs; })
    (import ../../customs/pkgs/shortcuts/notify/time.nix { inherit pkgs; })
    (import ../../customs/pkgs/shortcuts/notify/battery.nix { inherit pkgs; })
    (import ../../customs/pkgs/shortcuts/notify/brightness.nix { inherit pkgs; })

    (import ../../customs/pkgs/shortcuts/capture/whole.nix { inherit pkgs; })
    (import ../../customs/pkgs/shortcuts/capture/section.nix { inherit pkgs; })

    # (import ../../../customs/pkgs/shortcuts/river/layout-top.nix { inherit pkgs; })
    # (import ../../../customs/pkgs/shortcuts/river/layout-left.nix { inherit pkgs; })
    # (import ../../../customs/pkgs/shortcuts/river/layout-right.nix { inherit pkgs; })
    # (import ../../../customs/pkgs/shortcuts/river/layout-bottom.nix{ inherit pkgs; })

    # (import ../../../customs/wideriver/default.nix {inherit pkgs;})

    websocat
    mosquitto
    rlwrap
    tree
    dconf
    unzip
    luajit
	luarocks
    nodejs_22
    ntfs3g
    cargo
    wget
    flex
    bison
    gperf
    # (python3.withPackages(ps: with ps; [ pip pyserial psutil west torch torchaudio torchvision]))
    # (python310.withPackages(ps: with ps; [ pip lark stringcase jinja2 urllib3]))
    python310
    ninja
    ccache
    dfu-util
    cmake
    gcc
	clang
	clang-tools
    gnumake
    zig
    brightnessctl
    libnotify
    zathura
    unrar
    mpv
    # blender
    gimp
    nix-index
    p7zip
    fastfetch
    vscode

    alsa-utils

    #### WAYLAND
    grim
    slurp
    wl-clipboard
    wlr-randr
    swayimg
    swaybg
    swappy
	wl-screenrec
    wlopm
	waylock

    #### NRF
    nrf-command-line-tools
    segger-jlink
    # nrfconnect

    skypeforlinux
    xfce.thunar
    slack

    rnote

    krita

    saleae-logic-2
    digital
    lshw

    thunderbird
    scrcpy

    libreoffice

    stlink
    stlink-tool
    gcc-arm-embedded

    dtc
    system-config-printer

    imagemagick
    postman

    # gdb
    valgrind
    file
    nvtopPackages.full
    discord-unstable
    playerctl

    transmission_4-gtk
    # cudatoolkit
    pureref
    arduino-cli
    kicad
    # wideriver
    cmus
    doxygen
    ngrok
    deno
    sqlitebrowser
    sqlite
    rpi-imager
    zip
    dwl
	cpulimit
	libsixel
	# kitty
	# xclip
	# inputs.pinnacle.devShell.x86_64-linux.default
  ];

  services.udev.packages = with pkgs; [
    saleae-logic-2
    segger-jlink
    stlink
  ];
}