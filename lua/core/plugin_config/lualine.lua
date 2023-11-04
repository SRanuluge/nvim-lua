-- in case it isn't installed

-- import lualine plugin safely
local setup, lualine = pcall(require, "lualine")
if not setup then
 print("Lualine not found!") -- print error if colorscheme not installed 
  return
end

lualine.setup {
  options = {
    icons_enabled = true,
    theme = 'rose-pine',
  },
  sections = {
    lualine_a = {
      {
        'filename',
        path = 1,
      }
    }
  }
}
