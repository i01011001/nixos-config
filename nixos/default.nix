{ pkgs, ... }:
{
	imports = [
		./hardware-configuration.nix
			../modules/nixos
	];

	programs.zsh = {
		enable = true;
		enableCompletion = false;
		enableLsColors = false;
		autosuggestions.async = false;
	};
	environment = {
		pathsToLink = [ "/share/zsh" ];
		variables = {
			EDITOR = "nvim";
			VISUAL = "nvim";
			FUNCNEST = 1000;
		};
		variables = {
			QT_QPA_PLATFORMTHEME = "qt5ct";
			_JAVA_AWT_WM_NONREPARENTING = 1;
			QT_WAYLAND_DISABLE_WINDOWDECORATION = 1;
			WLR_NO_HARDWARE_CURSORS = 1;
			XDG_PICTURES_DIR = "~/media/images/";
			# WLR_DRM_NO_MODIFIERS=1;

			# WLR_RENDERER="vulkan";
			__GL_GSYNC_ALLOWED=0;
			__GL_VRR_ALLOWED=0;
		};
	};

	boot.loader = {
		grub = {
			enable = true;
			backgroundColor = "#000000";
			device = "nodev";
			useOSProber = false;
			efiSupport = true;
			gfxmodeBios = "auto";
			gfxmodeEfi = "auto";
			splashImage = null;
		};
		systemd-boot.enable = false;

		efi = {
			canTouchEfiVariables = true;
			efiSysMountPoint = "/boot/efi"; # ← use the same mount point here.
		};

		timeout = 5;
	};

#    nix-store --optimise
	nix.settings.auto-optimise-store = true;

	fonts = {
		packages = with pkgs; [
			nerd-fonts.iosevka
#    nerd-fonts.hack
# nerd-fonts.mononoki

# normal Fonts

				noto-fonts
				noto-fonts-cjk-sans
				noto-fonts-emoji

# icon Fonts
				material-design-icons
		];
		fontconfig.defaultFonts = {
			monospace = [ "Iosevka Nerd Font Propo" ];
			sansSerif = [ "Iosevka Nerd Font Propo" ];
			serif = [ "Iosevka Nerd Font Propo" ];
		};
	};

	hardware = {
		bluetooth = {
			enable = true; # enables support for Bluetooth
				powerOnBoot = true;
		};
	};
	services.blueman.enable = true;

	networking = {
		# networkmanager = {
		# 	enable = true;
		# 	wifi.backend = "iwd";
		# 	};
		hostName = "nixos";
		wireless.iwd = {
			enable = true;
			settings = {
				General.UseDefaultInterface = true;
				Settings.AutoConnect = true;
			};
		};
		firewall = {
			enable = true;
			allowedTCPPorts = [ 22 ];
		};
		useDHCP = false;
		interfaces.enp7s0 = {
			useDHCP = true;
			ipv4.addresses = [ {
				address = "192.168.1.70";
				prefixLength = 24;
			} ];
		};

		interfaces.wlan0 = {
			useDHCP = true;
			ipv4.addresses = [
			{
				address = "192.168.1.69";
				prefixLength = 24;
			}
			];
		};
# defaultGateway = "192.168.1.254";
		nameservers = [
			"1.1.1.1"
				"8.8.8.8"
		];
		enableIPv6 = false;
		dhcpcd.extraConfig = "nohook resolv.conf";
	};

	services.resolved.enable = false;

#Set your time zone.
	time.timeZone = "Asia/Kathmandu";

# Enable sound.
	security.rtkit.enable = true;

	services = {
		pipewire = {
			enable = true;
			alsa.enable = true;
			alsa.support32Bit = true;
			pulse.enable = true;
		};
	};

	services.journald.extraConfig = "SystemMaxUse=1G";

	services.printing = {
		enable = true;
		cups-pdf.enable = true;
		drivers = [
# (pkgs.callPackage ../pkgs/driver/dcpj125.nix {inherit pkgs;})
			(import ../customs/driver/dcpj125.nix { inherit pkgs; }).driver
				(import ../customs/driver/dcpj125.nix { inherit pkgs; }).cupswrapper
		];
	};

	hardware.printers = {
		ensurePrinters = [
		{
			name = "DCP-J125";
			location = "Home";
			deviceUri = "usb://Brother/DCP-J125?serial=BROE2F352003";
# model = "drv:///sample.drv/generic.ppd";
			model = "brother_dcpj125_printer_en.ppd";
			ppdOptions = {
				PageSize = "A4";
			};
		}
		];
	};
	hardware.sane = {
		enable = true;
		brscan4 = {
			enable = true;
		};
		brscan5 = {
			enable = true;
		};
	};

	nix.settings.experimental-features = [
		"nix-command"
			"flakes"
	];

	nixpkgs.config = {
		allowUnfree = true;
		allowBroken = true;
# cudaSupport=true;
	};

# Define a user account. Don't forget to set a password with ‘passwd’.
	users = {
		users.void = {
			isNormalUser = true;
			extraGroups = [
				"wheel"
					"audio"
					"video"
					"dialout"
					"input"
					"adbusers"
					"wireshark"
					"lp"
					"scanner"
					"networkmanager"
			];
			initialPassword = "01011001";
			openssh.authorizedKeys.keys = [
				"AAAAC3NzaC1lZDI1NTE5AAAAICjmHMA0P7sAiw0WX0yld81fVpyHk7h9iixdtS4nzAgh"
			];
		};
		defaultUserShell = pkgs.zsh;
	};

	services.sshd.enable = true;

	programs.gnupg.agent = {
		enable = true;
		enableSSHSupport = true;
	};

	services.avahi = {
		enable = true;
		nssmdns4 = true;
		publish = {
			enable = true;
			addresses = true;
			domain = true;
			hinfo = true;
			userServices = true;
			workstation = true;
		};
	};
	programs.adb.enable = true;

	qt = {
		enable = true;
		platformTheme = "qt5ct";
		style = "adwaita-dark";
	};

	nixpkgs.config = {
		segger-jlink.acceptLicense = true;
		permittedInsecurePackages = [
			"segger-jlink-qt4-796s"
				"dotnet-runtime-6.0.36"
				"dotnet-sdk-wrapped-6.0.428"
				"dotnet-sdk-6.0.428"

		];
	};
	system.stateVersion = "23.11"; # Did you read the comment?
}
