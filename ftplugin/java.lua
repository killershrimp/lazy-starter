local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
local workspace_dir = os.getenv("HOME") .. "/.local/share/eclipse/" .. vim.fn.fnamemodify(root_dir, ":p:h:t")

local config = {
  cmd = {
    "java",
    "-Declipse.application=org.eclipse.jdt.ls.core.id1",
    "-Dosgi.bundles.defaultStartLevel=4",
    "-Declipse.product=org.eclipse.jdt.ls.core.product",
    "-Dlog.protocol=true",
    "-Dlog.level=ALL",
    "-Xmx1g",
    "--add-modules=ALL-SYSTEM",
    "--add-opens",
    "java.base/java.util=ALL-UNNAMED",
    "--add-opens",
    "java.base/java.lang=ALL-UNNAMED",
    "-jar",
    vim.fn.glob(vim.fn.expand("~/.jdtls/plugins/org.eclipse.equinox.launcher_*.jar")),
    "-configuration",
    vim.fn.expand("~/.jdtls/config_mac"),
    "-data",
    workspace_dir,
  },
  settings = {
    java = {},
  },

  -- Configure the data directory for the project.
  root_dir = vim.fs.root(0, { "gradlew", ".git" }),
  -- local project_name = root_dir and vim.fs.basename(root_dir)
  -- if project_name then
  --   vim.list_extend(cmd, {
  --     "-data",
  --     vim.fn.stdpath("data") .. "/workspace/" .. project_name,
  --   })
  -- end
}

require("jdtls").start_or_attach(config)
