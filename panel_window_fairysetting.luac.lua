-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\window\fairyinfo\panel_window_fairysetting.luac 

-- params : ...
-- function num : 0
Panel_Window_FairySetting:SetShow(false)
local ClassType_Valkiry = 24
local spiritClass = {12, 19, 20, 21, 23, 26, 30; [0] = 0}
local fairyMainPotionData = {513, 514, 517, 518, 519, 524, 525, 528, 529, 530, 538, 551, 552, 553, 554, 555, 17568, 17569, 19932, 19933, 19934, 19935; [0] = 502}
local fairySubPotionData = {
[1] = {520, 521, 522, 526, 527, 515, 516, 531, 532, 533, 810, 17570, 17571, 17680, 17685, 17686, 17687, 17688, 18854, 19936, 19937, 19938; [0] = 503}
, 
[2] = {592, 593, 594, 810, 827, 828, 829, 830, 16334, 17707, 17708, 17709, 17710; [0] = 591}
, 
[3] = {596, 597, 598, 810, 831, 832, 833, 834, 17711, 17712, 17713, 17714; [0] = 595}
}
local _Static_MainBG = (UI.getChildControl)(Panel_Window_FairySetting, "Static_SettingMainBG")
local _Static_BaseSkillListBG = (UI.getChildControl)(Panel_Window_FairySetting, "Static_BaseSkillListBG")
local FairySetting = {_currentFairyNoStr = nil, _currentHpKey = nil, _currentMpKey = nil, _currentHpRate = nil, _currentMpRate = nil, _currentClassType = nil, _currentTier = 0, 
_UI = {_StaticText_MPTitle = (UI.getChildControl)(_Static_MainBG, "StaticText_MPTitle"), _Static_HPItemSlotBig = (UI.getChildControl)(_Static_MainBG, "Static_HPItemSlotBig"), _Static_MPItemSlotBig = (UI.getChildControl)(_Static_MainBG, "Static_MPItemSlotBig"), 
_Radio_HP = {[10] = (UI.getChildControl)(_Static_MainBG, "Radiobutton_HP10Percent"), [20] = (UI.getChildControl)(_Static_MainBG, "Radiobutton_HP20Percent"), [30] = (UI.getChildControl)(_Static_MainBG, "Radiobutton_HP30Percent"), [50] = (UI.getChildControl)(_Static_MainBG, "Radiobutton_HP50Percent")}
, 
_Radio_MP = {[10] = (UI.getChildControl)(_Static_MainBG, "Radiobutton_MP10Percent"), [20] = (UI.getChildControl)(_Static_MainBG, "Radiobutton_MP20Percent"), [30] = (UI.getChildControl)(_Static_MainBG, "Radiobutton_MP30Percent"), [50] = (UI.getChildControl)(_Static_MainBG, "Radiobutton_MP50Percent")}
, _Static_SkillListBG2 = (UI.getChildControl)(Panel_Window_FairySetting, "Static_SkillListBG2"), _Button_Yes = (UI.getChildControl)(Panel_Window_FairySetting, "Button_Yes"), _Button_No = (UI.getChildControl)(Panel_Window_FairySetting, "Button_No"), _Button_Close = (UI.getChildControl)(Panel_Window_FairySetting, "Button_Win_Close"), _StaticText_BaseSkillDesc = (UI.getChildControl)(_Static_BaseSkillListBG, "StaticText_BaseSkillDesc")}
}
PaGlobal_FairyList_HpRateCheck = function(rate)
  -- function num : 0_0 , upvalues : FairySetting
  local self = FairySetting
  self._currentHpRate = tonumber(rate)
end

PaGlobal_FairyList_MpRateCheck = function(mpCheck)
  -- function num : 0_1 , upvalues : FairySetting
  local self = FairySetting
  self._currentMpRate = tonumber(mpCheck)
end

FairySetting.RegistEvent = function(self)
  -- function num : 0_2
  ((self._UI)._Button_No):addInputEvent("Mouse_LUp", "PaGlobal_FairySetting_Close()")
  ;
  ((self._UI)._Button_Yes):addInputEvent("Mouse_LUp", "PaGlobal_FairySetting_Request()")
  ;
  ((self._UI)._Button_Close):addInputEvent("Mouse_LUp", "PaGlobal_FairySetting_Close()")
  ;
  ((self._UI)._Button_Close):addInputEvent("Mouse_LUp", "PaGlobal_FairySetting_Close()")
  ;
  (((self._UI)._Radio_HP)[10]):addInputEvent("Mouse_LUp", "PaGlobal_FairyList_HpRateCheck(10)")
  ;
  (((self._UI)._Radio_HP)[20]):addInputEvent("Mouse_LUp", "PaGlobal_FairyList_HpRateCheck(20)")
  ;
  (((self._UI)._Radio_HP)[30]):addInputEvent("Mouse_LUp", "PaGlobal_FairyList_HpRateCheck(30)")
  ;
  (((self._UI)._Radio_HP)[50]):addInputEvent("Mouse_LUp", "PaGlobal_FairyList_HpRateCheck(50)")
  ;
  (((self._UI)._Radio_MP)[10]):addInputEvent("Mouse_LUp", "PaGlobal_FairyList_MpRateCheck(10)")
  ;
  (((self._UI)._Radio_MP)[20]):addInputEvent("Mouse_LUp", "PaGlobal_FairyList_MpRateCheck(20)")
  ;
  (((self._UI)._Radio_MP)[30]):addInputEvent("Mouse_LUp", "PaGlobal_FairyList_MpRateCheck(30)")
  ;
  (((self._UI)._Radio_MP)[50]):addInputEvent("Mouse_LUp", "PaGlobal_FairyList_MpRateCheck(50)")
end

FairySetting.Initialize = function(self)
  -- function num : 0_3
  self._currentFairyNoStr = nil
  self._currentHpKey = nil
  self._currentHpRate = nil
  self._currentMpKey = nil
  self._currentMpRate = nil
  self._currentTier = 0
  self:RegistEvent()
end

FairySetting.UpdateDesc = function(self)
  -- function num : 0_4 , upvalues : _Static_BaseSkillListBG
  local setText = ""
  for ii = 1, self._currentTier + 1 do
    local stringText = "LUA_FAIRY_SKILL_TIER" .. tostring(ii)
    setText = setText .. "- " .. PAGetString(Defines.StringSheet_GAME, stringText) .. "\\n"
  end
  ;
  ((self._UI)._StaticText_BaseSkillDesc):SetText(setText)
  _Static_BaseSkillListBG:SetSize(_Static_BaseSkillListBG:GetSizeX(), 40 + self._currentTier * 20)
end

FairySetting.UpdateSetting = function(self)
  -- function num : 0_5
  if self._currentFairyNoStr == nil then
    return 
  end
  local fairyNo_s64 = tonumber64(self._currentFairyNoStr)
  local settingData = ToClient_getFairySettingData(fairyNo_s64)
  if settingData ~= nil then
    self._currentHpKey = settingData._hpItemKey
    self._currentMpKey = settingData._mpItemKey
    self._currentHpRate = settingData._hpMinRate
    self._currentMpRate = settingData._mpMinRate
  end
  local ItemHpSSW, ItemMpSSW = nil, nil
  if self._currentHpKey ~= nil then
    ItemHpSSW = getItemEnchantStaticStatus(self._currentHpKey)
  end
  if ItemHpSSW ~= nil then
    ((self._UI)._Static_HPItemSlotBig):ChangeTextureInfoName("Icon/" .. ItemHpSSW:getIconPath())
    ;
    ((self._UI)._Static_HPItemSlotBig):setRenderTexture(((self._UI)._Static_HPItemSlotBig):getBaseTexture())
    ;
    ((self._UI)._Static_HPItemSlotBig):SetShow(true)
  else
    ;
    ((self._UI)._Static_HPItemSlotBig):SetShow(false)
  end
  if self._currentMpKey ~= nil then
    ItemMpSSW = getItemEnchantStaticStatus(self._currentMpKey)
  end
  if ItemMpSSW ~= nil then
    ((self._UI)._Static_MPItemSlotBig):ChangeTextureInfoName("Icon/" .. ItemMpSSW:getIconPath())
    ;
    ((self._UI)._Static_MPItemSlotBig):setRenderTexture(((self._UI)._Static_MPItemSlotBig):getBaseTexture())
    ;
    ((self._UI)._Static_MPItemSlotBig):SetShow(true)
  else
    ;
    ((self._UI)._Static_MPItemSlotBig):SetShow(false)
  end
  if self._currentHpRate ~= 0 then
    for key,value in pairs((self._UI)._Radio_HP) do
      if self._currentHpRate == key then
        value:SetCheck(true)
      else
        value:SetCheck(false)
      end
    end
  end
  do
    if self._currentMpRate ~= 0 then
      for key,value in pairs((self._UI)._Radio_MP) do
        if self._currentMpRate == key then
          value:SetCheck(true)
        else
          value:SetCheck(false)
        end
      end
    end
  end
end

FairySetting.Clear = function(self)
  -- function num : 0_6
  self._currentHpKey = nil
  self._currentHpRate = nil
  self._currentMpKey = nil
  self._currentMpRate = nil
  for key,value in pairs((self._UI)._Radio_HP) do
    value:SetCheck(false)
    if key == 30 then
      value:SetCheck(true)
    end
  end
  for key,value in pairs((self._UI)._Radio_MP) do
    value:SetCheck(false)
    if key == 30 then
      value:SetCheck(true)
    end
  end
end

FairySetting.SetPos = function(self)
  -- function num : 0_7
  Panel_Window_FairySetting:SetPosX(Panel_Window_FairyListNew:GetPosX() + Panel_Window_FairyListNew:GetSizeX())
  Panel_Window_FairySetting:SetPosY(Panel_Window_FairyListNew:GetPosY())
end

PaGlobal_FairySetting_Request = function()
  -- function num : 0_8 , upvalues : FairySetting
  local self = FairySetting
  if self._currentHpKey == nil then
    self._currentHpKey = ItemEnchantKey(0, 0)
    -- DECOMPILER ERROR at PC10: Confused about usage of register: R1 in 'UnsetPending'

    ;
    (self._cacheSetting)._hpRate = 0
  end
  if self._currentMpKey == nil then
    self._currentMpKey = ItemEnchantKey(0, 0)
    -- DECOMPILER ERROR at PC20: Confused about usage of register: R1 in 'UnsetPending'

    ;
    (self._cacheSetting)._mpRate = 0
  end
  if self._currentFairyNoStr == nil then
    return 
  end
  ToClient_setFairySettingData(tonumber64(self._currentFairyNoStr), self._currentHpKey, self._currentHpRate, self._currentMpKey, self._currentMpRate)
  PaGlobal_FairySetting_Close()
  PaGlobal_FairyList_Update()
end

PaGlobal_FairySetting_Open = function(petNoStr, tier)
  -- function num : 0_9 , upvalues : FairySetting, spiritClass, ClassType_Valkiry
  if not Panel_Window_FairyListNew:GetShow() then
    return 
  end
  if petNoStr == nil then
    return 
  end
  local self = FairySetting
  local selfPlayer = getSelfPlayer()
  if selfPlayer == nil then
    return 
  end
  local classType = selfPlayer:getClassType()
  self._currentClassType = 1
  for ii = 0, #spiritClass do
    if classType == spiritClass[ii] then
      self._currentClassType = 2
    end
  end
  if ClassType_Valkiry == classType then
    self._currentClassType = 3
  end
  self._currentFairyNoStr = petNoStr
  self._currentTier = tier
  self:Clear()
  self:SetPos()
  audioPostEvent_SystemUi(1, 40)
  if Panel_Window_FairyUpgrade:GetShow() then
    PaGlobal_FairyUpgrade_Close()
  end
  Panel_Window_FairySetting:SetShow(true)
  self:UpdateSetting()
  self:UpdateDesc()
end

PaGlobal_FairySetting_Close = function()
  -- function num : 0_10 , upvalues : FairySetting
  local self = FairySetting
  self._currentFairyNoStr = nil
  Panel_Window_FairySetting:SetShow(false)
end

PaGlobal_FairySetting_SetPortion = function(itemKey)
  -- function num : 0_11 , upvalues : FairySetting
  local self = FairySetting
  if PaGlobal_FairyList_IsHp(tostring(itemKey:get())) == true then
    self._currentHpKey = itemKey
  end
  if PaGlobal_FairyList_IsMp(tostring(itemKey:get())) == true then
    self._currentMpKey = itemKey
  end
  if isSetting == false then
    Proc_ShowMessage_Ack_WithOut_ChattingMessage("등록�\160 �\152 없는 아이템입니다.")
  end
  self:UpdateSetting()
end

PaGlobal_FairyList_IsMp = function(mpKeyStr)
  -- function num : 0_12 , upvalues : FairySetting, fairySubPotionData
  local self = FairySetting
  local key = tonumber(mpKeyStr)
  for idx,value in pairs(fairySubPotionData[self._currentClassType]) do
    if key == value then
      return true
    end
  end
  return false
end

PaGlobal_FairyList_IsHp = function(hpKeyStr)
  -- function num : 0_13 , upvalues : fairyMainPotionData
  local key = tonumber(hpKeyStr)
  for idx,value in pairs(fairyMainPotionData) do
    if key == value then
      return true
    end
  end
  return false
end

FairySetting:Initialize()

