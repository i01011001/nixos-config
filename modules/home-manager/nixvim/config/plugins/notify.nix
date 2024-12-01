{
  programs.nixvim.plugins.notify = {
    enable = true;
    backgroundColour = "#000000";
    fps = 90;
    icons = {
      debug = "";
      error = "";
      info = "";
      trace = "";
      warn = "";
    };
    render = "minimal";
    stages = "static";
    topDown = false;
  };
}
