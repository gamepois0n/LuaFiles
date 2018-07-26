local _panel = Panel_Window_Guild_SkillInfo
_panel:ignorePadSnapMoveToOtherPanel()
local UI_TM = CppEnums.TextMode
local GuildSkillInfo = {
  _ui = {
    stc_CenterBg = UI.getChildControl(_panel, "Static_CenterBg"),
    stc_BottomBg = UI.getChildControl(_panel, "Static_BottomBg")
  },
  _currentSkillNo = nil,
  _originalPanelSizeX = 500,
  _originalPanelSizeY = 548,
  _originalCenterSizeX = 490,
  _originalCenterSizeY = 384
}
function GuildSkillInfo:init()
  self._ui.txt_SkillName = UI.getChildControl(self._ui.stc_CenterBg, "StaticText_SkillName")
  self._ui.txt_Condition = UI.getChildControl(self._ui.stc_CenterBg, "StaticText_Condition")
  self._ui.txt_NeedPoint = UI.getChildControl(self._ui.stc_CenterBg, "StaticText_NeedPoint")
  self._ui.txt_NeedItem = UI.getChildControl(self._ui.stc_CenterBg, "StaticText_NeedItem")
  self._ui.txt_CoolTime = UI.getChildControl(self._ui.stc_CenterBg, "StaticText_CoolTime")
  self._ui.txt_Effect = UI.getChildControl(self._ui.stc_CenterBg, "StaticText_Effect")
  PaGlobal_registerPanelOnBlackBackground(_panel)
end
function GuildSkillInfo:open()
  self:update()
  _panel:SetShow(true)
end
function GuildSkillInfo:close()
  _panel:SetShow(false)
end
function GuildSkillInfo:update()
  local skillTypeSS = getSkillTypeStaticStatus(self._currentSkillNo)
  local skillStatic = getSkillStaticStatus(self._currentSkillNo, 1)
  if nil == skillStatic then
    return
  end
  local skillTypeSSW = skillStatic:getSkillTypeStaticStatusWrapper()
  if nil == skillTypeSSW then
    return
  end
  self._ui.txt_SkillName:SetText(skillTypeSS:getName())
  self._ui.txt_Condition:SetTextMode(UI_TM.eTextMode_AutoWrap)
  self._ui.txt_Condition:SetAutoResize(true)
  self._ui.txt_Condition:SetText(skillTypeSSW:getDescription())
  local pointStr = PAGetString(Defines.StringSheet_RESOURCE, "TOOLTIP_SKILLLEARN_TXT_NEEDSP")
  self._ui.txt_NeedPoint:SetText(pointStr .. " : " .. tostring(skillStatic:get()._needSkillPointForLearning))
  local isShowNeedItem = nil ~= skillStatic:getItemInfo() and nil ~= skillStatic:getItemInfo():get()
  local needText = PAGetString(Defines.StringSheet_RESOURCE, "TOOLTIP_SKILLLEARN_TXT_NEEDITEM")
  if false == isShowNeedItem then
    self._ui.txt_NeedItem:SetText(needText .. " : " .. PAGetString(Defines.StringSheet_GAME, "Lua_TooltipSkill_NoItemConsumed"))
  else
    local useNeedItemName = skillStatic:getItemInfo():getName()
    local s64_useNeedItemCount = skillStatic:get()._needItemCount_s64
    self._ui.txt_NeedItem:SetText(needText .. " : " .. PAGetStringParam2(Defines.StringSheet_GAME, "Lua_TooltipSkill_UseNeedItem", "useNeedItemName", useNeedItemName, "useNeedItemCount", tostring(Int64toInt32(s64_useNeedItemCount))))
  end
  local coolTime = skillStatic:get()._reuseCycle / 1000
  local needText = PAGetString(Defines.StringSheet_RESOURCE, "TOOLTIP_SKILL_TXT_REUSECYCLE")
  self._ui.txt_CoolTime:SetText(needText .. " " .. convertStringFromDatetimeForSkillTooltip(coolTime))
  self._ui.txt_Effect:SetTextMode(UI_TM.eTextMode_AutoWrap)
  self._ui.txt_Effect:SetAutoResize(true)
  self._ui.txt_Effect:SetText(skillStatic:getDescription())
  local panelSizeY = self._originalPanelSizeY
  local centerSizeY = self._originalCenterSizeY
  if 120 < self._ui.txt_Effect:GetSizeY() then
    local modifiedY = self._ui.txt_Effect:GetSizeY() - 120
    panelSizeY = panelSizeY + modifiedY
    centerSizeY = centerSizeY + modifiedY
  end
  _panel:SetSize(self._originalPanelSizeX, panelSizeY)
  _panel:ComputePos()
  self._ui.stc_CenterBg:SetSize(self._originalCenterSizeX, centerSizeY)
  self._ui.stc_BottomBg:ComputePos()
end
function PaGlobalFunc_GuildSkillInfo_Init()
  local self = GuildSkillInfo
  if nil == self then
    _PA_ASSERT(false, "\237\140\168\235\132\144\236\157\180 \236\161\180\236\158\172\237\149\152\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : GuildSkillInfo")
    return
  end
  self:init()
end
function PaGlobalFunc_GuildSkillInfo_Open(skillNo)
  local self = GuildSkillInfo
  if nil == self then
    _PA_ASSERT(false, "\237\140\168\235\132\144\236\157\180 \236\161\180\236\158\172\237\149\152\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : GuildSkillInfo")
    return
  end
  if nil == skillNo then
    return
  end
  self._currentSkillNo = skillNo
  self:open()
end
function PaGlobalFunc_GuildSkillInfo_Close()
  local self = GuildSkillInfo
  if nil == self then
    _PA_ASSERT(false, "\237\140\168\235\132\144\236\157\180 \236\161\180\236\158\172\237\149\152\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : GuildSkillInfo")
    return
  end
  self:close()
end
registerEvent("FromClient_luaLoadComplete", "PaGlobalFunc_GuildSkillInfo_Init")
