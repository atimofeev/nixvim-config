_: {

  plugins.otter.enable = true;
  autoCmd = [
    {
      event = [ "BufEnter" ];
      pattern = [ "*.nix" ];
      command = ''lua require("otter").activate({"python", "lua", "bash"}, true, true, nil)'';
    }
  ];

}
