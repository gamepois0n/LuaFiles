-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\mercenary\panel_mercenary.luac 

-- params : ...
-- function num : 0
Panel_Window_Mercenary:SetShow(false)
local mercenary = {
_control = {_btnClose = (UI.getChildControl)(Panel_Window_Mercenary, "Button_Close"), _topGuideText = (UI.getChildControl)(Panel_Window_Mercenary, "StaticText_TopGuide"), _btnCancel = (UI.getChildControl)(Panel_Window_Mercenary, "Button_Cancel"), _btnGuideIcon = (UI.getChildControl)(Panel_Window_Mercenary, "Static_GuideIcon"), 
_territoryBg = {}
, 
_territoryControl = {}
}
, _isAttack = true, _territoryCount = 0, _maxTerritoryCount = 3}
mercenary.Init = function(self)
  -- function num : 0_0
  local isCalpheonOpen = ToClient_IsContentsGroupOpen("2")
  local isMediaOpen = ToClient_IsContentsGroupOpen("3")
  local isValenciaOpen = ToClient_IsContentsGroupOpen("4")
  if isCalpheonOpen then
    self._territoryCount = self._territoryCount + 1
  end
  if isMediaOpen then
    self._territoryCount = self._territoryCount + 1
  end
  if isValenciaOpen then
    self._territoryCount = self._territoryCount + 1
  end
  -- DECOMPILER ERROR at PC31: Confused about usage of register: R4 in 'UnsetPending'

  ;
  ((self._control)._territoryBg)[0] = (UI.getChildControl)(Panel_Window_Mercenary, "Static_CapheonBg")
  -- DECOMPILER ERROR at PC39: Confused about usage of register: R4 in 'UnsetPending'

  ;
  ((self._control)._territoryBg)[1] = (UI.getChildControl)(Panel_Window_Mercenary, "Static_MediaBg")
  -- DECOMPILER ERROR at PC47: Confused about usage of register: R4 in 'UnsetPending'

  ;
  ((self._control)._territoryBg)[2] = (UI.getChildControl)(Panel_Window_Mercenary, "Static_ValenciaBg")
  for index = 0, self._maxTerritoryCount - 1 do
    local temp = {}
    local parent = ((self._control)._territoryBg)[index]
    temp._btnAttack = (UI.getChildControl)(parent, "Button_Attack")
    temp._btnDeffence = (UI.getChildControl)(parent, "Button_Deffence")
    temp._occupyGuild = (UI.getChildControl)(parent, "StaticText_OccupyGuild")
    temp._territoryName = (UI.getChildControl)(parent, "StaticText_TerritoryName")
    temp._freeDesc = (UI.getChildControl)(parent, "StaticText_Free")
    ;
    (temp._freeDesc):SetTextMode((CppEnums.TextMode).eTextMode_AutoWrap)
    ;
    (temp._freeDesc):SetText((temp._freeDesc):GetText())
    ;
    (temp._btnAttack):addInputEvent("Mouse_LUp", "Mercenary_Request(true)")
    ;
    (temp._btnDeffence):addInputEvent("Mouse_LUp", "Mercenary_Request(false)")
    if self._territoryCount <= index then
      parent:SetShow(false)
    end
    -- DECOMPILER ERROR at PC117: Confused about usage of register: R10 in 'UnsetPending'

    ;
    ((self._control)._territoryControl)[index] = temp
  end
end

Mercenary_Request = function(isAttack)
  -- function num : 0_1
  local currentSiegeTerrytoryKey = ToClient_GetStartSiegeTerritoryKey()
  local doRequest_Militia = function()
    -- function num : 0_1_0 , upvalues : currentSiegeTerrytoryKey, isAttack
    ToClient_VolunteerEnterReq(currentSiegeTerrytoryKey, isAttack)
  end

  local title = PAGetString(Defines.StringSheet_GAME, "LUA_MILITIA__REQUESTTITLE")
  local content = ""
  if isAttack then
    content = PAGetString(Defines.StringSheet_GAME, "LUA_MILITIA__REQUESCONTENT_ATTACK")
  else
    content = PAGetString(Defines.StringSheet_GAME, "LUA_MILITIA__REQUESCONTENT_DEFFENCE")
  end
  local messageBoxData = {title = title, content = content, functionYes = doRequest_Militia, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
  ;
  (MessageBox.showMessageBox)(messageBoxData)
end

Mercenary_Cancel = function()
  -- function num : 0_2
  local cancelMercenary = function()
    -- function num : 0_2_0
    ToClient_VolunteerLeaveReq()
  end

  local title = PAGetString(Defines.StringSheet_GAME, "LUA_MILITIA_MSGTITLE")
  local content = PAGetString(Defines.StringSheet_GAME, "LUA_MILITIA_MSGDESC")
  local messageBoxData = {title = title, content = content, functionYes = cancelMercenary, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
  ;
  (MessageBox.showMessageBox)(messageBoxData)
end

mercenary.Update = function(self)
  -- function num : 0_3
  local currentSiegeTerrytoryKey = ToClient_GetStartSiegeTerritoryKey()
  for index = 0, self._maxTerritoryCount - 1 do
    local territoryKey = index + 2
    local occupyGuildWrapper = ToClient_GetOccupyGuildWrapper(territoryKey)
    if occupyGuildWrapper ~= nil then
      local guildName = occupyGuildWrapper:getName()
      ;
      ((((self._control)._territoryControl)[index])._occupyGuild):SetText(guildName)
      ;
      ((((self._control)._territoryControl)[index])._occupyGuild):SetShow(true)
      ;
      ((((self._control)._territoryControl)[index])._freeDesc):SetShow(false)
      if territoryKey == currentSiegeTerrytoryKey then
        if currentSiegeTerrytoryKey >= 2 then
          self:SetButton(index, true)
        else
          self:SetButton(index, false)
        end
      else
        self:SetButton(index, false)
      end
    else
      do
        do
          ;
          ((((self._control)._territoryControl)[index])._occupyGuild):SetShow(false)
          ;
          ((((self._control)._territoryControl)[index])._freeDesc):SetShow(true)
          self:SetButton(index, false)
          -- DECOMPILER ERROR at PC73: LeaveBlock: unexpected jumping out DO_STMT

          -- DECOMPILER ERROR at PC73: LeaveBlock: unexpected jumping out IF_ELSE_STMT

          -- DECOMPILER ERROR at PC73: LeaveBlock: unexpected jumping out IF_STMT

        end
      end
    end
  end
end

mercenary.SetButton = function(self, index, isEnable)
  -- function num : 0_4
  ((((self._control)._territoryControl)[index])._btnAttack):SetMonoTone(not isEnable)
  ;
  ((((self._control)._territoryControl)[index])._btnAttack):SetIgnore(not isEnable)
  ;
  ((((self._control)._territoryControl)[index])._btnDeffence):SetMonoTone(not isEnable)
  ;
  ((((self._control)._territoryControl)[index])._btnDeffence):SetIgnore(not isEnable)
end

FGlobal_MercenaryOpen = function()
  -- function num : 0_5 , upvalues : mercenary
  if Panel_Window_Mercenary:GetShow() then
    FGlobal_MercenaryClose()
  else
    mercenary:Update()
    Panel_Window_Mercenary:SetShow(true)
    Panel_Mercenary_Repos()
    FGlobal_MercenaryDesc_Open()
  end
end

FGlobal_MercenaryClose = function()
  -- function num : 0_6
  Panel_Window_Mercenary:SetShow(false)
  FGlobal_MercenaryDesc_Close()
  TooltipSimple_Hide()
end

MercenaryDesc_GuideIcon_TooltipShow = function()
  -- function num : 0_7 , upvalues : mercenary
  TooltipSimple_Show((mercenary._control)._btnGuideIcon, PAGetString(Defines.StringSheet_GAME, "LUA_MILITIA_TOOLTIPDESC"))
end

MercenaryDesc_GuideIcon_TooltipHide = function()
  -- function num : 0_8
  TooltipSimple_Hide()
end

Panel_Mercenary_Repos = function()
  -- function num : 0_9
  Panel_Window_Mercenary:SetPosX(getScreenSizeX() / 2 - Panel_Window_Mercenary:GetSizeX() / 2 + 100)
  Panel_Window_Mercenary:SetPosY(getScreenSizeY() / 2 - Panel_Window_Mercenary:GetSizeY() / 2)
end

FromClient_ResponseVolunteerRecruit = function()
  -- function num : 0_10
  if ToClient_IsContentsGroupOpen("245") then
    local msg = {main = PAGetString(Defines.StringSheet_GAME, "LUA_MILITIA_RECRUITSTART"), sub = "", addMsg = ""}
    Proc_ShowMessage_Ack_For_RewardSelect(msg, 6, 75)
  end
end

FromClient_ResponseMilitiaStart = function()
  -- function num : 0_11
  local msg = {main = PAGetString(Defines.StringSheet_GAME, "LUA_MILITIA_STARTTEXT"), sub = "", addMsg = ""}
  Proc_ShowMessage_Ack_For_RewardSelect(msg, 6, 76)
end

FromClient_ResponseMilitiaEnd = function()
  -- function num : 0_12
  Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_MILITIA_ENDTEXT"))
end

FromClient_ResponseMilitiaEnter = function()
  -- function num : 0_13
  Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_MILITIA_RESPONSE_JOIN"))
end

FromClient_ResponseMilitiaLeave = function()
  -- function num : 0_14
  Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_MILITIA_RESPONSE_CANCEL"))
end

mercenary.registerEvent = function(self)
  -- function num : 0_15
  registerEvent("FromClient_luaLoadComplete", "FromClient_luaLoadComplete_Mercenary")
  registerEvent("FromClient_ResponseVolunteerRecruit", "FromClient_ResponseVolunteerRecruit")
  registerEvent("FromClient_ResponseVolunteerStart", "FromClient_ResponseMilitiaStart")
  registerEvent("FromClient_ResponseVolunteerEnd", "FromClient_ResponseMilitiaEnd")
  registerEvent("FromClient_ResponseVolunteerEnter", "FromClient_ResponseMilitiaEnter")
  registerEvent("FromClient_ResponseVolunteerLeave", "FromClient_ResponseMilitiaLeave")
  registerEvent("onScreenResize", "Panel_Mercenary_Repos")
  ;
  ((self._control)._btnCancel):addInputEvent("Mouse_LUp", "Mercenary_Cancel()")
  ;
  ((self._control)._btnGuideIcon):addInputEvent("Mouse_LUp", "FGlobal_MercenaryDesc_ShowToggle()")
  ;
  ((self._control)._btnGuideIcon):addInputEvent("Mouse_On", "MercenaryDesc_GuideIcon_TooltipShow()")
  ;
  ((self._control)._btnGuideIcon):addInputEvent("Mouse_Out", "MercenaryDesc_GuideIcon_TooltipHide()")
  ;
  ((self._control)._btnClose):addInputEvent("Mouse_LUp", "FGlobal_MercenaryClose()")
end

mercenary:Init()
mercenary:registerEvent()

