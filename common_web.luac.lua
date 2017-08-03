-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\common\common_web.luac 

-- params : ...
-- function num : 0
FromWeb_WebPageError = function(url, statusCode)
  -- function num : 0_0
  if statusCode ~= 200 then
    _PA_LOG("LUA", "url : " .. tostring(url))
  end
end

registerEvent("FromWeb_WebPageError", "FromWeb_WebPageError")

