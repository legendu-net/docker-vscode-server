{pkgs, ...}: {
  channel = "stable-24.11";
  packages = with pkgs; [
    bash-completion
    gitui
    neovim
    ripgrep
    rm-improved
    bat
  ];
  env = {};
  idx = {
    # check extensions on https://open-vsx.org/
    extensions = [
      "asvetliakov.vscode-neovim"
    ];
    workspace = {
      #onCreate = {
      #}
      onStart = {
        icon = ''
        curl -sSL https://raw.githubusercontent.com/legendu-net/icon/main/install_icon.sh | bash -s -- \
            -d ~/.local/bin
        '';
      };
    };
    # Enable previews and customize configuration
    previews = {};
  };
}