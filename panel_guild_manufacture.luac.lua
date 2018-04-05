-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\window\guild\panel_guild_manufacture.luac 

-- params : ...
-- function num : 0
PaGlobal_Guild_Manufacture = {
_ui = {_guildBG = (UI.getChildControl)(Panel_Window_Guild, "Static_Frame_GuildManufactureBG"), _productName = (UI.getChildControl)(Panel_Guild_Manufacture, "StaticText_ProductName"), _needItemIconBG = (UI.getChildControl)(Panel_Guild_Manufacture, "Static_Slot_IconBG"), _setButton = (UI.getChildControl)(Panel_Guild_Manufacture, "Button_Set"), _updateButton = (UI.getChildControl)(Panel_Guild_Manufacture, "Button_Update"), _tabButton = (UI.getChildControl)(Panel_Guild_Manufacture, "Button_Tab"), _startButton = (UI.getChildControl)(Panel_Guild_Manufacture, "Button_Start"), _cancelButton = (UI.getChildControl)(Panel_Guild_Manufacture, "Button_Cancel")}
, 
_config = {_needItemMax = 5}
, 
_slotConfig = {createIcon = true, createBorder = true, createEnchant = true}
, _needItemList = (Array.new)(), _tabButtonList = (Array.new)(), _setButtonList = (Array.new)()}
-- DECOMPILER ERROR at PC74: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Guild_Manufacture.initialize = function(self)
  -- function num : 0_0
  _PA_LOG("박규나_길드_�\128�\181", "init")
  self:createControl()
  ;
  ((self._ui)._guildBG):MoveChilds(((self._ui)._guildBG):GetID(), Panel_Guild_Manufacture)
  ;
  (UI.deletePanel)(Panel_Guild_Manufacture:GetID())
  Panel_Guild_Manufacture = nil
  self:registEventHandler()
end

-- DECOMPILER ERROR at PC77: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Guild_Manufacture.registEventHandler = function(self)
  -- function num : 0_1
  ((self._ui)._startButton):addInputEvent("Mouse_LUp", "PaGlobal_Guild_Manufacture:start(false)")
  ;
  ((self._ui)._cancelButton):addInputEvent("Mouse_LUp", "PaGlobal_Guild_Manufacture:cancel()")
  registerEvent("FromClient_Guild_Manufacture_Update", "FromClient_Guild_Manufacture_Update")
end

-- DECOMPILER ERROR at PC80: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Guild_Manufacture.createControl = function(self)
  -- function num : 0_2
  for ii = 0, (self._config)._needItemMax - 1 do
    local slot = {}
    slot.button = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_BUTTON, Panel_Guild_Manufacture, "UpdateButton_" .. ii)
    CopyBaseProperty((self._ui)._updateButton, slot.button)
    ;
    (slot.button):SetPosX(450)
    ;
    (slot.button):SetPosY(185 + ii * 57)
    ;
    (slot.button):SetShow(true)
    ;
    (slot.button):addInputEvent("Mouse_LUp", "PaGlobal_Guild_Manufacture:updateItem(" .. ii .. ")")
    slot.background = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATIC, Panel_Guild_Manufacture, "NeedItemBG_" .. ii)
    CopyBaseProperty((self._ui)._needItemIconBG, slot.background)
    ;
    (slot.background):SetPosX(400)
    ;
    (slot.background):SetPosY(185 + ii * 55)
    ;
    (slot.background):SetShow(true)
    ;
    (SlotItem.new)(slot, "NeedItemIcon_" .. ii, ii, slot.background, self._slotConfig)
    slot:createChild()
    ;
    (slot.icon):SetShow(true)
    -- DECOMPILER ERROR at PC90: Confused about usage of register: R6 in 'UnsetPending'

    ;
    (self._needItemList)[ii] = slot
  end
  for ii = 0, 4 do
    local button = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_BUTTON, Panel_Guild_Manufacture, "SetButton_" .. ii)
    CopyBaseProperty((self._ui)._setButton, button)
    button:SetPosX(100)
    button:SetPosY(185 + ii * 55)
    button:SetShow(true)
    button:SetText("등록 : " .. tostring(ii))
    button:addInputEvent("Mouse_LUp", "PaGlobal_Guild_Manufacture:set(" .. ii .. ")")
    -- DECOMPILER ERROR at PC136: Confused about usage of register: R6 in 'UnsetPending'

    ;
    (self._setButtonList)[ii] = button
  end
  for ii = 0, 4 do
    local button = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_BUTTON, Panel_Guild_Manufacture, "TabButton_" .. ii)
    CopyBaseProperty((self._ui)._tabButton, button)
    button:SetPosX(100 + ii * 125)
    button:SetPosY(550)
    button:SetShow(true)
    button:SetText("�\173 : " .. tostring(ii))
    button:addInputEvent("Mouse_LUp", "PaGlobal_Guild_Manufacture:setTab(" .. ii .. ")")
    -- DECOMPILER ERROR at PC182: Confused about usage of register: R6 in 'UnsetPending'

    ;
    (self._tabButtonList)[ii] = button
  end
end

-- DECOMPILER ERROR at PC83: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Guild_Manufacture.set = function(self, selectIndex)
  -- function num : 0_3
  _PA_LOG("박규나_길드_�\128�\181", "set : " .. tostring(selectIndex))
end

-- DECOMPILER ERROR at PC86: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Guild_Manufacture.updateItem = function(self, index)
  -- function num : 0_4
end

-- DECOMPILER ERROR at PC89: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Guild_Manufacture.setTab = function(self, index)
  -- function num : 0_5
  self._currentTabIndex = index
  self:refreshManufactureItemInfo()
end

-- DECOMPILER ERROR at PC92: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Guild_Manufacture.start = function(self, isNow)
  -- function num : 0_6
end

-- DECOMPILER ERROR at PC95: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Guild_Manufacture.cancel = function(self)
  -- function num : 0_7
end

-- DECOMPILER ERROR at PC98: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Guild_Manufacture.SetShow = function(self, isShow)
  -- function num : 0_8
  if isShow == true then
    ((self._ui)._guildBG):SetShow(true)
  else
    ;
    ((self._ui)._guildBG):SetShow(false)
  end
end

-- DECOMPILER ERROR at PC101: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Guild_Manufacture.refreshManufactureItemInfo = function(self)
  -- function num : 0_9
  ((self._ui)._productName):SetText("현재 �\173 : " .. tostring(self._currentTabIndex))
end

FromClient_Guild_Manufacture_Update = function(param0, param1, param2, param3, param4, isSuccess)
  -- function num : 0_10
  local self = PaGlobal_Guild_Manufacture
end

PaGlobal_Guild_Manufacture:initialize()

