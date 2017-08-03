-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\dye\panel_dye_renew.luac 

-- params : ...
-- function num : 0
local renderMode = (RenderModeWrapper.new)(100, {(Defines.RenderMode).eRenderMode_Dye}, false)
local UI_BUFFTYPE = CppEnums.UserChargeType
local ENUM_EQUIP = CppEnums.EquipSlotNoClient
local CT = CppEnums.ClassType
local awakenWeapon = {[CT.ClassType_Warrior] = ToClient_IsContentsGroupOpen("901"), [CT.ClassType_Ranger] = ToClient_IsContentsGroupOpen("902"), [CT.ClassType_Sorcerer] = ToClient_IsContentsGroupOpen("903"), [CT.ClassType_Giant] = ToClient_IsContentsGroupOpen("904"), [CT.ClassType_Tamer] = ToClient_IsContentsGroupOpen("905"), [CT.ClassType_BladeMaster] = ToClient_IsContentsGroupOpen("906"), [CT.ClassType_BladeMasterWomen] = ToClient_IsContentsGroupOpen("907"), [CT.ClassType_Valkyrie] = ToClient_IsContentsGroupOpen("908"), [CT.ClassType_Wizard] = ToClient_IsContentsGroupOpen("909"), [CT.ClassType_WizardWomen] = ToClient_IsContentsGroupOpen("910"), [CT.ClassType_NinjaMan] = ToClient_IsContentsGroupOpen("911"), [CT.ClassType_NinjaWomen] = ToClient_IsContentsGroupOpen("912"), [CT.ClassType_DarkElf] = ToClient_IsContentsGroupOpen("913"), [CT.ClassType_Combattant] = ToClient_IsContentsGroupOpen("914")}
local isKR2 = isGameTypeKR2()
local enControlValue = {MaxCharacterTypeListCount = 7, MaxEquipSlotCount = 18, MaxPartCount = 8, MaxPartSlotCount = 3, MaxAmpuleRowsCount = 3, MaxAmpuleColsCount = 7}
local enToggleIndex = {Underwear = 0, Avater = 1, Helmet = 2, AwakenWeapon = 3, FaceViewHair = 4, FaceGuard = 5, WarStance = 6}
local enCharacterType = {Character = 0, Horse = 1, Car = 2, Camel = 3}
local EquipSlotIcon = {
[enCharacterType.Character] = {
{0, 166, 123, 194, 151}
, 
{1, 197, 123, 225, 151}
, 
{29, 228, 93, 256, 121}
, 
{3, 42, 123, 70, 151}
, 
{4, 135, 123, 163, 151}
, 
{5, 104, 123, 132, 151}
, 
{6, 11, 123, 39, 151}
, 
{18, 166, 154, 194, 182}
, 
{19, 197, 154, 225, 182}
, 
{30, 259, 93, 287, 121}
, 
{14, 42, 154, 70, 182}
, 
{15, 135, 154, 163, 182}
, 
{16, 104, 154, 132, 182}
, 
{17, 11, 154, 39, 182}
, 
{20, 73, 154, 101, 182}
, 
{21, 228, 123, 256, 151}
, 
{22, 259, 154, 287, 182}
, 
{23, 228, 154, 256, 182}
}
, 
[enCharacterType.Horse] = {
{3, 136, 147, 164, 175}
, 
{4, 105, 147, 133, 175}
, 
{5, 198, 147, 226, 175}
, 
{6, 74, 147, 102, 175}
, 
{12, 167, 147, 195, 175}
, 
{0, 0, 0, 0, 0}
, 
{0, 0, 0, 0, 0}
, 
{14, 136, 177, 164, 205}
, 
{15, 105, 177, 133, 205}
, 
{16, 198, 177, 226, 205}
, 
{17, 74, 177, 102, 205}
, 
{18, 0, 0, 0, 0}
, 
{19, 0, 0, 0, 0}
, 
{20, 0, 0, 0, 0}
}
, 
[enCharacterType.Car] = {
{3, 136, 147, 164, 175}
, 
{4, 105, 147, 133, 175}
, 
{5, 198, 147, 226, 175}
, 
{6, 74, 147, 102, 175}
, 
{13, 167, 147, 195, 175}
, 
{25, 0, 0, 0, 0}
, 
{0, 0, 0, 0, 0}
, 
{14, 136, 177, 164, 205}
, 
{15, 105, 177, 133, 205}
, 
{16, 198, 177, 226, 205}
, 
{17, 74, 177, 102, 205}
, 
{26, 0, 0, 0, 0}
, 
{20, 0, 0, 0, 0}
, 
{21, 0, 0, 0, 0}
}
, 
[enCharacterType.Camel] = {
{3, 136, 147, 164, 175}
, 
{4, 105, 147, 133, 175}
, 
{5, 198, 147, 226, 175}
, 
{6, 74, 147, 102, 175}
, 
{12, 167, 147, 195, 175}
, 
{25, 0, 0, 0, 0}
, 
{0, 0, 0, 0, 0}
, 
{14, 136, 177, 164, 205}
, 
{15, 105, 177, 133, 205}
, 
{16, 198, 177, 226, 205}
, 
{17, 74, 177, 102, 205}
, 
{26, 0, 0, 0, 0}
, 
{20, 0, 0, 0, 0}
, 
{21, 0, 0, 0, 0}
}
}
local DyeReNew = {_classType = -1, _selected_CharacterTarget = 0, _selected_EquipSlotNo = -1, _nowClickPartId = 0, _nowClickPartSlotId = 0, _isPearlPalette = false, _paletteShowAll = false, _nowPaletteCategoryIndex = 0, _nowPaletteDataIndex = 0, _scrollStartIndex = 0, _scrollMaxRow = 0, _bShowUnderwear = false, _bShowAvater = false, _bFaceVeiwHair = false, _bHideHelmet = false, _bOpenFaceGuard = false, _bWarStance = false, _bShowAwakenWeapon = false, _ampuleCountCheck = false, _MaxEquipSlotItem = 18, 
_arrEquipSlotItem = {}
, _MaxEquipPartSlot = 24, 
_arrEquipPartSlot = {}
, 
_arrEquipPartReset = {}
, _MaxPaletteSlotBG = 21, 
_arrPaletteSlotBG = {}
, 
_arrAmpuleSlotBG = {}
, 
_arrAmpuleSlotColor = {}
, 
_arrAmpuleSlotButton = {}
, _AmpuleScroll = nil, 
_selectedDyePart = {}
, _enableDyePearl = false, _enableCamel = false, _enableAwaken = false}
FGlobal_DyeReNew_GetInstance = function()
  -- function num : 0_0 , upvalues : DyeReNew
  return DyeReNew
end

FGlobal_DyeReNew_GetEnableAwaken = function()
  -- function num : 0_1 , upvalues : DyeReNew
  return DyeReNew._enableAwaken
end

FGlobal_DyeReNew_GetEnableDyePearl = function()
  -- function num : 0_2 , upvalues : DyeReNew
  return DyeReNew._enableDyePearl
end

FGlobal_DyeReNew_GetEnableCamel = function()
  -- function num : 0_3 , upvalues : DyeReNew
  return DyeReNew._enableCamel
end

FGlobal_DyeReNew_GetEnableKR2 = function()
  -- function num : 0_4 , upvalues : isKR2
  return isKR2
end

DyeReNew.Initialize = function(self)
  -- function num : 0_5 , upvalues : awakenWeapon, enControlValue
  self._classType = (getSelfPlayer()):getClassType()
  self._enableDyePearl = ToClient_IsContentsGroupOpen("82")
  self._enableCamel = ToClient_IsContentsGroupOpen("4")
  self._enableAwaken = awakenWeapon[self._classType]
  local numbering = 0
  local ampuleSlotConfig = {createIcon = true, createBorder = true, createCount = true, createCash = true, createEnchant = true}
  local UIStaticBG = (UI.getChildControl)(Panel_Dye_ReNew, "Static_BG")
  FGlobal_Panel_Dye_ReNew_AddEvent()
  for ii = 0, enControlValue.MaxEquipSlotCount - 1 do
    local UIEquipBG = (UI.getChildControl)(UIStaticBG, "Static_EquipSlotBG_" .. ii)
    local equipSlot = {}
    ;
    (SlotItem.new)(equipSlot, "Dye_ReNew_equipSlotItem_" .. ii, 0, UIEquipBG, ampuleSlotConfig)
    equipSlot:createChild()
    -- DECOMPILER ERROR at PC58: Confused about usage of register: R10 in 'UnsetPending'

    ;
    (self._arrEquipSlotItem)[ii] = equipSlot
  end
  local UIEquipBG = (UI.getChildControl)(UIStaticBG, "Static_PartTartget_BG")
  numbering = 0
  for jj = 0, enControlValue.MaxPartCount - 1 do
    local UIEquipPartArea = (UI.getChildControl)(UIEquipBG, "Static_SlotBG_PartColorArea_" .. jj)
    for kk = 0, enControlValue.MaxPartSlotCount - 1 do
      local UIEquipSlotPart = (UI.getChildControl)(UIEquipPartArea, "Static_Radiobutton_PartColor_" .. jj .. "_" .. kk)
      local UIEquipSlotReset = (UI.getChildControl)(UIEquipSlotPart, "Static_Button_PartColorReset_" .. jj .. "_" .. kk)
      -- DECOMPILER ERROR at PC104: Confused about usage of register: R16 in 'UnsetPending'

      ;
      (self._arrEquipPartSlot)[numbering] = UIEquipSlotPart
      -- DECOMPILER ERROR at PC106: Confused about usage of register: R16 in 'UnsetPending'

      ;
      (self._arrEquipPartReset)[numbering] = UIEquipSlotReset
      numbering = numbering + 1
      UIEquipSlotPart:SetShow(false)
    end
  end
  local UIAmpuleBG = (UI.getChildControl)(UIStaticBG, "Static_AmpuleTartget_BG")
  numbering = 0
  for kk = 0, enControlValue.MaxAmpuleRowsCount - 1 do
    for ll = 0, enControlValue.MaxAmpuleColsCount - 1 do
      local UIAmpuleSlotBG = (UI.getChildControl)(UIAmpuleBG, "Static_AmpuleSlotBG_" .. kk .. "_" .. ll)
      local UIAmpuleSlotColor = (UI.getChildControl)(UIAmpuleSlotBG, "Static_AmplueSlotColor_" .. kk .. "_" .. ll)
      local UIAmpuleSlotButton = (UI.getChildControl)(UIAmpuleSlotBG, "RadioButton_AmplueSlotButton_" .. kk .. "_" .. ll)
      -- DECOMPILER ERROR at PC159: Confused about usage of register: R17 in 'UnsetPending'

      ;
      (self._arrAmpuleSlotBG)[numbering] = UIAmpuleSlotBG
      -- DECOMPILER ERROR at PC161: Confused about usage of register: R17 in 'UnsetPending'

      ;
      (self._arrAmpuleSlotColor)[numbering] = UIAmpuleSlotColor
      -- DECOMPILER ERROR at PC163: Confused about usage of register: R17 in 'UnsetPending'

      ;
      (self._arrAmpuleSlotButton)[numbering] = UIAmpuleSlotButton
      UIAmpuleSlotButton:addInputEvent("Mouse_UpScroll", "HandleScroll_DyeReNew_Ampule_ScrollUpdate( true )")
      UIAmpuleSlotButton:addInputEvent("Mouse_DownScroll", "HandleScroll_DyeReNew_Ampule_ScrollUpdate( false )")
      numbering = numbering + 1
      UIAmpuleSlotBG:SetShow(false)
    end
  end
  self._AmpuleScroll = (UI.getChildControl)(UIAmpuleBG, "Scroll_DyeNew")
  ;
  (self._AmpuleScroll):SetInterval(10)
  local ScrollBtn = (UI.getChildControl)(self._AmpuleScroll, "Scroll_CtrlButton")
  ScrollBtn:addInputEvent("Mouse_LPress", "HandleClicked_DyeReNew_PressAmpuleScroll()")
  ScrollBtn:addInputEvent("Mouse_UpScroll", "HandleClicked_DyeReNew_PressAmpuleScroll()")
  ScrollBtn:addInputEvent("Mouse_DownScroll", "HandleClicked_DyeReNew_PressAmpuleScroll()")
  ;
  (self._AmpuleScroll):addInputEvent("Mouse_UpScroll", "HandleClicked_DyeReNew_PressAmpuleScroll()")
  ;
  (self._AmpuleScroll):addInputEvent("Mouse_DownScroll", "HandleClicked_DyeReNew_PressAmpuleScroll()")
  ;
  (self._AmpuleScroll):addInputEvent("Mouse_LUp", "HandleClicked_DyeReNew_PressAmpuleScroll()")
end

DyeReNew.Open = function(self)
  -- function num : 0_6 , upvalues : enControlValue
  self._selected_CharacterTarget = 0
  self._selected_EquipSlotNo = -1
  ToClient_DyeingManagerShow()
  ToClient_RequestSetTargetType(self.selected_characterType)
  self:Reset_Position()
  self._bShowUnderwear = false
  self._bShowAvater = false
  self._bFaceVeiwHair = false
  self._bHideHelmet = true
  self._bOpenFaceGuard = false
  self._bWarStance = true
  self._bShowAwakenWeapon = false
  FGlobal_Panel_Dye_ReNew_Reset()
  self:Reset_AmpuleList()
  self:SetAmpuleScrollSize()
  for ii = 0, enControlValue.MaxEquipSlotCount - 1 do
    (((self._arrEquipSlotItem)[ii]).icon):SetColor(4286019447)
  end
  self:Change_EquipIcon()
  HandleClicked_LUp_Ampule_SelectedType(false, false)
  self._selectedDyePart = {}
  HandleOpen_RadioButton_AmpuleReset()
end

DyeReNew.Close = function(self)
  -- function num : 0_7
  audioPostEvent_SystemUi(1, 23)
  Panel_Dye_ReNew:SetShow(false)
  if Panel_ChangeWeapon:GetShow() then
    WeaponChange_Close()
  end
  if Panel_ChangeWeapon:GetShow() then
    WeaponChange_Close()
  end
  Panel_Tooltip_Item_hideTooltip()
end

DyeReNew.Reset_Position = function(self)
  -- function num : 0_8 , upvalues : enControlValue
  local UIStaticBG = (UI.getChildControl)(Panel_Dye_ReNew, "Static_BG")
  local UIPartTitle = (UI.getChildControl)(UIStaticBG, "StaticText_PartTarget_Title")
  local UIPartBG = (UI.getChildControl)(UIStaticBG, "Static_PartTartget_BG")
  local UIAmpuleTitle = (UI.getChildControl)(UIStaticBG, "StaticText_AmpuleTarget_Title")
  local UIAmpuleBG = (UI.getChildControl)(UIStaticBG, "Static_AmpuleTartget_BG")
  for ii = 0, enControlValue.MaxEquipSlotCount - 1 do
    local UIEquipBG = (UI.getChildControl)(UIStaticBG, "Static_EquipSlotBG_" .. ii)
    UIEquipBG:SetShow(true)
  end
  UIPartTitle:SetPosY(275)
  UIPartBG:SetPosY(311)
  UIAmpuleTitle:SetPosY(380)
  UIAmpuleBG:SetPosY(413)
end

DyeReNew.Update_Position = function(self)
  -- function num : 0_9 , upvalues : enControlValue
  local UIStaticBG = (UI.getChildControl)(Panel_Dye_ReNew, "Static_BG")
  local UIPartTitle = (UI.getChildControl)(UIStaticBG, "StaticText_PartTarget_Title")
  local UIPartBG = (UI.getChildControl)(UIStaticBG, "Static_PartTartget_BG")
  local UIAmpuleTitle = (UI.getChildControl)(UIStaticBG, "StaticText_AmpuleTarget_Title")
  local UIAmpuleBG = (UI.getChildControl)(UIStaticBG, "Static_AmpuleTartget_BG")
  if self._selected_CharacterTarget ~= 0 then
    for ii = 14, enControlValue.MaxEquipSlotCount - 1 do
      local UIEquipBG = (UI.getChildControl)(UIStaticBG, "Static_EquipSlotBG_" .. ii)
      UIEquipBG:SetShow(false)
    end
    UIPartTitle:SetPosY(UIPartTitle:GetPosY() - 45)
    UIPartBG:SetPosY(UIPartBG:GetPosY() - 45)
    UIAmpuleTitle:SetPosY(UIAmpuleTitle:GetPosY() - 45)
    UIAmpuleBG:SetPosY(UIAmpuleBG:GetPosY() - 45)
  else
    for ii = 14, enControlValue.MaxEquipSlotCount - 1 do
      local UIEquipBG = (UI.getChildControl)(UIStaticBG, "Static_EquipSlotBG_" .. ii)
      UIEquipBG:SetShow(true)
    end
    UIPartTitle:SetPosY(UIPartTitle:GetPosY() + 45)
    UIPartBG:SetPosY(UIPartBG:GetPosY() + 45)
    UIAmpuleTitle:SetPosY(UIAmpuleTitle:GetPosY() + 45)
    UIAmpuleBG:SetPosY(UIAmpuleBG:GetPosY() + 45)
  end
end

DyeReNew.Change_EquipIcon = function(self)
  -- function num : 0_10 , upvalues : enCharacterType, EquipSlotIcon
  self:DeleteAll_EquipIcon()
  local textureInfoName = ""
  local characterType = self._selected_CharacterTarget
  local targetSlot = nil
  if enCharacterType.Character == characterType then
    textureInfoName = "New_UI_Common_forLua/Window/Dye/Dye_New_00.dds"
  else
    if enCharacterType.Horse == characterType or enCharacterType.Camel == characterType then
      textureInfoName = "New_UI_Common_forLua/Window/Dye/Dye_New_01.dds"
    end
  end
  targetSlot = EquipSlotIcon[characterType]
  for idx,equipSlotIdx in pairs(targetSlot) do
    local UIEquipIcon = self:GetUIEquipIconByIndex(idx - 1)
    UIEquipIcon:ChangeTextureInfoName(textureInfoName)
    local x1, y1, x2, y2 = setTextureUV_Func(UIEquipIcon, equipSlotIdx[2], equipSlotIdx[3], equipSlotIdx[4], equipSlotIdx[5])
    ;
    (UIEquipIcon:getBaseTexture()):setUV(x1, y1, x2, y2)
    UIEquipIcon:setRenderTexture(UIEquipIcon:getBaseTexture())
  end
  FromClient_updateDyeingTargetList()
end

DyeReNew.DeleteAll_EquipIcon = function(self)
  -- function num : 0_11 , upvalues : enControlValue
  for ii = 0, enControlValue.MaxEquipSlotCount - 1 do
    local UIEquipIcon = self:GetUIEquipIconByIndex(ii)
    UIEquipIcon:ChangeTextureInfoName("")
  end
end

DyeReNew.GetUIEquipIconByIndex = function(self, Index)
  -- function num : 0_12
  local UIStaticBG = (UI.getChildControl)(Panel_Dye_ReNew, "Static_BG")
  local UIEquipBG = (UI.getChildControl)(UIStaticBG, "Static_EquipSlotBG_" .. Index)
  local UIEquipIcon = (UI.getChildControl)(UIEquipBG, "Static_EquipSlotIcon_" .. Index)
  return UIEquipIcon
end

DyeReNew.GetUIEquipBGByIndex = function(self, Index)
  -- function num : 0_13
  local UIStaticBG = (UI.getChildControl)(Panel_Dye_ReNew, "Static_BG")
  local UIEquipBG = (UI.getChildControl)(UIStaticBG, "Static_EquipSlotBG_" .. Index)
  return UIEquipBG
end

FromClient_updateDyeingTargetList = function()
  -- function num : 0_14 , upvalues : DyeReNew, EquipSlotIcon
  local self = DyeReNew
  local haveNormalEquip, haveAvartarEquip = nil, nil
  for idx,equipSlotWarraper in pairs(EquipSlotIcon[self._selected_CharacterTarget]) do
    local fixedIndex = idx - 1
    local itemWrapper = ToClient_RequestGetDyeingTargetItemWrapper(equipSlotWarraper[1])
    local isDyeAble = false
    if itemWrapper ~= nil then
      isDyeAble = itemWrapper:isDyeable()
    end
    local UISlotItem = (self._arrEquipSlotItem)[fixedIndex]
    if isDyeAble == true and itemWrapper ~= nil then
      (self:GetUIEquipIconByIndex(fixedIndex)):SetShow(false)
      UISlotItem:setItem(itemWrapper)
      ;
      (UISlotItem.icon):SetShow(true)
      ;
      (UISlotItem.icon):addInputEvent("Mouse_LUp", "HandleClicked_LUp_SelectEquipItem( " .. equipSlotWarraper[1] .. "," .. fixedIndex .. " ) ")
      ;
      (UISlotItem.icon):addInputEvent("Mouse_RUp", "HandleClicked_RUp_ClearEquipItemByEquipSlotNo( " .. equipSlotWarraper[1] .. "," .. fixedIndex .. " ) ")
      ;
      (UISlotItem.icon):addInputEvent("Mouse_On", "HandleClicked_OnOut_ShowEquipItemToolTip( true, " .. equipSlotWarraper[1] .. ", " .. fixedIndex .. " )")
      ;
      (UISlotItem.icon):addInputEvent("Mouse_Out", "HandleClicked_OnOut_ShowEquipItemToolTip( false, " .. equipSlotWarraper[1] .. ", " .. fixedIndex .. " )")
    else
      ;
      (self:GetUIEquipIconByIndex(fixedIndex)):SetShow(true)
      UISlotItem:clearItem()
      ;
      (UISlotItem.icon):SetShow(false)
      ;
      (UISlotItem.icon):addInputEvent("Mouse_LUp", "")
      ;
      (UISlotItem.icon):addInputEvent("Mouse_RUp", "")
      ;
      (UISlotItem.icon):addInputEvent("Mouse_On", "")
      ;
      (UISlotItem.icon):addInputEvent("Mouse_Out", "")
    end
  end
end

DyeReNew.Reset_Part = function(self, isClearCheck)
  -- function num : 0_15
  for ii = 0, self._MaxEquipPartSlot - 1 do
    ((self._arrEquipPartSlot)[ii]):SetShow(false)
    ;
    ((self._arrEquipPartReset)[ii]):SetShow(false)
    if isClearCheck then
      ((self._arrEquipPartSlot)[ii]):SetCheck(false)
    end
  end
end

FromClient_updateDyeingPartList = function()
  -- function num : 0_16 , upvalues : DyeReNew
  DyeReNew:Update_Part()
end

DyeReNew.Update_Part = function(self)
  -- function num : 0_17
  self:Reset_Part(false)
  local equipSlotNo = self._selected_EquipSlotNo
  if equipSlotNo == -1 then
    return 
  end
  ToClient_SetDyeingTargetInformationByEquipNo(equipSlotNo)
  local infoCount = ToClient_getDyeingTargetInformationCount()
  local oldPartIdx = 0
  for infoIdx = 0, infoCount - 1 do
    local partIdx = ToClient_getDyeingTargetPartIdxByIndex(infoIdx)
    local slotIdx = ToClient_getDyeingTartSlotIndexByIndex(infoIdx)
    local DyeSlotIdx = ToClient_getDyeingTargetDyeSlotIndexByIndex(infoIdx)
    local PartSlot = (self._arrEquipPartSlot)[DyeSlotIdx]
    local PartReset = (self._arrEquipPartReset)[DyeSlotIdx]
    PartSlot:SetText(DyeSlotIdx)
    local getColorInfo = ToClient_RequestGetUsedPartColor(equipSlotNo, partIdx, slotIdx)
    PartSlot:addInputEvent("Mouse_LUp", " HandleClicked_LUp_SelectEquipPart( " .. partIdx .. ", " .. slotIdx .. ", " .. DyeSlotIdx .. " )")
    local isReset = ToClient_RequestIsResetDyeingPartSlot(equipSlotNo, partIdx, slotIdx)
    if isReset then
      PartReset:SetShow(true)
      PartReset:addInputEvent("Mouse_LUp", " HandleClicked_LUp_EquipPartReset( " .. equipSlotNo .. ", " .. partIdx .. ", " .. slotIdx .. ", " .. DyeSlotIdx .. " )")
    else
      PartReset:SetShow(false)
    end
    PartSlot:SetAlphaIgnore(true)
    PartSlot:SetColor(getColorInfo)
    PartSlot:SetShow(true)
  end
end

DyeReNew.Reset_AmpuleList = function(self, isClearCheck)
  -- function num : 0_18
  local clearColor = 16777215
  for ii = 0, self._MaxPaletteSlotBG - 1 do
    ((self._arrAmpuleSlotButton)[ii]):addInputEvent("Mouse_LUp", "")
    ;
    ((self._arrAmpuleSlotButton)[ii]):addInputEvent("Mouse_On", "")
    ;
    ((self._arrAmpuleSlotButton)[ii]):addInputEvent("Mouse_Out", "")
    ;
    ((self._arrAmpuleSlotButton)[ii]):setTooltipEventRegistFunc("")
    ;
    ((self._arrAmpuleSlotButton)[ii]):SetText("")
    ;
    ((self._arrAmpuleSlotBG)[ii]):SetShow(false)
    if isClearCheck then
      ((self._arrAmpuleSlotButton)[ii]):SetCheck(false)
    end
  end
end

DyeReNew.Update_AmpuleList = function(self)
  -- function num : 0_19
  self:Reset_AmpuleList(false)
  local DyeingPaletteCategoryInfo = ToClient_requestGetPaletteCategoryInfo(self._nowPaletteCategoryIndex, self._paletteShowAll)
  if DyeingPaletteCategoryInfo ~= nil then
    local UISlotIndex = 0
    local arrCount = DyeingPaletteCategoryInfo:getListSize()
    local nowScroll = self._scrollStartIndex
    self._scrollMaxRow = (math.ceil)(arrCount / 7)
    local dataIndex = self._scrollStartIndex * 7
    for ii = 0, self._MaxPaletteSlotBG - 1 do
      if dataIndex < arrCount then
        local colorValue = DyeingPaletteCategoryInfo:getColor(dataIndex)
        local itemEnchantKey = DyeingPaletteCategoryInfo:getItemEnchantKey(dataIndex)
        local isDyeUI = true
        local ampuleCount = DyeingPaletteCategoryInfo:getCount(dataIndex, isDyeUI)
        local UIAmpuleBG = (self._arrAmpuleSlotBG)[UISlotIndex]
        local UIAmpuleColor = (self._arrAmpuleSlotColor)[UISlotIndex]
        local UIAmpuleButton = (self._arrAmpuleSlotButton)[UISlotIndex]
        UIAmpuleBG:SetShow(true)
        UIAmpuleColor:ChangeTextureInfoName("DyeSlot_n.dds")
        ;
        (UIAmpuleColor:getBaseTexture()):setUV(0, 0, 1, 1)
        UIAmpuleColor:setRenderTexture(UIAmpuleColor:getBaseTexture())
        UIAmpuleColor:SetAlphaIgnore(true)
        UIAmpuleColor:SetColor(colorValue)
        UIAmpuleColor:SetShow(true)
        if self._isPearlPalette == false then
          UIAmpuleButton:SetText(tostring(ampuleCount))
        end
        UIAmpuleButton:SetCheck(false)
        UIAmpuleButton:addInputEvent("Mouse_LUp", "HandleClicked_DeyReNew_Palette_SelectColor( " .. dataIndex .. " )")
        UIAmpuleButton:addInputEvent("Mouse_On", "HandleOnOut_DeyReNew_Ampule_Color( true, " .. itemEnchantKey .. "," .. UISlotIndex .. ")")
        UIAmpuleButton:addInputEvent("Mouse_Out", "HandleOnOut_DeyReNew_Ampule_Color( false, " .. itemEnchantKey .. "," .. UISlotIndex .. ")")
        UIAmpuleButton:setTooltipEventRegistFunc("HandleOnOut_DeyReNew_Ampule_Color( true, " .. itemEnchantKey .. ", " .. UISlotIndex .. " )")
        UISlotIndex = UISlotIndex + 1
      end
      do
        do
          dataIndex = dataIndex + 1
          -- DECOMPILER ERROR at PC117: LeaveBlock: unexpected jumping out DO_STMT

        end
      end
    end
  end
  do
    ;
    (UIScroll.SetButtonSize)(self._AmpuleScroll, self._MaxPaletteSlotBG / 7, self._scrollMaxRow)
  end
end

DyeReNew.SetAmpuleScrollSize = function(self)
  -- function num : 0_20
  if getScreenSizeY() < 900 then
    self._MaxPaletteSlotBG = 14
    ;
    (self._AmpuleScroll):SetSize((self._AmpuleScroll):GetSizeX(), 96)
  else
    self._MaxPaletteSlotBG = 21
    ;
    (self._AmpuleScroll):SetSize((self._AmpuleScroll):GetSizeX(), 145)
  end
end

FGlobal_Panel_Dye_ReNew_Open = function()
  -- function num : 0_21
  if FGlobal_Panel_DyeReNew_Show() ~= true then
    return 
  end
  Panel_Dye_ReNew:SetShow(true)
end

FGlobal_Panel_Dye_ReNew_Close = function()
  -- function num : 0_22
  Panel_Dye_ReNew:SetShow(false)
end

FGlobal_Panel_DyeReNew_Show = function()
  -- function num : 0_23 , upvalues : renderMode, DyeReNew
  if isDeadInWatchingMode() then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_DYEOPENALERT_INDEAD"))
    return 
  end
  ToClient_SaveUiInfo(false)
  if isGameTypeRussia() and (getContentsServiceType() == (CppEnums.ContentsServiceType).eContentsServiceType_CBT or getContentsServiceType() == (CppEnums.ContentsServiceType).eContentsServiceType_OBT) then
    return 
  end
  if isFlushedUI() then
    return 
  end
  local isShow = ToClient_DyeingManagerIsShow()
  if isShow == true then
    return 
  end
  local isShowable = ToClient_DyeingManagerIsShowable()
  if isShowable == false then
    return 
  end
  if not IsSelfPlayerWaitAction() then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_CURRENTACTION_NOT_DYE"))
    return 
  end
  if selfPlayerIsInCompetitionArea() then
    return 
  end
  if Panel_Win_System:GetShow() then
    allClearMessageData()
  end
  isInventoryOpen = Panel_Window_Inventory:IsShow()
  SetUIMode((Defines.UIMode).eUIMode_DyeNew)
  renderMode:set()
  if Panel_DyePalette:GetShow() then
    FGlobal_DyePalette_Close()
  end
  DyeReNew:Open()
  FGlobal_DyeNew_CharacterController_Open()
  Inventory_SetFunctor(FGlobal_Panel_DyeReNew_InventoryFilter, FGlobal_Panel_DyeReNew_Interaction_FromInventory, nil, nil)
  InventoryWindow_Show()
  renderMode:set()
  return true
end

FGlobal_Panel_DyeReNew_Hide = function()
  -- function num : 0_24 , upvalues : renderMode, DyeReNew
  if Panel_Win_System:GetShow() then
    Proc_ShowMessage_Ack("알림창을 먼저 닫아주세�\148.")
    return 
  end
  local isShow = ToClient_DyeingManagerHide()
  if isShow == false then
    return 
  end
  if Panel_Dye_ReNew:GetShow() == false and Panel_DyeNew_CharacterController:GetShow() == false then
    return 
  end
  SetUIMode((Defines.UIMode).eUIMode_Default)
  renderMode:reset()
  if isInventoryOpen == false then
    InventoryWindow_Close()
    FGlobal_Equipment_SetHide(false)
  else
    Inventory_SetFunctor(nil, nil, nil, nil)
    Inventory_SetShow(true)
  end
  if Panel_ChangeWeapon:GetShow() then
    WeaponChange_Close()
  end
  isInventoryOpen = false
  ToClient_DyeingManagerHide()
  FGlobal_DyeNew_CharacterController_Close()
  DyeReNew:Close()
  return true
end

Dye_ReNew_IsDyeableEquipment = function(equipSlotNo)
  -- function num : 0_25 , upvalues : DyeReNew, ENUM_EQUIP, enCharacterType
  local self = DyeReNew
  if Dye_ReNew_IsAvatar(equipSlotNo) then
    return true
  else
    if Dye_ReNew_IsNormal(equipSlotNo) then
      return true
    else
      if ENUM_EQUIP.eEquipSlotNoAvatarUnderwear == equipSlotNo and enCharacterType.Character == self._selected_CharacterTarget then
        return true
      else
        if (ENUM_EQUIP.eEquipSlotNoFaceDecoration1 == equipSlotNo or ENUM_EQUIP.eEquipSlotNoFaceDecoration2 == equipSlotNo or ENUM_EQUIP.eEquipSlotNoFaceDecoration3 == equipSlotNo) and enCharacterType.Character == self._selected_CharacterTarget then
          return true
        end
      end
    end
  end
  return false
end

Dye_ReNew_IsAvatar = function(equipSlotNo)
  -- function num : 0_26 , upvalues : DyeReNew, enCharacterType, ENUM_EQUIP
  local self = DyeReNew
  -- DECOMPILER ERROR at PC35: Unhandled construct in 'MakeBoolean' P1

  if enCharacterType.Character == self._selected_CharacterTarget and (ENUM_EQUIP.eEquipSlotNoAvatarChest == equipSlotNo or ENUM_EQUIP.eEquipSlotNoAvatarGlove == equipSlotNo or ENUM_EQUIP.eEquipSlotNoAvatarBoots == equipSlotNo or ENUM_EQUIP.eEquipSlotNoAvatarHelm == equipSlotNo or ENUM_EQUIP.eEquipSlotNoAvatarWeapon == equipSlotNo or ENUM_EQUIP.eEquipSlotNoAvatarSubWeapon == equipSlotNo or ENUM_EQUIP.eEquipSlotNoAvatarAwakenWeapon == equipSlotNo) then
    return true
  end
  if enCharacterType.Horse == self._selected_CharacterTarget and (ENUM_EQUIP.eEquipSlotNoAvatarChest == equipSlotNo or ENUM_EQUIP.eEquipSlotNoAvatarGlove == equipSlotNo or ENUM_EQUIP.eEquipSlotNoAvatarBoots == equipSlotNo or ENUM_EQUIP.eEquipSlotNoAvatarHelm == equipSlotNo) then
    return true
  end
  return false
end

Dye_ReNew_IsNormal = function(equipSlotNo)
  -- function num : 0_27 , upvalues : DyeReNew, ENUM_EQUIP
  local self = DyeReNew
  -- DECOMPILER ERROR at PC33: Unhandled construct in 'MakeBoolean' P1

  if self._selected_CharacterTarget == 0 and (ENUM_EQUIP.eEquipSlotNoRightHand == equipSlotNo or ENUM_EQUIP.eEquipSlotNoLeftHand == equipSlotNo or ENUM_EQUIP.eEquipSlotNoChest == equipSlotNo or ENUM_EQUIP.eEquipSlotNoGlove == equipSlotNo or ENUM_EQUIP.eEquipSlotNoBoots == equipSlotNo or ENUM_EQUIP.eEquipSlotNoHelm == equipSlotNo or ENUM_EQUIP.eEquipSlotNoAwakenWeapon == equipSlotNo) then
    return true
  end
  if self._selected_CharacterTarget == 1 and (ENUM_EQUIP.eEquipSlotNoChest == equipSlotNo or ENUM_EQUIP.eEquipSlotNoGlove == equipSlotNo or ENUM_EQUIP.eEquipSlotNoBoots == equipSlotNo or ENUM_EQUIP.eEquipSlotNoHelm == equipSlotNo or ENUM_EQUIP.eEquipSlotNoBelt == equipSlotNo) then
    return true
  end
  return false
end

FGlobal_Panel_DyeReNew_InventoryFilter = function(InvenSlotNo, itemWrapper, currentWhereType)
  -- function num : 0_28 , upvalues : DyeReNew, enCharacterType
  local self = DyeReNew
  if itemWrapper == nil then
    return true
  end
  local isServantUseable = (itemWrapper:getStaticStatus()):isUsableServant()
  if self._selected_CharacterTarget == 0 and isServantUseable then
    return true
  else
    if (enCharacterType.Horse == self._selected_CharacterTarget or enCharacterType.Camel == self._selected_CharacterTarget) and not isServantUseable then
      return true
    end
  end
  if itemWrapper:isDyeable() then
    return false
  end
  local equipSlotNo = (itemWrapper:getStaticStatus()):getEquipSlotNo()
  if Dye_ReNew_IsDyeableEquipment(equipSlotNo) then
    if itemWrapper:isDyeable() then
      return false
    else
      return true
    end
  end
  return true
end

FGlobal_Panel_DyeReNew_Reset_SetFunctor = function()
  -- function num : 0_29
  Inventory_SetFunctor(FGlobal_Panel_DyeReNew_InventoryFilter, FGlobal_Panel_DyeReNew_Interaction_FromInventory, nil, nil)
end

FGlobal_Panel_DyeReNew_Interaction_FromInventory = function(invenSlotNo, itemWrapper, count_s64, inventoryType)
  -- function num : 0_30
  ToClient_RequestSetDyeTargetSlotByInventorySlotNo(Inventory_GetCurrentInventoryType(), invenSlotNo)
end

FromClient_Dyeing_AddDamage = function()
  -- function num : 0_31
  FGlobal_Panel_DyeReNew_Hide()
end

renderMode:setClosefunctor(renderMode, FGlobal_Panel_DyeReNew_Hide)
Panel_Dye_ReNew:SetShow(false)
DyeReNew:Initialize()
ConsoleGroupCreate_Panel_Dye_ReNew = function()
  -- function num : 0_32
end

ConsoleGroupCreate_Panel_Dye_ReNew()

