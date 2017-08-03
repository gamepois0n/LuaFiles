-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\changeitem\panel_changeweapon.luac 

-- params : ...
-- function num : 0
Panel_ChangeWeapon:SetShow(false)
Panel_ChangeWeapon:setMaskingChild(true)
Panel_ChangeWeapon:setGlassBackground(true)
Panel_ChangeWeapon:RegisterShowEventFunc(true, "Panel_ChangeWeapon_ShowAni()")
Panel_ChangeWeapon:RegisterShowEventFunc(false, "Panel_ChangeWeapon_HideAni()")
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
local title = (UI.getChildControl)(Panel_ChangeWeapon, "StaticText_Title")
local btn_CloseIcon = (UI.getChildControl)(Panel_ChangeWeapon, "Button_CloseIcon")
local btn_Close = (UI.getChildControl)(Panel_ChangeWeapon, "Button_Close")
local btn_Apply = (UI.getChildControl)(Panel_ChangeWeapon, "Button_Apply")
local runEffect = (UI.getChildControl)(Panel_ChangeWeapon, "Static_BackEffect")
local equipIcon = (UI.getChildControl)(Panel_ChangeWeapon, "equipIcon_1")
local avatarIcon = (UI.getChildControl)(Panel_ChangeWeapon, "equipIcon_2")
local _buttonQuestion = (UI.getChildControl)(Panel_ChangeWeapon, "Button_Question")
_buttonQuestion:addInputEvent("Mouse_LUp", "Panel_WebHelper_ShowToggle( \"ClothExchange\" )")
_buttonQuestion:addInputEvent("Mouse_On", "HelpMessageQuestion_Show( \"ClothExchange\", \"true\")")
_buttonQuestion:addInputEvent("Mouse_Out", "HelpMessageQuestion_Show( \"ClothExchange\", \"false\")")
_buttonQuestion:SetShow(false)
local equipSlot = {}
local avatarSlot = {}
local selectedItemSlotNo, selectedItemWhere = nil, nil
local elapsTime = 0
local doChange = false
local resultItemKey = 0
local isChangeDoing = false
local slotConfig = {createIcon = true, createBorder = true, createCount = true, createCash = false, createEnchant = true}
local initiallize = function()
  -- function num : 0_0 , upvalues : btn_Apply, btn_Close, btn_CloseIcon, equipSlot, equipIcon, slotConfig, avatarSlot, avatarIcon, runEffect
  btn_Apply:addInputEvent("Mouse_LUp", "WeaponChange_ApplyChangeItem()")
  btn_Close:addInputEvent("Mouse_LUp", "WeaponChange_Close()")
  btn_CloseIcon:addInputEvent("Mouse_LUp", "WeaponChange_Close()")
  ;
  (SlotItem.new)(equipSlot, "ChangeWeapon_equipSlot", 0, equipIcon, slotConfig)
  equipSlot:createChild()
  ;
  (equipSlot.icon):SetPosX(0)
  ;
  (equipSlot.icon):SetPosY(0)
  ;
  (equipSlot.icon):addInputEvent("Mouse_On", "WeaponChange_IconOver( true, " .. 0 .. " )")
  ;
  (equipSlot.icon):addInputEvent("Mouse_Out", "WeaponChange_IconOver( false, " .. 0 .. " )")
  ;
  (SlotItem.new)(avatarSlot, "ChangeWeapon_avatarSlot", 0, avatarIcon, slotConfig)
  avatarSlot:createChild()
  ;
  (avatarSlot.icon):SetPosX(0)
  ;
  (avatarSlot.icon):SetPosY(0)
  ;
  (avatarSlot.icon):addInputEvent("Mouse_On", "WeaponChange_IconOver( true, " .. 1 .. " )")
  ;
  (avatarSlot.icon):addInputEvent("Mouse_Out", "WeaponChange_IconOver( false, " .. 1 .. " )")
  runEffect:SetShow(false)
  btn_Apply:SetShow(true)
  btn_Close:SetShow(false)
  btn_Apply:SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_CHANGEWEAPON_EXCHANGE"))
  local btnApplySizeX = btn_Apply:GetSizeX() + 23
  local btnApplyTextPosX = btnApplySizeX - btnApplySizeX / 2 - btn_Apply:GetTextSizeX() / 2
  btn_Apply:SetTextSpan(btnApplyTextPosX, 6)
end

initiallize()
Panel_ChangeWeapon_ShowAni = function()
  -- function num : 0_1 , upvalues : UI_ANI_ADV
  (UIAni.fadeInSCR_Down)(Panel_ChangeWeapon)
  local aniInfo1 = Panel_ChangeWeapon:addScaleAnimation(0, 0.08, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo1:SetStartScale(0.5)
  aniInfo1:SetEndScale(1.1)
  aniInfo1.AxisX = Panel_ChangeWeapon:GetSizeX() / 2
  aniInfo1.AxisY = Panel_ChangeWeapon:GetSizeY() / 2
  aniInfo1.ScaleType = 2
  aniInfo1.IsChangeChild = true
  local aniInfo2 = Panel_ChangeWeapon:addScaleAnimation(0.08, 0.15, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo2:SetStartScale(1.1)
  aniInfo2:SetEndScale(1)
  aniInfo2.AxisX = Panel_ChangeWeapon:GetSizeX() / 2
  aniInfo2.AxisY = Panel_ChangeWeapon:GetSizeY() / 2
  aniInfo2.ScaleType = 2
  aniInfo2.IsChangeChild = true
end

Panel_ChangeWeapon_HideAni = function()
  -- function num : 0_2
  Panel_ChangeWeapon:SetAlpha(1)
  local aniInfo = (UIAni.AlphaAnimation)(0, Panel_ChangeWeapon, 0, 0.1)
  aniInfo:SetHideAtEnd(true)
end

local materialWhereType, materialSlotno = nil, nil
FromClient_UseItemExchangeToClass = function(whereType, SlotNo)
  -- function num : 0_3 , upvalues : selectedItemSlotNo, selectedItemWhere, elapsTime, doChange, resultItemKey, btn_Apply, btn_Close, runEffect, avatarSlot, materialWhereType, materialSlotno
  selectedItemSlotNo = nil
  selectedItemWhere = nil
  elapsTime = 0
  doChange = false
  resultItemKey = 0
  btn_Apply:SetShow(true)
  btn_Close:SetShow(false)
  runEffect:SetShow(false)
  btn_Apply:SetMonoTone(true)
  btn_Apply:SetEnable(false)
  btn_Apply:SetIgnore(true)
  ;
  (avatarSlot.icon):EraseAllEffect()
  materialWhereType = whereType
  materialSlotno = SlotNo
  Panel_ChangeWeapon:SetShow(true, true)
  Inventory_SetFunctor(WeaponChange_SetFilter, WeaponChange_Rclick, nil, nil)
  Inventory_SetShow(true)
end

WeaponChange_SetFilter = function(slotNo, itemWrapper, whereType)
  -- function num : 0_4 , upvalues : materialWhereType, materialSlotno
  local itemKey = (itemWrapper:get()):getKey()
  local changeItemWrapper = getExchangeItem(whereType, slotNo, materialWhereType, materialSlotno)
  if changeItemWrapper == nil then
    return true
  else
    local itemSSW = changeItemWrapper:getStaticStatus()
    local itemWrapper = getInventoryItemByType(materialWhereType, materialSlotno)
    local filterClassType = (itemWrapper:getStaticStatus()):getContentsEventParam1()
    local classType = (getSelfPlayer()):getClassType()
    local itemStaticStatus = (getInventoryItemByType(whereType, slotNo)):getStaticStatus()
    if filterClassType == -1 then
      return ((itemStaticStatus:get())._usableClassType):isOn(classType)
    else
      return ((itemStaticStatus:get())._usableClassType):isOn(filterClassType)
    end
  end
end

WeaponChange_Rclick = function(slotNo, itemWrapper, count_s64, inventoryType)
  -- function num : 0_5 , upvalues : selectedItemSlotNo, selectedItemWhere, elapsTime, equipSlot, btn_Apply, materialWhereType, materialSlotno, resultItemKey, avatarSlot
  selectedItemSlotNo = slotNo
  selectedItemWhere = inventoryType
  elapsTime = 0
  equipSlot:clearItem()
  equipSlot:setItem(itemWrapper)
  btn_Apply:SetMonoTone(false)
  btn_Apply:SetEnable(true)
  btn_Apply:SetIgnore(false)
  local itemKey = (itemWrapper:get()):getKey()
  local toItemWrapper = getExchangeItem(inventoryType, slotNo, materialWhereType, materialSlotno)
  if toItemWrapper ~= nil then
    resultItemKey = ((toItemWrapper:get()):getKey()):getItemKey()
    avatarSlot:clearItem()
    avatarSlot:setItemByStaticStatus(toItemWrapper:getStaticStatus(), 1, nil, nil, true)
    ;
    (avatarSlot.icon):SetMonoTone(true)
  end
end

WeaponChange_ApplyChangeItem = function()
  -- function num : 0_6 , upvalues : selectedItemWhere, selectedItemSlotNo, elapsTime, doChange, isChangeDoing, runEffect, btn_Apply
  if selectedItemWhere == nil or selectedItemSlotNo == nil then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_CHANGEWEAPON_SELECTITEM"))
    return 
  end
  elapsTime = 0
  doChange = true
  isChangeDoing = true
  audioPostEvent_SystemUi(13, 15)
  runEffect:SetShow(true)
  btn_Apply:SetMonoTone(true)
  btn_Apply:SetEnable(false)
  btn_Apply:SetIgnore(true)
end

FromClient_WeaponChange = function(itemSSW)
  -- function num : 0_7 , upvalues : equipSlot, avatarSlot, selectedItemSlotNo, selectedItemWhere, elapsTime, doChange, resultItemKey
  equipSlot:clearItem()
  avatarSlot:clearItem()
  selectedItemSlotNo = nil
  selectedItemWhere = nil
  elapsTime = 0
  doChange = false
  resultItemKey = (itemSSW:get())._key
  avatarSlot:setItemByStaticStatus(itemSSW, 1, nil, nil, true)
  ;
  (avatarSlot.icon):SetMonoTone(false)
end

WeaponChange_IconOver = function(isShow, controlId)
  -- function num : 0_8 , upvalues : selectedItemWhere, selectedItemSlotNo, equipSlot, avatarSlot, materialWhereType, materialSlotno
  if isShow then
    local control = nil
    if controlId == 0 then
      if selectedItemWhere == nil or selectedItemSlotNo == nil then
        return 
      end
      control = equipSlot.icon
      local itemWrapper = getInventoryItemByType(selectedItemWhere, selectedItemSlotNo)
      Panel_Tooltip_Item_Show(itemWrapper, control, false, true, nil, nil, nil)
    else
      do
        if controlId == 1 then
          control = avatarSlot.icon
          local toItemWrapper = getExchangeItem(selectedItemWhere, selectedItemSlotNo, materialWhereType, materialSlotno)
          if toItemWrapper ~= nil then
            local itemSSW = toItemWrapper:getStaticStatus()
            Panel_Tooltip_Item_Show(itemSSW, control, true, false, nil, nil, nil)
          end
        else
          do
            do
              do return  end
              Panel_Tooltip_Item_hideTooltip()
            end
          end
        end
      end
    end
  end
end

WeaponChange_Close = function()
  -- function num : 0_9 , upvalues : isChangeDoing, equipSlot, avatarSlot, selectedItemSlotNo, selectedItemWhere, elapsTime, doChange, resultItemKey, btn_Apply, btn_Close, runEffect
  if isChangeDoing == true then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_CHANGEITEM_DONOT_CLOSE"))
    return 
  end
  equipSlot:clearItem()
  avatarSlot:clearItem()
  selectedItemSlotNo = nil
  selectedItemWhere = nil
  elapsTime = 0
  doChange = false
  resultItemKey = 0
  isChangeDoing = false
  btn_Apply:SetShow(true)
  btn_Close:SetShow(false)
  runEffect:SetShow(false)
  Inventory_SetFunctor(nil, nil, nil, nil)
  Panel_ChangeWeapon:SetShow(false, false)
end

WeaponChange_updateTime = function(deltaTime)
  -- function num : 0_10 , upvalues : elapsTime, selectedItemSlotNo, selectedItemWhere, doChange, runEffect, avatarSlot, materialWhereType, materialSlotno, isChangeDoing, btn_Apply, btn_Close
  elapsTime = elapsTime + deltaTime
  if elapsTime > 3 then
    if selectedItemSlotNo == nil or selectedItemWhere == nil or doChange == false then
      return 
    end
    runEffect:SetShow(false)
    ;
    (avatarSlot.icon):AddEffect("UI_ItemEnchant01", false, -5, -5)
    exchangeItemToClass(selectedItemWhere, selectedItemSlotNo, materialWhereType, materialSlotno)
    doChange = false
    isChangeDoing = false
    btn_Apply:SetShow(false)
    btn_Close:SetShow(true)
  end
  if elapsTime > 4 then
    elapsTime = 0
  end
end

FGlobal_WeaponChange_IsDoing = function()
  -- function num : 0_11 , upvalues : isChangeDoing
  return isChangeDoing
end

FromClient_UseItemExchangeToClassNotify = function()
  -- function num : 0_12
  WeaponChange_Close()
  Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_CHANGEWEAPON_SUCCESS_CHANGEITEM"))
end

Panel_ChangeWeapon:RegisterUpdateFunc("WeaponChange_updateTime")
registerEvent("FromClient_UseItemExchangeToClass", "FromClient_UseItemExchangeToClass")
registerEvent("FromClient_UseItemExchangeToClassNotify", "FromClient_UseItemExchangeToClassNotify")

