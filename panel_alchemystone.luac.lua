-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\alchemy\panel_alchemystone.luac 

-- params : ...
-- function num : 0
Panel_AlchemyStone:SetShow(false)
local AlchemyStone = {
control = {tab_Charge = (UI.getChildControl)(Panel_AlchemyStone, "RadioButton_Tab_Charge"), tab_Exp = (UI.getChildControl)(Panel_AlchemyStone, "RadioButton_Tab_Exp"), tab_Upgrade = (UI.getChildControl)(Panel_AlchemyStone, "RadioButton_Tab_Upgrade"), contentBG = (UI.getChildControl)(Panel_AlchemyStone, "Static_ContentTypeBG"), contentEffect = (UI.getChildControl)(Panel_AlchemyStone, "Static_ContentTypeEffect"), guideString = (UI.getChildControl)(Panel_AlchemyStone, "Static_GuideText"), btn_Close = (UI.getChildControl)(Panel_AlchemyStone, "Button_Win_Close"), btn_Doit = (UI.getChildControl)(Panel_AlchemyStone, "Button_Doit"), slotBg_1 = (UI.getChildControl)(Panel_AlchemyStone, "Static_SlotBg_1"), slotBg_2 = (UI.getChildControl)(Panel_AlchemyStone, "Static_SlotBg_2"), Slot_1 = (UI.getChildControl)(Panel_AlchemyStone, "Static_Slot_1"), Slot_2 = (UI.getChildControl)(Panel_AlchemyStone, "Static_Slot_2"), needCount = (UI.getChildControl)(Panel_AlchemyStone, "Static_NeedCountTitle"), count = (UI.getChildControl)(Panel_AlchemyStone, "StaticText_NeedCount"), expMaterial = (UI.getChildControl)(Panel_AlchemyStone, "StaticText_ExpMaterial"), expMaterial2 = (UI.getChildControl)(Panel_AlchemyStone, "StaticText_ExpMaterial2"), btn_Plus = (UI.getChildControl)(Panel_AlchemyStone, "Button_CountPlus"), btn_Minus = (UI.getChildControl)(Panel_AlchemyStone, "Button_CountMinus"), descBg = (UI.getChildControl)(Panel_AlchemyStone, "Static_DescBg"), desc = (UI.getChildControl)(Panel_AlchemyStone, "StaticText_Desc"), progressBg_1 = (UI.getChildControl)(Panel_AlchemyStone, "Static_GaugeBG_1"), progress_1 = (UI.getChildControl)(Panel_AlchemyStone, "Progress2_Exp_Gauge_1"), progressText_1 = (UI.getChildControl)(Panel_AlchemyStone, "StaticText_Count_1"), progressBg_2 = (UI.getChildControl)(Panel_AlchemyStone, "Static_GaugeBG_2"), progress_2 = (UI.getChildControl)(Panel_AlchemyStone, "Progress2_Exp_Gauge_2"), progressText_2 = (UI.getChildControl)(Panel_AlchemyStone, "StaticText_Count_2"), resultSlot = (UI.getChildControl)(Panel_AlchemyStone, "Static_SlotBgTemplate"), resultSlotBg = (UI.getChildControl)(Panel_AlchemyStone, "Static_ResultSlotBg"), upgradeSlotBg = (UI.getChildControl)(Panel_AlchemyStone, "Static_UpgradeSlotBg")}
, 
slotConfig = {createIcon = true, createBorder = true, createCount = true, createCash = true}
, 
Stuff_slot = {}
, 
Stone_slot = {}
, 
resultSlot = {}
, 
resultSlotBg = {}
, selectedTabIdx = 0, selectedStoneType = 0, selectedStoneItemKey = nil, fromWhereType = -1, fromSlotNo = -1, fromCount = toInt64(0, -1), fromMaxCount = toInt64(0, -1), toWhereType = -1, toSlotNo = -1, toLostEndurance = 0, recoverCount = 0, maxRecoverCount = 0, chargePoint = 0, isPushDoit = false, doItType = -1, startEffectPlay = false, contentEffectPlay = false, slotEffectPlay = false, effectEnd = false, 
resultMsg = {}
, upgradeItem = nil, 
resultItemKey = {}
, resultItemIndex = -1}
local _buttonQuestion = (UI.getChildControl)(Panel_AlchemyStone, "Button_Question")
_buttonQuestion:addInputEvent("Mouse_LUp", "Panel_WebHelper_ShowToggle( \"AlchemyStone\" )")
_buttonQuestion:addInputEvent("Mouse_On", "HelpMessageQuestion_Show( \"AlchemyStone\", \"true\")")
_buttonQuestion:addInputEvent("Mouse_Out", "HelpMessageQuestion_Show( \"AlchemyStone\", \"false\")")
local AlchemyStoneTab = {Charge = 0, Exp = 1, Upgrade = 2}
local AlchemyStoneTabTexture = {
[AlchemyStoneTab.Charge] = {bg = "New_UI_Common_forLua/Window/AlchemyStone/AlchemyStone_Charge_BG.dds", effect = "New_UI_Common_forLua/Window/ChangeItem/ChangeItem_Effect1.dds"}
, 
[AlchemyStoneTab.Exp] = {bg = "New_UI_Common_forLua/Window/AlchemyStone/AlchemyStone_Exp_BG.dds", effect = "New_UI_Common_forLua/Window/AlchemyStone/AlchemyStone_Exp_Effect.dds"}
, 
[AlchemyStoneTab.Upgrade] = {bg = "New_UI_Common_forLua/Window/AlchemyStone/AlchemyStone_Upgrade_BG.dds", effect = "New_UI_Common_forLua/Window/AlchemyStone/AlchemyStone_Upgrade_Effect.dds"}
}
local alchemyStoneDesc = {[AlchemyStoneTab.Charge] = PAGetString(Defines.StringSheet_GAME, "LUA_ALCHEMYSTONE_DESC_1"), [AlchemyStoneTab.Exp] = PAGetString(Defines.StringSheet_GAME, "LUA_ALCHEMYSTONE_DESC_2"), [AlchemyStoneTab.Upgrade] = PAGetString(Defines.StringSheet_GAME, "LUA_ALCHEMYSTONE_DESC_3")}
local panelSizeY = Panel_AlchemyStone:GetSizeY()
local bgSizeY = ((AlchemyStone.control).descBg):GetSizeY()
local textSizeY = ((AlchemyStone.control).desc):GetTextSizeY()
;
((AlchemyStone.control).desc):SetTextMode((CppEnums.TextMode).eTextMode_AutoWrap)
AlchemyStone.Init = function(self)
  -- function num : 0_0
  (SlotItem.new)(self.Stuff_slot, "AlchemyStone_Stuff", 0, (self.control).Slot_1, self.slotConfig)
  ;
  (self.Stuff_slot):createChild()
  -- DECOMPILER ERROR at PC13: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self.Stuff_slot).Empty = true
  ;
  ((self.Stuff_slot).icon):addInputEvent("Mouse_RUp", "HandleClicked_AlchemyStone_UnSetSlot(" .. 1 .. ")")
  ;
  (SlotItem.new)(self.Stone_slot, "AlchemyStone_Stone", 0, (self.control).Slot_2, self.slotConfig)
  ;
  (self.Stone_slot):createChild()
  -- DECOMPILER ERROR at PC36: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self.Stone_slot).Empty = true
  ;
  ((self.Stone_slot).icon):addInputEvent("Mouse_RUp", "HandleClicked_AlchemyStone_UnSetSlot(" .. 0 .. ")")
  ;
  ((self.control).tab_Charge):SetCheck(true)
  ;
  ((self.control).tab_Exp):SetCheck(false)
  ;
  ((self.control).tab_Upgrade):SetCheck(false)
  local btnChargeSizeX = ((self.control).tab_Charge):GetSizeX() + 23
  local btnChargeTextPosX = btnChargeSizeX - btnChargeSizeX / 2 - ((self.control).tab_Charge):GetTextSizeX() / 2
  local btnExpSizeX = ((self.control).tab_Exp):GetSizeX() + 23
  local btnExpTextPosX = btnExpSizeX - btnExpSizeX / 2 - ((self.control).tab_Exp):GetTextSizeX() / 2
  local btnUpgradeSizeX = ((self.control).tab_Upgrade):GetSizeX() + 23
  local btnUpgradeTextPosX = btnUpgradeSizeX - btnUpgradeSizeX / 2 - ((self.control).tab_Upgrade):GetTextSizeX() / 2
  ;
  ((self.control).tab_Charge):SetTextSpan(btnChargeTextPosX, 5)
  ;
  ((self.control).tab_Exp):SetTextSpan(btnExpTextPosX, 5)
  ;
  ((self.control).tab_Upgrade):SetTextSpan(btnUpgradeTextPosX, 5)
  ;
  ((self.control).contentEffect):SetShow(false)
  local temp = {}
  for index = 0, 2 do
    temp[index] = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATIC, Panel_AlchemyStone, "AlchemyStone_SuccessResultSlot_" .. index)
    CopyBaseProperty((self.control).resultSlot, temp[index])
    self.resultSlotBg = temp
    -- DECOMPILER ERROR at PC147: Confused about usage of register: R12 in 'UnsetPending'

    ;
    (self.resultSlot)[index] = {}
    ;
    (SlotItem.new)((self.resultSlot)[index], "AlchemyStone_ResultSlot_" .. index, 0, (self.resultSlotBg)[index], self.slotConfig)
    ;
    ((self.resultSlot)[index]):createChild()
    -- DECOMPILER ERROR at PC166: Confused about usage of register: R12 in 'UnsetPending'

    ;
    ((self.resultSlot)[index]).Empty = true
    ;
    (((self.resultSlot)[index]).icon):SetPosX(5)
    ;
    (((self.resultSlot)[index]).icon):SetPosY(5)
  end
  self.upgradeItem = nil
end

AlchemyStone.registEventHandler = function(self)
  -- function num : 0_1 , upvalues : AlchemyStoneTab
  ((self.control).tab_Charge):addInputEvent("Mouse_LUp", "HandleClicked_AlchemyStoneTab( " .. AlchemyStoneTab.Charge .. " )")
  ;
  ((self.control).tab_Exp):addInputEvent("Mouse_LUp", "HandleClicked_AlchemyStoneTab( " .. AlchemyStoneTab.Exp .. " )")
  ;
  ((self.control).tab_Upgrade):addInputEvent("Mouse_LUp", "HandleClicked_AlchemyStoneTab( " .. AlchemyStoneTab.Upgrade .. " )")
  ;
  ((self.control).tab_Charge):addInputEvent("Mouse_On", "HandleClicked_AlchemyStoneTab_Tooltip( true, " .. AlchemyStoneTab.Charge .. " )")
  ;
  ((self.control).tab_Charge):addInputEvent("Mouse_Out", "HandleClicked_AlchemyStoneTab_Tooltip( false, " .. AlchemyStoneTab.Charge .. " )")
  ;
  ((self.control).tab_Charge):setTooltipEventRegistFunc("HandleClicked_AlchemyStoneTab_Tooltip( true, " .. AlchemyStoneTab.Charge .. " )")
  ;
  ((self.control).tab_Exp):addInputEvent("Mouse_On", "HandleClicked_AlchemyStoneTab_Tooltip( true, " .. AlchemyStoneTab.Exp .. " )")
  ;
  ((self.control).tab_Exp):addInputEvent("Mouse_Out", "HandleClicked_AlchemyStoneTab_Tooltip( false, " .. AlchemyStoneTab.Exp .. " )")
  ;
  ((self.control).tab_Exp):setTooltipEventRegistFunc("HandleClicked_AlchemyStoneTab_Tooltip( true, " .. AlchemyStoneTab.Exp .. " )")
  ;
  ((self.control).tab_Upgrade):addInputEvent("Mouse_On", "HandleClicked_AlchemyStoneTab_Tooltip( true, " .. AlchemyStoneTab.Upgrade .. " )")
  ;
  ((self.control).tab_Upgrade):addInputEvent("Mouse_Out", "HandleClicked_AlchemyStoneTab_Tooltip( false, " .. AlchemyStoneTab.Upgrade .. " )")
  ;
  ((self.control).tab_Upgrade):setTooltipEventRegistFunc("HandleClicked_AlchemyStoneTab_Tooltip( true, " .. AlchemyStoneTab.Upgrade .. " )")
  ;
  ((self.control).btn_Plus):addInputEvent("Mouse_LUp", "HandleClicked_AlchemyStone_ChangeStuffCount( true )")
  ;
  ((self.control).btn_Minus):addInputEvent("Mouse_LUp", "HandleClicked_AlchemyStone_ChangeStuffCount( false )")
  ;
  ((self.control).btn_Doit):addInputEvent("Mouse_LUp", "HandleClicked_AlchemyStone_Doit()")
  ;
  ((self.control).btn_Close):addInputEvent("Mouse_LUp", "HandleClicked_AlchemyStone_Close()")
end

AlchemyStone.registMessageHandler = function(self)
  -- function num : 0_2
  registerEvent("onScreenResize", "AlchemyStone_onScreenResize")
  registerEvent("FromClient_ItemUpgrade", "FromClient_ItemUpgrade")
  registerEvent("FromClient_StoneChange", "FromClient_StoneChange")
  registerEvent("FromClient_StoneChangeFailedByDown", "FromClient_StoneChangeFailedByDown")
  registerEvent("FromClient_AlchemyEvolve", "FromClient_AlchemyEvolve")
  registerEvent("FromClient_AlchemyRepair", "FromClient_AlchemyRepair")
  Panel_AlchemyStone:RegisterUpdateFunc("Panel_AlchemyStone_updateTime")
end

AlchemyStone.ClearData = function(self, isOpenStep)
  -- function num : 0_3 , upvalues : AlchemyStoneTab, AlchemyStone
  if isOpenStep == true then
    self.resultMsg = {}
  end
  self.toWhereType = -1
  self.toSlotNo = -1
  self.fromWhereType = -1
  self.fromSlotNo = -1
  self.fromCount = toInt64(0, -1)
  self.fromMaxCount = toInt64(0, -1)
  self.selectedStoneType = -1
  self.selectedStoneItemKey = nil
  self.toLostEndurance = 0
  self.recoverCount = 0
  self.maxRecoverCount = 0
  self.chargePoint = 0
  self.isPushDoit = false
  self.startEffectPlay = false
  self.contentEffectPlay = false
  self.slotEffectPlay = false
  self.effectEnd = false
  ;
  ((self.Stuff_slot).icon):EraseAllEffect()
  ;
  ((self.control).contentEffect):EraseAllEffect()
  ;
  ((self.Stone_slot).icon):EraseAllEffect()
  ;
  ((self.control).btn_Doit):SetMonoTone(not self.isPushDoit)
  ;
  ((self.control).btn_Doit):SetEnable(self.isPushDoit)
  ;
  (self.Stuff_slot):clearItem()
  ;
  (self.Stone_slot):clearItem()
  -- DECOMPILER ERROR at PC59: Confused about usage of register: R2 in 'UnsetPending'

  ;
  (self.Stuff_slot).Empty = true
  -- DECOMPILER ERROR at PC61: Confused about usage of register: R2 in 'UnsetPending'

  ;
  (self.Stone_slot).Empty = true
  ;
  ((self.resultSlot)[0]):clearItem()
  ;
  ((self.resultSlot)[1]):clearItem()
  ;
  ((self.resultSlot)[2]):clearItem()
  ;
  (((self.resultSlot)[0]).icon):addInputEvent("Mouse_On", "")
  ;
  (((self.resultSlot)[0]).icon):addInputEvent("Mouse_Out", "")
  ;
  (((self.resultSlot)[1]).icon):addInputEvent("Mouse_On", "")
  ;
  (((self.resultSlot)[1]).icon):addInputEvent("Mouse_Out", "")
  ;
  (((self.resultSlot)[2]).icon):addInputEvent("Mouse_On", "")
  ;
  (((self.resultSlot)[2]).icon):addInputEvent("Mouse_Out", "")
  ;
  ((self.control).progressBg_1):SetShow(false)
  ;
  ((self.control).progress_1):SetShow(false)
  ;
  ((self.control).progressText_1):SetShow(false)
  ;
  ((self.control).progressBg_2):SetShow(false)
  ;
  ((self.control).progress_2):SetShow(false)
  ;
  ((self.control).progressText_2):SetShow(false)
  ;
  ((self.control).count):SetShow(false)
  ;
  ((self.control).expMaterial):SetShow(false)
  ;
  ((self.control).expMaterial2):SetShow(false)
  ;
  ((self.control).progress_1):SetProgressRate(0)
  ;
  ((self.control).progress_2):SetProgressRate(0)
  ;
  ((self.control).contentEffect):SetShow(false)
  local guideKeyword = ""
  local guideText = ""
  if AlchemyStoneTab.Charge == self.selectedTabIdx then
    guideKeyword = PAGetString(Defines.StringSheet_GAME, "LUA_ALCHEMYSTONE_CHARGE")
    guideText = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_ALCHEMYSTONE_SELECT", "guideKeyword", guideKeyword)
  else
    if AlchemyStoneTab.Exp == self.selectedTabIdx then
      guideKeyword = PAGetString(Defines.StringSheet_GAME, "LUA_ALCHEMYSTONE_EXP")
      guideText = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_ALCHEMYSTONE_SELECT", "guideKeyword", guideKeyword)
    else
      if AlchemyStoneTab.Upgrade == self.selectedTabIdx then
        guideKeyword = PAGetString(Defines.StringSheet_GAME, "LUA_ALCHEMYSTONE_UPGRADE")
        guideText = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_ALCHEMYSTONE_SELECT", "guideKeyword", guideKeyword)
      end
    end
  end
  ;
  ((self.control).guideString):SetText(guideText)
  ;
  ((self.control).btn_Doit):SetText(guideKeyword)
  local btnDoitSizeX = ((self.control).btn_Doit):GetSizeX() + 23
  local btnDoitTextPosX = btnDoitSizeX - btnDoitSizeX / 2 - ((self.control).btn_Doit):GetTextSizeX() / 2
  ;
  ((self.control).btn_Doit):SetTextSpan(btnDoitTextPosX, 5)
  ;
  ((self.control).needCount):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_ALCHEMYSTONE_NEEDCOUNT"))
  ;
  ((AlchemyStone.control).count):SetShow(false)
  ;
  ((AlchemyStone.control).expMaterial):SetShow(false)
  ;
  ((AlchemyStone.control).expMaterial2):SetShow(false)
  AlchemyStone_TabButton_Enable(true)
  self.upgradeItem = nil
  self.resultItemKey = {}
  self.resultItemIndex = -1
end

HandleClicked_AlchemyStoneTab = function(tabIdx)
  -- function num : 0_4 , upvalues : AlchemyStone, AlchemyStoneTab, alchemyStoneDesc, panelSizeY, bgSizeY
  -- DECOMPILER ERROR at PC1: Confused about usage of register: R1 in 'UnsetPending'

  AlchemyStone.toWhereType = -1
  -- DECOMPILER ERROR at PC3: Confused about usage of register: R1 in 'UnsetPending'

  AlchemyStone.toSlotNo = -1
  -- DECOMPILER ERROR at PC5: Confused about usage of register: R1 in 'UnsetPending'

  AlchemyStone.fromWhereType = -1
  -- DECOMPILER ERROR at PC7: Confused about usage of register: R1 in 'UnsetPending'

  AlchemyStone.fromSlotNo = -1
  -- DECOMPILER ERROR at PC13: Confused about usage of register: R1 in 'UnsetPending'

  AlchemyStone.fromCount = toInt64(0, -1)
  -- DECOMPILER ERROR at PC19: Confused about usage of register: R1 in 'UnsetPending'

  AlchemyStone.fromMaxCount = toInt64(0, -1)
  -- DECOMPILER ERROR at PC21: Confused about usage of register: R1 in 'UnsetPending'

  AlchemyStone.selectedStoneType = -1
  -- DECOMPILER ERROR at PC23: Confused about usage of register: R1 in 'UnsetPending'

  AlchemyStone.selectedStoneItemKey = nil
  -- DECOMPILER ERROR at PC25: Confused about usage of register: R1 in 'UnsetPending'

  AlchemyStone.toLostEndurance = 0
  -- DECOMPILER ERROR at PC27: Confused about usage of register: R1 in 'UnsetPending'

  AlchemyStone.recoverCount = 0
  -- DECOMPILER ERROR at PC29: Confused about usage of register: R1 in 'UnsetPending'

  AlchemyStone.maxRecoverCount = 0
  -- DECOMPILER ERROR at PC31: Confused about usage of register: R1 in 'UnsetPending'

  AlchemyStone.chargePoint = 0
  ;
  (AlchemyStone.Stone_slot):clearItem()
  ;
  (AlchemyStone.Stuff_slot):clearItem()
  ;
  ((AlchemyStone.resultSlot)[0]):clearItem()
  ;
  ((AlchemyStone.resultSlot)[1]):clearItem()
  ;
  ((AlchemyStone.resultSlot)[2]):clearItem()
  -- DECOMPILER ERROR at PC57: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (AlchemyStone.Stone_slot).Empty = true
  -- DECOMPILER ERROR at PC60: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (AlchemyStone.Stuff_slot).Empty = true
  -- DECOMPILER ERROR at PC64: Confused about usage of register: R1 in 'UnsetPending'

  ;
  ((AlchemyStone.resultSlot)[0]).Empty = true
  -- DECOMPILER ERROR at PC68: Confused about usage of register: R1 in 'UnsetPending'

  ;
  ((AlchemyStone.resultSlot)[1]).Empty = true
  -- DECOMPILER ERROR at PC72: Confused about usage of register: R1 in 'UnsetPending'

  ;
  ((AlchemyStone.resultSlot)[2]).Empty = true
  ;
  ((AlchemyStone.Stone_slot).icon):addInputEvent("Mouse_On", "")
  ;
  ((AlchemyStone.Stone_slot).icon):addInputEvent("Mouse_Out", "")
  ;
  ((AlchemyStone.Stuff_slot).icon):addInputEvent("Mouse_On", "")
  ;
  ((AlchemyStone.Stuff_slot).icon):addInputEvent("Mouse_Out", "")
  ;
  (((AlchemyStone.resultSlot)[0]).icon):addInputEvent("Mouse_On", "")
  ;
  (((AlchemyStone.resultSlot)[0]).icon):addInputEvent("Mouse_Out", "")
  ;
  (((AlchemyStone.resultSlot)[1]).icon):addInputEvent("Mouse_On", "")
  ;
  (((AlchemyStone.resultSlot)[1]).icon):addInputEvent("Mouse_Out", "")
  ;
  (((AlchemyStone.resultSlot)[2]).icon):addInputEvent("Mouse_On", "")
  ;
  (((AlchemyStone.resultSlot)[2]).icon):addInputEvent("Mouse_Out", "")
  -- DECOMPILER ERROR at PC150: Confused about usage of register: R1 in 'UnsetPending'

  AlchemyStone.selectedTabIdx = tabIdx
  doItType = -1
  -- DECOMPILER ERROR at PC154: Confused about usage of register: R1 in 'UnsetPending'

  AlchemyStone.isPushDoit = false
  ;
  ((AlchemyStone.Stuff_slot).icon):EraseAllEffect()
  ;
  ((AlchemyStone.control).contentEffect):EraseAllEffect()
  ;
  ((AlchemyStone.Stone_slot).icon):EraseAllEffect()
  Inventory_SetFunctor(AlchemyStone_StoneFilter, AlchemyStone_StoneRfunction, nil, nil)
  ;
  ((AlchemyStone.control).needCount):SetShow(false)
  ;
  ((AlchemyStone.control).btn_Plus):SetShow(false)
  ;
  ((AlchemyStone.control).btn_Minus):SetShow(false)
  local guideKeyword = ""
  local guideText = ""
  if AlchemyStoneTab.Charge == tabIdx then
    guideKeyword = PAGetString(Defines.StringSheet_GAME, "LUA_ALCHEMYSTONE_CHARGE")
    guideText = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_ALCHEMYSTONE_SELECT", "guideKeyword", guideKeyword)
    ;
    ((AlchemyStone.control).needCount):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_ALCHEMYSTONE_NEEDCOUNT"))
    ;
    ((AlchemyStone.control).needCount):SetShow(true)
    ;
    ((AlchemyStone.control).btn_Plus):SetShow(true)
    ;
    ((AlchemyStone.control).btn_Minus):SetShow(true)
  else
    if AlchemyStoneTab.Exp == tabIdx then
      guideKeyword = PAGetString(Defines.StringSheet_GAME, "LUA_ALCHEMYSTONE_EXP")
      guideText = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_ALCHEMYSTONE_SELECT", "guideKeyword", guideKeyword)
      ;
      ((AlchemyStone.control).needCount):SetShow(true)
      ;
      ((AlchemyStone.control).needCount):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_ALCHEMYSTONE_MATERIALNAME"))
    else
      if AlchemyStoneTab.Upgrade == tabIdx then
        guideKeyword = PAGetString(Defines.StringSheet_GAME, "LUA_ALCHEMYSTONE_UPGRADE")
        guideText = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_ALCHEMYSTONE_SELECT", "guideKeyword", guideKeyword)
        ;
        ((AlchemyStone.control).needCount):SetShow(true)
        ;
        ((AlchemyStone.control).needCount):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_ALCHEMYSTONE_PENALTY"))
      end
    end
  end
  ;
  ((AlchemyStone.control).guideString):SetText(guideText)
  ;
  ((AlchemyStone.control).btn_Doit):SetText(guideKeyword)
  local btnDoitSizeX = ((AlchemyStone.control).btn_Doit):GetSizeX() + 23
  local btnDoitTextPosX = btnDoitSizeX - btnDoitSizeX / 2 - ((AlchemyStone.control).btn_Doit):GetTextSizeX() / 2
  ;
  ((AlchemyStone.control).btn_Doit):SetTextSpan(btnDoitTextPosX, 5)
  ;
  ((AlchemyStone.control).desc):SetText(alchemyStoneDesc[tabIdx])
  local _descTextSizeY = ((AlchemyStone.control).desc):GetTextSizeY()
  if _descTextSizeY > 35 then
    Panel_AlchemyStone:SetSize(Panel_AlchemyStone:GetSizeX(), panelSizeY + _descTextSizeY - 34)
    ;
    ((AlchemyStone.control).descBg):SetSize(((AlchemyStone.control).descBg):GetSizeX(), bgSizeY + _descTextSizeY - 34)
  else
    Panel_AlchemyStone:SetSize(Panel_AlchemyStone:GetSizeX(), panelSizeY)
    ;
    ((AlchemyStone.control).descBg):SetSize(((AlchemyStone.control).descBg):GetSizeX(), bgSizeY)
  end
  ;
  ((AlchemyStone.control).btn_Doit):ComputePos()
  if tabIdx == 0 or tabIdx == 1 then
    ((AlchemyStone.control).slotBg_1):SetPosX(50)
    ;
    ((AlchemyStone.control).slotBg_1):SetPosY(195)
    ;
    ((AlchemyStone.control).slotBg_2):SetPosX(380)
    ;
    ((AlchemyStone.control).slotBg_2):SetPosY(195)
    ;
    ((AlchemyStone.control).Slot_1):SetPosX(440)
    ;
    ((AlchemyStone.control).Slot_1):SetPosY(223)
    ;
    ((AlchemyStone.control).Slot_2):SetPosX(112)
    ;
    ((AlchemyStone.control).Slot_2):SetPosY(223)
    ;
    ((AlchemyStone.control).slotBg_1):SetShow(true)
    ;
    ((AlchemyStone.control).slotBg_2):SetShow(true)
    ;
    ((AlchemyStone.control).resultSlotBg):SetShow(false)
    ;
    ((AlchemyStone.resultSlotBg)[0]):SetShow(false)
    ;
    ((AlchemyStone.resultSlotBg)[1]):SetShow(false)
    ;
    ((AlchemyStone.resultSlotBg)[2]):SetShow(false)
    ;
    ((AlchemyStone.control).resultSlot):SetShow(true)
    ;
    ((AlchemyStone.control).resultSlot):SetPosX(436)
    ;
    ((AlchemyStone.control).resultSlot):SetPosY(218)
    ;
    ((AlchemyStone.control).upgradeSlotBg):SetShow(false)
  else
    if tabIdx == 2 then
      ((AlchemyStone.control).slotBg_1):SetPosX(50)
      ;
      ((AlchemyStone.control).slotBg_1):SetPosY(150)
      ;
      ((AlchemyStone.control).slotBg_2):SetPosX(50)
      ;
      ((AlchemyStone.control).slotBg_2):SetPosY(255)
      ;
      ((AlchemyStone.control).Slot_1):SetPosX(118)
      ;
      ((AlchemyStone.control).Slot_1):SetPosY(306)
      ;
      ((AlchemyStone.control).Slot_2):SetPosX(118)
      ;
      ((AlchemyStone.control).Slot_2):SetPosY(174)
      ;
      ((AlchemyStone.control).resultSlotBg):SetSize(((AlchemyStone.control).resultSlotBg):GetSizeX(), 98)
      ;
      ((AlchemyStone.control).slotBg_1):SetShow(false)
      ;
      ((AlchemyStone.control).slotBg_2):SetShow(false)
      ;
      ((AlchemyStone.control).resultSlotBg):SetShow(true)
      ;
      ((AlchemyStone.control).resultSlotBg):SetPosX(380)
      ;
      ((AlchemyStone.control).resultSlotBg):SetPosY(195)
      ;
      ((AlchemyStone.resultSlotBg)[0]):SetShow(true)
      ;
      ((AlchemyStone.resultSlotBg)[1]):SetShow(false)
      ;
      ((AlchemyStone.resultSlotBg)[2]):SetShow(false)
      ;
      ((AlchemyStone.control).resultSlot):SetShow(false)
      ;
      ((AlchemyStone.resultSlotBg)[0]):SetPosX(436)
      ;
      ((AlchemyStone.resultSlotBg)[0]):SetPosY(218)
      ;
      ((AlchemyStone.control).upgradeSlotBg):SetShow(true)
    end
  end
  ;
  ((AlchemyStone.control).progressBg_1):SetShow(false)
  ;
  ((AlchemyStone.control).progress_1):SetShow(false)
  ;
  ((AlchemyStone.control).progressText_1):SetShow(false)
  ;
  ((AlchemyStone.control).progressBg_2):SetShow(false)
  ;
  ((AlchemyStone.control).progress_2):SetShow(false)
  ;
  ((AlchemyStone.control).progressText_2):SetShow(false)
  ;
  ((AlchemyStone.control).count):SetShow(false)
  ;
  ((AlchemyStone.control).expMaterial):SetShow(false)
  ;
  ((AlchemyStone.control).expMaterial2):SetShow(false)
  ;
  ((AlchemyStone.control).progress_1):SetProgressRate(0)
  ;
  ((AlchemyStone.control).progress_2):SetProgressRate(0)
  ;
  ((AlchemyStone.control).btn_Doit):SetMonoTone(true)
  ;
  ((AlchemyStone.control).btn_Doit):SetEnable(false)
  -- DECOMPILER ERROR at PC731: Confused about usage of register: R6 in 'UnsetPending'

  AlchemyStone.resultItemKey = {}
  -- DECOMPILER ERROR at PC733: Confused about usage of register: R6 in 'UnsetPending'

  AlchemyStone.resultItemIndex = -1
  Panel_AlchemyStone:deleteConsoleUIGroup(1, true)
  local group_1 = Panel_AlchemyStone:addConsoleUIGroup(1, (CppEnums.PA_CONSOLE_UI_CONTROL_TYPE).eCONSOLE_UI_CONTROL_TYPE_NOTEVENT)
  if tabIdx == 0 then
    group_1:addControl(0, 0, 5, 1, (AlchemyStone.Stone_slot).icon)
    group_1:addControl(1, 0, 5, 1, (AlchemyStone.Stuff_slot).icon)
    group_1:addControl(2, 0, 5, 1, (AlchemyStone.control).btn_Plus)
    group_1:addControl(3, 0, 5, 1, (AlchemyStone.control).btn_Minus)
    group_1:addControl(4, 0, 5, 1, (AlchemyStone.control).btn_Doit)
  else
    if tabIdx == 1 then
      group_1:addControl(0, 0, 3, 1, (AlchemyStone.Stuff_slot).icon)
      group_1:addControl(1, 0, 3, 1, (AlchemyStone.Stone_slot).icon)
      group_1:addControl(2, 0, 3, 1, (AlchemyStone.control).btn_Doit)
    else
      if tabIdx == 2 then
        group_1:addControl(0, 0, 4, 1, (AlchemyStone.Stone_slot).icon)
        group_1:addControl(1, 0, 4, 1, (AlchemyStone.Stuff_slot).icon)
        group_1:addControl(2, 0, 4, 1, ((AlchemyStone.resultSlot)[0]).icon)
        group_1:addControl(3, 0, 4, 1, (AlchemyStone.control).btn_Doit)
      end
    end
  end
end

HandleClicked_AlchemyStone_ChangeStuffCount = function(isUp)
  -- function num : 0_5 , upvalues : AlchemyStone
  if AlchemyStone.fromCount < toInt64(0, 1) then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_ALCHEMYSTONE_NOTSETSTUFF"))
    return 
  end
  if isUp == true then
    if toInt64(0, AlchemyStone.maxRecoverCount) <= AlchemyStone.fromCount then
      Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_ALCHEMYSTONE_MAXCHARGECOUNT"))
      return 
    else
      if AlchemyStone.fromMaxCount <= AlchemyStone.fromCount then
        return 
      end
    end
    -- DECOMPILER ERROR at PC51: Confused about usage of register: R1 in 'UnsetPending'

    AlchemyStone.fromCount = AlchemyStone.fromCount + toInt64(0, 1)
  else
    if AlchemyStone.fromCount <= toInt64(0, 1) then
      Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_ALCHEMYSTONE_MUSTMOREONE"))
      return 
    end
    -- DECOMPILER ERROR at PC77: Confused about usage of register: R1 in 'UnsetPending'

    AlchemyStone.fromCount = AlchemyStone.fromCount - toInt64(0, 1)
  end
  ;
  ((AlchemyStone.Stuff_slot).count):SetText(tostring(AlchemyStone.fromCount))
end

HandleClicked_AlchemyStoneTab_Tooltip = function(isOn, buttonType)
  -- function num : 0_6 , upvalues : AlchemyStoneTab, AlchemyStone
  if isOn == true then
    local control = nil
    local name = ""
    local desc = ""
    if AlchemyStoneTab.Charge == buttonType then
      control = (AlchemyStone.control).tab_Charge
      name = PAGetString(Defines.StringSheet_RESOURCE, "PANEL_ALCHEMYSTONE_BTN_CHARGE")
      desc = PAGetString(Defines.StringSheet_GAME, "LUA_ALCHEMYSTONE_RADIO_0_TOOLTIP_DESC")
    else
      if AlchemyStoneTab.Exp == buttonType then
        control = (AlchemyStone.control).tab_Exp
        name = PAGetString(Defines.StringSheet_RESOURCE, "PANEL_ALCHEMYSTONE_BTN_EXP")
        desc = PAGetString(Defines.StringSheet_GAME, "LUA_ALCHEMYSTONE_RADIO_1_TOOLTIP_DESC")
      else
        if AlchemyStoneTab.Upgrade == buttonType then
          control = (AlchemyStone.control).tab_Upgrade
          name = PAGetString(Defines.StringSheet_RESOURCE, "PANEL_ALCHEMYSTONE_BTN_UPGRADE")
          desc = PAGetString(Defines.StringSheet_GAME, "LUA_ALCHEMYSTONE_RADIO_2_TOOLTIP_DESC")
        end
      end
    end
    registTooltipControl(control, Panel_Tooltip_SimpleText)
    TooltipSimple_Show(control, name, desc)
  else
    do
      TooltipSimple_Hide()
    end
  end
end

HandleClicked_AlchemyStone_Doit = function()
  -- function num : 0_7 , upvalues : AlchemyStone, AlchemyStoneTab
  local doUpgrade = function()
    -- function num : 0_7_0 , upvalues : AlchemyStone
    -- DECOMPILER ERROR at PC1: Confused about usage of register: R0 in 'UnsetPending'

    AlchemyStone.isPushDoit = true
  end

  local itemWrapper = getInventoryItemByType(AlchemyStone.toWhereType, AlchemyStone.toSlotNo)
  local itemSSW = itemWrapper:getStaticStatus()
  local itemGrade = itemSSW:getGradeType()
  local itemContentsParam2 = (itemSSW:get())._contentsEventParam2
  local msgTitle = PAGetString(Defines.StringSheet_GAME, "LUA_ALCHEMYSTONE_MSGBOX_TITLE")
  local msgContent = ""
  if AlchemyStone.selectedTabIdx == AlchemyStoneTab.Upgrade then
    if itemContentsParam2 == 3 or itemContentsParam2 == 4 then
      msgContent = PAGetString(Defines.StringSheet_GAME, "LUA_ALCHEMYSTONE_MSGBOX_CONTENT1")
    else
      if itemContentsParam2 == 5 or itemContentsParam2 == 6 then
        msgContent = PAGetString(Defines.StringSheet_GAME, "LUA_ALCHEMYSTONE_MSGBOX_CONTENT2")
      else
        -- DECOMPILER ERROR at PC58: Unhandled construct in 'MakeBoolean' P1

        if itemContentsParam2 == 7 and itemGrade < 3 then
          msgContent = PAGetString(Defines.StringSheet_GAME, "LUA_ALCHEMYSTONE_MSGBOX_CONTENT2")
        end
      end
    end
    -- DECOMPILER ERROR at PC61: Confused about usage of register: R7 in 'UnsetPending'

    AlchemyStone.isPushDoit = true
    if msgContent ~= "" then
      local messageBoxData = {title = msgTitle, content = msgContent, functionYes = doUpgrade, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
      ;
      (MessageBox.showMessageBox)(messageBoxData, "middle")
    end
  else
    do
      -- DECOMPILER ERROR at PC81: Confused about usage of register: R7 in 'UnsetPending'

      AlchemyStone.isPushDoit = true
      doItType = AlchemyStone.selectedTabIdx
      ;
      ((AlchemyStone.control).contentEffect):SetShow(true)
      ;
      ((AlchemyStone.control).btn_Doit):SetMonoTone(AlchemyStone.isPushDoit)
      ;
      ((AlchemyStone.control).btn_Doit):SetEnable(not AlchemyStone.isPushDoit)
      audioPostEvent_SystemUi(1, 43)
    end
  end
end

HandleClicked_AlchemyStone_Close = function()
  -- function num : 0_8 , upvalues : AlchemyStone
  Panel_AlchemyStone:SetShow(false)
  Panel_AlchemyStone:CloseUISubApp()
  -- DECOMPILER ERROR at PC8: Confused about usage of register: R0 in 'UnsetPending'

  AlchemyStone.toWhereType = -1
  -- DECOMPILER ERROR at PC10: Confused about usage of register: R0 in 'UnsetPending'

  AlchemyStone.toSlotNo = -1
  -- DECOMPILER ERROR at PC12: Confused about usage of register: R0 in 'UnsetPending'

  AlchemyStone.fromWhereType = -1
  -- DECOMPILER ERROR at PC14: Confused about usage of register: R0 in 'UnsetPending'

  AlchemyStone.fromSlotNo = -1
  -- DECOMPILER ERROR at PC20: Confused about usage of register: R0 in 'UnsetPending'

  AlchemyStone.fromCount = toInt64(0, -1)
  -- DECOMPILER ERROR at PC26: Confused about usage of register: R0 in 'UnsetPending'

  AlchemyStone.fromMaxCount = toInt64(0, -1)
  -- DECOMPILER ERROR at PC28: Confused about usage of register: R0 in 'UnsetPending'

  AlchemyStone.selectedStoneType = -1
  -- DECOMPILER ERROR at PC30: Confused about usage of register: R0 in 'UnsetPending'

  AlchemyStone.selectedStoneItemKey = nil
  -- DECOMPILER ERROR at PC32: Confused about usage of register: R0 in 'UnsetPending'

  AlchemyStone.isPushDoit = false
  -- DECOMPILER ERROR at PC34: Confused about usage of register: R0 in 'UnsetPending'

  AlchemyStone.toLostEndurance = 0
  -- DECOMPILER ERROR at PC36: Confused about usage of register: R0 in 'UnsetPending'

  AlchemyStone.recoverCount = 0
  -- DECOMPILER ERROR at PC38: Confused about usage of register: R0 in 'UnsetPending'

  AlchemyStone.maxRecoverCount = 0
  -- DECOMPILER ERROR at PC40: Confused about usage of register: R0 in 'UnsetPending'

  AlchemyStone.chargePoint = 0
  doItType = -1
  if Panel_Window_Inventory:GetShow() then
    Inventory_SetFunctor(nil, nil, nil, nil)
    Equipment_SetShow(true)
  end
end

HandleClicked_AlchemyStone_UnSetSlot = function(slotType)
  -- function num : 0_9 , upvalues : AlchemyStone, AlchemyStoneTab
  -- DECOMPILER ERROR at PC10: Unhandled construct in 'MakeBoolean' P1

  if slotType == 0 and (AlchemyStone.Stone_slot).Empty == false then
    (AlchemyStone.Stone_slot):clearItem()
    -- DECOMPILER ERROR at PC13: Confused about usage of register: R1 in 'UnsetPending'

    ;
    (AlchemyStone.Stone_slot).Empty = true
    ;
    (AlchemyStone.Stuff_slot):clearItem()
    -- DECOMPILER ERROR at PC20: Confused about usage of register: R1 in 'UnsetPending'

    ;
    (AlchemyStone.Stuff_slot).Empty = true
    ;
    ((AlchemyStone.control).progressBg_1):SetShow(false)
    ;
    ((AlchemyStone.control).progress_1):SetShow(false)
    ;
    ((AlchemyStone.control).progressText_1):SetShow(false)
    ;
    ((AlchemyStone.control).progressBg_2):SetShow(false)
    ;
    ((AlchemyStone.control).progress_2):SetShow(false)
    ;
    ((AlchemyStone.control).progressText_2):SetShow(false)
    ;
    ((AlchemyStone.control).count):SetShow(false)
    ;
    ((AlchemyStone.control).expMaterial):SetShow(false)
    ;
    ((AlchemyStone.control).expMaterial2):SetShow(false)
    ;
    ((AlchemyStone.control).progress_1):SetProgressRate(0)
    ;
    ((AlchemyStone.control).progress_2):SetProgressRate(0)
    ;
    ((AlchemyStone.Stone_slot).icon):addInputEvent("Mouse_On", "")
    ;
    ((AlchemyStone.Stone_slot).icon):addInputEvent("Mouse_Out", "")
    ;
    ((AlchemyStone.Stuff_slot).icon):addInputEvent("Mouse_On", "")
    ;
    ((AlchemyStone.Stuff_slot).icon):addInputEvent("Mouse_Out", "")
    ;
    ((AlchemyStone.control).btn_Doit):SetMonoTone(true)
    ;
    ((AlchemyStone.control).btn_Doit):SetEnable(false)
    ;
    ((AlchemyStone.control).resultSlotBg):SetSize(((AlchemyStone.control).resultSlotBg):GetSizeX(), 98)
    ;
    ((AlchemyStone.control).resultSlotBg):SetShow(false)
    ;
    ((AlchemyStone.control).resultSlotBg):SetPosX(380)
    ;
    ((AlchemyStone.control).resultSlotBg):SetPosY(195)
    ;
    ((AlchemyStone.resultSlotBg)[0]):SetShow(false)
    ;
    ((AlchemyStone.resultSlotBg)[0]):SetPosX(437)
    ;
    ((AlchemyStone.resultSlotBg)[0]):SetPosY(218)
    ;
    ((AlchemyStone.resultSlotBg)[1]):SetShow(false)
    ;
    ((AlchemyStone.resultSlotBg)[2]):SetShow(false)
    ;
    ((AlchemyStone.resultSlot)[0]):clearItem()
    -- DECOMPILER ERROR at PC194: Confused about usage of register: R1 in 'UnsetPending'

    ;
    ((AlchemyStone.resultSlot)[0]).Empty = true
    ;
    ((AlchemyStone.resultSlot)[1]):clearItem()
    -- DECOMPILER ERROR at PC203: Confused about usage of register: R1 in 'UnsetPending'

    ;
    ((AlchemyStone.resultSlot)[1]).Empty = true
    ;
    ((AlchemyStone.resultSlot)[2]):clearItem()
    -- DECOMPILER ERROR at PC212: Confused about usage of register: R1 in 'UnsetPending'

    ;
    ((AlchemyStone.resultSlot)[2]).Empty = true
    ;
    (((AlchemyStone.resultSlot)[0]).icon):addInputEvent("Mouse_On", "")
    ;
    (((AlchemyStone.resultSlot)[0]).icon):addInputEvent("Mouse_Out", "")
    ;
    (((AlchemyStone.resultSlot)[1]).icon):addInputEvent("Mouse_On", "")
    ;
    (((AlchemyStone.resultSlot)[1]).icon):addInputEvent("Mouse_Out", "")
    ;
    (((AlchemyStone.resultSlot)[2]).icon):addInputEvent("Mouse_On", "")
    ;
    (((AlchemyStone.resultSlot)[2]).icon):addInputEvent("Mouse_Out", "")
    Inventory_SetFunctor(AlchemyStone_StoneFilter, AlchemyStone_StoneRfunction, nil, nil)
    if Panel_Window_Exchange_Number:GetShow() then
      Panel_NumberPad_ButtonCancel_Mouse_Click()
    end
  end
  if (AlchemyStone.Stuff_slot).Empty == false then
    (AlchemyStone.Stuff_slot):clearItem()
    -- DECOMPILER ERROR at PC285: Confused about usage of register: R1 in 'UnsetPending'

    ;
    (AlchemyStone.Stuff_slot).Empty = true
    ;
    ((AlchemyStone.Stuff_slot).icon):addInputEvent("Mouse_On", "")
    ;
    ((AlchemyStone.Stuff_slot).icon):addInputEvent("Mouse_Out", "")
    ;
    ((AlchemyStone.control).btn_Doit):SetMonoTone(true)
    ;
    ((AlchemyStone.control).btn_Doit):SetEnable(false)
    ;
    ((AlchemyStone.control).count):SetShow(false)
    ;
    ((AlchemyStone.control).expMaterial):SetShow(false)
    ;
    ((AlchemyStone.control).expMaterial2):SetShow(false)
    Inventory_SetFunctor(AlchemyStone_StuffFilter, AlchemyStone_StuffRfunction, nil, nil)
  end
  if AlchemyStoneTab.Upgrade == AlchemyStone.selectedTabIdx then
    ((AlchemyStone.control).resultSlotBg):SetShow(true)
    ;
    ((AlchemyStone.resultSlotBg)[0]):SetShow(true)
  end
  -- DECOMPILER ERROR at PC355: Confused about usage of register: R1 in 'UnsetPending'

  AlchemyStone.resultItemKey = {}
  -- DECOMPILER ERROR at PC357: Confused about usage of register: R1 in 'UnsetPending'

  AlchemyStone.resultItemIndex = -1
end

AlchemyStone_ItemToolTip = function(isShow, slotType)
  -- function num : 0_10 , upvalues : AlchemyStone
  if isShow == true then
    local control, itemWrapper = nil, nil
    if slotType == 0 then
      control = (AlchemyStone.Stone_slot).icon
      if AlchemyStone.toWhereType ~= -1 then
        itemWrapper = getInventoryItemByType(AlchemyStone.toWhereType, AlchemyStone.toSlotNo)
        Panel_Tooltip_Item_Show(itemWrapper, control, false, true, nil, nil, nil)
      else
        return 
      end
    else
      control = (AlchemyStone.Stuff_slot).icon
      if AlchemyStone.fromWhereType ~= -1 then
        itemWrapper = getInventoryItemByType(AlchemyStone.fromWhereType, AlchemyStone.fromSlotNo)
        Panel_Tooltip_Item_Show(itemWrapper, control, false, true, nil, nil, nil)
      else
        return 
      end
    end
  else
    do
      Panel_Tooltip_Item_hideTooltip()
    end
  end
end

AlchemyStone_ResultItemTooltip = function(isShow, index)
  -- function num : 0_11 , upvalues : AlchemyStone
  if not isShow then
    Panel_Tooltip_Item_hideTooltip()
    return 
  end
  local itemWrapper = getInventoryItemByType(AlchemyStone.toWhereType, AlchemyStone.toSlotNo)
  if itemWrapper ~= nil then
    local itemSSW = itemWrapper:getStaticStatus()
    local resultItemWrapper = getAlchemyEvolveItemStaticStatusWrapper(((itemSSW:get())._key):getItemKey(), index)
    Panel_Tooltip_Item_Show(resultItemWrapper, ((AlchemyStone.resultSlot)[index]).icon, true, false, nil, nil, nil)
  end
end

AlchemyStone_StoneFilter = function(slotNo, itemWrapper, count, inventoryType)
  -- function num : 0_12 , upvalues : AlchemyStone
  local returnValue = true
  if itemWrapper:getStaticStatus() == nil then
    return returnValue
  end
  if ((itemWrapper:getStaticStatus()):get()):getContentsEventType() == 32 then
    if ((AlchemyStone.control).tab_Upgrade):IsCheck() then
      local itemContentsParam2 = ((itemWrapper:getStaticStatus()):get())._contentsEventParam2
      if itemContentsParam2 == 7 then
        returnValue = true
      else
        returnValue = false
      end
    else
      do
        if ((AlchemyStone.control).tab_Charge):IsCheck() then
          if (itemWrapper:get()):getEndurance() == (itemWrapper:get()):getMaxEndurance() then
            returnValue = true
          else
            returnValue = false
          end
        else
          returnValue = false
        end
        return returnValue
      end
    end
  end
end

AlchemyStone_StoneRfunction = function(slotNo, itemWrapper, count, inventoryType)
  -- function num : 0_13 , upvalues : AlchemyStone, AlchemyStoneTab
  -- DECOMPILER ERROR at PC1: Confused about usage of register: R4 in 'UnsetPending'

  AlchemyStone.toWhereType = inventoryType
  -- DECOMPILER ERROR at PC3: Confused about usage of register: R4 in 'UnsetPending'

  AlchemyStone.toSlotNo = slotNo
  -- DECOMPILER ERROR at PC10: Confused about usage of register: R4 in 'UnsetPending'

  AlchemyStone.selectedStoneType = ((itemWrapper:getStaticStatus()):get())._contentsEventParam1
  -- DECOMPILER ERROR at PC16: Confused about usage of register: R4 in 'UnsetPending'

  AlchemyStone.selectedStoneItemKey = (itemWrapper:get()):getKey()
  -- DECOMPILER ERROR at PC24: Confused about usage of register: R4 in 'UnsetPending'

  AlchemyStone.recoverCount = ((itemWrapper:getStaticStatus()):get()):getAlchemyStoneGrade()
  ;
  (AlchemyStone.Stone_slot):setItem(itemWrapper)
  -- DECOMPILER ERROR at PC32: Confused about usage of register: R4 in 'UnsetPending'

  ;
  (AlchemyStone.Stone_slot).Empty = false
  local currentEndurance = (itemWrapper:get()):getEndurance()
  local maxEndurance = (itemWrapper:get()):getMaxEndurance()
  local alchemystoneExp = itemWrapper:getExperience() / 10000
  local itemSSW = itemWrapper:getStaticStatus()
  local itemContentsParam1 = (itemSSW:get())._contentsEventParam1
  -- DECOMPILER ERROR at PC51: Confused about usage of register: R9 in 'UnsetPending'

  AlchemyStone.toLostEndurance = maxEndurance - currentEndurance
  ;
  ((AlchemyStone.Stone_slot).icon):addInputEvent("Mouse_On", "AlchemyStone_ItemToolTip( true, " .. 0 .. " )")
  ;
  ((AlchemyStone.Stone_slot).icon):addInputEvent("Mouse_Out", "AlchemyStone_ItemToolTip( false )")
  Inventory_SetFunctor(AlchemyStone_StuffFilter, AlchemyStone_StuffRfunction, nil, nil)
  ;
  ((AlchemyStone.control).count):SetShow(false)
  ;
  ((AlchemyStone.control).expMaterial):SetShow(false)
  ;
  ((AlchemyStone.control).expMaterial2):SetShow(false)
  local guideText = ""
  if AlchemyStoneTab.Charge == AlchemyStone.selectedTabIdx then
    guideText = PAGetString(Defines.StringSheet_GAME, "LUA_ALCHEMYSTONE_SELECT_CHARGE")
    ;
    ((AlchemyStone.control).progressBg_2):SetShow(false)
    ;
    ((AlchemyStone.control).progress_2):SetShow(false)
    ;
    ((AlchemyStone.control).progressText_2):SetShow(false)
    ;
    ((AlchemyStone.control).progressBg_1):SetShow(true)
    ;
    ((AlchemyStone.control).progress_1):SetShow(true)
    ;
    ((AlchemyStone.control).progressText_1):SetShow(true)
    ;
    ((AlchemyStone.control).progress_1):SetProgressRate(currentEndurance / maxEndurance * 100)
    local endurancePoint = currentEndurance .. " / " .. maxEndurance
    ;
    ((AlchemyStone.control).progressText_1):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_ALCHEMYSTONE_ENDURANCE", "endurance", endurancePoint))
  else
    do
      if AlchemyStoneTab.Exp == AlchemyStone.selectedTabIdx then
        guideText = PAGetString(Defines.StringSheet_GAME, "LUA_ALCHEMYSTONE_SELECT_EXP")
        ;
        ((AlchemyStone.control).progressBg_1):SetShow(false)
        ;
        ((AlchemyStone.control).progress_1):SetShow(false)
        ;
        ((AlchemyStone.control).progressText_1):SetShow(false)
        ;
        ((AlchemyStone.control).progressBg_2):SetShow(true)
        ;
        ((AlchemyStone.control).progress_2):SetShow(true)
        ;
        ((AlchemyStone.control).progressText_2):SetShow(true)
        ;
        ((AlchemyStone.control).progress_2):SetProgressRate(alchemystoneExp)
        local _exp = (string.format)("%.2f", alchemystoneExp)
        ;
        ((AlchemyStone.control).progressText_2):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_ALCHEMYSTONE_EXPERIENCE", "exp", _exp))
        ;
        ((AlchemyStone.control).expMaterial):SetShow(true)
        ;
        ((AlchemyStone.control).expMaterial2):SetShow(true)
        if itemContentsParam1 == 0 then
          ((AlchemyStone.control).expMaterial):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_ALCHEMYSTONE_PURESTONE"))
          ;
          ((AlchemyStone.control).expMaterial2):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_ALCHEMYSTONE_PURESTONE2"))
        else
          if itemContentsParam1 == 1 then
            ((AlchemyStone.control).expMaterial):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_ALCHEMYSTONE_HARDWOOD"))
            ;
            ((AlchemyStone.control).expMaterial2):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_ALCHEMYSTONE_HARDWOOD2"))
          else
            if itemContentsParam1 == 2 then
              ((AlchemyStone.control).expMaterial):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_ALCHEMYSTONE_CHOICEGOOD"))
              ;
              ((AlchemyStone.control).expMaterial2):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_ALCHEMYSTONE_CHOICEGOOD2"))
            end
          end
        end
      else
        do
          if AlchemyStoneTab.Upgrade == AlchemyStone.selectedTabIdx then
            guideText = PAGetString(Defines.StringSheet_GAME, "LUA_ALCHEMYSTONE_SELECT_UPGRADE")
            ;
            ((AlchemyStone.control).progressBg_1):SetShow(false)
            ;
            ((AlchemyStone.control).progress_1):SetShow(false)
            ;
            ((AlchemyStone.control).progressText_1):SetShow(false)
            ;
            ((AlchemyStone.control).progressBg_2):SetShow(false)
            ;
            ((AlchemyStone.control).progress_2):SetShow(false)
            ;
            ((AlchemyStone.control).progressText_2):SetShow(false)
            ;
            ((AlchemyStone.control).expMaterial):SetShow(true)
            ;
            ((AlchemyStone.control).expMaterial2):SetShow(false)
            local itemWrapper = getInventoryItemByType(AlchemyStone.toWhereType, AlchemyStone.toSlotNo)
            local itemSSW = itemWrapper:getStaticStatus()
            local itemGrade = itemSSW:getGradeType()
            local itemContentsParam2 = (itemSSW:get())._contentsEventParam2
            local resultCount = getAlchemyEvolveItemSize(((itemSSW:get())._key):getItemKey())
            local resultAlchemyStone = {}
            for index = 0, 2 do
              if index < resultCount then
                local resultItemWrapper = getAlchemyEvolveItemStaticStatusWrapper(((itemSSW:get())._key):getItemKey(), index)
                ;
                ((AlchemyStone.resultSlot)[index]):setItemByStaticStatus(resultItemWrapper, 1, nil, nil, nil)
                ;
                (((AlchemyStone.resultSlot)[index]).icon):addInputEvent("Mouse_On", "AlchemyStone_ResultItemTooltip(true, " .. index .. ")")
                ;
                (((AlchemyStone.resultSlot)[index]).icon):addInputEvent("Mouse_Out", "AlchemyStone_ResultItemTooltip(false, " .. index .. ")")
                ;
                ((AlchemyStone.resultSlotBg)[index]):SetShow(true)
                -- DECOMPILER ERROR at PC455: Confused about usage of register: R21 in 'UnsetPending'

                ;
                (AlchemyStone.resultItemKey)[index] = ((resultItemWrapper:get())._key):getItemKey()
              else
                do
                  do
                    ;
                    ((AlchemyStone.resultSlotBg)[index]):SetShow(false)
                    -- DECOMPILER ERROR at PC463: LeaveBlock: unexpected jumping out DO_STMT

                    -- DECOMPILER ERROR at PC463: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                    -- DECOMPILER ERROR at PC463: LeaveBlock: unexpected jumping out IF_STMT

                  end
                end
              end
            end
            if itemContentsParam2 <= 2 then
              ((AlchemyStone.control).expMaterial):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_ALCHEMYSTONE_EXPDOWN"))
            else
              if itemContentsParam2 <= 4 then
                ((AlchemyStone.control).expMaterial):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_ALCHEMYSTONE_EXPDOWN") .. "\n" .. PAGetString(Defines.StringSheet_GAME, "LUA_ALCHEMYSTONE_GRADEDOWN"))
              else
                if itemContentsParam2 <= 6 then
                  ((AlchemyStone.control).expMaterial):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_ALCHEMYSTONE_EXPDOWN") .. "\n" .. PAGetString(Defines.StringSheet_GAME, "LUA_ALCHEMYSTONE_STONEDESTROY"))
                end
              end
            end
            if resultCount == 1 then
              ((AlchemyStone.control).resultSlotBg):SetSize(((AlchemyStone.control).resultSlotBg):GetSizeX(), 98)
              ;
              ((AlchemyStone.control).resultSlotBg):SetPosX(380)
              ;
              ((AlchemyStone.control).resultSlotBg):SetPosY(195)
              ;
              ((AlchemyStone.resultSlotBg)[0]):SetPosX(437)
              ;
              ((AlchemyStone.resultSlotBg)[0]):SetPosY(218)
            else
              if resultCount == 2 then
                ((AlchemyStone.control).resultSlotBg):SetSize(((AlchemyStone.control).resultSlotBg):GetSizeX(), 158)
                ;
                ((AlchemyStone.control).resultSlotBg):SetPosX(380)
                ;
                ((AlchemyStone.control).resultSlotBg):SetPosY(135)
                ;
                ((AlchemyStone.resultSlotBg)[0]):SetPosX(437)
                ;
                ((AlchemyStone.resultSlotBg)[0]):SetPosY(188)
                ;
                ((AlchemyStone.resultSlotBg)[1]):SetPosX(437)
                ;
                ((AlchemyStone.resultSlotBg)[1]):SetPosY(248)
              else
                if resultCount == 3 then
                  ((AlchemyStone.control).resultSlotBg):SetSize(((AlchemyStone.control).resultSlotBg):GetSizeX(), 218)
                  ;
                  ((AlchemyStone.control).resultSlotBg):SetPosX(380)
                  ;
                  ((AlchemyStone.control).resultSlotBg):SetPosY(135)
                  ;
                  ((AlchemyStone.resultSlotBg)[0]):SetPosX(437)
                  ;
                  ((AlchemyStone.resultSlotBg)[0]):SetPosY(158)
                  ;
                  ((AlchemyStone.resultSlotBg)[1]):SetPosX(437)
                  ;
                  ((AlchemyStone.resultSlotBg)[1]):SetPosY(218)
                  ;
                  ((AlchemyStone.resultSlotBg)[2]):SetPosX(437)
                  ;
                  ((AlchemyStone.resultSlotBg)[2]):SetPosY(278)
                end
              end
            end
            Panel_AlchemyStone:deleteConsoleUIGroup(1)
            local group_1 = Panel_AlchemyStone:addConsoleUIGroup(1, (CppEnums.PA_CONSOLE_UI_CONTROL_TYPE).eCONSOLE_UI_CONTROL_TYPE_NOTEVENT)
            if resultCount == 1 then
              group_1:addControl(0, 0, 4, 1, (AlchemyStone.Stone_slot).icon)
              group_1:addControl(1, 0, 4, 1, (AlchemyStone.Stuff_slot).icon)
              group_1:addControl(2, 0, 4, 1, ((AlchemyStone.resultSlot)[0]).icon)
              group_1:addControl(3, 0, 4, 1, (AlchemyStone.control).btn_Doit)
            else
              if resultCount == 2 then
                group_1:addControl(0, 0, 5, 1, (AlchemyStone.Stone_slot).icon)
                group_1:addControl(1, 0, 5, 1, (AlchemyStone.Stuff_slot).icon)
                group_1:addControl(2, 0, 5, 1, ((AlchemyStone.resultSlot)[0]).icon)
                group_1:addControl(3, 0, 5, 1, ((AlchemyStone.resultSlot)[1]).icon)
                group_1:addControl(4, 0, 5, 1, (AlchemyStone.control).btn_Doit)
              else
                group_1:addControl(0, 0, 6, 1, (AlchemyStone.Stone_slot).icon)
                group_1:addControl(1, 0, 6, 1, (AlchemyStone.Stuff_slot).icon)
                group_1:addControl(2, 0, 6, 1, ((AlchemyStone.resultSlot)[0]).icon)
                group_1:addControl(3, 0, 6, 1, ((AlchemyStone.resultSlot)[1]).icon)
                group_1:addControl(4, 0, 6, 1, ((AlchemyStone.resultSlot)[2]).icon)
                group_1:addControl(5, 0, 6, 1, (AlchemyStone.control).btn_Doit)
              end
            end
          end
          do
            ;
            ((AlchemyStone.control).guideString):SetText(guideText)
          end
        end
      end
    end
  end
end

AlchemyStone_StuffFilter = function(slotNo, itemWrapper, count, inventoryType)
  -- function num : 0_14 , upvalues : AlchemyStone, AlchemyStoneTab
  local returnValue = true
  local staticStatus = itemWrapper:getStaticStatus()
  if staticStatus == nil or AlchemyStone.selectedStoneType == -1 then
    return returnValue
  end
  if AlchemyStoneTab.Charge == AlchemyStone.selectedTabIdx and staticStatus:isAlchemyRepair(AlchemyStone.selectedStoneType) then
    returnValue = false
  end
  if AlchemyStoneTab.Exp == AlchemyStone.selectedTabIdx and staticStatus:isAlchemyUpgradeItem(AlchemyStone.selectedStoneType) then
    returnValue = false
  end
  do
    if AlchemyStoneTab.Upgrade == AlchemyStone.selectedTabIdx then
      local itemKey = (itemWrapper:get()):getKey()
      if staticStatus:isAlchemyUpgradeMaterial(AlchemyStone.selectedStoneItemKey) then
        returnValue = false
      end
    end
    return returnValue
  end
end

AlchemyStone_StuffRfunction = function(slotNo, itemWrapper, count, inventoryType)
  -- function num : 0_15 , upvalues : AlchemyStone, AlchemyStoneTab
  -- DECOMPILER ERROR at PC1: Confused about usage of register: R4 in 'UnsetPending'

  AlchemyStone.fromWhereType = inventoryType
  -- DECOMPILER ERROR at PC3: Confused about usage of register: R4 in 'UnsetPending'

  AlchemyStone.fromSlotNo = slotNo
  -- DECOMPILER ERROR at PC5: Confused about usage of register: R4 in 'UnsetPending'

  AlchemyStone.fromCount = count
  -- DECOMPILER ERROR at PC7: Confused about usage of register: R4 in 'UnsetPending'

  AlchemyStone.fromMaxCount = count
  local itemSSW = itemWrapper:getStaticStatus()
  local itemKey = (itemSSW:get())._key
  local guideText = ""
  local setStuffFunc = function(itemCount)
    -- function num : 0_15_0 , upvalues : AlchemyStone, itemKey, guideText
    -- DECOMPILER ERROR at PC1: Confused about usage of register: R1 in 'UnsetPending'

    AlchemyStone.fromCount = itemCount
    local itemSSW = getItemEnchantStaticStatus(itemKey)
    ;
    (AlchemyStone.Stuff_slot):setItemByStaticStatus(itemSSW, AlchemyStone.fromCount, nil, nil, nil)
    -- DECOMPILER ERROR at PC15: Confused about usage of register: R2 in 'UnsetPending'

    ;
    (AlchemyStone.Stuff_slot).Empty = false
    ;
    ((AlchemyStone.Stuff_slot).icon):addInputEvent("Mouse_On", "AlchemyStone_ItemToolTip( true, " .. 1 .. " )")
    ;
    ((AlchemyStone.Stuff_slot).icon):addInputEvent("Mouse_Out", "AlchemyStone_ItemToolTip( false )")
    ;
    ((AlchemyStone.control).btn_Doit):SetMonoTone(AlchemyStone.isPushDoit)
    ;
    ((AlchemyStone.control).btn_Doit):SetEnable(not AlchemyStone.isPushDoit)
    ;
    ((AlchemyStone.control).guideString):SetText(guideText)
  end

  ;
  ((AlchemyStone.control).count):SetShow(false)
  if AlchemyStoneTab.Charge == AlchemyStone.selectedTabIdx then
    guideText = PAGetString(Defines.StringSheet_GAME, "LUA_ALCHEMYSTONE_DOIT_CHARGE")
    -- DECOMPILER ERROR at PC47: Confused about usage of register: R8 in 'UnsetPending'

    AlchemyStone.chargePoint = ToClient_GetAlchmeyStoneChargePoint(AlchemyStone.toWhereType, AlchemyStone.toSlotNo, AlchemyStone.fromWhereType, AlchemyStone.fromSlotNo)
    -- DECOMPILER ERROR at PC60: Confused about usage of register: R8 in 'UnsetPending'

    AlchemyStone.maxRecoverCount = (math.ceil)(AlchemyStone.toLostEndurance / AlchemyStone.chargePoint) * AlchemyStone.recoverCount
    local string = PAGetStringParam3(Defines.StringSheet_GAME, "LUA_ALCHEMYSTONE_NEEDMAXCHARGECOUNT", "count1", AlchemyStone.maxRecoverCount, "count2", AlchemyStone.recoverCount, "count3", AlchemyStone.chargePoint)
    ;
    ((AlchemyStone.control).count):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_ALCHEMYSTONE_NEEDMATERIALCOUNT", "count", AlchemyStone.maxRecoverCount))
    ;
    ((AlchemyStone.control).count):SetShow(true)
  else
    do
      if AlchemyStoneTab.Exp == AlchemyStone.selectedTabIdx then
        guideText = PAGetString(Defines.StringSheet_GAME, "LUA_ALCHEMYSTONE_DOIT_EXP")
      else
        if AlchemyStoneTab.Upgrade == AlchemyStone.selectedTabIdx then
          guideText = PAGetString(Defines.StringSheet_GAME, "LUA_ALCHEMYSTONE_DOIT_UPGRADE")
        end
      end
      if toInt64(0, 1) < count then
        Panel_NumberPad_Show(true, count, nil, setStuffFunc, false, nil, nil)
      else
        setStuffFunc(toInt64(0, 1))
      end
    end
  end
end

FGlobal_AlchemyStone_Open = function()
  -- function num : 0_16 , upvalues : AlchemyStone
  local isAlchemyStoneEnble = ToClient_IsContentsGroupOpen("35")
  if not isAlchemyStoneEnble then
    return 
  end
  if Panel_AlchemyFigureHead:GetShow() then
    FGlobal_AlchemyFigureHead_Close()
  end
  if Panel_Manufacture:GetShow() then
    Manufacture_Close()
  end
  if Panel_DyePalette:GetShow() then
    FGlobal_DyePalette_Close()
  end
  FGlobal_SetInventoryDragNoUse(Panel_AlchemyStone)
  Panel_AlchemyStone:SetShow(true)
  ;
  ((AlchemyStone.control).tab_Charge):SetCheck(true)
  ;
  ((AlchemyStone.control).tab_Exp):SetCheck(false)
  ;
  ((AlchemyStone.control).tab_Upgrade):SetCheck(false)
  AlchemyStone:ClearData(true)
  HandleClicked_AlchemyStoneTab(0)
  doItType = 0
  if Panel_Window_Inventory:IsUISubApp() then
    Panel_AlchemyStone:OpenUISubApp()
  end
  if Panel_Equipment:GetShow() then
    EquipmentWindow_Close()
  end
  InventoryWindow_Show()
  Inventory_SetFunctor(AlchemyStone_StoneFilter, AlchemyStone_StoneRfunction, nil, nil)
end

FGlobal_AlchemyStone_Close = function()
  -- function num : 0_17
  HandleClicked_AlchemyStone_Close()
end

FGlobal_AlchemyStone_Use = function()
  -- function num : 0_18
  local itemWrapper = getEquipmentItem((CppEnums.EquipSlotNo).alchemyStone)
  if itemWrapper ~= nil and (itemWrapper:get()):getEndurance() > 0 then
    useAlchemyStone()
  end
end

local elapsTime = 0
local isUpgrade = false
Panel_AlchemyStone_updateTime = function(deltaTime)
  -- function num : 0_19 , upvalues : AlchemyStone, elapsTime, AlchemyStoneTab, isUpgrade
  if AlchemyStone.isPushDoit then
    elapsTime = elapsTime + deltaTime
    if elapsTime > 0 and AlchemyStone.startEffectPlay == false then
      AlchemyStone_TabButton_Enable(false)
      ;
      ((AlchemyStone.control).btn_Doit):SetMonoTone(true)
      ;
      ((AlchemyStone.control).btn_Doit):SetEnable(false)
      ;
      ((AlchemyStone.Stuff_slot).icon):EraseAllEffect()
      ;
      ((AlchemyStone.Stuff_slot).icon):AddEffect("fUI_Alchemy_UpgradeStart01", false, 3, 0)
      -- DECOMPILER ERROR at PC44: Confused about usage of register: R1 in 'UnsetPending'

      AlchemyStone.startEffectPlay = true
      if AlchemyStoneTab.Charge == doItType then
        audioPostEvent_SystemUi(13, 16)
      else
        if AlchemyStoneTab.Exp == doItType then
          audioPostEvent_SystemUi(13, 16)
        else
          if AlchemyStoneTab.Upgrade == doItType then
            audioPostEvent_SystemUi(13, 17)
          end
        end
      end
      if AlchemyStoneTab.Upgrade == doItType then
        ((AlchemyStone.control).upgradeSlotBg):AddEffect("fUI_Alchemy_Stone_Upgrade03", false)
      end
    end
    if elapsTime > 1 and AlchemyStone.contentEffectPlay == false and not ((AlchemyStone.control).tab_Upgrade):IsCheck() then
      (AlchemyStone.Stuff_slot):clearItem()
      -- DECOMPILER ERROR at PC106: Confused about usage of register: R1 in 'UnsetPending'

      ;
      (AlchemyStone.Stuff_slot).Empty = true
      ;
      ((AlchemyStone.control).contentEffect):EraseAllEffect()
      if AlchemyStoneTab.Charge == doItType then
        ((AlchemyStone.control).contentEffect):AddEffect("fUI_Alchemy_Stone01", false, 0, -30)
      else
        if AlchemyStoneTab.Exp == doItType then
          ((AlchemyStone.control).contentEffect):AddEffect("fUI_Alchemy_Stone01", false, 0, -30)
        else
          if AlchemyStoneTab.Upgrade == doItType then
            ((AlchemyStone.control).contentEffect):AddEffect("fUI_Alchemy_Stone_Upgrade01", false, 0, -30)
          end
        end
      end
      -- DECOMPILER ERROR at PC157: Confused about usage of register: R1 in 'UnsetPending'

      AlchemyStone.contentEffectPlay = true
    end
    if elapsTime > 2.5 and AlchemyStone.slotEffectPlay == false then
      ((AlchemyStone.Stone_slot).icon):EraseAllEffect()
      if AlchemyStoneTab.Charge == doItType then
        ((AlchemyStone.Stone_slot).icon):AddEffect("fUI_Alchemy_Stone02", false)
      else
        if AlchemyStoneTab.Exp == doItType then
          ((AlchemyStone.Stone_slot).icon):AddEffect("fUI_Alchemy_Stone02", false)
        else
          if AlchemyStoneTab.Upgrade == doItType then
            ((AlchemyStone.Stone_slot).icon):AddEffect("fUI_Alchemy_Stone_Upgrade02", false)
          end
        end
      end
      -- DECOMPILER ERROR at PC209: Confused about usage of register: R1 in 'UnsetPending'

      AlchemyStone.slotEffectPlay = true
      if ((AlchemyStone.control).tab_Upgrade):IsCheck() then
        (AlchemyStone.Stuff_slot):clearItem()
        -- DECOMPILER ERROR at PC223: Confused about usage of register: R1 in 'UnsetPending'

        ;
        (AlchemyStone.Stuff_slot).Empty = true
      end
    end
    -- DECOMPILER ERROR at PC232: Confused about usage of register: R1 in 'UnsetPending'

    if elapsTime > 3 and AlchemyStone.effectEnd == false then
      AlchemyStone.effectEnd = true
      ;
      ((AlchemyStone.resultSlotBg)[0]):AddEffect("fUI_Alchemy_Stone02", false)
      ;
      ((AlchemyStone.resultSlotBg)[1]):AddEffect("fUI_Alchemy_Stone02", false)
      ;
      ((AlchemyStone.resultSlotBg)[2]):AddEffect("fUI_Alchemy_Stone02", false)
    end
    if elapsTime > 5 and elapsTime < 9 then
      if AlchemyStoneTab.Charge == doItType then
        alchemyRepair(AlchemyStone.toWhereType, AlchemyStone.toSlotNo, AlchemyStone.fromWhereType, AlchemyStone.fromSlotNo, AlchemyStone.fromCount)
        elapsTime = 0
        AlchemyStone:ClearData()
        Inventory_SetFunctor(AlchemyStone_StoneFilter, AlchemyStone_StoneRfunction, nil, nil)
      else
        if AlchemyStoneTab.Exp == doItType then
          alchemyUpgrade(AlchemyStone.fromWhereType, AlchemyStone.fromSlotNo, AlchemyStone.fromCount, AlchemyStone.toWhereType, AlchemyStone.toSlotNo)
          elapsTime = 0
          -- DECOMPILER ERROR at PC308: Confused about usage of register: R1 in 'UnsetPending'

          AlchemyStone.isPushDoit = false
          Inventory_SetFunctor(AlchemyStone_StoneFilter, AlchemyStone_StoneRfunction, nil, nil)
        else
          if AlchemyStoneTab.Upgrade == doItType then
            alchemyEvolve(AlchemyStone.fromWhereType, AlchemyStone.fromSlotNo, AlchemyStone.toWhereType, AlchemyStone.toSlotNo)
            elapsTime = 9
          end
        end
      end
    end
    if elapsTime > 9.5 and not isUpgrade then
      if AlchemyStone.resultItemIndex > -1 then
        ((AlchemyStone.resultSlotBg)[AlchemyStone.resultItemIndex]):AddEffect("fUI_Alchemy_Stone02", false)
      else
        ;
        ((AlchemyStone.Stone_slot).icon):AddEffect("fUI_Alchemy_Stone02", false)
      end
      isUpgrade = true
    end
    if elapsTime > 12 and isUpgrade then
      AlchemyStone:ClearData()
      Inventory_SetFunctor(AlchemyStone_StoneFilter, AlchemyStone_StoneRfunction, nil, nil)
      isUpgrade = false
      elapsTime = 0
    end
  else
    elapsTime = 0
    isUpgrade = false
  end
end

AlchemyStone_onScreenResize = function()
  -- function num : 0_20
  Panel_AlchemyStone:ComputePos()
end

FromClient_ItemUpgrade = function(itemwhereType, slotNo, exp)
  -- function num : 0_21 , upvalues : AlchemyStoneTab, AlchemyStone
  if not Panel_AlchemyStone:GetShow() then
    return 
  end
  if doItType == -1 then
    return 
  end
  local itemWrapper = getInventoryItemByType(itemwhereType, slotNo)
  if itemWrapper == nil then
    return 
  end
  local itemName = (itemWrapper:getStaticStatus()):getName()
  local mainMsg = ""
  if doItType == -1 then
    return 
  end
  if AlchemyStoneTab.Charge == doItType then
    mainMsg = itemName .. " " .. PAGetString(Defines.StringSheet_GAME, "LUA_ALCHEMYSTONE_DONE_CHARGE")
  else
    if AlchemyStoneTab.Exp == doItType then
      mainMsg = itemName .. " " .. PAGetString(Defines.StringSheet_GAME, "LUA_ALCHEMYSTONE_DONE_EXP")
    else
      if AlchemyStoneTab.Upgrade == doItType then
        mainMsg = itemName .. " " .. PAGetString(Defines.StringSheet_GAME, "LUA_ALCHEMYSTONE_DONE_UPGRADE")
      end
    end
  end
  -- DECOMPILER ERROR at PC92: Confused about usage of register: R6 in 'UnsetPending'

  AlchemyStone.resultMsg = {main = mainMsg, sub = PAGetString(Defines.StringSheet_GAME, "LUA_ALCHEMYSTONE_MSG_EXP") .. (string.format)("%.2f", itemWrapper:getExperience() / 10000) .. "%", addMsg = "Icon/" .. (itemWrapper:getStaticStatus()):getIconPath()}
  Proc_ShowMessage_Ack_For_RewardSelect(AlchemyStone.resultMsg, 2.5, 33)
  ;
  ((AlchemyStone.control).progress_2):SetProgressRate(itemWrapper:getExperience() / 10000)
  local _exp = (string.format)("%.2f", itemWrapper:getExperience() / 10000)
  ;
  ((AlchemyStone.control).progressText_2):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_ALCHEMYSTONE_EXPERIENCE", "exp", _exp))
  if AlchemyStoneTab.Charge == doItType then
    AlchemyStone:ClearData()
    Inventory_SetFunctor(AlchemyStone_StoneFilter, AlchemyStone_StoneRfunction, nil, nil)
  else
    if AlchemyStoneTab.Exp == doItType then
      Inventory_SetFunctor(AlchemyStone_StuffFilter, AlchemyStone_StuffRfunction, nil, nil)
      -- DECOMPILER ERROR at PC151: Confused about usage of register: R7 in 'UnsetPending'

      AlchemyStone.isPushDoit = false
      -- DECOMPILER ERROR at PC153: Confused about usage of register: R7 in 'UnsetPending'

      AlchemyStone.startEffectPlay = false
      -- DECOMPILER ERROR at PC155: Confused about usage of register: R7 in 'UnsetPending'

      AlchemyStone.contentEffectPlay = false
      -- DECOMPILER ERROR at PC157: Confused about usage of register: R7 in 'UnsetPending'

      AlchemyStone.slotEffectPlay = false
      -- DECOMPILER ERROR at PC159: Confused about usage of register: R7 in 'UnsetPending'

      AlchemyStone.effectEnd = false
      AlchemyStone_TabButton_Enable(true)
    end
  end
end

FromClient_StoneChange = function(whereType, slotNo)
  -- function num : 0_22 , upvalues : AlchemyStone
  if not Panel_AlchemyStone:GetShow() then
    return 
  end
  if doItType == -1 then
    return 
  end
  local itemWrapper = getInventoryItemByType(whereType, slotNo)
  if itemWrapper == nil then
    return 
  end
  local itemSSW = itemWrapper:getStaticStatus()
  local itemName = itemSSW:getName()
  local itemKey = ((itemSSW:get())._key):getItemKey()
  msg = {main = PAGetString(Defines.StringSheet_GAME, "LUA_ALCHEMYSTONE_MSG_DONE"), sub = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_ALCHEMYSTONE_MSG_DONE2", "itemName", itemName), addMsg = "Icon/" .. (itemWrapper:getStaticStatus()):getIconPath()}
  Proc_ShowMessage_Ack_For_RewardSelect(msg, 2.5, 33)
  for index = 0, #AlchemyStone.resultItemKey do
    -- DECOMPILER ERROR at PC66: Confused about usage of register: R10 in 'UnsetPending'

    if itemKey == (AlchemyStone.resultItemKey)[index] then
      AlchemyStone.resultItemIndex = index
    end
  end
end

FromClient_StoneChangeFailedByDown = function(whereType, slotNo)
  -- function num : 0_23
  if not Panel_AlchemyStone:GetShow() then
    return 
  end
  if doItType == -1 then
    return 
  end
  local itemWrapper = getInventoryItemByType(whereType, slotNo)
  if itemWrapper == nil then
    return 
  end
  local itemName = (itemWrapper:getStaticStatus()):getName()
  msg = {main = PAGetString(Defines.StringSheet_GAME, "LUA_ALCHEMYSTONE_MSG_FAIL"), sub = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_ALCHEMYSTONE_MSG_FAIL2", "itemName", itemName), addMsg = "Icon/" .. (itemWrapper:getStaticStatus()):getIconPath()}
  Proc_ShowMessage_Ack_For_RewardSelect(msg, 2.5, 33)
end

FromClient_AlchemyEvolve = function(evolveType)
  -- function num : 0_24 , upvalues : AlchemyStone
  if not Panel_AlchemyStone:GetShow() then
    return 
  end
  if doItType == -1 then
    return 
  end
  local guideString = ""
  if evolveType == 0 then
    guideString = PAGetString(Defines.StringSheet_GAME, "LUA_ALCHEMYSTONE_UPGRADERESULT_0")
  else
    if evolveType == 1 then
      guideString = PAGetString(Defines.StringSheet_GAME, "LUA_ALCHEMYSTONE_UPGRADERESULT_1")
    else
      if evolveType == 2 then
        guideString = PAGetString(Defines.StringSheet_GAME, "LUA_ALCHEMYSTONE_UPGRADERESULT_2")
      else
        if evolveType == 3 then
          guideString = PAGetString(Defines.StringSheet_GAME, "LUA_ALCHEMYSTONE_UPGRADERESULT_3")
        end
      end
    end
  end
  ;
  ((AlchemyStone.control).guideString):SetText(guideString)
end

FromClient_AlchemyRepair = function(whereType, slotNo)
  -- function num : 0_25 , upvalues : AlchemyStone
  local itemWrapper = getInventoryItemByType(whereType, Int64toInt32(slotNo))
  if itemWrapper ~= nil then
    local itemSSW = itemWrapper:getStaticStatus()
    local itemName = itemSSW:getName()
    Proc_ShowMessage_Ack(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_ALCHEMYSTONE_CHARGE_COMPLETE_ACK", "itemName", itemName))
    AlchemyStone:ClearData()
    Inventory_SetFunctor(AlchemyStone_StoneFilter, AlchemyStone_StoneRfunction, nil, nil)
  end
end

AlchemyStone_TabButton_Enable = function(isEnable)
  -- function num : 0_26 , upvalues : AlchemyStone
  local self = AlchemyStone.control
  ;
  (self.tab_Charge):SetEnable(isEnable)
  ;
  (self.tab_Exp):SetEnable(isEnable)
  ;
  (self.tab_Upgrade):SetEnable(isEnable)
end

AlchemyStone:Init()
AlchemyStone:registEventHandler()
AlchemyStone:registMessageHandler()
ConsoleGroupCreate_Panel_AlchemyStone = function()
  -- function num : 0_27 , upvalues : AlchemyStone
  local group_0 = Panel_AlchemyStone:addConsoleUIGroup(0, (CppEnums.PA_CONSOLE_UI_CONTROL_TYPE).eCONSOLE_UI_CONTROL_TYPE_NOTEVENT)
  group_0:addControl(0, 0, 3, 1, (AlchemyStone.control).tab_Charge)
  group_0:addControl(1, 0, 3, 1, (AlchemyStone.control).tab_Exp)
  group_0:addControl(2, 0, 3, 1, (AlchemyStone.control).tab_Upgrade)
end

ConsoleGroupCreate_Panel_AlchemyStone()

