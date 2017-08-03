-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\messagebox\panel_useitem.luac 

-- params : ...
-- function num : 0
local UI_TM = CppEnums.TextMode
local UI_PSFT = CppEnums.PAUI_SHOW_FADE_TYPE
local UI_color = Defines.Color
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
local UI_PUCT = CppEnums.PA_UI_CONTROL_TYPE
local const_64 = Defines.s64_const
Panel_UseItem:setGlassBackground(true)
Panel_UseItem:ActiveMouseEventEffect(true)
local _title = (UI.getChildControl)(Panel_UseItem, "Static_Text_Title")
local _frame = (UI.getChildControl)(Panel_UseItem, "Frame_UseItem")
local _frameContent = (UI.getChildControl)(_frame, "Frame_1_Content")
local _frameScroll = (UI.getChildControl)(_frame, "Frame_1_VerticalScroll")
local _backGround = (UI.getChildControl)(Panel_UseItem, "Static_Background")
local _descBG = (UI.getChildControl)(Panel_UseItem, "Static_DescBG")
local _desc = (UI.getChildControl)(_frameContent, "StaticText_Desc")
local _btn_Yes = (UI.getChildControl)(Panel_UseItem, "Button_Yes")
local _btn_No = (UI.getChildControl)(Panel_UseItem, "Button_No")
local _btn_Close = (UI.getChildControl)(Panel_UseItem, "Button_Close")
local group_0 = Panel_UseItem:addConsoleUIGroup(0, (CppEnums.PA_CONSOLE_UI_CONTROL_TYPE).eCONSOLE_UI_CONTROL_TYPE_NOTEVENT)
group_0:addControl(0, 0, 2, 1, _btn_Yes)
group_0:addControl(1, 0, 2, 1, _btn_No)
local _copyItemSlot = (UI.getChildControl)(Panel_UseItem, "Static_C_ItemSlot")
_copyItemSlot:SetShow(false)
local popupItem = {
slotInfo = {}
, 
slotInfoBG = {}
, 
slotInfoForBuff = {}
, 
slotInfoForBuffBG = {}
, slotIndex = 0, selectWhereType = nil, selectSlotNo = nil, selectEquipNo = 0, totalRowCount = 0}
local slotConfig = {createIcon = true, createBorder = false, createCount = true, createExpiration = false, createCash = true}
local maxPopupSlotCount = 10
local baseSlotLineCount = 5
local descBG_sizeY = 0
global_PopupItemItemWrapper = nil
getPopupIteWrapper = function()
  -- function num : 0_0
  return global_PopupItemItemWrapper
end

Panel_UseItem_Initialize = function()
  -- function num : 0_1 , upvalues : descBG_sizeY, maxPopupSlotCount, popupItem, UI_PUCT, _copyItemSlot, slotConfig
  descBG_sizeY = 0
  for idx = 1, maxPopupSlotCount do
    -- DECOMPILER ERROR at PC17: Confused about usage of register: R4 in 'UnsetPending'

    (popupItem.slotInfoBG)[idx] = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATIC, Panel_UseItem, "Static_EmptyItemSlotBG_" .. idx)
    CopyBaseProperty(_copyItemSlot, (popupItem.slotInfoBG)[idx])
    local slot = {}
    ;
    (SlotItem.new)(slot, "PopupUserItem_" .. idx, idx, Panel_UseItem, slotConfig)
    slot:createChild()
    -- DECOMPILER ERROR at PC39: Confused about usage of register: R5 in 'UnsetPending'

    ;
    (popupItem.slotInfo)[idx] = slot
    -- DECOMPILER ERROR at PC51: Confused about usage of register: R5 in 'UnsetPending'

    ;
    (popupItem.slotInfoForBuffBG)[idx] = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATIC, Panel_UseItem, "Static_EmptyBuffSlotBG_" .. idx)
    CopyBaseProperty(_copyItemSlot, (popupItem.slotInfoForBuffBG)[idx])
    -- DECOMPILER ERROR at PC69: Confused about usage of register: R5 in 'UnsetPending'

    ;
    (popupItem.slotInfoForBuff)[idx] = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATIC, Panel_UseItem, "Static_EmptyBuffSlot_" .. idx)
    CopyBaseProperty(_copyItemSlot, (popupItem.slotInfoForBuff)[idx])
  end
  Panel_UseItem_AddEventContol()
end

local resetUIcontrol = function()
  -- function num : 0_2 , upvalues : maxPopupSlotCount, popupItem
  for idx = 1, maxPopupSlotCount do
    ((popupItem.slotInfoBG)[idx]):SetShow(false)
    ;
    (((popupItem.slotInfo)[idx]).icon):SetShow(false)
    ;
    ((popupItem.slotInfoForBuff)[idx]):SetShow(false)
    ;
    ((popupItem.slotInfoForBuffBG)[idx]):SetShow(false)
  end
  -- DECOMPILER ERROR at PC31: Confused about usage of register: R0 in 'UnsetPending'

  popupItem.totalRowCount = 0
end

local GetBottomPos = function(control)
  -- function num : 0_3
  if control == nil then
    return 
  end
  return control:GetPosY() + control:GetSizeY()
end

Panel_UseItem_RepositionSlot = function(slotCount)
  -- function num : 0_4 , upvalues : baseSlotLineCount, popupItem, _desc, _copyItemSlot, GetBottomPos, descBG_sizeY, _descBG, _backGround, _btn_Yes, _btn_No
  local remain = slotCount % baseSlotLineCount
  local row = (math.floor)(slotCount / baseSlotLineCount)
  local slotIndexCount = row * baseSlotLineCount + remain
  -- DECOMPILER ERROR at PC13: Confused about usage of register: R4 in 'UnsetPending'

  if slotIndexCount == 0 then
    popupItem.slotIndex = 0
    return 
  end
  -- DECOMPILER ERROR at PC17: Confused about usage of register: R4 in 'UnsetPending'

  popupItem.totalRowCount = row + 1
  local startX = _desc:GetPosX() + 5
  local startY = _desc:GetPosY() + _desc:GetSizeY() + 30
  local slotSizeX = _copyItemSlot:GetSizeX()
  local slotSizeY = _copyItemSlot:GetSizeY()
  local UIindex = 0
  local UIPosX = 0
  local UIPosY = 0
  for idy = 0, row do
    for idx = 1, baseSlotLineCount do
      UIindex = idx + idy * baseSlotLineCount
      if slotIndexCount < UIindex then
        break
      end
      UIPosX = startX + slotSizeX * (idx - 1) + 8 * (idx - 1)
      UIPosY = startY + slotSizeY * idy + 5 * idy
      if slotIndexCount == 1 then
        ((popupItem.slotInfoBG)[UIindex]):SetPosX(Panel_UseItem:GetSizeX() / 2 - ((popupItem.slotInfoBG)[UIindex]):GetSizeX() / 2)
        ;
        ((popupItem.slotInfoBG)[UIindex]):SetPosY(UIPosY)
        ;
        ((popupItem.slotInfoBG)[UIindex]):SetShow(true)
        ;
        (((popupItem.slotInfo)[UIindex]).icon):SetPosX(Panel_UseItem:GetSizeX() / 2 - ((popupItem.slotInfoBG)[UIindex]):GetSizeX() / 2 + 2)
        ;
        (((popupItem.slotInfo)[UIindex]).icon):SetPosY(UIPosY + 3)
        ;
        (((popupItem.slotInfo)[UIindex]).icon):SetShow(true)
        local bgBottomPos = GetBottomPos((popupItem.slotInfoBG)[UIindex])
        descBG_sizeY = bgBottomPos - _descBG:GetPosY() + 7
      else
        do
          if slotIndexCount <= 4 then
            ((popupItem.slotInfoBG)[UIindex]):SetPosX(UIPosX)
            ;
            ((popupItem.slotInfoBG)[UIindex]):SetPosY(UIPosY)
            ;
            ((popupItem.slotInfoBG)[UIindex]):SetShow(true)
            ;
            (((popupItem.slotInfo)[UIindex]).icon):SetPosX(UIPosX + 3)
            ;
            (((popupItem.slotInfo)[UIindex]).icon):SetPosY(UIPosY + 3)
            ;
            (((popupItem.slotInfo)[UIindex]).icon):SetShow(true)
            local bgBottomPos = GetBottomPos((popupItem.slotInfoBG)[UIindex])
            descBG_sizeY = bgBottomPos - _descBG:GetPosY() + 7
          else
            do
              if slotIndexCount > 4 then
                ((popupItem.slotInfoBG)[UIindex]):SetPosX(UIPosX)
                ;
                ((popupItem.slotInfoBG)[UIindex]):SetPosY(UIPosY)
                ;
                ((popupItem.slotInfoBG)[UIindex]):SetShow(true)
                ;
                (((popupItem.slotInfo)[UIindex]).icon):SetPosX(UIPosX + 3)
                ;
                (((popupItem.slotInfo)[UIindex]).icon):SetPosY(UIPosY + 3)
                ;
                (((popupItem.slotInfo)[UIindex]).icon):SetShow(true)
                local bgBottomPos = GetBottomPos((popupItem.slotInfoBG)[UIindex])
                descBG_sizeY = bgBottomPos - _descBG:GetPosY() + 7
              end
              do
                -- DECOMPILER ERROR at PC242: LeaveBlock: unexpected jumping out DO_STMT

                -- DECOMPILER ERROR at PC242: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                -- DECOMPILER ERROR at PC242: LeaveBlock: unexpected jumping out IF_STMT

                -- DECOMPILER ERROR at PC242: LeaveBlock: unexpected jumping out DO_STMT

                -- DECOMPILER ERROR at PC242: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                -- DECOMPILER ERROR at PC242: LeaveBlock: unexpected jumping out IF_STMT

              end
            end
          end
        end
      end
    end
  end
  _descBG:SetSize(_descBG:GetSizeX(), descBG_sizeY)
  local desc_sizeY = GetBottomPos(_descBG)
  _backGround:SetSize(Panel_UseItem:GetSizeX(), desc_sizeY + 40)
  local backgroundBottom = GetBottomPos(_backGround)
  _btn_Yes:SetPosY(backgroundBottom - _btn_Yes:GetSizeY() - 7)
  _btn_No:SetPosY(backgroundBottom - _btn_No:GetSizeY() - 7)
  -- DECOMPILER ERROR at PC282: Confused about usage of register: R13 in 'UnsetPending'

  popupItem.slotIndex = UIindex - 1
end

Panel_UseBuff_RepositionSlot = function(buffCount)
  -- function num : 0_5 , upvalues : baseSlotLineCount, popupItem, _desc, _copyItemSlot, GetBottomPos, descBG_sizeY, _descBG
  local remain = buffCount % baseSlotLineCount
  local row = (math.floor)(buffCount / baseSlotLineCount)
  local slotIndexCount = row * baseSlotLineCount + remain
  local startUI = nil
  local startX = 0
  local startY = 0
  if popupItem.slotIndex ~= 0 then
    startUI = (popupItem.slotInfoBG)[popupItem.slotIndex]
    startX = _desc:GetPosX() + 5
    startY = startUI:GetPosY() + startUI:GetSizeY() + 30
    -- DECOMPILER ERROR at PC37: Confused about usage of register: R7 in 'UnsetPending'

    popupItem.totalRowCount = popupItem.totalRowCount + row + 1
  else
    startX = _desc:GetPosX() + 5
    startY = _desc:GetPosY() + _desc:GetSizeY() + 30
    -- DECOMPILER ERROR at PC53: Confused about usage of register: R7 in 'UnsetPending'

    popupItem.totalRowCount = row + 1
  end
  local slotSizeX = _copyItemSlot:GetSizeX()
  local slotSizeY = _copyItemSlot:GetSizeY()
  local UIindex = 1
  for idy = 0, row do
    for idx = 1, baseSlotLineCount do
      UIindex = idx + idy * baseSlotLineCount
      if slotIndexCount < UIindex then
        break
      end
      UIPosX = startX + slotSizeX * (idx - 1) + 8 * (idx - 1)
      UIPosY = startY + slotSizeY * idy + 5 * idy
      if slotIndexCount == 1 then
        ((popupItem.slotInfoBG)[UIindex]):SetPosX(Panel_UseItem:GetSizeX() / 2 - ((popupItem.slotInfoBG)[UIindex]):GetSizeX() / 2)
        ;
        ((popupItem.slotInfoBG)[UIindex]):SetPosY(UIPosY)
        ;
        ((popupItem.slotInfoBG)[UIindex]):SetShow(true)
        ;
        (((popupItem.slotInfo)[UIindex]).icon):SetPosX(Panel_UseItem:GetSizeX() / 2 - ((popupItem.slotInfoBG)[UIindex]):GetSizeX() / 2 + 2)
        ;
        (((popupItem.slotInfo)[UIindex]).icon):SetPosY(UIPosY + 3)
        ;
        (((popupItem.slotInfo)[UIindex]).icon):SetShow(true)
        local bgBottomPos = GetBottomPos((popupItem.slotInfoBG)[UIindex])
        descBG_sizeY = bgBottomPos - _descBG:GetPosY() + 7
      else
        do
          if slotIndexCount <= 4 then
            ((popupItem.slotInfoBG)[UIindex]):SetPosX(UIPosX)
            ;
            ((popupItem.slotInfoBG)[UIindex]):SetPosY(UIPosY)
            ;
            ((popupItem.slotInfoBG)[UIindex]):SetShow(true)
            ;
            (((popupItem.slotInfo)[UIindex]).icon):SetPosX(UIPosX + 3)
            ;
            (((popupItem.slotInfo)[UIindex]).icon):SetPosY(UIPosY + 3)
            ;
            (((popupItem.slotInfo)[UIindex]).icon):SetShow(true)
            local bgBottomPos = GetBottomPos((popupItem.slotInfoBG)[UIindex])
            descBG_sizeY = bgBottomPos - _descBG:GetPosY() + 7
          else
            do
              if slotIndexCount > 4 then
                ((popupItem.slotInfoBG)[UIindex]):SetPosX(UIPosX)
                ;
                ((popupItem.slotInfoBG)[UIindex]):SetPosY(UIPosY)
                ;
                ((popupItem.slotInfoBG)[UIindex]):SetShow(true)
                ;
                (((popupItem.slotInfo)[UIindex]).icon):SetPosX(UIPosX + 3)
                ;
                (((popupItem.slotInfo)[UIindex]).icon):SetPosY(UIPosY + 3)
                ;
                (((popupItem.slotInfo)[UIindex]).icon):SetShow(true)
                local bgBottomPos = GetBottomPos((popupItem.slotInfoBG)[UIindex])
                descBG_sizeY = bgBottomPos - _descBG:GetPosY() + 7
              end
              do
                -- DECOMPILER ERROR at PC271: LeaveBlock: unexpected jumping out DO_STMT

                -- DECOMPILER ERROR at PC271: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                -- DECOMPILER ERROR at PC271: LeaveBlock: unexpected jumping out IF_STMT

                -- DECOMPILER ERROR at PC271: LeaveBlock: unexpected jumping out DO_STMT

                -- DECOMPILER ERROR at PC271: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                -- DECOMPILER ERROR at PC271: LeaveBlock: unexpected jumping out IF_STMT

              end
            end
          end
        end
      end
    end
  end
end

Panel_UseItem_ShowToggle_Func = function()
  -- function num : 0_6 , upvalues : _frame, _frameScroll, descBG_sizeY
  if Panel_UseItem:IsShow() then
    SetUIMode((Defines.UIMode).eUIMode_Default)
    Panel_UseItem:SetShow(false)
  else
    SetUIMode((Defines.UIMode).eUIMode_PopupItem)
    Panel_UseItem:SetShow(true)
    _frame:UpdateContentScroll()
    _frameScroll:SetControlTop()
    _frame:UpdateContentPos()
  end
  descBG_sizeY = 0
end

local fillPopupUseItemData = function(itemEnchatWrapper)
  -- function num : 0_7 , upvalues : _desc, UI_TM, _frameContent, _frameScroll, descBG_sizeY, const_64, popupItem
  _desc:SetTextMode(UI_TM.eTextMode_AutoWrap)
  _desc:SetText(itemEnchatWrapper:getPopupItemDesc())
  _frameContent:SetSize(_frameContent:GetSizeX(), _desc:GetTextSizeY() + 25)
  _desc:SetPosY(10)
  _desc:SetSize(_desc:GetSizeX(), _desc:GetTextSizeY())
  local descSizeY = _desc:GetTextSizeY()
  if descSizeY > 180 then
    _frameScroll:SetShow(true)
  else
    _frameScroll:SetShow(false)
  end
  descBG_sizeY = descBG_sizeY + _desc:GetSizeY()
  local popupItemSize = itemEnchatWrapper:getPopupItemSize()
  Panel_UseItem_RepositionSlot(popupItemSize)
  if popupItemSize ~= 0 then
    local itemESS = nil
    local itemStack = const_64.s64_0
    local expiration = nil
    for idx = 1, popupItemSize do
      itemESS = itemEnchatWrapper:getPopupItemAt(idx - 1)
      if itemESS == nil then
        (((popupItem.slotInfo)[idx]).count):SetText("")
        ;
        (((popupItem.slotInfo)[idx]).icon):ChangeTextureInfoName("icon/new_icon/03_etc/item_unknown.dds")
      else
        itemStack = itemEnchatWrapper:getPopupItemAtStatckCount(idx - 1)
        ;
        ((popupItem.slotInfo)[idx]):setItemByStaticStatus(itemESS, itemStack, -1)
        ;
        (((popupItem.slotInfo)[idx]).icon):addInputEvent("Mouse_On", "Panel_Tooltip_Item_Show_GeneralStatic(" .. idx .. ", \"popupItem\", true)")
        ;
        (((popupItem.slotInfo)[idx]).icon):addInputEvent("Mouse_Out", "Panel_Tooltip_Item_Show_GeneralStatic(" .. idx .. ", \"popupItem\", false)")
        Panel_Tooltip_Item_SetPosition(idx, (popupItem.slotInfo)[idx], "popupItem")
      end
    end
  end
  do
    local popupBuffSize = itemEnchatWrapper:getPopupBuffSize()
    if popupBuffSize == 0 then
      return 
    end
    Panel_UseBuff_RepositionSlot(popupBuffSize)
    local buffSSW = nil
    for idxBuff = 1, popupBuffSize do
      buffSSW = itemEnchatWrapper:getPopupBuffStaticStatusWrapperAt(idxBuff - 1)
      if buffSSW == nil then
        ((popupItem.slotInfoForBuff)[idxBuff]):ChangeTextureInfoName("icon/new_icon/03_etc/item_unknown.dds")
      else
        ;
        ((popupItem.slotInfoForBuff)[idxBuff]):ChangeTextureInfoName("icon/" .. buffSSW:getIconPath())
        ;
        ((popupItem.slotInfoForBuff)[idxBuff]):addInputEvent("Mouse_On", "ShowPopupBuffTooltip(" .. idxBuff .. ")")
        ;
        ((popupItem.slotInfoForBuff)[idxBuff]):addInputEvent("Mouse_Out", "HidePopupBuffTooltip(" .. idxBuff .. ")")
      end
    end
  end
end

ShowPopupBuffTooltip = function(idxBuff)
  -- function num : 0_8 , upvalues : popupItem
  local buffSSW = global_PopupItemItemWrapper:getPopupBuffStaticStatusWrapperAt(idxBuff - 1)
  if buffSSW ~= nil then
    TooltipCommon_Show(idxBuff, (popupItem.slotInfoForBuff)[idxBuff], buffSSW:getIconPath(), buffSSW:getDescription(), "")
  end
end

HidePopupBuffTooltip = function(idxBuff)
  -- function num : 0_9
  TooltipCommon_Hide(idxBuff)
end

Panel_UserItem_PopupItem = function(itemEnchatWrapper, whereType, slotNo, equipSlotNo)
  -- function num : 0_10 , upvalues : resetUIcontrol, popupItem, fillPopupUseItemData
  Panel_UseItem_ShowToggle_Func()
  resetUIcontrol()
  global_PopupItemItemWrapper = itemEnchatWrapper
  -- DECOMPILER ERROR at PC6: Confused about usage of register: R4 in 'UnsetPending'

  popupItem.selectWhereType = whereType
  -- DECOMPILER ERROR at PC8: Confused about usage of register: R4 in 'UnsetPending'

  popupItem.selectSlotNo = slotNo
  -- DECOMPILER ERROR at PC10: Confused about usage of register: R4 in 'UnsetPending'

  popupItem.selectEquipNo = equipSlotNo
  fillPopupUseItemData(itemEnchatWrapper)
end

Click_Panel_UserItem_Yes = function()
  -- function num : 0_11 , upvalues : popupItem
  Panel_UseItem_ShowToggle_Func()
  Inventory_UseItemTargetSelf(popupItem.selectWhereType, popupItem.selectSlotNo, popupItem.selectEquipNo)
end

Panel_UseItem_AddEventContol = function()
  -- function num : 0_12 , upvalues : _btn_Close, _btn_Yes, _btn_No
  _btn_Close:addInputEvent("Mouse_LUp", "Panel_UseItem_ShowToggle_Func()")
  _btn_Yes:addInputEvent("Mouse_LUp", "Click_Panel_UserItem_Yes()")
  _btn_No:addInputEvent("Mouse_LUp", "Panel_UseItem_ShowToggle_Func()")
end

Panel_UseItem_Initialize()

