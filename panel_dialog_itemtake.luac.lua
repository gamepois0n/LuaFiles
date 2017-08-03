-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\widget\dialogue\panel_dialog_itemtake.luac 

-- params : ...
-- function num : 0
Panel_Dialogue_Itemtake:setGlassBackground(true)
local UI_color = Defines.Color
local UI_TM = CppEnums.TextMode
local slotConfig = {createIcon = true, createBorder = true, createCount = true, createCash = true}
local TalkPopup = {
_itemSlot = {}
, _itemSlotBg = (UI.getChildControl)(Panel_Dialogue_Itemtake, "Static_Itemicon"), _buttonAccept = (UI.getChildControl)(Panel_Dialogue_Itemtake, "Button_Yes"), _buttonCancel = (UI.getChildControl)(Panel_Dialogue_Itemtake, "Button_No"), _textItemName = (UI.getChildControl)(Panel_Dialogue_Itemtake, "StaticText_Itemname"), _textComment = (UI.getChildControl)(Panel_Dialogue_Itemtake, "StaticText_Comment"), _textNeedContribution = (UI.getChildControl)(Panel_Dialogue_Itemtake, "StaticText_NeedContribution"), _textMyContribution = (UI.getChildControl)(Panel_Dialogue_Itemtake, "StaticText_MyContribution"), _territoryMark = (UI.getChildControl)(Panel_Dialogue_Itemtake, "Static_territorymark"), _helpMsg = (UI.getChildControl)(Panel_Dialogue_Itemtake, "StaticText_helpMsg"), _selectedIndex = 0, _currentDisplayData = nil}
TalkPopup.init = function(self)
  -- function num : 0_0 , upvalues : slotConfig
  (SlotItem.new)(self._itemSlot, "ItemIconSlot", 0, self._itemSlotBg, slotConfig)
  ;
  (self._itemSlot):createChild()
  ;
  ((self._itemSlot).icon):SetPosX(((self._itemSlot).icon):GetPosX() + 6)
  ;
  ((self._itemSlot).icon):SetPosY(((self._itemSlot).icon):GetPosY() + 6)
  ;
  (self._buttonAccept):addInputEvent("Mouse_LUp", "click_yesDialogButton()")
  ;
  (self._buttonCancel):addInputEvent("Mouse_LUp", "click_noDialogButton()")
  ;
  ((self._itemSlot).icon):addInputEvent("Mouse_On", "showTooltip()")
  ;
  ((self._itemSlot).icon):addInputEvent("Mouse_Out", "hideTooltip()")
  Panel_Tooltip_Item_SetPosition(0, (self._itemSlot).icon, "talkPopup")
  local group_0 = Panel_Dialogue_Itemtake:addConsoleUIGroup(0, (CppEnums.PA_CONSOLE_UI_CONTROL_TYPE).eCONSOLE_UI_CONTROL_TYPE_NOTEVENT)
  group_0:addControl(0, 0, 3, 1, (self._itemSlot).icon)
  group_0:addControl(1, 0, 3, 1, self._buttonAccept)
  group_0:addControl(2, 0, 3, 1, self._buttonCancel)
end

TalkPopup:init()
showTooltip = function()
  -- function num : 0_1 , upvalues : TalkPopup
  local itemStaticWrapper = getItemEnchantStaticStatus((TalkPopup._currentDisplayData):getItemKey())
  Panel_Tooltip_Item_Show(itemStaticWrapper, (TalkPopup._itemSlot).icon, true, false)
end

hideTooltip = function()
  -- function num : 0_2
  Panel_Tooltip_Item_hideTooltip()
end

TalkPopup_Show = function(displayData)
  -- function num : 0_3 , upvalues : TalkPopup, UI_color, UI_TM
  local self = TalkPopup
  -- DECOMPILER ERROR at PC2: Confused about usage of register: R2 in 'UnsetPending'

  TalkPopup._currentDisplayData = displayData
  Panel_Dialogue_Itemtake:SetShow(true)
  Panel_Dialogue_Itemtake:SetPosX(getScreenSizeX() - Panel_Dialogue_Itemtake:GetSizeX() * 1.5)
  Panel_Dialogue_Itemtake:SetPosY(getScreenSizeY() / 2 - Panel_Dialogue_Itemtake:GetSizeY() / 2 - 60)
  local itemStaticWrapper = getItemEnchantStaticStatus(displayData:getItemKey())
  local explorePoint = getExplorePointByTerritory((TalkPopup._currentDisplayData)._territoryKey)
  ;
  (self._itemSlot):setItemByStaticStatus(itemStaticWrapper, displayData._itemCounts64)
  local strNeedPoint = (string.format)("%d", displayData._needPoint)
  local strHavePoint = (string.format)("%d", explorePoint:getRemainedPoint())
  ;
  (self._textItemName):SetText(itemStaticWrapper:getName())
  ;
  (self._textNeedContribution):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "DIALOG_NEED_POINT", "point", strNeedPoint))
  ;
  (self._textMyContribution):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "DIALOG_HAVE_POINT", "point", strHavePoint))
  if selfPlayerCurrentTerritory() == PAGetString(Defines.StringSheet_GAME, "DIALOG_SERENDIA") then
    (self._territoryMark):ChangeTextureInfoName("New_UI_Common_forLua/Widget/Dialogue/Dialogue_Etc_00.dds")
    local x1, y1, x2, y2 = setTextureUV_Func(self._territoryMark, 329, 1, 379, 60)
    ;
    ((self._territoryMark):getBaseTexture()):setUV(x1, y1, x2, y2)
    ;
    (self._territoryMark):setRenderTexture((self._territoryMark):getBaseTexture())
  else
    do
      if selfPlayerCurrentTerritory() == PAGetString(Defines.StringSheet_GAME, "DIALOG_BALENOS") then
        (self._territoryMark):ChangeTextureInfoName("New_UI_Common_forLua/Widget/Dialogue/Dialogue_Etc_00.dds")
        local x1, y1, x2, y2 = setTextureUV_Func(self._territoryMark, 278, 1, 328, 60)
        ;
        ((self._territoryMark):getBaseTexture()):setUV(x1, y1, x2, y2)
        ;
        (self._territoryMark):setRenderTexture((self._territoryMark):getBaseTexture())
      end
      do
        if explorePoint:getRemainedPoint() < displayData._needPoint then
          (self._textComment):SetText(PAGetString(Defines.StringSheet_GAME, "DIALOG_ERROR_SHORTAGE_POINT"))
          ;
          (self._buttonAccept):SetEnable(false)
          ;
          (self._buttonAccept):SetMonoTone(true)
          ;
          (self._buttonAccept):SetFontColor(UI_color.C_FF515151)
        else
          ;
          (self._textComment):SetText(PAGetString(Defines.StringSheet_GAME, "DIALOG_ITEMTAKE_TXT_COMMENT"))
          ;
          (self._buttonAccept):SetEnable(true)
          ;
          (self._buttonAccept):SetMonoTone(false)
          ;
          (self._buttonAccept):SetFontColor(UI_color.C_FFC4BEBE)
        end
        ;
        (self._helpMsg):SetShow(true)
        ;
        (self._helpMsg):SetTextMode(UI_TM.eTextMode_AutoWrap)
        ;
        (self._helpMsg):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_DIALOGUE_TXT_CONTRIHELP"))
      end
    end
  end
end

TalkPopup.hide = function(self)
  -- function num : 0_4
  Panel_Dialogue_Itemtake:SetShow(false)
end

click_yesDialogButton = function()
  -- function num : 0_5 , upvalues : TalkPopup
  local explorePoint = getExplorePointByTerritory((TalkPopup._currentDisplayData)._territoryKey)
  if explorePoint:getRemainedPoint() < (TalkPopup._currentDisplayData)._needPoint then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "DIALOG_ERROR_SHORTAGE_POINT"))
    return 
  end
  Dialog_clickDialogButtonReq(TalkPopup._selectedIndex)
  TalkPopup:hide()
end

click_noDialogButton = function()
  -- function num : 0_6 , upvalues : TalkPopup
  TalkPopup:hide()
end

TalkPopup_SelectedIndex = function(index)
  -- function num : 0_7 , upvalues : TalkPopup
  -- DECOMPILER ERROR at PC1: Confused about usage of register: R1 in 'UnsetPending'

  TalkPopup._selectedIndex = index
end


