{ pkgs, config, ... }: {
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
            set -gx EDITOR nvim
            source ($HOME/.nix-profile/bin/starship init fish --print-full-init | psub)
            zoxide init --cmd cd fish | source
      	direnv hook fish | source
      	# fix direnv with tmux session switch
      	alias tmux "direnv exec / tmux"
    '';
  };
  # start fish whenb interaktive shell 
  programs.bash = {
    interactiveShellInit = ''
      if [[ $(${pkgs.procps}/bin/ps --no-header --pid=$PPID --format=comm) != "fish" && -z ''${BASH_EXECUTION_STRING} ]]
      then
        shopt -q login_shell && LOGIN_OPTION='--login' || LOGIN_OPTION=""
        exec ${pkgs.fish}/bin/fish $LOGIN_OPTION
      fi
    '';
  };
}

