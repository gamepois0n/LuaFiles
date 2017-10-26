-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\buildingbuff\panel_window_buildingbuff.luac 

-- params : ...
-- function num : 0
Panel_Window_BuildingBuff:SetShow(false)
PaGlobal_BuildingBuff = {
_ui = {_list2 = (UI.getChildControl)(Panel_Window_BuildingBuff, "List2_BuffList"), _btn_Close = (UI.getChildControl)(Panel_Window_BuildingBuff, "Button_Win_Close")}
, _maxPriceKey = 0, 
_keyCount = {}
, 
_buffCount = {}
, 
_limitControl = {}
, 
_limitControlDesc = {}
}
-- DECOMPILER ERROR at PC31: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_BuildingBuff.initialize = function(self)
  -- function num : 0_0
  self._maxPriceKey = ToClient_GetBuildingBuffCount()
  PaGlobal_BuildingBuff:setPos()
end

-- DECOMPILER ERROR at PC34: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_BuildingBuff.open = function(self)
  -- function num : 0_1
  local selfPlayer = (getSelfPlayer()):get()
  local regionInfo = getRegionInfoByPosition(selfPlayer:getPosition())
  if regionInfo == nil then
    return 
  end
  local regionInfoWrapper = getRegionInfoWrapper(regionInfo:getAffiliatedTownRegionKey())
  local wayKey = (regionInfoWrapper:getPlantKeyByWaypointKey()):getWaypointKey()
  if ToClient_IsAccessibleRegionKey(regionInfo:getAffiliatedTownRegionKey()) == true then
    warehouse_requestInfo((regionInfoWrapper:get())._waypointKey)
  else
    local plantWayKey = ToClient_GetOtherRegionKey_NeerByTownRegionKey()
    local newRegionInfo = ToClient_getRegionInfoWrapperByWaypoint(plantWayKey)
    if newRegionInfo == nil then
      return 
    end
    warehouse_requestInfo((newRegionInfo:get())._waypointKey)
  end
  do
    Panel_Window_BuildingBuff:SetShow(true)
    ;
    (((self._ui)._list2):getElementManager()):clearKey()
    self._buffInfo = {}
    local buffCount = 0
    for index = 0, self._maxPriceKey - 1 do
      local buffMaxCount = ToClient_GetCountPerBuffKeyCount(index)
      for buffIndex = 0, buffMaxCount - 1 do
        -- DECOMPILER ERROR at PC70: Confused about usage of register: R11 in 'UnsetPending'

        (self._keyCount)[buffCount] = index
        -- DECOMPILER ERROR at PC72: Confused about usage of register: R11 in 'UnsetPending'

        ;
        (self._buffCount)[buffCount] = buffIndex
        buffCount = buffCount + 1
      end
    end
    for index = 0, buffCount - 1 do
      (((self._ui)._list2):getElementManager()):pushKey(toInt64(0, index))
    end
  end
end

-- DECOMPILER ERROR at PC37: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_BuildingBuff.close = function(self)
  -- function num : 0_2
  Panel_Window_BuildingBuff:SetShow(false)
end

-- DECOMPILER ERROR at PC40: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_BuildingBuff.setPos = function(self)
  -- function num : 0_3
  Panel_Window_BuildingBuff:SetPosX(getScreenSizeX() / 2 - Panel_Window_BuildingBuff:GetSizeX() / 2)
  Panel_Window_BuildingBuff:SetPosY(getScreenSizeY() / 2 - Panel_Window_BuildingBuff:GetSizeY() / 2)
end

-- DECOMPILER ERROR at PC43: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_BuildingBuff.update = function(self)
  -- function num : 0_4
end

BuildingBuff_ListControlCreate = function(content, key)
  -- function num : 0_5
  PaGlobal_BuildingBuff:BuildingBuff_ListControlCreate(content, key)
end

-- DECOMPILER ERROR at PC48: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_BuildingBuff.BuildingBuff_ListControlCreate = function(self, content, key)
  -- function num : 0_6
  local index = Int64toInt32(key)
  local keyText = (UI.getChildControl)(content, "StaticText_List2_KeyCount")
  local buff = (UI.getChildControl)(content, "StaticText_List2_BuffDesc")
  local applyBtn = (UI.getChildControl)(content, "Static_List2_ApplyButton")
  local price = (UI.getChildControl)(content, "StaticText_List2_Price")
  local keyCount = (self._keyCount)[index]
  local buffIndex = (self._buffCount)[index]
  keyText:SetText(tostring((self._keyCount)[index] + 1) .. "ê°\156")
  local skillNo = ToClient_GetBuildingBuff(keyCount, buffIndex)
  if skillNo ~= 0 then
    local skillWrapper = getSkillTypeStaticStatus(skillNo)
    local buffPrice = ToClient_GetBuildingBuffCost(keyCount, buffIndex)
    buffPrice = makeDotMoney(buffPrice)
    buff:SetTextMode((CppEnums.TextMode).eTextMode_Limit_AutoWrap)
    buff:SetText(tostring(skillWrapper:getName()))
    -- DECOMPILER ERROR at PC67: Confused about usage of register: R13 in 'UnsetPending'

    ;
    (self._limitControlDesc)[index] = skillWrapper:getDescription()
    -- DECOMPILER ERROR at PC69: Confused about usage of register: R13 in 'UnsetPending'

    ;
    (self._limitControl)[index] = buff
    buff:addInputEvent("Mouse_On", "PaGlobal_BuildingBuff:limitTextTooltip(true, " .. index .. " )")
    buff:addInputEvent("Mouse_Out", "PaGlobal_BuildingBuff:limitTextTooltip(false, " .. index .. " )")
    price:SetText(tostring(buffPrice))
    applyBtn:addInputEvent("Mouse_LUp", "PaGlobal_BuildingBuff:applyBuff(" .. keyCount .. "," .. buffIndex .. ", " .. index .. ")")
  end
end

-- DECOMPILER ERROR at PC51: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_BuildingBuff.limitTextTooltip = function(self, isShow, index, skillWrapper)
  -- function num : 0_7
  if isShow == false then
    TooltipSimple_Hide()
    return 
  end
  name = (self._limitControlDesc)[index]
  TooltipSimple_Show((self._limitControl)[index], name)
end

-- DECOMPILER ERROR at PC54: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_BuildingBuff.applyBuff = function(self, keyCount, buffIndex, index)
  -- function num : 0_8
  local apply = function()
    -- function num : 0_8_0 , upvalues : keyCount, buffIndex
    ToClient_ApplyBuildingBuff(keyCount, buffIndex)
  end

  local messageBoxMemo = ((self._limitControl)[index]):GetText() .. " " .. PAGetString(Defines.StringSheet_GAME, "LUA_CAMP_BUILDINGBUFF_MESSAGEBOX_DESC")
  local messageBoxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_MESSAGEBOX_NOTIFY"), content = messageBoxMemo, functionYes = apply, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
  ;
  (MessageBox.showMessageBox)(messageBoxData)
end

-- DECOMPILER ERROR at PC57: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_BuildingBuff.registEventHandler = function(self)
  -- function num : 0_9
  ((self._ui)._list2):registEvent((CppEnums.PAUIList2EventType).luaChangeContent, "BuildingBuff_ListControlCreate")
  ;
  ((self._ui)._list2):createChildContent((CppEnums.PAUIList2ElementManagerType).list)
  ;
  ((self._ui)._btn_Close):addInputEvent("Mouse_LUp", "PaGlobal_BuildingBuff:close()")
end

PaGlobal_BuildingBuff:registEventHandler()
PaGlobal_BuildingBuff:initialize()

