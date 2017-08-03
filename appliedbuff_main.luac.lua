-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\widget\buff\appliedbuff_main.luac 

-- params : ...
-- function num : 0
basicLoadUI("UI_Data/Widget/Buff/UI_BuffPanel.xml", "Panel_AppliedBuffList", (Defines.UIGroup).PAGameUIGroup_MainUI)
Panel_AppliedBuffList:SetShow(false, false)
PaGlobalAppliedBuffList = {_uiBackBuff = (UI.getChildControl)(Panel_AppliedBuffList, "Static_Buff_BG"), _uiBackDeBuff = (UI.getChildControl)(Panel_AppliedBuffList, "Static_DeBuff_BG"), _buffText = (UI.getChildControl)(Panel_AppliedBuffList, "StaticText_buffText"), _maxBuffCount = 20, 
_uiBuffList = {}
, 
_uiDeBuffList = {}
, _isShow = false}
local UI_PUCT = CppEnums.PA_UI_CONTROL_TYPE
local UI_classType = CppEnums.ClassType
local UI_TIMETOP = (Util.Time).inGameTimeFormattingTop
-- DECOMPILER ERROR at PC48: Confused about usage of register: R3 in 'UnsetPending'

PaGlobalAppliedBuffList.initialize = function(self)
  -- function num : 0_0 , upvalues : UI_PUCT
  local styleBuffIcon = (UI.getChildControl)(Panel_AppliedBuffList, "StaticText_Buff")
  local styleDeBuffIcon = (UI.getChildControl)(Panel_AppliedBuffList, "StaticText_deBuff")
  styleBuffIcon:SetShow(false)
  styleDeBuffIcon:SetShow(false)
  ;
  (self._uiBackBuff):SetShow(false)
  ;
  (self._uiBackDeBuff):SetShow(false)
  local iconSpan = styleBuffIcon:GetSizeX() + 1
  for index = 1, self._maxBuffCount do
    local buffIcon = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATICTEXT, Panel_AppliedBuffList, "AppliedBuff_" .. index)
    CopyBaseProperty(styleBuffIcon, buffIcon)
    buffIcon:SetPosX((self._uiBackBuff):GetPosX() + iconSpan * (index - 1) + 2)
    buffIcon:SetPosY((self._uiBackBuff):GetPosY() + 2)
    buffIcon:SetShow(false)
    buffIcon:SetIgnore(false)
    local deBuffIcon = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATICTEXT, Panel_AppliedBuffList, "AppliedDeBuff_" .. index)
    CopyBaseProperty(styleDeBuffIcon, deBuffIcon)
    deBuffIcon:SetPosX((self._uiBackDeBuff):GetPosX() + iconSpan * (index - 1) + 2)
    deBuffIcon:SetPosY((self._uiBackDeBuff):GetPosY() + 2)
    deBuffIcon:SetShow(false)
    deBuffIcon:SetIgnore(false)
    buffIcon:addInputEvent("Mouse_On", "HandleMOnAppliedBuff(" .. index .. ",false)")
    buffIcon:addInputEvent("Mouse_Out", "HandleMOffAppliedBuff(" .. index .. ",false)")
    deBuffIcon:addInputEvent("Mouse_On", "HandleMOnAppliedBuff(" .. index .. ",true)")
    deBuffIcon:addInputEvent("Mouse_Out", "HandleMOffAppliedBuff(" .. index .. ",true)")
    -- DECOMPILER ERROR at PC128: Confused about usage of register: R10 in 'UnsetPending'

    ;
    (self._uiBuffList)[index] = buffIcon
    -- DECOMPILER ERROR at PC130: Confused about usage of register: R10 in 'UnsetPending'

    ;
    (self._uiDeBuffList)[index] = deBuffIcon
  end
  ;
  (self._uiBackBuff):SetIgnore(true)
  ;
  (self._uiBackDeBuff):SetIgnore(true)
  Panel_AppliedBuffList:addInputEvent("Mouse_On", "HandleMOnAppliedBuffPenel()")
  Panel_AppliedBuffList:addInputEvent("Mouse_Out", "HandleMOutAppliedBuffPenel()")
  Panel_AppliedBuffList:addInputEvent("Mouse_Lup", "ResetPos_WidgetButton()")
end

-- DECOMPILER ERROR at PC51: Confused about usage of register: R3 in 'UnsetPending'

PaGlobalAppliedBuffList.setMovableUIForControlMode = function(self)
  -- function num : 0_1
  (self._buffText):SetShow(false)
  Panel_AppliedBuffList:SetIgnore(false)
  Panel_AppliedBuffList:SetDragEnable(true)
  Panel_AppliedBuffList:ChangeTextureInfoName("New_UI_Common_forLua/Default/window_sample_isWidget.dds")
end

-- DECOMPILER ERROR at PC54: Confused about usage of register: R3 in 'UnsetPending'

PaGlobalAppliedBuffList.cancelMovableUIForControlMode = function(self)
  -- function num : 0_2
  (self._buffText):SetShow(false)
  Panel_AppliedBuffList:SetDragEnable(false)
  Panel_AppliedBuffList:ChangeTextureInfoName("New_UI_Common_forLua/Default/window_sample_empty.dds")
end

-- DECOMPILER ERROR at PC57: Confused about usage of register: R3 in 'UnsetPending'

PaGlobalAppliedBuffList.changeOnOffTexture = function(self, isOn)
  -- function num : 0_3
  if isOn == true and Panel_UIControl:IsShow() then
    Panel_AppliedBuffList:ChangeTextureInfoName("new_ui_common_forlua/default/window_sample_drag.dds")
    ;
    (self._buffText):SetText(PAGetString(Defines.StringSheet_GAME, "BUFF_LIST_MOVE"))
  end
  if Panel_UIControl:IsShow() then
    Panel_AppliedBuffList:ChangeTextureInfoName("new_ui_common_forlua/default/window_sample_isWidget.dds")
    ;
    (self._buffText):SetText(PAGetString(Defines.StringSheet_GAME, "BUFF_LIST"))
  else
    Panel_AppliedBuffList:ChangeTextureInfoName("new_ui_common_forlua/default/window_sample_empty.dds")
  end
end

-- DECOMPILER ERROR at PC60: Confused about usage of register: R3 in 'UnsetPending'

PaGlobalAppliedBuffList.show = function(self)
  -- function num : 0_4
  Panel_AppliedBuffList:SetShow(true, false)
end

-- DECOMPILER ERROR at PC63: Confused about usage of register: R3 in 'UnsetPending'

PaGlobalAppliedBuffList.hide = function(self)
  -- function num : 0_5
  Panel_AppliedBuffList:SetShow(false, false)
end

-- DECOMPILER ERROR at PC66: Confused about usage of register: R3 in 'UnsetPending'

PaGlobalAppliedBuffList.showToggle = function(self)
  -- function num : 0_6
  if Panel_AppliedBuffList:IsShow() then
    Panel_AppliedBuffList:SetShow(false)
  else
    Panel_AppliedBuffList:SetShow(true)
  end
end

HandleMOnAppliedBuffPenel = function()
  -- function num : 0_7
  AppliedBuffList:changeOnOffTexture(true)
end

HandleMOutAppliedBuffPenel = function()
  -- function num : 0_8
  AppliedBuffList:changeOnOffTexture(false)
end

HandleMOnAppliedBuff = function(buffIndex, isDebuff)
  -- function num : 0_9
  ShowBuffTooltip(buffIndex, isDebuff)
end

HandleMOffAppliedBuff = function(buffIndex, isDebuff)
  -- function num : 0_10
  HideBuffTooltip(buffIndex, isDebuff)
end

PaGlobalAppliedBuffList:initialize()

