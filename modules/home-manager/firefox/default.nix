{ pkgs, inputs, ... }: {
  programs = {
    firefox = {
      enable = true;
      package = inputs.firefox.packages.${pkgs.system}.firefox-nightly-bin;
      profiles = {
        delta = {
          settings = {
            "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
            "browser.uidensity" = 1;
            "browser.compact.show" = true;
            "browser.compactmode.show" = true;
            "sidebar.animation.enabled" = false;
            "layers.offmainthreadcomposition.log-animations" = false;
            "layout.css.prefixes.animations" = false;
            "layout.css.animation-composition.enabled" = false;
            "sidebar.position_start" = false;
            "browser.suppress_first_window_animation" = false;
            "sidebar.verticalTabs" = true;
            # "sidebar.visibility" = "hide-sidebar";
          };
          userChrome = builtins.readFile ./nightly.css;
        };
      };
    };
  };
}
