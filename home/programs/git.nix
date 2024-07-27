{
    pkgs,
    ...
}: {
    home.packages = [pkgs.gh];

    programs.git = {
        enable = true;

        userName = "Matthew-Redrup";
        userEmail = "matthew.redrup@gmail.com";
    };
}