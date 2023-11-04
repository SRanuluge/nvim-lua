-- set colorscheme to nightfly with protected call
-- in case it isn't installed

-- import nvim-tree plugin safely
local setup, schema = pcall(require, "rose-pine")
if not setup then
 print("Colorscheme not found!") -- print error if colorscheme not installed 
  return
end

 vim.o.termguicolors = true
 schema.setup({
    disable_background = true,
 })

 vim.cmd('colorscheme rose-pine')

