-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\changeitem\panel_changeitem.luac 

-- params : ...
-- function num : 0
Panel_ChangeItem:SetShow(false)
Panel_ChangeItem:RegisterShowEventFunc(true, "Panel_ChangeItem_ShowAni()")
Panel_ChangeItem:RegisterShowEventFunc(false, "Panel_ChangeItem_HideAni()")
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
local title = (UI.getChildControl)(Panel_ChangeItem, "StaticText_Title")
local btn_CloseIcon = (UI.getChildControl)(Panel_ChangeItem, "Button_CloseIcon")
local btn_Close = (UI.getChildControl)(Panel_ChangeItem, "Button_Close")
local btn_Apply = (UI.getChildControl)(Panel_ChangeItem, "Button_Apply")
local runEffect = (UI.getChildControl)(Panel_ChangeItem, "Static_BackEffect")
local equipIcon = (UI.getChildControl)(Panel_ChangeItem, "equipIcon_1")
local avatarIcon = (UI.getChildControl)(Panel_ChangeItem, "equipIcon_2")
local _buttonQuestion = (UI.getChildControl)(Panel_ChangeItem, "Button_Question")
_buttonQuestion:addInputEvent("Mouse_LUp", "Panel_WebHelper_ShowToggle( \"ClothExchange\" )")
_buttonQuestion:addInputEvent("Mouse_On", "HelpMessageQuestion_Show( \"ClothExchange\", \"true\")")
_buttonQuestion:addInputEvent("Mouse_Out", "HelpMessageQuestion_Show( \"ClothExchange\", \"false\")")
local equipSlot = {}
local avatarSlot = {}
local selectedItemSlotNo, selectedItemWhere = nil, nil
local elapsTime = 0
local doChange = false
local resultItemKey = 0
local isChangeDoing = false
local slotConfig = {createIcon = true, createBorder = true, createCount = true, createCash = false}
local initiallize = function()
  -- function num : 0_0 , upvalues : btn_Apply, btn_Close, btn_CloseIcon, equipSlot, equipIcon, slotConfig, avatarSlot, avatarIcon, runEffect
  btn_Apply:addInputEvent("Mouse_LUp", "ItemChange_ApplyChangeItem()")
  btn_Close:addInputEvent("Mouse_LUp", "ItemChange_Close()")
  btn_CloseIcon:addInputEvent("Mouse_LUp", "ItemChange_Close()")
  ;
  (SlotItem.new)(equipSlot, "ChangeItem_equipSlot", 0, equipIcon, slotConfig)
  equipSlot:createChild()
  ;
  (equipSlot.icon):SetPosX(0)
  ;
  (equipSlot.icon):SetPosY(0)
  ;
  (equipSlot.icon):addInputEvent("Mouse_On", "ItemChange_IconOver( true, " .. 0 .. " )")
  ;
  (equipSlot.icon):addInputEvent("Mouse_Out", "ItemChange_IconOver( false, " .. 0 .. " )")
  ;
  (SlotItem.new)(avatarSlot, "ChangeItem_avatarSlot", 0, avatarIcon, slotConfig)
  avatarSlot:createChild()
  ;
  (avatarSlot.icon):SetPosX(0)
  ;
  (avatarSlot.icon):SetPosY(0)
  ;
  (avatarSlot.icon):addInputEvent("Mouse_On", "ItemChange_IconOver( true, " .. 1 .. " )")
  ;
  (avatarSlot.icon):addInputEvent("Mouse_Out", "ItemChange_IconOver( false, " .. 1 .. " )")
  runEffect:SetShow(false)
  btn_Apply:SetShow(true)
  btn_Close:SetShow(false)
  btn_Apply:SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_CHANGEITEM_TITLE"))
  local btnApplySizeX = btn_Apply:GetSizeX() + 23
  local btnApplyTextPosX = btnApplySizeX - btnApplySizeX / 2 - btn_Apply:GetTextSizeX() / 2
  btn_Apply:SetTextSpan(btnApplyTextPosX, 6)
end

initiallize()
Panel_ChangeItem_ShowAni = function()
  -- function num : 0_1 , upvalues : UI_ANI_ADV
  (UIAni.fadeInSCR_Down)(Panel_ChangeItem)
  local aniInfo1 = Panel_ChangeItem:addScaleAnimation(0, 0.08, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo1:SetStartScale(0.5)
  aniInfo1:SetEndScale(1.1)
  aniInfo1.AxisX = Panel_ChangeItem:GetSizeX() / 2
  aniInfo1.AxisY = Panel_ChangeItem:GetSizeY() / 2
  aniInfo1.ScaleType = 2
  aniInfo1.IsChangeChild = true
  local aniInfo2 = Panel_ChangeItem:addScaleAnimation(0.08, 0.15, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo2:SetStartScale(1.1)
  aniInfo2:SetEndScale(1)
  aniInfo2.AxisX = Panel_ChangeItem:GetSizeX() / 2
  aniInfo2.AxisY = Panel_ChangeItem:GetSizeY() / 2
  aniInfo2.ScaleType = 2
  aniInfo2.IsChangeChild = true
end

Panel_ChangeItem_HideAni = function()
  -- function num : 0_2
  Panel_ChangeItem:SetAlpha(1)
  local aniInfo = (UIAni.AlphaAnimation)(0, Panel_ChangeItem, 0, 0.1)
  aniInfo:SetHideAtEnd(true)
end

FromClient_ShowItemChange = function()
  -- function num : 0_3 , upvalues : selectedItemSlotNo, selectedItemWhere, elapsTime, doChange, resultItemKey, btn_Apply, btn_Close, runEffect, avatarSlot
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
  Panel_ChangeItem:SetShow(true, true)
  Inventory_SetFunctor(ItemChange_SetFilter, ItemChange_Rclick, nil, nil)
  Inventory_SetShow(true)
end

ItemChange_SetFilter = function(slotNo, itemWrapper, currentWhereType)
  -- function num : 0_4
  local itemKey = (itemWrapper:get()):getKey()
  local isUseableItem = getItemChange(itemKey)
  if isUseableItem == nil then
    return true
  else
    return false
  end
end

ItemChange_Rclick = function(slotNo, itemWrapper, count_s64, inventoryType)
  -- function num : 0_5 , upvalues : selectedItemSlotNo, selectedItemWhere, elapsTime, equipSlot, btn_Apply, resultItemKey, avatarSlot
  selectedItemSlotNo = slotNo
  selectedItemWhere = inventoryType
  elapsTime = 0
  equipSlot:clearItem()
  equipSlot:setItem(itemWrapper)
  btn_Apply:SetMonoTone(false)
  btn_Apply:SetEnable(true)
  btn_Apply:SetIgnore(false)
  local itemKey = (itemWrapper:get()):getKey()
  local itemSSW = getItemChange(itemKey)
  resultItemKey = (itemSSW:get())._key
  avatarSlot:clearItem()
  avatarSlot:setItemByStaticStatus(itemSSW, 1, nil, nil, true)
  ;
  (avatarSlot.icon):SetMonoTone(true)
end

ItemChange_ApplyChangeItem = function()
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

FromClient_ItemChange = function(itemSSW)
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

ItemChange_IconOver = function(isShow, controlId)
  -- function num : 0_8 , upvalues : selectedItemWhere, selectedItemSlotNo, equipSlot, avatarSlot, resultItemKey
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
          if resultItemKey == 0 then
            return 
          end
          local itemSSW = getItemEnchantStaticStatus(resultItemKey)
          Panel_Tooltip_Item_Show(itemSSW, control, true, false, nil, nil, nil)
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

ItemChange_Close = function()
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
  Panel_ChangeItem:SetShow(false, false)
end

ItemChange_updateTime = function(deltaTime)
  -- function num : 0_10 , upvalues : elapsTime, selectedItemSlotNo, selectedItemWhere, doChange, runEffect, avatarSlot, isChangeDoing, btn_Apply, btn_Close
  elapsTime = elapsTime + deltaTime
  if elapsTime > 3 then
    if selectedItemSlotNo == nil or selectedItemWhere == nil or doChange == false then
      return 
    end
    runEffect:SetShow(false)
    ;
    (avatarSlot.icon):AddEffect("UI_ItemEnchant01", false, -5, -5)
    useItemChange(selectedItemWhere, selectedItemSlotNo)
    doChange = false
    isChangeDoing = false
    btn_Apply:SetShow(false)
    btn_Close:SetShow(true)
  end
  if elapsTime > 4 then
    elapsTime = 0
  end
end

FGlobal_ItemChange_IsDoing = function()
  -- function num : 0_11 , upvalues : isChangeDoing
  return isChangeDoing
end

Panel_ChangeItem:RegisterUpdateFunc("ItemChange_updateTime")
registerEvent("FromClient_ShowItemChange", "FromClient_ShowItemChange")
registerEvent("FromClient_ItemChange", "FromClient_ItemChange")

