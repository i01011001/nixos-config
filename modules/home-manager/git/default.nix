{ lib, ... }:
{
  programs.git = {
    enable = true;
    userName = "yugen";
    userEmail = "yugen.m7@gmail.com";
    attributes = [ ];
    extraConfig = {
      merge.tool = "nvimdiff";
      diff = {
        tool = "nvimdiff";
      };
      core = {
        editor = "nvim -f";
      };
      color = {
        ui = "auto";
      };
    };
    ignores = [
      "sdkconfig.old"
      "sdkconfig.ci"
      "sdkconfig.defaults"
      "*.bin"
      "*.elf"
      "*.map"
      "*.hex"
      "*.s"
      "*.lst"
      "*.o"
      "*.a"
      "*.ld"
      "*.log"

      # Build directories
      "/build/"
      "*.d"

      # Container specific files
      ".devcontainer/"

      # VSCode specific files
      ".vscode/"
      ".vscode/settings.json"
      ".vscode/c_cpp_properties.json"
      ".vscode/launch.json"
      ".vscode/tasks.json"

      # Python virtual environments
      ".venv/"
      "venv/"
      "env/"
      "ENV/"
      "__pycache__/"
      "*.py[cod]"

      # OS generated files
      ".DS_Store"
      "Thumbs.db"
      "desktop.ini"

      # Debugger files
      "*.svd"

      # ccache files
      ".ccache"

      #cache files
      ".cache"

      # Dependency directories
      "node_modules/"
    ];
  };
}
