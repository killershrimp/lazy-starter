return {
  "dense-analysis/ale",
  config = function()
    local max_line_length = "90"
    -- Configuration goes here.
    local g = vim.g

    g.ale_linters = {
      c = { "clangd" },
      cpp = { "clangd" },
      css = { "prettier" },
      html = { "prettier" },
      -- java = { "checkstyle", "eclipselsp" },
      javascript = { "prettier" },
      lua = { "lua_language_server" },
      python = { "flake8" },
    }
    g.ale_fixers = {
      c = { "clang-format", "clangtidy" },
      cpp = { "clang-format", "clangtidy" },
      css = { "prettier" },
      html = { "prettier" },
      java = { "google_java_format" },
      javascript = { "prettier" },
      python = { "black", "isort", "yapf" },
    }

    g.ale_c_clangformat_style_options = "--style=Google"
    g.ale_cpp_clangformat_style_options = "--style=Google"

    g.ale_fix_on_save = 1
    g.ale_completion_enabled = 1

    g.ale_java_eclipselsp_path = "/Users/ayun/.config/eclipse.jdt.ls"
    g.ale_java_eclipselsp_executable = "/Users/ayun/.jenv/shims/java"

    local uv = vim.loop

    local function file_exists(path)
      local stat = uv.fs_stat(path)
      return stat and stat.type == "file"
    end

    local function read_file_lines(path)
      local fd = uv.fs_open(path, "r", 438)
      if not fd then
        return nil
      end
      local stat = uv.fs_fstat(fd)
      if not stat then
        uv.fs_close(fd)
        return nil
      end
      local data = uv.fs_read(fd, stat.size, 0)
      uv.fs_close(fd)
      if not data then
        return nil
      end
      local lines = {}
      for line in data:gmatch("[^\r\n]+") do
        table.insert(lines, line)
      end
      return lines
    end

    local function find_file_upwards(filename, start_dir)
      local dir = start_dir or uv.cwd()
      while dir do
        local candidate = dir .. "/" .. filename
        if file_exists(candidate) then
          return candidate
        end
        local parent_dir = dir:match("(.*)/")
        if parent_dir == dir then
          break
        end
        dir = parent_dir
      end
      return nil
    end

    local function black_config_exists()
      local pyproject_path = find_file_upwards("pyproject.toml")
      if not pyproject_path then
        return false
      end
      local lines = read_file_lines(pyproject_path)
      if not lines then
        return false
      end
      for _, line in ipairs(lines) do
        if line:match("%[tool%.black%]") then
          return true
        end
      end
      return false
    end

    local function setup_ale_black()
      if not black_config_exists() then
        vim.g.ale_python_black_options = "--line-length " .. max_line_length
      else
        vim.g.ale_python_black_options = ""
      end
    end

    -- Run once now (in case cwd is already correct)
    setup_ale_black()

    -- Also run on BufEnter for Python files, to catch project changes or opening files in different projects
    vim.api.nvim_create_autocmd("BufEnter", {
      pattern = "*.py",
      callback = function()
        setup_ale_black()
      end,
    })

    vim.keymap.set("n", "<leader>af", function()
      vim.g.ale_fix_on_save = not vim.g.ale_fix_on_save
      print("ALE auto-fix: " .. (vim.g.ale_fix_on_save and "ON" or "OFF"))
    end, { noremap = true, silent = true, desc = "Toggle ALE fix on save" })
  end,
}
