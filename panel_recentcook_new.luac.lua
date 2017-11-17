-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\alchemy\panel_recentcook_new.luac 

-- params : ...
-- function num : 0
local UseRecordFailReasons = {NoError = 0, InvalidRecord = 1, NoMaterial = 2, NoMaterialCount = 3}
PaGlobal_RecentCook = {_isCook = false, _maxRecordCount = 10, 
_ui = {}
}
-- DECOMPILER ERROR at PC13: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_RecentCook.initialize = function(self)
  -- function num : 0_0
  local ui = self._ui
  local recentRecordGroup = {}
  self._maxMaterialCount = PaGlobal_Alchemy._maxMaterialCount
  ui._buttonClose = (UI.getChildControl)(Panel_RecentCook, "Button_Close")
  recentRecordGroup[1] = (UI.getChildControl)(Panel_RecentCook, "Static_CookRecipeBG")
  local posY = (recentRecordGroup[1]):GetPosY()
  for recordIndex = 2, self._maxRecordCount do
    posY = posY + (recentRecordGroup[1]):GetSizeY() + 2
    recentRecordGroup[recordIndex] = (UI.cloneControl)(recentRecordGroup[1], Panel_RecentCook, "Static_CookRecipeBG_" .. recordIndex)
    ;
    (recentRecordGroup[recordIndex]):SetPosY(posY)
  end
  ;
  (ui._buttonClose):addInputEvent("Mouse_LUp", "PaGlobal_RecentCook:closePanel()")
  ui._recordList = {}
  for recordIndex = 1, self._maxRecordCount do
    local uiRecordRow = {_staticBackground = recentRecordGroup[recordIndex], _staticTextRecordNumber = (UI.getChildControl)(recentRecordGroup[recordIndex], "StaticText_RecentCookNum"), 
_staticMaterialIcon = {}
, _buttonSetup = (UI.getChildControl)(recentRecordGroup[recordIndex], "Button_Setup")}
    ;
    (uiRecordRow._staticTextRecordNumber):SetText(recordIndex)
    ;
    (uiRecordRow._buttonSetup):addInputEvent("Mouse_LUp", "PaGlobal_RecentCook:selectAlchemyRecord(" .. recordIndex .. ")")
    for i = 1, self._maxMaterialCount do
      local slotIconParent = (UI.getChildControl)(recentRecordGroup[recordIndex], "Static_IconSlot" .. i)
      local slotIcon = {}
      slotIcon = (SlotItem.new)(slotIcon, "MaterialIcon_" .. recordIndex .. "_" .. i, i, slotIconParent, {createIcon = true, createBorder = true, createCount = true, createCash = true})
      slotIcon:createChild()
      ;
      (slotIcon.icon):SetSize(slotIconParent:GetSizeX(), slotIconParent:GetSizeY())
      ;
      (slotIcon.icon):addInputEvent("Mouse_On", "PaGlobal_RecentCook:handleMouseOn_MaterialIcon(" .. recordIndex .. "," .. i .. ")")
      ;
      (slotIcon.icon):addInputEvent("Mouse_Out", "PaGlobal_RecentCook:handleMouseOut_MaterialIcon()")
      ;
      (slotIcon.count):SetSize(slotIconParent:GetSizeX(), slotIconParent:GetSizeY() / 2)
      ;
      (slotIcon.count):SetVerticalBottom()
      ;
      (slotIcon.border):SetSize(slotIconParent:GetSizeX(), slotIconParent:GetSizeY())
      ;
      (slotIcon.border):SetPosXY(0, 0)
      -- DECOMPILER ERROR at PC160: Confused about usage of register: R15 in 'UnsetPending'

      ;
      (uiRecordRow._staticMaterialIcon)[i] = slotIcon
    end
    -- DECOMPILER ERROR at PC163: Confused about usage of register: R9 in 'UnsetPending'

    ;
    (ui._recordList)[recordIndex] = uiRecordRow
  end
  self:clearAlchemyRecord()
end

-- DECOMPILER ERROR at PC16: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_RecentCook.showPanel = function(self, knowledgeIndex, isCook, posX, posY)
  -- function num : 0_1
  self:clearAlchemyRecord()
  ToClient_AlchemyRequestRecord(knowledgeIndex)
  self._isCook = isCook
  Panel_RecentCook:SetShow(true)
  Panel_RecentCook:SetPosXY(posX, posY)
  Panel_RecentCook:ComputePos()
end

-- DECOMPILER ERROR at PC19: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_RecentCook.closePanel = function(self)
  -- function num : 0_2
  Panel_RecentCook:SetShow(false)
  Panel_Tooltip_Item_hideTooltip()
end

-- DECOMPILER ERROR at PC22: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_RecentCook.clearAlchemyRecord = function(self)
  -- function num : 0_3
  for recordIndex = 1, self._maxRecordCount do
    local materials = (((self._ui)._recordList)[recordIndex])._staticMaterialIcon
    for mtlIndex = 1, self._maxMaterialCount do
      (materials[mtlIndex]):clearItem()
      ;
      ((materials[mtlIndex]).icon):SetIgnore(true)
    end
    ;
    ((((self._ui)._recordList)[recordIndex])._staticBackground):SetAlpha(0)
    ;
    ((((self._ui)._recordList)[recordIndex])._staticTextRecordNumber):SetShow(false)
    ;
    ((((self._ui)._recordList)[recordIndex])._buttonSetup):SetIgnore(true)
    ;
    ((((self._ui)._recordList)[recordIndex])._buttonSetup):SetShow(false)
  end
end

-- DECOMPILER ERROR at PC25: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_RecentCook.updateAlchemyRecord = function(self)
  -- function num : 0_4
  local recordCount = ToClient_AlchemyGetRecordCount()
  for recordIndex = 1, recordCount do
    local recordWrapper = ToClient_AlchemyGetRecord(recordIndex - 1)
    _PA_ASSERT(recordWrapper ~= nil, "반환�\156 RecordCount�\128 실제 RecordCount�\152 개수�\128 일치하지 않습니다.")
    local materialCount = recordWrapper:getMaterialCount()
    local uiRecord = ((self._ui)._recordList)[recordIndex]
    for i = 1, materialCount do
      local itemStaticWrapper = recordWrapper:getItemStaticStatusWrapper(i - 1)
      local itemCount = recordWrapper:getItemCount(i - 1)
      ;
      ((uiRecord._staticMaterialIcon)[i]):setItemByStaticStatus(itemStaticWrapper, itemCount)
      ;
      (((uiRecord._staticMaterialIcon)[i]).icon):SetIgnore(false)
    end
    ;
    (uiRecord._staticBackground):SetAlpha(1)
    ;
    (uiRecord._staticTextRecordNumber):SetShow(true)
    ;
    (uiRecord._buttonSetup):SetIgnore(false)
    ;
    (uiRecord._buttonSetup):SetShow(true)
  end
  -- DECOMPILER ERROR: 1 unprocessed JMP targets
end

-- DECOMPILER ERROR at PC29: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_RecentCook.selectAlchemyRecord = function(self, recordIndex)
  -- function num : 0_5 , upvalues : UseRecordFailReasons
  if recordIndex < 1 or self._maxRecordCount < recordIndex then
    _PA_ASSERT("이재�\128", "Record index�\128 정상 범위�\188 넘어갔습니다(" .. recordIndex .. ")")
    return 
  end
  local result = ToClient_AlchemyTryUseRecord(recordIndex - 1)
  if UseRecordFailReasons.NoError == result then
    PaGlobal_Alchemy:updateMaterialSlot()
  else
    if UseRecordFailReasons.NoMaterial == result then
      Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_ALCHEMY_NO_MATERIAL"))
    else
      if UseRecordFailReasons.NoMaterialCount == result then
        Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_ALCHEMY_NO_MATERIAL_COUNT"))
      else
        if UseRecordFailReasons.InvalidRecord == result then
          _PA_ASSERT(false, "위에�\156 record index�\188 체크했기 때문�\144 �\180 조건�\180 발생�\160 �\152 없습니다.")
        else
          _PA_ASSERT(false, "스크립트�\144 반영되지 않은 새로�\180 FailReason�\180 추가�\156 �\131 같습니다.")
        end
      end
    end
  end
end

-- DECOMPILER ERROR at PC32: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_RecentCook.handleMouseOn_MaterialIcon = function(self, recordIndex, materialIndex)
  -- function num : 0_6
  local recordWrapper = ToClient_AlchemyGetRecord(recordIndex - 1)
  if recordWrapper == nil then
    return 
  end
  local itemStaticWrapper = recordWrapper:getItemStaticStatusWrapper(materialIndex - 1)
  if itemStaticWrapper == nil then
    return 
  end
  local icon = (((((self._ui)._recordList)[recordIndex])._staticMaterialIcon)[materialIndex]).icon
  Panel_Tooltip_Item_Show(itemStaticWrapper, icon, true, false, nil)
end

-- DECOMPILER ERROR at PC35: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_RecentCook.handleMouseOut_MaterialIcon = function(self)
  -- function num : 0_7
  Panel_Tooltip_Item_hideTooltip()
end

FromClient_UpdateAlchemyRecord_RecentCook = function(itemKey)
  -- function num : 0_8
  PaGlobal_RecentCook:clearAlchemyRecord()
  PaGlobal_RecentCook:updateAlchemyRecord()
end

FromClient_luaLoadComplete_PaGlobal_RecentCook = function()
  -- function num : 0_9
  PaGlobal_RecentCook:initialize()
end

registerEvent("FromClient_luaLoadComplete", "FromClient_luaLoadComplete_PaGlobal_RecentCook")
registerEvent("FromClient_UpdateAlchemyRecord", "FromClient_UpdateAlchemyRecord_RecentCook")

