return {
  {
    "JavaHello/spring-boot.nvim",
    ft = { "java", "yaml", "jproperties" },
    dependencies = {
      "mfussenegger/nvim-jdtls", -- provided by LazyVim's lang.java extra
    },
    ---@type bootls.Config
    opts = {},
  },
  -- Register spring-boot.nvim's jdtls extension jars with LazyVim's nvim-jdtls setup.
  {
    "mfussenegger/nvim-jdtls",
    optional = true,
    opts = function(_, opts)
      local prev_jdtls = opts.jdtls
      opts.jdtls = function(config, ...)
        if type(prev_jdtls) == "function" then
          config = prev_jdtls(config, ...) or config
        elseif type(prev_jdtls) == "table" then
          config = vim.tbl_deep_extend("force", config, prev_jdtls)
        end
        config.init_options = config.init_options or {}
        config.init_options.bundles = config.init_options.bundles or {}
        vim.list_extend(config.init_options.bundles, require("spring_boot").java_extensions())
        return config
      end
    end,
  },
}
