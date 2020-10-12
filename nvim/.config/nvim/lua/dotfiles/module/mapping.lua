local _0_0 = nil
do
  local name_0_ = "dotfiles.module.mapping"
  local loaded_0_ = package.loaded[name_0_]
  local module_0_ = nil
  if ("table" == type(loaded_0_)) then
    module_0_ = loaded_0_
  else
    module_0_ = {}
  end
  module_0_["aniseed/module"] = name_0_
  module_0_["aniseed/locals"] = (module_0_["aniseed/locals"] or {})
  module_0_["aniseed/local-fns"] = (module_0_["aniseed/local-fns"] or {})
  package.loaded[name_0_] = module_0_
  _0_0 = module_0_
end
local function _1_(...)
  _0_0["aniseed/local-fns"] = {require = {core = "aniseed.core", nu = "aniseed.nvim.util", nvim = "aniseed.nvim"}}
  return {require("aniseed.core"), require("aniseed.nvim.util"), require("aniseed.nvim")}
end
local _2_ = _1_(...)
local core = _2_[1]
local nu = _2_[2]
local nvim = _2_[3]
do local _ = ({nil, _0_0, {{}, nil}})[2] end
local map = nil
do
  local v_0_ = nil
  local function map0(mode, from, to)
    return nvim.set_keymap(mode, from, to, {})
  end
  v_0_ = map0
  _0_0["aniseed/locals"]["map"] = v_0_
  map = v_0_
end
local smap = nil
do
  local v_0_ = nil
  local function smap0(mode, from, to)
    return nvim.set_keymap(mode, from, to, {silent = true})
  end
  v_0_ = smap0
  _0_0["aniseed/locals"]["smap"] = v_0_
  smap = v_0_
end
local noremap = nil
do
  local v_0_ = nil
  local function noremap0(mode, from, to)
    return nvim.set_keymap(mode, from, to, {noremap = true})
  end
  v_0_ = noremap0
  _0_0["aniseed/locals"]["noremap"] = v_0_
  noremap = v_0_
end
nvim.g.mapleader = " "
nvim.g.maplocalleader = ","
map("c", "<C-v>", "<C-r>+")
map("n", "<F8>", "<Plug>(ale_fix)")
map("n", "<leader>rv", ":source ~/.config/nvim/init.vim<CR>")
smap("n", "<leader>f", ":Clap files<CR>")
smap("n", "<leader>h", ":Clap history<CR>")
smap("n", "<leader>e", ":Clap filer<CR>")
smap("n", "<leader>b", ":Clap marks<CR>")
map("n", "<ScrollWheelUp>", "<C-Y>")
map("n", "<ScrollWheelDown>", "<C-E>")
smap("n", "<ScrollWheelUp>", ":call smoothie#upwards()<CR>")
smap("n", "<ScrollWheelDown>", ":call smoothie#downwards()<CR>")
smap("n", "<leader>v", ":LuaTreeToggle<CR>")
smap("n", "<leader>n", ":LuaTreeFindFile<CR>")
smap("n", "<leader>r", ":LuaTreeRefresh<CR>")
smap("n", "<leader>", ":<c-u>WhichKey '<Space>'<CR>")
smap("n", "<localleader>", ":<c-u>WhichKey ','<CR>")
smap("n", "<C-h>", ":w | e | TSBufEnable highlight<CR>")
smap("n", "<leader>c", ":ColorizerToggle<CR>")
noremap("n", "<M-CR>", ":lua vim.lsp.buf.code_action()<CR>")
smap("n", "K", ":lua vim.lsp.buf.hover()<CR>")
noremap("v", "<M-CR>", "<Esc><Cmd>lua require('jdtls').code_action(true)<CR>")
noremap("n", "<M-r>", ":lua require('jdtls').code_action(false, 'refactor')<CR>")
noremap("n", "<M-o>", ":lua require('jdtls').organize_imports()<CR>")
noremap("n", "crv", ":lua require('jdtls').extract_variable()<CR>")
noremap("v", "crv", "<Esc><Cmd>lua require('jdtls').extract_variable(true)<CR>")
noremap("v", "crm", "<Esc><Cmd>lua require('jdtls').extract_method(true)<CR>")
noremap("n", "<leader>dc", ":lua require'jdtls'.test_class()<CR>")
return noremap("n", "<leader>dm", ":lua require'jdtls'.test_nearest_method()<CR>")