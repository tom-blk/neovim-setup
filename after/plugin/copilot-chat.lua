local IS_DEV = false

--- Get all the changes in the git repository
---@param staged? boolean
---@return string
local function get_git_diff(staged)
  local cmd = staged and "git diff --staged" or "git diff"
  local handled = io.popen(cmd)
  if not handled then
    return ""
  end

  local result = handle:read("*a")
  handle:close()
  return result
end

local prompts = {
  -- Code-related prompts
  Explain = "Please explain how the following code works.",
  Review = "Please review the following code and provide suggestions for improvement.",
  Tests = "Please explain how the selected code works, then generate unit tests for it.",
  Refactor = "Please refactor the following code to improve its clarity and readability.",
  FixCode = "Please fix the following code to make it work as intended.",
  BetterNamings = "Please provide better names for the following variables and functions.",
  Documentation = "Please provide documentation for the following code.",
  SwaggerApiDocs = "Please provide documentation for the following API using Swagger.",
  SwaggerJsDocs = "Please write JSDoc for the following API using Swagger.",
  -- Text-related prompts
  Summarize = "Please summarize the following text.",
  Spelling = "Please correct any grammar and spelling errors in the following text.",
  Wording = "Please improve the grammar and wording of the following text.",
  Concise = "Please rewrite the following text to make it more concise.",
}

return {
  -- Import the copilot plugin
  { import = "lazyvim.plugins.extras.coding.copilot" },
  {
    dir = IS_DEV and "~/Projects/research/CopilotChat.nvim" or nil,
    "CopilotC-Nvim/CopilotChat.nvim",
    opts = {
      show_help = "yes",
      prompts = prompts,
      debug = true, -- Set to true to see the response from GitHub Copilot API. The log file will be in ~/.local/state/nvim/CopilotChat.nvim.log.
      disable_extra_info = "no", -- Disable extra information (e.g.: system prompt, token count) in the response.
    },
    build = function()
      vim.notify("Please update the remote plugins by running ':UpdateRemotePlugins', then restart Neovim.")
    end,
    event = "VeryLazy",
    keys = {
      -- Code-related commands
      { "<leader>cce", "<cmd>CopilotChatExplain<cr>", desc = "CopilotChat - Explain code" },
      { "<leader>cct", "<cmd>CopilotChatTests<cr>", desc = "CopilotChat - Generate tests" },
      { "<leader>ccr", "<cmd>CopilotChatReview<cr>", desc = "CopilotChat - Review code" },
      { "<leader>ccR", "<cmd>CopilotChatRefactor<cr>", desc = "CopilotChat - Refactor code" },
      { "<leader>ccf", "<cmd>CopilotChatFixCode<cr>", desc = "CopilotChat - Fix code" },
      { "<leader>ccb", "<cmd>CopilotChatBetterNamings<cr>", desc = "CopilotChat - Better Name" },
      { "<leader>ccd", "<cmd>CopilotChatDocumentation<cr>", desc = "CopilotChat - Add documentation for code" },
      { "<leader>cca", "<cmd>CopilotChatSwaggerApiDocs<cr>", desc = "CopilotChat - Add Swagger API documentation" },
      {
        "<leader>ccA",
        "<cmd>CopilotChatSwaggerJsDocs<cr>",
        desc = "CopilotChat - Add Swagger API with Js Documentation",
      },
      -- Text related commands
      { "<leader>ccs", "<cmd>CopilotChatSummarize<cr>", desc = "CopilotChat - Summarize text" },
      { "<leader>ccS", "<cmd>CopilotChatSpelling<cr>", desc = "CopilotChat - Correct spelling" },
      { "<leader>ccw", "<cmd>CopilotChatWording<cr>", desc = "CopilotChat - Improve wording" },
      { "<leader>ccc", "<cmd>CopilotChatConcise<cr>", desc = "CopilotChat - Make text concise" },
      -- Chat with Copilot in visual mode
      {
        "<leader>ccv",
        ":CopilotChatVisual",
        mode = "x",
        desc = "CopilotChat - Open in vertical split",
      },
      {
        "<leader>ccx",
        ":CopilotChatInPlace<cr>",
        mode = "x",
        desc = "CopilotChat - Run in-place code",
      },
      -- Custom input for CopilotChat
      {
        "<leader>cci",
        function()
          local input = vim.fn.input("Ask Copilot: ")
          if input ~= "" then
            vim.cmd("CopilotChat " .. input)
          end
        end,
        desc = "CopilotChat - Ask input",
      },
      -- Generate commit message based on the git diff
      {
        "<leader>ccm",
        function()
          local diff = get_git_diff()
          if diff ~= "" then
            vim.fn.setreg('"', diff)
            vim.cmd("CopilotChat Write commit message for the change with commitizen convention.")
          end
        end,
        desc = "CopilotChat - Generate commit message for all changes",
      },
      {
        "<leader>ccM",
        function()
          local diff = get_git_diff(true)
          if diff ~= "" then
            vim.fn.setreg('"', diff)
            vim.cmd("CopilotChat Write commit message for the change with commitizen convention.")
          end
        end,
        desc = "CopilotChat - Generate commit message for staged changes",
      },
      -- Quick chat with Copilot
      {
        "<leader>ccq",
        function()
          local input = vim.fn.input("Quick Chat: ")
          if input ~= "" then
            -- Copy all the lines to the unnamed register
            vim.cmd('normal! ggVG"*y')
            vim.cmd("CopilotChat " .. input)
          end
        end,
        desc = "CopilotChat - Quick chat",
      },
      -- Debug
      { "<leader>ccD", "<cmd>CopilotChatDebugInfo<cr>", desc = "CopilotChat - Debug Info" },
      -- Fix the issue with the diagnostic
      { "<leader>ccF", "<cmd>CopilotChatFixDiagnostic<cr>", desc = "CopilotChat - Fix Diagnostic" },
    },
  },
}
