{ nixpkgs-unstable }: {
  # Use unstable services
  services.displayManager = {
    ly = {
      enable = true;
      package = nixpkgs-unstable.ly;
    };
  };
}
