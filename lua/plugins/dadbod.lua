return {
  "kristijanhusak/vim-dadbod-ui",
  dependencies = {
    "tpope/vim-dadbod",
    "kristijanhusak/vim-dadbod-completion",
  },
  lazy = true,
  cmd = { "DBUI" },
  ft = { "sql" },

  init = function()
    -- 'Describe' helper to show table's information
    vim.g.db_ui_table_helpers = {
      postgresql = {
        Describe = [[\d+ "{schema}"."{table}"]],
      },
    }
    vim.g.db_ui_auto_execute_table_helpers = 1

    -- DB variables
    local local_pg_tr = "postgres://postgres:postgres@localhost/transactions"
    local okup_dev_pg = "postgres://postgres:postgres@worker4-k8s.alseco.kz:31821/okup_base"
    local okup_tst_pg = "postgres://postgres:postgres@worker4-k8s.alseco.kz:31822/okup_base_tst"
    local okup_dev_redis = "redis://worker4-k8s.alseco.kz:31830"
    local okup_tst_redis = "redis://worker4-k8s.alseco.kz:31831"

    vim.g.db = okup_dev_pg --default connection
    vim.g.dev = okup_dev_pg
    vim.g.tst = okup_tst_pg
    vim.g.redis_dev = okup_dev_redis
    vim.g.redis_tst = okup_tst_redis
    vim.g.tr = local_pg_tr

    -- global DBUI connections
    vim.g.dbs = {
      dev = okup_dev_pg,
      tst = okup_tst_pg,
      dev_r = okup_dev_redis,
      tst_r = okup_tst_redis,
      local_tr = local_pg_tr,
    }
  end,
}
