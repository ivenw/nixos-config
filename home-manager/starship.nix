{...}: {
  programs.starship = {
    enable = true;
    settings = {
      aws.disabled = true;
      package.disabled = true;
    };
  };
}
