{
  pkgs,
  config,
  ...
}: {
  programs = {
    chromium = {
      enable = true;
      commandLineArgs = ["--enable-features=TouchpadOverscrollHistoryNavigation"];
      extensions = [
        # {id = "";}  // extension id, query from chrome web store
      ];
    };

    # firefox = {
    #   enable = true;
    #   # profiles.mredrup = {};
    # };
    firefox = {
      enable = true;
     # profiles.mredrup = {
     #   id = 0;
     #   name = "mredrup";
     #   isDefault = true;
     # };
    };
  };
}
