{
  plugins.codecompanion = {
    enable = true;

    settings = {
      adapters = {
        ollama.__raw = ''
          function()
            return require("codecompanion.adapters").extend("ollama", {
              env = {
                url = "http://127.0.0.1:11434",
              },
              schema = {
                model = {
                  default = "qwen:32b",
                },
                num_ctx = {
                  default = 32768,
                },
              },
            })
          end
        '';
      };
      strategies = {
        chat.adapter = "ollama";
        inline.adapter = "ollama";
        agent.adapter = "ollama";
      };
      opts = {
        log_level = "TRACE";
        send_code = true;
        use_default_actions = true;
        use_default_prompts = true;
      };
    };
  };
}
