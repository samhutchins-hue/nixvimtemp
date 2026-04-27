{ pkgs, ... }:
{
  extraPackages = with pkgs; [ shfmt ];
  plugins.conform-nvim = {
    enable = true;

    # This part is fine, no changes needed here.
    lazyLoad.settings = {
      cmd = [
        "ConformInfo"
      ];
      event = [ "BufWrite" ];
    };

    settings = {
      format_on_save = {
        lspFallback = false;
        timeoutMs = 500;
      };
      notify_on_error = true;

      # CHANGE 1: Add this line to replicate the old fallback behavior.
      stop_after_first = true;

      formatters_by_ft = {
        liquidsoap = [ "liquidsoap-prettier" ];

        # CHANGE 2: Flattened the lists below by removing the inner [ ]
        html = [
          "prettierd"
          "prettier"
        ];
        css = [
          "prettierd"
          "prettier"
        ];
        javascript = [
          "prettierd"
          "prettier"
        ];
        javascriptreact = [
          "prettierd"
          "prettier"
        ];
        typescript = [
          "prettierd"
          "prettier"
        ];
        typescriptreact = [
          "prettierd"
          "prettier"
        ];
        python = [ "black" ];
        lua = [ "stylua" ];
        nix = [ "nixfmt" ];
        markdown = [
          "prettierd"
          "prettier"
        ];

        # Note: The 'yaml' list will run ALL formatters.
        # If you only want the first one, add `stop_after_first = true`
        # inside its definition or just list one.
        yaml = [
          "yamllint"
          "yamlfmt"
        ];

        terragrunt = [ "hcl" ]; # This assumes you have a formatter named 'hcl'
        bash = [ "shfmt" ];
        sh = [ "shfmt" ];
      };
    };
  };
}
