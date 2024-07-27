# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ 
    pkgs,
    lib,
    ...
    }: let
    username = "mredrup";
    in {

        users.users.mredrup = {
        isNormalUser = true;
        description = "Matthew Redrup";
        extraGroups = [ "networkmanager" "wheel" ];
        };
        nix.settings.trusted-users = [username];

        nix.settings = {
            experimental-features = ["nix-command" "flakes"];
        };
        nix.gc = {
            automatic = lib.mkDefault true;
            dates = lib.mkDefault "weekly";
            options = lib.mkDefault "--delete-older-than 7d";
        };
        # Allow unfree packages
        nixpkgs.config.allowUnfree = true;

        # Enable networking
        networking.networkmanager.enable = true;

        # Set your time zone.
        time.timeZone = "Australia/Melbourne";

        # Select internationalisation properties.
        i18n.defaultLocale = "en_US.UTF-8";

        i18n.extraLocaleSettings = {
            LC_ADDRESS = "en_AU.UTF-8";
            LC_IDENTIFICATION = "en_AU.UTF-8";
            LC_MEASUREMENT = "en_AU.UTF-8";
            LC_MONETARY = "en_AU.UTF-8";
            LC_NAME = "en_AU.UTF-8";
            LC_NUMERIC = "en_AU.UTF-8";
            LC_PAPER = "en_AU.UTF-8";
            LC_TELEPHONE = "en_AU.UTF-8";
            LC_TIME = "en_AU.UTF-8";
        };

        fonts = {
            packages = with pkgs; [
            # icon fonts
            material-design-icons

            # normal fonts
            noto-fonts
            noto-fonts-cjk
            noto-fonts-emoji

            # nerdfonts
            (nerdfonts.override {fonts = ["FiraCode" "JetBrainsMono"];})
            ];

            # use fonts specified by user rather than default ones
            enableDefaultPackages = false;

            # user defined fonts
            # the reason there's Noto Color Emoji everywhere is to override DejaVu's
            # B&W emojis that would sometimes show instead of some Color emojis
            fontconfig.defaultFonts = {
            serif = ["Noto Serif" "Noto Color Emoji"];
            sansSerif = ["Noto Sans" "Noto Color Emoji"];
            monospace = ["JetBrainsMono Nerd Font" "Noto Color Emoji"];
            emoji = ["Noto Color Emoji"];
            };
        };
        environment.systemPackages = with pkgs; [
            git
            vim
            wget
            curl
            sysstat
            scrot
            neofetch
            xfce.thunar
            nnn
        ];

        # Enable CUPS to print documents.
        services.printing.enable = true;

        # Enable bluetooth
        hardware.bluetooth.enable = true;

        # Enable sound with pipewire.
        hardware.pulseaudio.enable = false;
        security.rtkit.enable = true;
        services.pipewire = {
            enable = true;
            alsa.enable = true;
            alsa.support32Bit = true;
            pulse.enable = true;
            # If you want to use JACK applications, uncomment this
            #jack.enable = true;

            # use the example session manager (no others are packaged yet so this is enabled by default,
            # no need to redefine it in your config for now)
            #media-session.enable = true;
        };
    }
