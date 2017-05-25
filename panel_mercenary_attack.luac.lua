-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\window\mercenary\panel_mercenary_attack.luac 

-- params : ...
-- function num : 0
Panel_Window_Mercenary_Attack:SetShow(false)
PaGlobal_MercenaryAttack = {
_ui = {_btn_Close = (UI.getChildControl)(Panel_Window_Mercenary_Attack, "Button_Close"), _mercenaryBG = (UI.getChildControl)(Panel_Window_Mercenary_Attack, "Static_MercenaryBG"), _terms = (UI.getChildControl)(Panel_Window_Mercenary_Attack, "StaticText_Terms"), _termsText = (UI.getChildControl)(Panel_Window_Mercenary_Attack, "StaticText_TermsText"), _applyButton = (UI.getChildControl)(Panel_Window_Mercenary_Attack, "Button_Enter")}
, isAttack = true, _territoryKey = nil}
-- DECOMPILER ERROR at PC42: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_MercenaryAttack.Mercenary_Attack_Initialize = function(self)
  -- function num : 0_0
  ((self._ui)._terms):SetTextMode((CppEnums.TextMode).eTextMode_AutoWrap)
  ;
  ((self._ui)._termsText):SetTextMode((CppEnums.TextMode).eTextMode_AutoWrap)
  ;
  ((self._ui)._terms):SetText("※공격팀")
  ;
  ((self._ui)._termsText):SetText("-민병�\128 공격�\128으로 공성�\144 참가합니�\164.\n-민병�\128 공격�\128 승리조건�\128 수성중인 길드�\152 �\128휘소�\188 파괴�\156 승리�\160 �\152 있습니다. \n-민병�\128 보상�\128 길드자금으로 일괄 �\128급됩니다.")
end

FGlobal_MercenaryAttackOpen = function()
  -- function num : 0_1
  Panel_Window_Mercenary_Attack:SetShow(true)
  FGlobal_MercenaryClose()
  local self = PaGlobal_MercenaryAttack
  local territoryKey = ToClient_GetStartSiegeTerritoryKey()
  self._territoryKey = territoryKey
end

FGlobal_MercenaryAttackClose = function()
  -- function num : 0_2
  Panel_Window_Mercenary_Attack:SetShow(false)
end

-- DECOMPILER ERROR at PC49: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_MercenaryAttack.Mercenary_AttackUpdate = function(self)
  -- function num : 0_3
  local applyCount = ToClient_GetMilitiaListCount()
  local userNo = ((getSelfPlayer()):get()):getUserNo()
  for applyListCount = 0, applyCount - 1 do
    local applyListInfo = ToClient_GetMilitiaInfoIndex(applyListCount)
    local applyUserNo = applyListInfo:getUserNo()
    if applyUserNo == userNo then
      do
        local userName = applyListInfo:getCharacterName()
        Proc_ShowMessage_Ack("userName[" .. tostring(applyListCount) .. "] : " .. tostring(userName) .. " / " .. "QA용입니다.")
        -- DECOMPILER ERROR at PC34: LeaveBlock: unexpected jumping out IF_THEN_STMT

        -- DECOMPILER ERROR at PC34: LeaveBlock: unexpected jumping out IF_STMT

      end
    end
  end
end

-- DECOMPILER ERROR at PC52: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_MercenaryAttack.Mercenary_AttackTextSetPos = function(self)
  -- function num : 0_4
  local startPosY = (self._terms):GetPosY()
  local textSizeY = 0
  local SetPos = function(control)
    -- function num : 0_4_0 , upvalues : startPosY, textSizeY
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
    Panel_Window_Mercenary_Attack:SetSize(Panel_Window_Mercenary_Attack:GetSizeX(), Panel_Window_Mercenary_Attack:GetSizeY() + sizeY)
    ;
    ((self._ui)._applyButton):SetPosY(((self._ui)._applyButton):GetPosY() + sizeY)
  end
end

-- DECOMPILER ERROR at PC55: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_MercenaryAttack.MercenaryAttack_Apply = function(self)
  -- function num : 0_5
  self._isAttack = true
  ToClient_MilitiaEnterReq(self._territoryKey, self._isAttack)
  PaGlobal_MercenaryAttack:Mercenary_AttackUpdate()
  _PA_LOG("임승�\177", " att :" .. tostring(self._territoryKey))
end

-- DECOMPILER ERROR at PC58: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_MercenaryAttack.Mercenary_Attack_registMessageHandler = function(self)
  -- function num : 0_6
  ((self._ui)._applyButton):addInputEvent("Mouse_LUp", "PaGlobal_MercenaryAttack:MercenaryAttack_Apply()")
  ;
  ((self._ui)._btn_Close):addInputEvent("Mouse_LUp", "FGlobal_MercenaryAttackClose()")
end

FromClient_luaLoadComplete_Mercenary_Attack = function()
  -- function num : 0_7
  PaGlobal_MercenaryAttack:Mercenary_Attack_Initialize()
  PaGlobal_MercenaryAttack:Mercenary_Attack_registMessageHandler()
end

registerEvent("FromClient_luaLoadComplete", "FromClient_luaLoadComplete_Mercenary_Attack")

