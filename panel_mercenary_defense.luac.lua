-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\window\mercenary\panel_mercenary_defense.luac 

-- params : ...
-- function num : 0
Panel_Window_Mercenary_Defense:SetShow(false)
PaGlobal_MercenaryDefense = {
_ui = {_btn_Close = (UI.getChildControl)(Panel_Window_Mercenary_Defense, "Button_Close"), _mercenaryBG = (UI.getChildControl)(Panel_Window_Mercenary_Defense, "Static_MercenaryBG"), _terms = (UI.getChildControl)(Panel_Window_Mercenary_Defense, "StaticText_Terms"), _termsText = (UI.getChildControl)(Panel_Window_Mercenary_Defense, "StaticText_TermsText"), _applyButton = (UI.getChildControl)(Panel_Window_Mercenary_Defense, "Button_Enter")}
, _isAttack = false, _territoryKey = nil}
-- DECOMPILER ERROR at PC42: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_MercenaryDefense.Mercenary_Defense_Initialize = function(self)
  -- function num : 0_0
  ((self._ui)._terms):SetTextMode((CppEnums.TextMode).eTextMode_AutoWrap)
  ;
  ((self._ui)._termsText):SetTextMode((CppEnums.TextMode).eTextMode_AutoWrap)
  ;
  ((self._ui)._terms):SetText("※수비팀")
  ;
  ((self._ui)._termsText):SetText("-민병�\128 수비�\128으로 공성�\144 참가합니�\164.")
end

FGlobal_MercenaryDefenseOpen = function()
  -- function num : 0_1
  Panel_Window_Mercenary_Defense:SetShow(true)
  FGlobal_MercenaryClose()
  local self = PaGlobal_MercenaryDefense
  local territoryKey = ToClient_GetStartSiegeTerritoryKey()
  self._territoryKey = territoryKey
end

FGlobal_MercenaryDefenseClose = function()
  -- function num : 0_2
  Panel_Window_Mercenary_Defense:SetShow(false)
end

-- DECOMPILER ERROR at PC49: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_MercenaryDefense.Mercenary_Defense_registMessageHandler = function(self)
  -- function num : 0_3
  ((self._ui)._applyButton):addInputEvent("Mouse_LUp", "PaGlobal_MercenaryDefense:MercenaryDefense_Apply()")
  ;
  ((self._ui)._btn_Close):addInputEvent("Mouse_LUp", "FGlobal_MercenaryDefenseClose()")
end

-- DECOMPILER ERROR at PC52: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_MercenaryDefense.Mercenary_DefenseUpdate = function(self)
  -- function num : 0_4
  local applyCount = ToClient_GetMilitiaListCount(self._territoryKey)
  local applyList = ToClient_MilitiaListReq(self._territoryKey)
  do
    local userNo = ((getSelfPlayer()):get()):getUserNo()
    _PA_LOG("임승�\177", " apply :" .. tostring(applyList == nil))
    for applyListCount = 0, applyCount - 1 do
      local applyListInfo = ToClient_GetMilitiaInfoIndex(applyListCount)
      local applyUserNo = applyListInfo:getUserNo()
      if userNo == applyUserNo then
        do
          local userName = applyListInfo:getCharacterName()
          Proc_ShowMessage_Ack("userName[" .. tostring(applyListCount) .. "] : " .. tostring(userName) .. " ")
          -- DECOMPILER ERROR at PC48: LeaveBlock: unexpected jumping out IF_THEN_STMT

          -- DECOMPILER ERROR at PC48: LeaveBlock: unexpected jumping out IF_STMT

        end
      end
    end
    -- DECOMPILER ERROR: 2 unprocessed JMP targets
  end
end

-- DECOMPILER ERROR at PC55: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_MercenaryDefense.Mercenary_DefenseTextSetPos = function(self)
  -- function num : 0_5
  local startPosY = (self._terms):GetPosY()
  local textSizeY = 0
  local SetPos = function(control)
    -- function num : 0_5_0 , upvalues : startPosY, textSizeY
    control:SetPosY(startPosY + textSizeY)
    textSizeY = textSizeY + control:GetTextSizeY()
  end

  SetPos((self._ui)._terms)
  SetPos((self._ui)._termsText)
  local bgSizeY = ((self._ui)._mercenaryBG):GetSizeY()
  if bgSizeY < textSizeY then
    local sizeY = 24 + textSizeY - bgSizeY
    ;
    ((self._ui)._mercenaryBG):SetSize(((self._ui)._mercenaryBG):GetSizeX(), ((self._ui)._mercenaryBG):GetSizeY() + sizeY)
    Panel_Window_Mercenary_Defense:SetSize(Panel_Window_Mercenary_Defense:GetSizeX(), Panel_Window_Mercenary_Defense:GetSizeY() + sizeY)
    ;
    ((self._ui)._applyButton):SetPosY(((self._ui)._applyButton):GetPosY() + sizeY)
  end
end

-- DECOMPILER ERROR at PC58: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_MercenaryDefense.MercenaryDefense_Apply = function(self)
  -- function num : 0_6
  self._isAttack = false
  ToClient_MilitiaEnterReq(self._territoryKey, self._isAttack)
  PaGlobal_MercenaryDefense:Mercenary_DefenseUpdate()
  _PA_LOG("임승�\177", " def :" .. tostring(self._territoryKey))
end

FromClient_luaLoadComplete_Mercenary_Defense = function()
  -- function num : 0_7
  PaGlobal_MercenaryDefense:Mercenary_Defense_Initialize()
  PaGlobal_MercenaryDefense:Mercenary_Defense_registMessageHandler()
end

registerEvent("FromClient_luaLoadComplete", "FromClient_luaLoadComplete_Mercenary_Defense")

