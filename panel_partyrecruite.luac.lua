-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\party\panel_partyrecruite.luac 

-- params : ...
-- function num : 0
Panel_PartyRecruite:SetShow(false, false)
Panel_PartyRecruite:setGlassBackground(true)
Panel_PartyRecruite:SetDragAll(true)
Panel_PartyRecruite:RegisterShowEventFunc(true, "Panel_PartyRecruite_ShowAni()")
Panel_PartyRecruite:RegisterShowEventFunc(false, "Panel_PartyRecruite_HideAni()")
local UI_TM = CppEnums.TextMode
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
local UI_PSFT = CppEnums.PAUI_SHOW_FADE_TYPE
local UI_color = Defines.Color
Panel_PartyRecruite_ShowAni = function()
  -- function num : 0_0 , upvalues : UI_ANI_ADV
  (UIAni.fadeInSCR_Down)(Panel_PartyRecruite)
  local aniInfo1 = Panel_PartyRecruite:addScaleAnimation(0, 0.08, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo1:SetStartScale(0.5)
  aniInfo1:SetEndScale(1.1)
  aniInfo1.AxisX = Panel_PartyRecruite:GetSizeX() / 2
  aniInfo1.AxisY = Panel_PartyRecruite:GetSizeY() / 2
  aniInfo1.ScaleType = 2
  aniInfo1.IsChangeChild = true
  local aniInfo2 = Panel_PartyRecruite:addScaleAnimation(0.08, 0.15, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo2:SetStartScale(1.1)
  aniInfo2:SetEndScale(1)
  aniInfo2.AxisX = Panel_PartyRecruite:GetSizeX() / 2
  aniInfo2.AxisY = Panel_PartyRecruite:GetSizeY() / 2
  aniInfo2.ScaleType = 2
  aniInfo2.IsChangeChild = true
end

Panel_PartyRecruite_HideAni = function()
  -- function num : 0_1 , upvalues : UI_PSFT, UI_ANI_ADV, UI_color
  Panel_PartyRecruite:SetShowWithFade(UI_PSFT.PAUI_ANI_TYPE_FADE_OUT)
  local aniInfo1 = Panel_PartyRecruite:addColorAnimation(0, 0.25, UI_ANI_ADV.PAUI_ANIM_ADVANCE_SIN_HALF_PI)
  aniInfo1:SetStartColor(UI_color.C_FFFFFFFF)
  aniInfo1:SetEndColor(UI_color.C_00FFFFFF)
  aniInfo1:SetStartIntensity(3)
  aniInfo1:SetEndIntensity(1)
  aniInfo1.IsChangeChild = true
  aniInfo1:SetHideAtEnd(true)
  aniInfo1:SetDisableWhileAni(true)
end

local partyListRecruite = {
control = {_btnClose = (UI.getChildControl)(Panel_PartyRecruite, "Button_Close"), _editText = (UI.getChildControl)(Panel_PartyRecruite, "MultilineEdit_Recruite"), _levelText = (UI.getChildControl)(Panel_PartyRecruite, "StaticText_LimitLevel"), _btnLvChange = (UI.getChildControl)(Panel_PartyRecruite, "Button_LevelChange"), _btnAdmin = (UI.getChildControl)(Panel_PartyRecruite, "Button_Admin")}
, _selectLevel = 0, _maxLevel = toInt64(0, 60)}
partyListRecruite.Show = function(self)
  -- function num : 0_2
  Panel_PartyRecruite:SetShow(true, true)
  self:Init()
end

partyListRecruite.Hide = function(self)
  -- function num : 0_3
  Panel_PartyRecruite:SetShow(false, false)
  ClearFocusEdit()
  FGlobal_PartyListClearFocusEdit()
end

FGlobal_PartyListRecruite_Show = function()
  -- function num : 0_4 , upvalues : partyListRecruite
  partyListRecruite:Show()
end

PartyListRecruite_Close = function()
  -- function num : 0_5 , upvalues : partyListRecruite
  partyListRecruite:Hide()
end

PartyListRecruite_TextSet = function()
  -- function num : 0_6 , upvalues : partyListRecruite
  local self = partyListRecruite
  local msg = ((self.control)._editText):GetEditText()
  local baseText = PAGetString(Defines.StringSheet_GAME, "LUA_PARTYLISTRECRUITE_DEFALUTTEXT")
  if baseText == msg then
    ((self.control)._editText):SetEditText("")
  end
  ;
  (UI.Set_ProcessorInputMode)((CppEnums.EProcessorInputMode).eProcessorInputMode_ChattingInputMode)
  SetFocusEdit((self.control)._editText)
  ;
  ((self.control)._editText):SetEditText(((self.control)._editText):GetEditText(), true)
end

PartyListRecruite_LevelChange = function()
  -- function num : 0_7 , upvalues : partyListRecruite
  local self = partyListRecruite
  local setLevel = function(inputNum)
    -- function num : 0_7_0 , upvalues : self
    ((self.control)._levelText):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_PARTYLISTRECRUITE_MINLEVEL", "level", tostring(inputNum)))
    -- DECOMPILER ERROR at PC18: Confused about usage of register: R1 in 'UnsetPending'

    self._selectLevel = Int64toInt32(inputNum)
  end

  Panel_NumberPad_Show(true, self._maxLevel, 0, setLevel)
end

PartyListRecruite_Request = function()
  -- function num : 0_8 , upvalues : partyListRecruite
  Panel_NumberPad_Close()
  local self = partyListRecruite
  local msg = ((self.control)._editText):GetEditText()
  local baseText = PAGetString(Defines.StringSheet_GAME, "LUA_PARTYLISTRECRUITE_DEFALUTTEXT")
  if msg == "" or baseText == msg then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_PARTYLISTRECRUITE_REGISTALERT"))
    return 
  end
  ToClient_RequestPartyRecruitment(msg, self._selectLevel, 5)
  partyListRecruite:Hide()
end

FGlobal_CheckPartyListRecruiteUiEdit = function(targetUI)
  -- function num : 0_9 , upvalues : partyListRecruite
  do return targetUI ~= nil and targetUI:GetKey() == ((partyListRecruite.control)._editText):GetKey() end
  -- DECOMPILER ERROR: 1 unprocessed JMP targets
end

partyListRecruite.Init = function(self)
  -- function num : 0_10
  ((self.control)._editText):SetMaxEditLine(2)
  ;
  ((self.control)._editText):SetMaxInput(30)
  ;
  ((self.control)._editText):SetEditText(PAGetString(Defines.StringSheet_GAME, "LUA_PARTYLISTRECRUITE_DEFALUTTEXT"))
  ;
  ((self.control)._editText):addInputEvent("Mouse_LUp", "PartyListRecruite_TextSet()")
  local selfPlayer = getSelfPlayer()
  if selfPlayer == nil then
    return 
  end
  local minLevel = (math.min)(60, (selfPlayer:get()):getLevel())
  self._selectLevel = minLevel
  ;
  ((self.control)._levelText):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_PARTYLISTRECRUITE_MINLEVEL", "level", minLevel))
  ;
  ((self.control)._btnLvChange):addInputEvent("Mouse_LUp", "PartyListRecruite_LevelChange()")
  ;
  ((self.control)._btnAdmin):addInputEvent("Mouse_LUp", "PartyListRecruite_Request()")
  ;
  ((self.control)._btnClose):addInputEvent("Mouse_LUp", "PartyListRecruite_Close()")
  Panel_PartyRecruite:SetPosX(getScreenSizeX() / 2 - Panel_PartyList:GetSizeX() / 2 - Panel_PartyRecruite:GetSizeX() / 2)
  Panel_PartyRecruite:SetPosY(getScreenSizeY() / 2 - Panel_PartyList:GetSizeY() / 2 - 100)
end

partyListRecruite:Init()

