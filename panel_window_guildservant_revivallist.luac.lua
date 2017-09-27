-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\servant\panel_window_guildservant_revivallist.luac 

-- params : ...
-- function num : 0
Panel_GuildServant_RevivalList:SetShow(false)
PaGlobal_GuildServant_RevivalList = {
_guildServantNoArray = {}
, _guildServantRevivalableCount = 0, _itemStartingPosY = 90, _itemIndexPerPosY = 25, _panelBgDefaultHeight = 180, _contentBgDefaultHeight = 35, _applyBtnDefaultPosY = 128, 
_ui = {_contentBg = (UI.getChildControl)(Panel_GuildServant_RevivalList, "Template_Static_ListContentBG"), _buttonClose = (UI.getChildControl)(Panel_GuildServant_RevivalList, "Button_CloseIcon"), _buttonApply = (UI.getChildControl)(Panel_GuildServant_RevivalList, "Button_Apply"), _radioGroupNum = ((UI.getChildControl)(Panel_GuildServant_RevivalList, "RadioButton_ServantTemplete")):GetGroupNumber(), 
_list = {}
}
}
-- DECOMPILER ERROR at PC46: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_GuildServant_RevivalList.init = function(self)
  -- function num : 0_0
  ((UI.getChildControl)(Panel_GuildServant_RevivalList, "RadioButton_ServantTemplete")):SetShow(false)
end

-- DECOMPILER ERROR at PC49: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_GuildServant_RevivalList.update = function(self)
  -- function num : 0_1
  PaGlobal_GuildServant_RevivalList:itemHideAll()
  PaGlobal_GuildServant_RevivalList:listSetting()
  PaGlobal_GuildServant_RevivalList:bgSetting()
end

-- DECOMPILER ERROR at PC52: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_GuildServant_RevivalList.itemHideAll = function(self)
  -- function num : 0_2
  for ii = 0, self._guildServantRevivalableCount - 1 do
    if ((self._ui)._list)[ii] ~= nil then
      (((self._ui)._list)[ii]):SetShow(false)
    end
  end
end

-- DECOMPILER ERROR at PC55: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_GuildServant_RevivalList.listSetting = function(self)
  -- function num : 0_3
  self._guildServantNoArray = {}
  self._guildServantRevivalableCount = 0
  local count = guildstable_getComaGuildServantCount()
  for ii = 0, count - 1 do
    local servantInfo = guildstable_getComaGuildServantAt(ii)
    if servantInfo ~= nil then
      PaGlobal_GuildServant_RevivalList:itemSetting(self._guildServantRevivalableCount, servantInfo)
      self._guildServantRevivalableCount = self._guildServantRevivalableCount + 1
    end
  end
end

-- DECOMPILER ERROR at PC58: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_GuildServant_RevivalList.itemSetting = function(self, index, servantWrapper)
  -- function num : 0_4
  -- DECOMPILER ERROR at PC5: Confused about usage of register: R3 in 'UnsetPending'

  if servantWrapper ~= nil then
    (self._guildServantNoArray)[index] = servantWrapper:getServantNo()
    -- DECOMPILER ERROR at PC22: Confused about usage of register: R3 in 'UnsetPending'

    if ((self._ui)._list)[index] == nil then
      ((self._ui)._list)[index] = (UI.createAndCopyBasePropertyControl)(Panel_GuildServant_RevivalList, "RadioButton_ServantTemplete", Panel_GuildServant_RevivalList, "RadioButton_ServantTemplete_" .. index)
    end
    ;
    (((self._ui)._list)[index]):SetPosY(self._itemStartingPosY + index * self._itemIndexPerPosY)
    ;
    (((self._ui)._list)[index]):SetText(servantWrapper:getName())
    ;
    (((self._ui)._list)[index]):SetShow(true)
  end
end

-- DECOMPILER ERROR at PC61: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_GuildServant_RevivalList.bgSetting = function(self)
  -- function num : 0_5
  local itemTotalHeight = (self._guildServantRevivalableCount - 1) * self._itemIndexPerPosY
  Panel_GuildServant_RevivalList:SetSize(Panel_GuildServant_RevivalList:GetSizeX(), self._panelBgDefaultHeight + itemTotalHeight)
  ;
  ((self._ui)._contentBg):SetSize(((self._ui)._contentBg):GetSizeX(), self._contentBgDefaultHeight + itemTotalHeight)
  ;
  ((self._ui)._buttonApply):SetPosY(self._applyBtnDefaultPosY + itemTotalHeight)
end

-- DECOMPILER ERROR at PC64: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_GuildServant_RevivalList.selectFirstItem = function(self)
  -- function num : 0_6
  Panel_GuildServant_RevivalList:ResetRadiobutton((self._ui)._radioGroupNum)
  if ((self._ui)._list)[0] ~= nil then
    (((self._ui)._list)[0]):SetCheck(true)
  end
end

-- DECOMPILER ERROR at PC67: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_GuildServant_RevivalList.getSelectedIndex = function(self)
  -- function num : 0_7
  for ii = 0, self._guildServantRevivalableCount - 1 do
    if (((self._ui)._list)[ii]):IsChecked() == true then
      return ii
    end
  end
  return -1
end

-- DECOMPILER ERROR at PC70: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_GuildServant_RevivalList.open = function(self)
  -- function num : 0_8
  local isShow = Panel_GuildServant_RevivalList:GetShow()
  if isShow == false then
    Panel_GuildServant_RevivalList:SetShow(true)
    PaGlobal_GuildServant_RevivalList:update()
  end
end

-- DECOMPILER ERROR at PC73: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_GuildServant_RevivalList.close = function(self)
  -- function num : 0_9
  Panel_GuildServant_RevivalList:SetShow(false)
end

-- DECOMPILER ERROR at PC76: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_GuildServant_RevivalList.refresh = function(self)
  -- function num : 0_10
  PaGlobal_GuildServant_RevivalList:selectFirstItem()
  PaGlobal_GuildServant_RevivalList:update()
end

local _fromWhereType, _fromSlotNo = nil, nil
-- DECOMPILER ERROR at PC82: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_GuildServant_RevivalList.apply = function(self)
  -- function num : 0_11 , upvalues : _fromWhereType, _fromSlotNo
  local selectedIndex = PaGlobal_GuildServant_RevivalList:getSelectedIndex()
  local servantNo = (self._guildServantNoArray)[selectedIndex]
  if servantNo ~= nil then
    ToClient_RequestResurrectionServant(servantNo, _fromWhereType, _fromSlotNo)
  end
end

-- DECOMPILER ERROR at PC85: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_GuildServant_RevivalList.registMessageHandler = function(self)
  -- function num : 0_12
  ((self._ui)._buttonApply):addInputEvent("Mouse_LUp", "PaGlobal_GuildServant_RevivalList:apply()")
  ;
  ((self._ui)._buttonClose):addInputEvent("Mouse_LUp", "PaGlobal_GuildServant_RevivalList:close()")
end

-- DECOMPILER ERROR at PC88: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_GuildServant_RevivalList.registEventHandler = function(self)
  -- function num : 0_13
  registerEvent("FromClient_ServantSeal", "FromClient_GuildServant_RevivalList_Update")
  registerEvent("FromClient_ServantUnseal", "FromClient_GuildServant_RevivalList_Update")
  registerEvent("FromClient_ServantToReward", "FromClient_GuildServant_RevivalList_Update")
  registerEvent("FromClient_ServantRecovery", "FromClient_GuildServant_RevivalList_Update")
  registerEvent("FromClient_ServantChangeName", "FromClient_GuildServant_RevivalList_Update")
  registerEvent("FromClient_ServantUpdate", "FromClient_GuildServant_RevivalList_Update")
  registerEvent("FromClient_RegistGuildServant", "FromClient_GuildServant_RevivalList_Update")
  registerEvent("FromClient_GuildServantListUpdate", "FromClient_GuildServant_RevivalList_Update")
  registerEvent("FromClient_UseServantRespawnItem", "FromClient_UseGuildServantRespawnItem")
  registerEvent("FromClient_ServantResurrectionAck", "FromClient_GuildServantResurrectionAck")
end

FromClient_GuildServant_RevivalList_Update = function()
  -- function num : 0_14
  PaGlobal_GuildServant_RevivalList:refresh()
end

FromClient_UseGuildServantRespawnItem = function(fromWhereType, fromSlotNo, contentEventParam1)
  -- function num : 0_15 , upvalues : _fromWhereType, _fromSlotNo
  if contentEventParam1 == (CppEnums.ServantWhereType).ServantWhereTypeGuild and guildstable_getComaGuildServantCount() ~= 0 then
    PaGlobal_GuildServant_RevivalList:open()
    _fromWhereType = fromWhereType
    _fromSlotNo = fromSlotNo
  end
end

FromClient_GuildServantResurrectionAck = function(servantNo, servantWhereType)
  -- function num : 0_16
  if servantWhereType == (CppEnums.ServantWhereType).ServantWhereTypeGuild then
    PaGlobal_GuildServant_RevivalList:close()
    local servantInfo = guildStable_getServantByServantNo(servantNo)
    if servantInfo ~= nil then
      Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_SERVANTRESURRECTION_MSG"))
    end
  end
end

PaGlobal_GuildServant_RevivalList:init()
PaGlobal_GuildServant_RevivalList:update()
PaGlobal_GuildServant_RevivalList:registMessageHandler()
PaGlobal_GuildServant_RevivalList:registEventHandler()

