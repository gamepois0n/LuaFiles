-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\widget\party\panel_largeparty.luac 

-- params : ...
-- function num : 0
local UI_Class = CppEnums.ClassType
Panel_LargeParty:SetShow(false)
PaGlobal_LargeParty = {
_ui = {_staticPartyLeftBG = (UI.getChildControl)(Panel_LargeParty, "Static_PartyLeftBG"), _staticPartyRightBG = (UI.getChildControl)(Panel_LargeParty, "Static_PartyRightBG"), _btn_Mandate = (UI.getChildControl)(Panel_LargeParty, "Button_Mandate"), _btn_Exile = (UI.getChildControl)(Panel_LargeParty, "Button_Exile"), _btn_Exit = (UI.getChildControl)(Panel_LargeParty, "Button_Out"), _staticClassBG = nil, _staticTextUserName = nil, _staticTextUserLevel = nil, _staticHpBG = nil, _progressHp = nil, _btn_ButtonAction = nil, _staticDeadBG = nil, _staticTextDead = nil, _staticRightClassBG = nil, _staticTextRightUserName = nil, _staticTextRightUserLevel = nil, _staticRightHpBG = nil, _progressRightHp = nil, _btn_ButtonRightAction = nil, _staticDeadRightBG = nil, _staticTextRightDead = nil}
, 
_partyMemberData = {}
, 
_uiPartyMemberList = {}
, _partyMemberCount = 0, _slotMouseIndex = 0, _isSlotMouseOn = false, _isMaster = false, _selectIndex = -1, _maxPartyMemberCount = 20}
-- DECOMPILER ERROR at PC68: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_LargeParty.Initialize = function(self)
  -- function num : 0_0
  -- DECOMPILER ERROR at PC7: Confused about usage of register: R1 in 'UnsetPending'

  (self._ui)._staticClassBG = (UI.getChildControl)((self._ui)._staticPartyLeftBG, "Static_ClassSlotBG")
  -- DECOMPILER ERROR at PC15: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._staticTextUserName = (UI.getChildControl)((self._ui)._staticClassBG, "StaticText_UserName")
  -- DECOMPILER ERROR at PC23: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._staticTextUserLevel = (UI.getChildControl)((self._ui)._staticClassBG, "StaticText_UserLevel")
  -- DECOMPILER ERROR at PC31: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._staticHpBG = (UI.getChildControl)((self._ui)._staticClassBG, "Static_HpBG")
  -- DECOMPILER ERROR at PC39: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._progressHp = (UI.getChildControl)((self._ui)._staticClassBG, "Progress2_Hp")
  -- DECOMPILER ERROR at PC47: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._btn_ButtonAction = (UI.getChildControl)((self._ui)._staticClassBG, "Button_Action")
  -- DECOMPILER ERROR at PC55: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._staticDeadBG = (UI.getChildControl)((self._ui)._staticClassBG, "Static_DeadConditionBG")
  -- DECOMPILER ERROR at PC63: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._staticTextDead = (UI.getChildControl)((self._ui)._staticClassBG, "StaticText_NowCondition")
  -- DECOMPILER ERROR at PC71: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._staticRightClassBG = (UI.getChildControl)((self._ui)._staticPartyRightBG, "Static_ClassSlotBG")
  -- DECOMPILER ERROR at PC79: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._staticTextRightUserName = (UI.getChildControl)((self._ui)._staticRightClassBG, "StaticText_UserName")
  -- DECOMPILER ERROR at PC87: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._staticTextRightUserLevel = (UI.getChildControl)((self._ui)._staticRightClassBG, "StaticText_UserLevel")
  -- DECOMPILER ERROR at PC95: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._staticRightHpBG = (UI.getChildControl)((self._ui)._staticRightClassBG, "Static_HpBG")
  -- DECOMPILER ERROR at PC103: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._progressRightHp = (UI.getChildControl)((self._ui)._staticRightClassBG, "Progress2_Hp")
  -- DECOMPILER ERROR at PC111: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._btn_ButtonRightAction = (UI.getChildControl)((self._ui)._staticRightClassBG, "Button_Action")
  -- DECOMPILER ERROR at PC119: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._staticDeadRightBG = (UI.getChildControl)((self._ui)._staticRightClassBG, "Static_DeadConditionBG")
  -- DECOMPILER ERROR at PC127: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._staticTextRightDead = (UI.getChildControl)((self._ui)._staticRightClassBG, "StaticText_NowCondition")
  ;
  ((self._ui)._btn_Mandate):SetShow(false)
  ;
  ((self._ui)._btn_Exile):SetShow(false)
  ;
  ((self._ui)._btn_Exit):SetShow(false)
  ;
  ((self._ui)._staticPartyLeftBG):SetShow(true)
  ;
  ((self._ui)._staticTextUserName):SetTextMode((CppEnums.TextMode).eTextMode_LimitText)
  ;
  ((self._ui)._staticTextRightUserName):SetTextMode((CppEnums.TextMode).eTextMode_LimitText)
  for index = 0, self._maxPartyMemberCount - 1 do
    local partyMember = {}
    partyMember._base = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATIC, Panel_LargeParty, "PartyMember_Back" .. index)
    partyMember._name = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATICTEXT, partyMember._base, "PartyMember_UserName" .. index)
    partyMember._hpBG = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATIC, partyMember._base, "PartyMember_HpBG" .. index)
    partyMember._hp = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_PROGRESS2, partyMember._base, "PartyMember_Hp" .. index)
    partyMember._level = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATICTEXT, partyMember._base, "PartyMember_UserLevel" .. index)
    partyMember._actionBtn = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_BUTTON, partyMember._base, "PartyMember_ActionBtn" .. index)
    partyMember._deadConditionBG = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATIC, partyMember._base, "PartyMember_DeadConditionBG" .. index)
    partyMember._deadCondition = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATICTEXT, partyMember._base, "PartyMember_DeadCondition" .. index)
    if index < 10 then
      CopyBaseProperty((self._ui)._staticClassBG, partyMember._base)
      CopyBaseProperty((self._ui)._staticTextUserName, partyMember._name)
      CopyBaseProperty((self._ui)._staticHpBG, partyMember._hpBG)
      CopyBaseProperty((self._ui)._progressHp, partyMember._hp)
      CopyBaseProperty((self._ui)._staticTextUserLevel, partyMember._level)
      CopyBaseProperty((self._ui)._btn_ButtonAction, partyMember._actionBtn)
      CopyBaseProperty((self._ui)._staticDeadBG, partyMember._deadConditionBG)
      CopyBaseProperty((self._ui)._staticTextDead, partyMember._deadCondition)
      ;
      (partyMember._base):SetPosY(index * 42)
    else
      CopyBaseProperty((self._ui)._staticRightClassBG, partyMember._base)
      CopyBaseProperty((self._ui)._staticTextRightUserName, partyMember._name)
      CopyBaseProperty((self._ui)._staticRightHpBG, partyMember._hpBG)
      CopyBaseProperty((self._ui)._progressRightHp, partyMember._hp)
      CopyBaseProperty((self._ui)._staticTextRightUserLevel, partyMember._level)
      CopyBaseProperty((self._ui)._btn_ButtonRightAction, partyMember._actionBtn)
      CopyBaseProperty((self._ui)._staticDeadRightBG, partyMember._deadConditionBG)
      CopyBaseProperty((self._ui)._staticTextRightDead, partyMember._deadCondition)
      ;
      (partyMember._base):SetPosX(((self._ui)._staticPartyLeftBG):GetPosX() + ((self._ui)._staticPartyLeftBG):GetSizeX() + 10)
      ;
      (partyMember._base):SetPosY((index - 10) * 42)
    end
    ;
    (partyMember._base):SetShow(false)
    ;
    (partyMember._actionBtn):SetShow(false)
    ;
    (partyMember._base):addInputEvent("Mouse_On", "PaGlobal_LargeParty:ButtonAction(true," .. index .. ")")
    ;
    (partyMember._base):addInputEvent("Mouse_Out", "PaGlobal_LargeParty:ButtonAction(false," .. index .. ")")
    ;
    (partyMember._base):addInputEvent("Mouse_LUp", "PaGlobal_LargeParty:ClickButtonAction(" .. index .. ")")
    -- DECOMPILER ERROR at PC394: Confused about usage of register: R6 in 'UnsetPending'

    ;
    (self._uiPartyMemberList)[index] = partyMember
  end
  ;
  ((self._ui)._staticPartyRightBG):SetShow(false)
  ;
  ((self._ui)._staticPartyRightBG):SetPosX(((self._ui)._staticPartyLeftBG):GetPosX() + ((self._ui)._staticPartyLeftBG):GetSizeX() + 3)
  ;
  ((self._ui)._btn_Mandate):addInputEvent("Mouse_LUp", "PaGlobal_LargeParty:ChangeLeader()")
  ;
  ((self._ui)._btn_Exile):addInputEvent("Mouse_LUp", "PaGlobal_LargeParty:BanishMember()")
  ;
  ((self._ui)._btn_Exit):addInputEvent("Mouse_LUp", "PaGlobal_LargeParty:ExitParty()")
end

-- DECOMPILER ERROR at PC71: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_LargeParty.Close = function(self)
  -- function num : 0_1
  self = PaGlobal_LargeParty
  Panel_LargeParty:SetShow(false)
  ;
  ((self._ui)._btn_Mandate):SetShow(false)
  ;
  ((self._ui)._btn_Exile):SetShow(false)
  ;
  ((self._ui)._btn_Exit):SetShow(false)
  for index = 0, self._partyMemberCount - 1 do
    (((self._uiPartyMemberList)[index])._actionBtn):SetShow(false)
    ;
    (((self._uiPartyMemberList)[index])._base):SetShow(false)
  end
end

-- DECOMPILER ERROR at PC74: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_LargeParty.Update = function(self)
  -- function num : 0_2
  self._partyMemberCount = RequestParty_getPartyMemberCount()
  if self._partyMemberCount == 0 then
    PaGlobal_LargeParty:Close()
  else
    if self._partyMemberCount < 11 then
      ((self._ui)._staticPartyRightBG):SetShow(false)
    end
  end
  self._partyMemberData = FGlobal_ResponseParty_PartyMemberSet(self._partyMemberCount)
  if (self._partyMemberData)[0] == nil then
    return 
  end
  if self._partyMemberCount > 0 and self._partyMemberCount <= 10 then
    ((self._ui)._staticPartyLeftBG):SetSize(((self._ui)._staticPartyLeftBG):GetSizeX(), 42 * self._partyMemberCount)
  else
    if self._partyMemberCount >= 11 then
      ((self._ui)._staticPartyLeftBG):SetSize(((self._ui)._staticPartyLeftBG):GetSizeX(), 420)
      ;
      ((self._ui)._staticPartyRightBG):SetShow(true)
      ;
      ((self._ui)._staticPartyRightBG):SetSize(((self._ui)._staticPartyRightBG):GetSizeX(), 42 * (self._partyMemberCount - 10))
    end
  end
  self._isMaster = false
  for index = 0, self._maxPartyMemberCount - 1 do
    (((self._uiPartyMemberList)[index])._base):SetShow(false)
    if index < self._partyMemberCount then
      PaGlobal_LargeParty:SetInfo(index)
      ;
      (((self._uiPartyMemberList)[index])._base):SetShow(true)
    end
  end
end

-- DECOMPILER ERROR at PC77: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_LargeParty.SetInfo = function(self, index)
  -- function num : 0_3
  if ((self._partyMemberData)[index])._isSelf == true and ((self._partyMemberData)[index])._isMaster == true then
    self._isMaster = true
  end
  ;
  (((self._uiPartyMemberList)[index])._name):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_LV") .. "." .. ((self._partyMemberData)[index])._level .. " " .. ((self._partyMemberData)[index])._name)
  ;
  (((self._uiPartyMemberList)[index])._hp):SetProgressRate(((self._partyMemberData)[index])._nowHp / ((self._partyMemberData)[index])._maxHp)
  if (((self._uiPartyMemberList)[index])._name):IsLimitText() then
    (((self._uiPartyMemberList)[index])._name):SetIgnore(false)
    ;
    (((self._uiPartyMemberList)[index])._name):addInputEvent("Mouse_On", "PaGlobal_LargeParty:LimitTextTooptip(true, " .. index .. ")")
    ;
    (((self._uiPartyMemberList)[index])._name):addInputEvent("Mouse_Out", "PaGlobal_LargeParty:LimitTextTooptip(false, " .. index .. ")")
  end
  if ((self._partyMemberData)[index])._isMaster then
    (((self._uiPartyMemberList)[index])._name):SetFontColor((Defines.Color).C_FFA3EF00)
  else
    ;
    (((self._uiPartyMemberList)[index])._name):SetFontColor((Defines.Color).C_FFFFFFFF)
  end
  if ((self._partyMemberData)[index])._nowHp <= 0 then
    (((self._uiPartyMemberList)[index])._deadConditionBG):SetShow(true)
    ;
    (((self._uiPartyMemberList)[index])._deadCondition):SetShow(true)
    ;
    (((self._uiPartyMemberList)[index])._deadCondition):SetText(PAGetString(Defines.StringSheet_GAME, "PANEL_PARTY_DEATH"))
  else
    if ((self._partyMemberData)[index])._nowHp >= 1 then
      (((self._uiPartyMemberList)[index])._deadConditionBG):SetShow(false)
      ;
      (((self._uiPartyMemberList)[index])._deadCondition):SetShow(false)
      ;
      (((self._uiPartyMemberList)[index])._deadCondition):SetText("")
    end
  end
  ;
  (((self._uiPartyMemberList)[index])._base):SetShow(true)
  ;
  (((self._uiPartyMemberList)[index])._name):SetShow(true)
  ;
  (((self._uiPartyMemberList)[index])._hpBG):SetShow(true)
  ;
  (((self._uiPartyMemberList)[index])._hp):SetShow(true)
end

-- DECOMPILER ERROR at PC80: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_LargeParty.LimitTextTooptip = function(self, isShow, index)
  -- function num : 0_4
  if isShow == false then
    TooltipSimple_Hide()
    return 
  end
  TooltipSimple_Show(((self._uiPartyMemberList)[index])._name, (((self._uiPartyMemberList)[index])._name):GetText())
end

-- DECOMPILER ERROR at PC83: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_LargeParty.ButtonAction = function(self, isShow, index)
  -- function num : 0_5
  if (((self._uiPartyMemberList)[index])._actionBtn):GetShow() and index == self._selectIndex then
    return 
  end
  if isShow then
    for count = 0, RequestParty_getPartyMemberCount() - 1 do
      if count == index then
        (((self._uiPartyMemberList)[count])._actionBtn):SetShow(true)
      else
        ;
        (((self._uiPartyMemberList)[count])._actionBtn):SetShow(false)
        ;
        ((self._ui)._btn_Mandate):SetShow(false)
        ;
        ((self._ui)._btn_Exile):SetShow(false)
        ;
        ((self._ui)._btn_Exit):SetShow(false)
      end
    end
  else
    do
      ;
      (((self._uiPartyMemberList)[index])._actionBtn):SetShow(false)
      if self._selectIndex == ((self._partyMemberData)[index])._index then
        ((self._ui)._btn_Mandate):SetShow(false)
        ;
        ((self._ui)._btn_Exile):SetShow(false)
        ;
        ((self._ui)._btn_Exit):SetShow(false)
        return 
      end
    end
  end
end

-- DECOMPILER ERROR at PC86: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_LargeParty.ClickButtonAction = function(self, index)
  -- function num : 0_6
  if ((self._ui)._btn_Mandate):GetShow() or ((self._ui)._btn_Exile):GetShow() or ((self._ui)._btn_Exit):GetShow() then
    ((self._ui)._btn_Mandate):SetShow(false)
    ;
    ((self._ui)._btn_Exile):SetShow(false)
    ;
    ((self._ui)._btn_Exit):SetShow(false)
  end
  if self._selectIndex == ((self._partyMemberData)[index])._index then
    ((self._ui)._btn_Mandate):SetShow(false)
    ;
    ((self._ui)._btn_Exile):SetShow(false)
    ;
    ((self._ui)._btn_Exit):SetShow(false)
    self._selectIndex = -1
    return 
  end
  local gapX = 0
  if index >= 10 then
    gapX = ((self._ui)._staticPartyRightBG):GetSizeX() + 10
  end
  ;
  ((self._ui)._btn_Mandate):SetPosX((((self._uiPartyMemberList)[index])._actionBtn):GetPosX() + 30 + (gapX))
  ;
  ((self._ui)._btn_Exile):SetPosX((((self._uiPartyMemberList)[index])._actionBtn):GetPosX() + 88 + (gapX))
  ;
  ((self._ui)._btn_Exit):SetPosX((((self._uiPartyMemberList)[index])._actionBtn):GetPosX() + 30 + (gapX))
  ;
  ((self._ui)._btn_Mandate):SetPosY(index % 10 * 42)
  ;
  ((self._ui)._btn_Exile):SetPosY(index % 10 * 42)
  ;
  ((self._ui)._btn_Exit):SetPosY(index % 10 * 42)
  if ((self._partyMemberData)[index])._isSelf == false and self._isMaster then
    ((self._ui)._btn_Mandate):SetShow(true)
    ;
    ((self._ui)._btn_Exile):SetShow(true)
  else
    if ((self._partyMemberData)[index])._isSelf then
      ((self._ui)._btn_Exit):SetShow(true)
    else
      ;
      ((self._ui)._btn_Mandate):SetShow(false)
      ;
      ((self._ui)._btn_Exile):SetShow(false)
      ;
      ((self._ui)._btn_Exit):SetShow(false)
    end
  end
  Panel_LargeParty:SetChildIndex((self._ui)._btn_Mandate, 9999)
  Panel_LargeParty:SetChildIndex((self._ui)._btn_Exile, 9998)
  Panel_LargeParty:SetChildIndex((self._ui)._btn_Exit, 9997)
  self._selectIndex = ((self._partyMemberData)[index])._index
end

-- DECOMPILER ERROR at PC89: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_LargeParty.ChangeLeader = function(self)
  -- function num : 0_7
  local index = self._selectIndex
  RequestParty_changeLeader(index)
  ;
  ((self._ui)._btn_Mandate):SetShow(false)
  ;
  ((self._ui)._btn_Exile):SetShow(false)
  PaGlobal_LargeParty:Update()
end

-- DECOMPILER ERROR at PC92: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_LargeParty.BanishMember = function(self)
  -- function num : 0_8
  local index = self._selectIndex
  local withdrawMemberData = RequestParty_getPartyMemberAt(index)
  local withdrawMemberActorKey = withdrawMemberData:getActorKey()
  local withdrawMemberPlayerActor = getPlayerActor(withdrawMemberActorKey)
  local partyType = ToClient_GetPartyType()
  local messageBox_party_BanishMember = function()
    -- function num : 0_8_0 , upvalues : index, self
    RequestParty_withdrawMember(index)
    ;
    ((self._ui)._btn_Mandate):SetShow(false)
    ;
    ((self._ui)._btn_Exile):SetShow(false)
    PaGlobal_LargeParty:Update()
  end

  local contentString = ""
  local titleForceOut = ""
  if partyType == 0 then
    contentString = withdrawMemberData:name() .. PAGetString(Defines.StringSheet_GAME, "PANEL_PARTY_FORCEOUT_QUESTION")
    titleForceOut = PAGetString(Defines.StringSheet_GAME, "PANEL_PARTY_FORCEOUT")
  else
    contentString = withdrawMemberData:name() .. PAGetString(Defines.StringSheet_GAME, "PANEL_LARGEPARTY_FORCEOUT_QUESTION")
    titleForceOut = PAGetString(Defines.StringSheet_GAME, "PANEL_LARGEPARTY_FORCEOUT")
  end
  local messageboxData = {title = titleForceOut, content = contentString, functionYes = messageBox_party_BanishMember, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
  ;
  (MessageBox.showMessageBox)(messageboxData)
end

-- DECOMPILER ERROR at PC95: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_LargeParty.ExitParty = function(self)
  -- function num : 0_9
  local index = self._selectIndex
  local isPlayingPvPMatch = (getSelfPlayer()):isDefinedPvPMatch()
  if isPlayingPvPMatch == true then
    RequestParty_withdrawMember(index)
    return 
  end
  local partyOut = function()
    -- function num : 0_9_0 , upvalues : index
    RequestParty_withdrawMember(index)
    PaGlobal_LargeParty:Close()
  end

  local partyType = ToClient_GetPartyType()
  local messageBoxMemo = ""
  if partyType == 0 then
    messageBoxMemo = PAGetString(Defines.StringSheet_GAME, "LUA_PARTY_DISTRIBUTION_GETOUTPARTY")
  else
    messageBoxMemo = PAGetString(Defines.StringSheet_GAME, "LUA_LARGEPARTY_DISTRIBUTION_GETOUTPARTY")
  end
  local messageBoxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ALERT_NOTIFICATIONS"), content = messageBoxMemo, functionYes = partyOut, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
  ;
  (MessageBox.showMessageBox)(messageBoxData)
  PaGlobal_LargeParty:Update()
end

LargeParty_Resize = function()
  -- function num : 0_10
  PaGlobal_LargeParty:Resize()
end

-- DECOMPILER ERROR at PC100: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_LargeParty.Resize = function(self)
  -- function num : 0_11
  if RequestParty_getPartyMemberCount() == 0 then
    Panel_LargeParty:SetShow(false)
  end
  if Panel_LargeParty:GetRelativePosX() == -1 or Panel_LargeParty:GetRelativePosY() == -1 then
    local initPosX = 10
    local initPosY = 200
    changePositionBySever(Panel_LargeParty, (CppEnums.PAGameUIType).PAGameUIPanel_Party, false, true, false)
    FGlobal_InitPanelRelativePos(Panel_LargeParty, initPosX, initPosY)
  else
    do
      if Panel_LargeParty:GetRelativePosX() == 0 or Panel_LargeParty:GetRelativePosY() == 0 then
        Panel_LargeParty:SetPosX(10)
        Panel_LargeParty:SetPosY(200)
      else
        Panel_LargeParty:SetPosX(getScreenSizeX() * Panel_LargeParty:GetRelativePosX() - Panel_LargeParty:GetSizeX() / 2)
        Panel_LargeParty:SetPosY(getScreenSizeY() * Panel_LargeParty:GetRelativePosY() - Panel_LargeParty:GetSizeY() / 2)
      end
      FGlobal_PanelRepostionbyScreenOut(Panel_LargeParty)
    end
  end
end

LargeParty_registEventHandler = function()
  -- function num : 0_12
  local self = PaGlobal_LargeParty
end

registerEvent("onScreenResize", "LargeParty_Resize()")
PaGlobal_LargeParty:Initialize()
LargeParty_registEventHandler()

