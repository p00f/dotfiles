local _2afile_2a = "/home/p00f/.config/nvim/fnl/todo.fnl"
local _0_0
do
  local name_0_ = "ale"
  local module_0_
  do
    local x_0_ = package.loaded[name_0_]
    if ("table" == type(x_0_)) then
      module_0_ = x_0_
    else
      module_0_ = {}
    end
  end
  module_0_["aniseed/module"] = name_0_
  module_0_["aniseed/locals"] = ((module_0_)["aniseed/locals"] or {})
  module_0_["aniseed/local-fns"] = ((module_0_)["aniseed/local-fns"] or {})
  package.loaded[name_0_] = module_0_
  _0_0 = module_0_
end
local autoload = (require("aniseed.autoload")).autoload
local function _1_(...)
  local ok_3f_0_, val_0_ = nil, nil
  local function _1_()
    return {require("nvim-nonicons"), require("aniseed.nvim"), require("todo-comments")}
  end
  ok_3f_0_, val_0_ = pcall(_1_)
  if ok_3f_0_ then
    _0_0["aniseed/local-fns"] = {require = {icons = "nvim-nonicons", nvim = "aniseed.nvim", tdcmt = "todo-comments"}}
    return val_0_
  else
    return print(val_0_)
  end
end
local _local_0_ = _1_(...)
local icons = _local_0_[1]
local nvim = _local_0_[2]
local tdcmt = _local_0_[3]
local _2amodule_2a = _0_0
local _2amodule_name_2a = "ale"
do local _ = ({nil, _0_0, nil, {{}, nil, nil, nil}})[2] end
return tdcmt.setup({keywords = {FIX = {icon = icons.get("bug")}, HACK = {icon = icons.get("flame")}, NOTE = {icon = icons.get("note")}, PERF = {icon = icons.get("clock")}, TODO = {icon = icons.get("checklist")}, WARN = {icon = icons.get("alert")}}})