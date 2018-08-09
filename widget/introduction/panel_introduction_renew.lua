local _panel = Panel_Introduction
local Introduction = {
  _ui = {
    txt_UserName = UI.getChildControl(_panel, "StaticText_UserName"),
    txt_InfoDesc = UI.getChildControl(_panel, "StaticText_UserInfoDec"),
    txt_Level = UI.getChildControl(_panel, "StaticText_LvnJob")
  }
}
function Introduction:init()
  self:registEventHandler()
end
function Introduction:open(actorKey)
  local playerActorProxyWrapper = getPlayerActor(actorKey)
  if nil == playerActorProxyWrapper then
    return
  end
  local nameString = playerActorProxyWrapper:getOriginalName()
  local name = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_INTRODUCTIONMYSELF_TITLE", "name", nameString)
  local desc = playerActorProxyWrapper:getUserIntroduction()
  if nil == desc or "" == desc then
    desc = nameString .. PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_RECRUITMENT_PLAYERINTRO_NODATA")
  end
  local charLevel = playerActorProxyWrapper:get():getLevel()
  local playerClass = playerActorProxyWrapper:getClassType()
  local classString = CppEnums.ClassType2String[playerClass]
  self._ui.txt_UserName:SetText(name)
  self._ui.txt_InfoDesc:SetText(desc)
  self._ui.txt_Level:SetText(PAGetStringParam2(Defines.StringSheet_GAME, "LUA_INTRODUCTIONMYSELF_SUBINFO", "class", classString, "level", charLevel))
  _panel:SetShow(true)
end
function Introduction:close()
  _panel:SetShow(false)
end
function Introduction:registEventHandler()
  registerEvent("FromClient_InterActionUserIntroduction", "FromClient_UserInfo_InterActionUserIntroduction")
end
function PaGlobalFunc_Introduction_Init()
  local self = Introduction
  if nil == self then
    _PA_ASSERT(false, "\237\140\168\235\132\144\236\157\180 \236\161\180\236\158\172\237\149\152\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : Introduction")
    return
  end
  self:init()
end
function FGlobal_Introcution_TooltipHide()
  local self = Introduction
  if nil == self then
    _PA_ASSERT(false, "\237\140\168\235\132\144\236\157\180 \236\161\180\236\158\172\237\149\152\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : Introduction")
    return
  end
  self:close()
end
function FromClient_UserInfo_InterActionUserIntroduction(actorKey)
  local self = Introduction
  if nil == self then
    _PA_ASSERT(false, "\237\140\168\235\132\144\236\157\180 \236\161\180\236\158\172\237\149\152\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : Introduction")
    return
  end
  self:open(actorKey)
end
registerEvent("FromClient_luaLoadComplete", "PaGlobalFunc_Introduction_Init")
