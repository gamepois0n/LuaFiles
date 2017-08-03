-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\petinfo\panel_window_petcontrol.luac 

-- params : ...
-- function num : 0
Panel_Window_PetControl:SetShow(false, false)
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
local UI_color = Defines.Color
local UI_PUCT = CppEnums.PA_UI_CONTROL_TYPE
local isPlayOpen = ToClient_IsContentsGroupOpen("256")
local PetControl = {Btn_PetInfo = (UI.getChildControl)(Panel_Window_PetControl, "Button_PetInfo"), Btn_Follow = (UI.getChildControl)(Panel_Window_PetControl, "Button_Follow"), Btn_Wait = (UI.getChildControl)(Panel_Window_PetControl, "Button_Wait"), Btn_Find = (UI.getChildControl)(Panel_Window_PetControl, "Button_Find"), Btn_GetItem = (UI.getChildControl)(Panel_Window_PetControl, "Button_GetItem"), Btn_Play = (UI.getChildControl)(Panel_Window_PetControl, "CheckButton_Play"), Btn_Seal = (UI.getChildControl)(Panel_Window_PetControl, "Button_Seal"), Dot_RedIcon = (UI.getChildControl)(Panel_Window_PetControl, "Static_RedDotIcon"), Dot_GreenIcon = (UI.getChildControl)(Panel_Window_PetControl, "Static_GreenDotIcon"), Dot_YellowIcon = (UI.getChildControl)(Panel_Window_PetControl, "Static_YellowDotIcon"), Dot_PurpleIcon = (UI.getChildControl)(Panel_Window_PetControl, "Static_PurpleDotIcon"), Dot_GrayIcon1 = (UI.getChildControl)(Panel_Window_PetControl, "Static_GrayDotIcon1"), Dot_GrayIcon2 = (UI.getChildControl)(Panel_Window_PetControl, "Static_GrayDotIcon2"), Btn_IconPet = (UI.getChildControl)(Panel_Window_PetControl, "Button_IconPet"), Stc_IconPetBg = (UI.getChildControl)(Panel_Window_PetControl, "Static_IconPetBG"), Stc_HungryBG = (UI.getChildControl)(Panel_Window_PetControl, "Static_HungryBG"), Progrss_Hungry = (UI.getChildControl)(Panel_Window_PetControl, "Progress2_Hungry"), Txt_HungryAlert = (UI.getChildControl)(Panel_Window_PetIcon, "StaticText_HungryAlert"), Btn_AllSeal = (UI.getChildControl)(Panel_Window_PetControl, "Button_Allseal")}
local btnPetIcon = (UI.getChildControl)(Panel_Window_PetIcon, "Button_PetIcon")
for v,control in pairs(PetControl) do
  control:SetShow(false)
end
local posX = (PetControl.Btn_IconPet):GetSizeX()
local maxUnsealCount = ToClient_getPetUseMaxCount()
local temporaryPCRoomWrapper = getTemporaryInformationWrapper()
local isPremiumPcRoom = temporaryPCRoomWrapper:isPremiumPcRoom()
if isPremiumPcRoom then
  maxUnsealCount = maxUnsealCount + ToClient_getPetUseMaxCountPcRoom()
end
local maxPetControlCount = maxUnsealCount
local petCond = {}
local petIcon = {}
local haveUnsealPetNo = {}
local petIconPosX = {}
local petOrderList = {
_follow = {}
, 
_find = {}
, 
_getItem = {}
}
for index = 0, maxPetControlCount - 1 do
  petIconPosX[index] = {}
  petCond[index] = {}
end
PetControl.Init = function(self)
  -- function num : 0_0 , upvalues : maxPetControlCount, UI_PUCT, posX, petIcon, petIconPosX, btnPetIcon
  for index = 0, maxPetControlCount - 1 do
    local temp = {}
    local _petInfo = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_BUTTON, Panel_Window_PetControl, "Button_PetInfo_" .. index)
    CopyBaseProperty(self.Btn_PetInfo, _petInfo)
    _petInfo:addInputEvent("Mouse_LUp", "PetInfoNew_Open(" .. index .. ")")
    _petInfo:addInputEvent("Mouse_On", "petControl_Button_Tooltip( true," .. 4 .. ", " .. index .. ")")
    _petInfo:addInputEvent("Mouse_Out", "petControl_Button_Tooltip( false )")
    _petInfo:setTooltipEventRegistFunc("petControl_Button_Tooltip( true, " .. 4 .. " )")
    temp._petInfo = _petInfo
    local _follow = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_RADIOBUTTON, Panel_Window_PetControl, "Button_Follow_" .. index)
    CopyBaseProperty(self.Btn_Follow, _follow)
    _follow:addInputEvent("Mouse_LUp", "PetControl_Follow(" .. index .. ")")
    _follow:addInputEvent("Mouse_On", "petControl_Button_Tooltip( true," .. 0 .. ", " .. index .. ")")
    _follow:addInputEvent("Mouse_Out", "petControl_Button_Tooltip( false )")
    _follow:setTooltipEventRegistFunc("petControl_Button_Tooltip( true, " .. 0 .. " )")
    _follow:SetCheck(true)
    temp._follow = _follow
    local _wait = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_RADIOBUTTON, Panel_Window_PetControl, "Button_Wait_" .. index)
    CopyBaseProperty(self.Btn_Wait, _wait)
    _wait:addInputEvent("Mouse_LUp", "PetControl_Wait(" .. index .. ")")
    _wait:addInputEvent("Mouse_On", "petControl_Button_Tooltip( true," .. 1 .. ", " .. index .. ")")
    _wait:addInputEvent("Mouse_Out", "petControl_Button_Tooltip( false )")
    _wait:setTooltipEventRegistFunc("petControl_Button_Tooltip( true, " .. 1 .. " )")
    temp._wait = _wait
    local _find = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_CHECKBUTTON, Panel_Window_PetControl, "Button_Find_" .. index)
    CopyBaseProperty(self.Btn_Find, _find)
    _find:addInputEvent("Mouse_LUp", "PetControl_Find(" .. index .. ")")
    _find:addInputEvent("Mouse_On", "petControl_Button_Tooltip( true," .. 3 .. ", " .. index .. ")")
    _find:addInputEvent("Mouse_Out", "petControl_Button_Tooltip( false )")
    _find:setTooltipEventRegistFunc("petControl_Button_Tooltip( true, " .. 3 .. " )")
    _find:SetCheck(false)
    temp._find = _find
    local _getItem = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_CHECKBUTTON, Panel_Window_PetControl, "Button_GetItem_" .. index)
    CopyBaseProperty(self.Btn_GetItem, _getItem)
    _getItem:addInputEvent("Mouse_LUp", "PetControl_GetItem(" .. index .. ")")
    _getItem:addInputEvent("Mouse_On", "petControl_Button_Tooltip( true," .. 2 .. ", " .. index .. ")")
    _getItem:addInputEvent("Mouse_Out", "petControl_Button_Tooltip( false )")
    _getItem:setTooltipEventRegistFunc("petControl_Button_Tooltip( true, " .. 2 .. " )")
    _getItem:SetCheck(true)
    temp._getItem = _getItem
    local _getPlay = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_CHECKBUTTON, Panel_Window_PetControl, "Button_Play_" .. index)
    CopyBaseProperty(self.Btn_Play, _getPlay)
    _getPlay:addInputEvent("Mouse_LUp", "PetControl_WithPlay(" .. index .. ")")
    _getPlay:addInputEvent("Mouse_On", "petControl_Button_Tooltip( true," .. 5 .. ", " .. index .. ")")
    _getPlay:addInputEvent("Mouse_Out", "petControl_Button_Tooltip( false )")
    _getPlay:setTooltipEventRegistFunc("petControl_Button_Tooltip( true, " .. 5 .. " )")
    _getPlay:SetCheck(true)
    temp._withPlay = _getPlay
    local _seal = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_CHECKBUTTON, Panel_Window_PetControl, "Button_Seal_" .. index)
    CopyBaseProperty(self.Btn_Seal, _seal)
    _seal:addInputEvent("Mouse_LUp", "HandleClicked_petControl_Seal(" .. index .. ")")
    _seal:addInputEvent("Mouse_On", "petControl_Button_Tooltip( true," .. 97 .. ", " .. index .. ")")
    _seal:addInputEvent("Mouse_Out", "petControl_Button_Tooltip( false )")
    _seal:setTooltipEventRegistFunc("petControl_Button_Tooltip( true, " .. 97 .. " )")
    temp._seal = _seal
    local _redDotIcon = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATIC, Panel_Window_PetControl, "Static_RedDotIcon_" .. index)
    CopyBaseProperty(self.Dot_RedIcon, _redDotIcon)
    temp._redDotIcon = _redDotIcon
    local _greenDotIcon = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATIC, Panel_Window_PetControl, "Static_GreenDotIcon_" .. index)
    CopyBaseProperty(self.Dot_GreenIcon, _greenDotIcon)
    temp._greenDotIcon = _greenDotIcon
    local _yellowDotIcon = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATIC, Panel_Window_PetControl, "Static_YellowDotIcon_" .. index)
    CopyBaseProperty(self.Dot_YellowIcon, _yellowDotIcon)
    temp._yellowDotIcon = _yellowDotIcon
    local _purpleDotIcon = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATIC, Panel_Window_PetControl, "Static_PurpleDotIcon_" .. index)
    CopyBaseProperty(self.Dot_PurpleIcon, _purpleDotIcon)
    temp._purpleDotIcon = _purpleDotIcon
    local _grayDotIcon1 = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATIC, Panel_Window_PetControl, "Static_GrayDotIcon1_" .. index)
    CopyBaseProperty(self.Dot_GrayIcon1, _grayDotIcon1)
    temp._grayDotIcon1 = _grayDotIcon1
    local _grayDotIcon2 = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATIC, Panel_Window_PetControl, "Static_GrayDotIcon2_" .. index)
    CopyBaseProperty(self.Dot_GrayIcon2, _grayDotIcon2)
    temp._grayDotIcon2 = _grayDotIcon2
    local _iconPet = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_BUTTON, Panel_Window_PetControl, "Button_IconPet_" .. index)
    CopyBaseProperty(self.Btn_IconPet, _iconPet)
    _iconPet:addInputEvent("Mouse_LUp", "HandleClicked_petControl_IconShow(" .. index .. ")")
    _iconPet:addInputEvent("Mouse_On", "petControl_Button_Tooltip( true," .. 98 .. ", " .. index .. ")")
    _iconPet:addInputEvent("Mouse_Out", "petControl_Button_Tooltip( false )")
    _iconPet:setTooltipEventRegistFunc("petControl_Button_Tooltip( true, " .. 98 .. " )")
    temp._iconPet = _iconPet
    local _iconPetBg = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATIC, Panel_Window_PetControl, "Static_IconPetBG_" .. index)
    CopyBaseProperty(self.Stc_IconPetBg, _iconPetBg)
    temp._iconPetBg = _iconPetBg
    local _hungryBg = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATIC, Panel_Window_PetControl, "Static_HungryBG_" .. index)
    CopyBaseProperty(self.Stc_HungryBG, _hungryBg)
    temp._hungryBg = _hungryBg
    local _progress = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_PROGRESS2, Panel_Window_PetControl, "Progress2_Hungry_" .. index)
    CopyBaseProperty(self.Progrss_Hungry, _progress)
    temp._progress = _progress
    for v,control in pairs(temp) do
      control:SetPosX(control:GetPosX() + (posX + 13) * index)
      control:SetShow(false)
    end
    -- DECOMPILER ERROR at PC482: Confused about usage of register: R23 in 'UnsetPending'

    petIcon[index] = temp
    -- DECOMPILER ERROR at PC490: Confused about usage of register: R23 in 'UnsetPending'

    ;
    (petIconPosX[index])._petInfo = ((petIcon[index])._petInfo):GetPosX()
    -- DECOMPILER ERROR at PC498: Confused about usage of register: R23 in 'UnsetPending'

    ;
    (petIconPosX[index])._seal = ((petIcon[index])._seal):GetPosX()
    -- DECOMPILER ERROR at PC506: Confused about usage of register: R23 in 'UnsetPending'

    ;
    (petIconPosX[index])._follow = ((petIcon[index])._follow):GetPosX()
    -- DECOMPILER ERROR at PC514: Confused about usage of register: R23 in 'UnsetPending'

    ;
    (petIconPosX[index])._find = ((petIcon[index])._find):GetPosX()
    -- DECOMPILER ERROR at PC522: Confused about usage of register: R23 in 'UnsetPending'

    ;
    (petIconPosX[index])._getItem = ((petIcon[index])._getItem):GetPosX()
    -- DECOMPILER ERROR at PC530: Confused about usage of register: R23 in 'UnsetPending'

    ;
    (petIconPosX[index])._withPlay = ((petIcon[index])._withPlay):GetPosX()
  end
  for index = 0, maxPetControlCount - 1 do
    ((petIcon[index])._petInfo):SetText("")
    ;
    ((petIcon[index])._follow):SetText("")
    ;
    ((petIcon[index])._wait):SetText("")
    ;
    ((petIcon[index])._find):SetText("")
    ;
    ((petIcon[index])._getItem):SetText("")
    ;
    ((petIcon[index])._withPlay):SetText("")
    ;
    ((petIcon[index])._seal):SetText("")
  end
  ;
  (self.Btn_AllSeal):addInputEvent("Mouse_LUp", "HandleClicked_petControl_AllUnSeal()")
  btnPetIcon:addInputEvent("Mouse_LUp", "FGlobal_PetListNew_Toggle()")
  btnPetIcon:addInputEvent("Mouse_RUp", "Panel_Window_PetControl_ShowToggle()")
  btnPetIcon:addInputEvent("Mouse_On", "petControl_Button_Tooltip( true, 99 )")
  btnPetIcon:addInputEvent("Mouse_Out", "petControl_Button_Tooltip( false )")
  btnPetIcon:setTooltipEventRegistFunc("petControl_Button_Tooltip( true, " .. 99 .. " )")
  btnPetIcon:ActiveMouseEventEffect(true)
  ;
  (self.Btn_AllSeal):SetShow(false)
end

local _havePetCount = 0
local _unSealPetCount = 0
PetInfoInit_ByPetNo = function()
  -- function num : 0_1 , upvalues : _unSealPetCount, petCond, petIcon, _havePetCount
  local unSealPetCount = ToClient_getPetUnsealedList()
  local sealPetCount = ToClient_getPetSealedList()
  local havePetCount = unSealPetCount + sealPetCount
  if havePetCount <= 0 then
    return 
  end
  if _unSealPetCount < unSealPetCount then
    for index = 0, unSealPetCount - 1 do
      local petData = ToClient_getPetUnsealedDataByIndex(index)
      local newUnsealPetCheck = true
      for pIndex = 0, _unSealPetCount - 1 do
        local _petData = ToClient_getPetUnsealedDataByIndex(pIndex)
        -- DECOMPILER ERROR at PC37: Confused about usage of register: R14 in 'UnsetPending'

        if petData:getPcPetNo() == _petData:getPcPetNo() then
          (petCond[index])._petNo = petData:getPcPetNo()
          -- DECOMPILER ERROR at PC45: Confused about usage of register: R14 in 'UnsetPending'

          ;
          (petCond[index])._follow = ((petIcon[pIndex])._follow):IsCheck()
          -- DECOMPILER ERROR at PC53: Confused about usage of register: R14 in 'UnsetPending'

          ;
          (petCond[index])._find = ((petIcon[pIndex])._find):IsCheck()
          -- DECOMPILER ERROR at PC61: Confused about usage of register: R14 in 'UnsetPending'

          ;
          (petCond[index])._getItem = ((petIcon[pIndex])._getItem):IsCheck()
          newUnsealPetCheck = false
        end
      end
      -- DECOMPILER ERROR at PC70: Confused about usage of register: R9 in 'UnsetPending'

      if newUnsealPetCheck then
        (petCond[index])._petNo = petData:getPcPetNo()
        -- DECOMPILER ERROR at PC73: Confused about usage of register: R9 in 'UnsetPending'

        ;
        (petCond[index])._follow = true
        -- DECOMPILER ERROR at PC76: Confused about usage of register: R9 in 'UnsetPending'

        ;
        (petCond[index])._getItem = true
        local isFind = false
        if petData:getSkillParam(1) ~= nil then
          isFind = (petData:getSkillParam(1)):isPassiveSkill()
        end
        -- DECOMPILER ERROR at PC91: Confused about usage of register: R10 in 'UnsetPending'

        ;
        (petCond[index])._find = isFind
        ToClient_callHandlerToPetNo("handlePetFollowMaster", (petCond[index])._petNo)
        ToClient_callHandlerToPetNo("handlePetGetItemOn", (petCond[index])._petNo)
        if isFind then
          ToClient_callHandlerToPetNo("handlePetFindThatOn", (petCond[index])._petNo)
        else
          ToClient_callHandlerToPetNo("handlePetFindThatOff", (petCond[index])._petNo)
        end
      end
    end
    _havePetCount = havePetCount
    _unSealPetCount = unSealPetCount
  else
    if unSealPetCount < _unSealPetCount then
      if unSealPetCount > 0 then
        for index = 0, unSealPetCount - 1 do
          local petData = ToClient_getPetUnsealedDataByIndex(index)
          for pIndex = 0, _unSealPetCount - 1 do
            local _petData = ToClient_getPetUnsealedDataByIndex(pIndex)
            -- DECOMPILER ERROR at PC155: Confused about usage of register: R13 in 'UnsetPending'

            if _petData ~= nil and petData:getPcPetNo() == _petData:getPcPetNo() then
              (petCond[index])._petNo = petData:getPcPetNo()
              -- DECOMPILER ERROR at PC163: Confused about usage of register: R13 in 'UnsetPending'

              ;
              (petCond[index])._follow = ((petIcon[pIndex])._follow):IsCheck()
              -- DECOMPILER ERROR at PC171: Confused about usage of register: R13 in 'UnsetPending'

              ;
              (petCond[index])._find = ((petIcon[pIndex])._find):IsCheck()
              -- DECOMPILER ERROR at PC179: Confused about usage of register: R13 in 'UnsetPending'

              ;
              (petCond[index])._getItem = ((petIcon[pIndex])._getItem):IsCheck()
            end
          end
        end
      end
      do
        _unSealPetCount = unSealPetCount
        PetControl_IconSettingUpdate()
      end
    end
  end
end

PetControl_IconSettingUpdate = function()
  -- function num : 0_2 , upvalues : petIcon, petCond
  local unSealPetCount = ToClient_getPetUnsealedList()
  for index = 0, unSealPetCount - 1 do
    ((petIcon[index])._follow):SetCheck((petCond[index])._follow)
    ;
    ((petIcon[index])._find):SetCheck((petCond[index])._find)
    ;
    ((petIcon[index])._getItem):SetCheck((petCond[index])._getItem)
  end
  FGlobal_PetControl_CheckUnSealPet()
end

FGlobal_PetInfoInit = function()
  -- function num : 0_3
  PetInfoInit_ByPetNo()
end

local screenX = getScreenSizeX()
local screenY = getScreenSizeY()
local panelSizeX = (PetControl.Btn_GetItem):GetSizeX()
local panelSizeY = (PetControl.Btn_GetItem):GetSizeY()
local unSealPetNo = {nil, nil; [0] = nil}
local PetControl_CurrentButtonTooltipType = -1
;
(PetControl.Btn_Follow):ActiveMouseEventEffect(true)
;
(PetControl.Btn_Wait):ActiveMouseEventEffect(true)
PetControl.ButtonShow = function(self, isShow, index)
  -- function num : 0_4 , upvalues : petIcon, isPlayOpen
  ((petIcon[index])._petInfo):SetShow(isShow)
  ;
  ((petIcon[index])._follow):SetShow(isShow)
  ;
  ((petIcon[index])._wait):SetShow(isShow)
  ;
  ((petIcon[index])._find):SetShow(isShow)
  ;
  ((petIcon[index])._getItem):SetShow(isShow)
  ;
  ((petIcon[index])._withPlay):SetShow(not isShow or isPlayOpen)
  ;
  ((petIcon[index])._seal):SetShow(isShow)
end

local showIndex = -1
FGlobal_PetControl_CheckUnSealPet = function(petNo_s64)
  -- function num : 0_5 , upvalues : maxUnsealCount, petIcon, PetControl, petCond, haveUnsealPetNo
  if isFlushedUI() then
    return 
  end
  if not Panel_Window_PetControl:GetShow() then
    return 
  end
  local isUnSealPet = ToClient_getPetUnsealedList()
  if isUnSealPet > 0 then
    PetControl_RePos()
    for index = 0, maxUnsealCount - 1 do
      local PetUnSealData = ToClient_getPetUnsealedDataByIndex(index)
      if PetUnSealData ~= nil then
        local self = petIcon[index]
        local unsealPetStaticStatus = PetUnSealData:getPetStaticStatus()
        local unsealIconPath = PetUnSealData:getIconPath()
        local petNo = PetUnSealData:getPcPetNo()
        ;
        ((petIcon[index])._iconPet):ChangeTextureInfoName(unsealIconPath)
        for v,control in pairs(petIcon[index]) do
          control:SetShow(true)
        end
        if isShowIndex() ~= index then
          PetControl:ButtonShow(false, index)
        else
          ;
          (self._wait):SetShow(false)
        end
        -- DECOMPILER ERROR at PC72: Confused about usage of register: R11 in 'UnsetPending'

        if (petCond[index])._follow == nil then
          (petCond[index])._petNo = petNo
          -- DECOMPILER ERROR at PC75: Confused about usage of register: R11 in 'UnsetPending'

          ;
          (petCond[index])._follow = true
          -- DECOMPILER ERROR at PC78: Confused about usage of register: R11 in 'UnsetPending'

          ;
          (petCond[index])._find = false
          -- DECOMPILER ERROR at PC81: Confused about usage of register: R11 in 'UnsetPending'

          ;
          (petCond[index])._getItem = true
          ToClient_callHandlerToPetNo("handlePetFollowMaster", (petCond[index])._petNo)
          ToClient_callHandlerToPetNo("handlePetFindThatOff", (petCond[index])._petNo)
          ToClient_callHandlerToPetNo("handlePetGetItemOn", (petCond[index])._petNo)
        end
        -- DECOMPILER ERROR at PC114: Confused about usage of register: R11 in 'UnsetPending'

        if PetUnSealData:getSkillParam(1) ~= nil and (PetUnSealData:getSkillParam(1)):isPassiveSkill() then
          (petCond[index])._find = true
        end
        ;
        (self._follow):SetCheck((petCond[index])._follow)
        ;
        (self._find):SetCheck((petCond[index])._find)
        ;
        (self._getItem):SetCheck((petCond[index])._getItem)
        local isFollow = (self._follow):IsCheck()
        ;
        (self._greenDotIcon):SetShow(isFollow)
        ;
        (self._redDotIcon):SetShow(not isFollow)
        local isFind = (self._find):IsCheck()
        ;
        (self._yellowDotIcon):SetShow(isFind)
        ;
        (self._grayDotIcon1):SetShow(not isFind)
        local isGetItem = (self._getItem):IsCheck()
        ;
        (self._purpleDotIcon):SetShow(isGetItem)
        ;
        (self._grayDotIcon2):SetShow(not isGetItem)
        local petLootingType = PetUnSealData:getPetLootingType()
        ;
        (self._withPlay):ChangeTextureInfoName("new_ui_common_forlua/window/servant/pet_00.dds")
        local x1, y1, x2, y2 = nil, nil, nil, nil
        if petLootingType == 0 then
          x1 = setTextureUV_Func(self._withPlay, 140, 280, 172, 312)
        else
          -- DECOMPILER ERROR at PC196: Overwrote pending register: R18 in 'AssignReg'

          -- DECOMPILER ERROR at PC197: Overwrote pending register: R17 in 'AssignReg'

          -- DECOMPILER ERROR at PC198: Overwrote pending register: R16 in 'AssignReg'

          if petLootingType == 1 then
            x1 = setTextureUV_Func(self._withPlay, 104, 280, 136, 312)
          else
            -- DECOMPILER ERROR at PC210: Overwrote pending register: R18 in 'AssignReg'

            -- DECOMPILER ERROR at PC211: Overwrote pending register: R17 in 'AssignReg'

            -- DECOMPILER ERROR at PC212: Overwrote pending register: R16 in 'AssignReg'

            if petLootingType == 2 then
              x1 = setTextureUV_Func(self._withPlay, 176, 280, 208, 312)
            end
          end
        end
        ;
        ((self._withPlay):getBaseTexture()):setUV(x1, y1, x2, y2)
        ;
        (self._withPlay):setRenderTexture((self._withPlay):getBaseTexture())
        if Panel_Window_PetIcon:GetShow() then
          ((petIcon[index])._progress):SetShow(true)
          ;
          ((petIcon[index])._hungryBg):SetShow(true)
        else
          ;
          ((petIcon[index])._progress):SetShow(false)
          ;
          ((petIcon[index])._hungryBg):SetShow(false)
        end
        FGlobal_PetContorl_HungryGaugeUpdate(petNo)
      else
        do
          for v,control in pairs(petIcon[index]) do
            control:SetShow(false)
          end
          do
            -- DECOMPILER ERROR at PC273: LeaveBlock: unexpected jumping out DO_STMT

            -- DECOMPILER ERROR at PC273: LeaveBlock: unexpected jumping out IF_ELSE_STMT

            -- DECOMPILER ERROR at PC273: LeaveBlock: unexpected jumping out IF_STMT

          end
        end
      end
    end
  else
    if Panel_Window_PetControl:GetShow() then
      Panel_Window_PetControl_ShowToggle()
    end
    haveUnsealPetNo = {}
  end
  PetControl_RePos()
end

isShowIndex = function()
  -- function num : 0_6 , upvalues : showIndex
  return showIndex
end

PetControl_SetPositon = function()
  -- function num : 0_7
  Panel_Window_PetControl:SetPosX(10)
  Panel_Window_PetControl:SetPosY(Panel_SelfPlayerExpGage:GetSizeY() * 2.2)
end

PetInfoNew_Open = function(index)
  -- function num : 0_8
  TooltipSimple_Hide()
  local petCount = ToClient_getPetUnsealedList()
  if petCount == 0 then
    return 
  end
  local petNo = (ToClient_getPetUnsealedDataByIndex(index)):getPcPetNo()
  FGlobal_PetInfoNew_Open(petNo, true)
end

PetControl_Follow = function(index)
  -- function num : 0_9
  TooltipSimple_Hide()
  PetControl_BTNCheckedUpdate(index)
end

PetControl_Wait = function(index)
  -- function num : 0_10
  TooltipSimple_Hide()
  PetControl_BTNCheckedUpdate(index)
end

PetControl_BTNCheckedUpdate = function(index, isByPetListUpdate)
  -- function num : 0_11 , upvalues : petCond, petIcon, petOrderList
  local petCount = ToClient_getPetUnsealedList()
  if petCount == 0 then
    return 
  end
  local petNo = (ToClient_getPetUnsealedDataByIndex(index)):getPcPetNo()
  -- DECOMPILER ERROR at PC16: Confused about usage of register: R4 in 'UnsetPending'

  ;
  (petCond[index])._follow = not (petCond[index])._follow
  local isFollow = (petCond[index])._follow
  if isFollow then
    ToClient_callHandlerToPetNo("handlePetFollowMaster", petNo)
  else
    ToClient_callHandlerToPetNo("handlePetWaitMaster", petNo)
  end
  ;
  ((petIcon[index])._follow):SetShow(isFollow)
  ;
  ((petIcon[index])._wait):SetShow(not isFollow)
  -- DECOMPILER ERROR at PC48: Confused about usage of register: R5 in 'UnsetPending'

  ;
  (petOrderList._follow)[tostring(petNo)] = isFollow
  PetControl_IconSettingUpdate()
  FGlobal_PetList_PetOrder(index)
end

PetControl_WithPlay = function(index)
  -- function num : 0_12
  TooltipSimple_Hide()
  local PetUnSealData = ToClient_getPetUnsealedDataByIndex(index)
  if PetUnSealData ~= nil then
    local petNo = PetUnSealData:getPcPetNo()
    local petLootingType = (PetUnSealData:getPetLootingType() + 1) % 3
    ToClient_requestChangePetLootingType(petNo, petLootingType)
  end
end

PetControl_GetItem = function(index, isByPetListUpdate)
  -- function num : 0_13 , upvalues : petCond, petOrderList
  TooltipSimple_Hide()
  local petCount = ToClient_getPetUnsealedList()
  if petCount == 0 then
    return 
  end
  local petNo = (ToClient_getPetUnsealedDataByIndex(index)):getPcPetNo()
  -- DECOMPILER ERROR at PC18: Confused about usage of register: R4 in 'UnsetPending'

  ;
  (petCond[index])._getItem = not (petCond[index])._getItem
  local isGetItem = (petCond[index])._getItem
  if isGetItem then
    ToClient_callHandlerToPetNo("handlePetGetItemOn", petNo)
  else
    ToClient_callHandlerToPetNo("handlePetGetItemOff", petNo)
  end
  -- DECOMPILER ERROR at PC38: Confused about usage of register: R5 in 'UnsetPending'

  ;
  (petOrderList._getItem)[tostring(petNo)] = isGetItem
  PetControl_IconSettingUpdate()
  FGlobal_PetList_PetOrder(index)
end

PetControl_Find = function(index, isByPetListUpdate)
  -- function num : 0_14 , upvalues : petIcon, petCond, petOrderList
  TooltipSimple_Hide()
  if PetTalentCheck(index) then
    ((petIcon[index])._find):SetCheck(true)
    ;
    ((petIcon[index])._yellowDotIcon):SetShow(true)
    ;
    ((petIcon[index])._grayDotIcon1):SetShow(false)
    return 
  end
  local petCount = ToClient_getPetUnsealedList()
  if petCount == 0 then
    return 
  end
  local petNo = (ToClient_getPetUnsealedDataByIndex(index)):getPcPetNo()
  -- DECOMPILER ERROR at PC42: Confused about usage of register: R4 in 'UnsetPending'

  ;
  (petCond[index])._find = not (petCond[index])._find
  local isFind = (petCond[index])._find
  if isFind then
    ToClient_callHandlerToPetNo("handlePetFindThatOn", petNo)
  else
    ToClient_callHandlerToPetNo("handlePetFindThatOff", petNo)
  end
  -- DECOMPILER ERROR at PC62: Confused about usage of register: R5 in 'UnsetPending'

  ;
  (petOrderList._find)[tostring(petNo)] = isFind
  PetControl_IconSettingUpdate()
  FGlobal_PetList_PetOrder(index)
end

PetTalentCheck = function(index)
  -- function num : 0_15
  local petCount = ToClient_getPetUnsealedList()
  if petCount == 0 then
    return false
  end
  local petData = ToClient_getPetUnsealedDataByIndex(index)
  local petRace = (petData:getPetStaticStatus()):getPetRace()
  if petData ~= nil and petData:getSkillParam(1) ~= nil then
    return (petData:getSkillParam(1)):isPassiveSkill()
  end
  return false
end

FGlobal_PetControl_OrderList = function(orderType, index)
  -- function num : 0_16
  local petCount = ToClient_getPetUnsealedList()
  if petCount == 0 then
    return 
  end
  local petNo = (ToClient_getPetUnsealedDataByIndex(index)):getPcPetNo()
  if orderType == 0 then
    PetControl_BTNCheckedUpdate(index, true)
  else
    if orderType == 1 then
      PetControl_Find(index, true)
    else
      if orderType == 2 then
        PetControl_GetItem(index, true)
      end
    end
  end
end

FGlobal_PetControl_SealPet = function(index)
  -- function num : 0_17 , upvalues : petIcon, maxUnsealCount, PetControl
  local self = petIcon[index]
  local unsealedPetList = ToClient_getPetUnsealedList()
  if unsealedPetList > 0 then
    local petData = ToClient_getPetUnsealedDataByIndex(index)
    local petNo = petData:getPcPetNo()
    for petIconIndex = 0, maxUnsealCount - 1 do
      local petData = ToClient_getPetUnsealedDataByIndex(petIconIndex)
      if petData ~= nil then
        FGlobal_PetContorl_HungryGaugeUpdate(petData:getPcPetNo())
        PetControl:ButtonShow(false, petIconIndex)
      end
    end
  end
  do
    if Panel_Window_PetIcon:GetShow() then
      (self._progress):SetShow(true)
      ;
      (self._hungryBg):SetShow(true)
    else
      ;
      (self._progress):SetShow(false)
      ;
      (self._hungryBg):SetShow(false)
    end
    FGlobal_PetControl_RestoreUI()
  end
end

FGlobal_PetControl_RestoreUI = function()
  -- function num : 0_18 , upvalues : PetControl
  local self = PetControl
  TooltipSimple_Hide()
  local unsealedCount = ToClient_getPetUnsealedList()
  if unsealedCount <= 0 then
    return 
  end
  if Panel_Window_PetControl:GetShow() or Panel_Window_PetIcon:GetShow() then
    local isUnSealPetIndex = unsealedCount - 1
  end
end

HandleClicked_petControl_IconShow = function(index)
  -- function num : 0_19 , upvalues : maxUnsealCount, petIcon
  for i = 0, maxUnsealCount - 1 do
    if ((petIcon[i])._petInfo):GetShow() == true then
      PetControl_ButtonHide(i)
      return 
    end
  end
  PetControl_ButtonShow(index)
end

HandleClicked_petControl_Seal = function(index)
  -- function num : 0_20 , upvalues : petIcon
  TooltipSimple_Hide()
  local self = petIcon[index]
  local unSealPetInfo = ToClient_getPetUnsealedList()
  local PetUnSealData = ToClient_getPetUnsealedDataByIndex(index)
  do
    if PetUnSealData ~= nil then
      local unsealPetNo_s64 = PetUnSealData:getPcPetNo()
      FGlobal_petListNew_Seal(tostring(unsealPetNo_s64), index)
    end
    FGlobal_AllSealButtonPosition(unSealPetInfo, false)
  end
end

HandleClicked_petControl_AllUnSeal = function()
  -- function num : 0_21 , upvalues : maxUnsealCount, petIcon
  for index = 0, maxUnsealCount - 1 do
    local self = petIcon[index]
    local unSealPetInfo = ToClient_getPetUnsealedList()
    local PetUnSealData = ToClient_getPetUnsealedDataByIndex(index)
    if PetUnSealData ~= nil then
      local unsealPetNo_s64 = PetUnSealData:getPcPetNo()
      FGlobal_petListNew_Seal(tostring(unsealPetNo_s64), index)
    end
  end
end

FGlobal_HandleClicked_petControl_AllUnSeal = function()
  -- function num : 0_22
  HandleClicked_petControl_AllUnSeal()
end

local unSealPetCounting = 0
FGlobal_AllSealButtonPosition = function(sealCount, sealType)
  -- function num : 0_23 , upvalues : PetControl, unSealPetCounting
  local self = PetControl
  if sealCount == nil then
    unSealPetCounting = ToClient_getPetUnsealedList()
  else
    if sealType == true then
      unSealPetCounting = sealCount + 1
    else
      unSealPetCounting = sealCount - 1
    end
  end
  ;
  (self.Btn_AllSeal):SetPosX(20 + 57 * unSealPetCounting)
end

PetControl_ButtonShow = function(index)
  -- function num : 0_24 , upvalues : petIcon, UI_ANI_ADV, petIconPosX, isPlayOpen
  local self = petIcon[index]
  local endTime = 0.08
  local MoveAni1 = (self._petInfo):addMoveAnimation(0, endTime, UI_ANI_ADV.PAUI_ANIM_ADVANCE_SIN_HALF_PI)
  MoveAni1:SetStartPosition((petIconPosX[index])._petInfo, (self._petInfo):GetPosY())
  MoveAni1:SetEndPosition((petIconPosX[index])._petInfo, (self._petInfo):GetPosY())
  ;
  (self._petInfo):SetShow(true)
  local MoveAni2 = (self._seal):addMoveAnimation(0, endTime, UI_ANI_ADV.PAUI_ANIM_ADVANCE_SIN_HALF_PI)
  MoveAni2:SetStartPosition((petIconPosX[index])._petInfo, (self._seal):GetPosY())
  MoveAni2:SetEndPosition((petIconPosX[index])._seal, (self._seal):GetPosY())
  ;
  (self._seal):SetShow(true)
  local MoveAni3 = (self._follow):addMoveAnimation(0, endTime, UI_ANI_ADV.PAUI_ANIM_ADVANCE_SIN_HALF_PI)
  MoveAni3:SetStartPosition((petIconPosX[index])._petInfo, (self._follow):GetPosY())
  MoveAni3:SetEndPosition((petIconPosX[index])._follow, (self._follow):GetPosY())
  if (self._greenDotIcon):GetShow() then
    (self._follow):SetShow(true)
    ;
    (self._wait):SetShow(false)
  else
    ;
    (self._wait):SetShow(true)
    ;
    (self._follow):SetShow(false)
  end
  local MoveAni4 = (self._wait):addMoveAnimation(0, endTime, UI_ANI_ADV.PAUI_ANIM_ADVANCE_SIN_HALF_PI)
  MoveAni4:SetStartPosition((petIconPosX[index])._petInfo, (self._follow):GetPosY())
  MoveAni4:SetEndPosition((petIconPosX[index])._follow, (self._follow):GetPosY())
  local MoveAni5 = (self._find):addMoveAnimation(0, endTime, UI_ANI_ADV.PAUI_ANIM_ADVANCE_SIN_HALF_PI)
  MoveAni5:SetStartPosition((petIconPosX[index])._petInfo, (self._find):GetPosY())
  MoveAni5:SetEndPosition((petIconPosX[index])._find, (self._find):GetPosY())
  ;
  (self._find):SetShow(true)
  local MoveAni6 = (self._getItem):addMoveAnimation(0, endTime, UI_ANI_ADV.PAUI_ANIM_ADVANCE_SIN_HALF_PI)
  MoveAni6:SetStartPosition((petIconPosX[index])._petInfo, (self._getItem):GetPosY())
  MoveAni6:SetEndPosition((petIconPosX[index])._getItem, (self._getItem):GetPosY())
  ;
  (self._getItem):SetShow(true)
  local MoveAni7 = (self._withPlay):addMoveAnimation(0, endTime, UI_ANI_ADV.PAUI_ANIM_ADVANCE_SIN_HALF_PI)
  MoveAni7:SetStartPosition((petIconPosX[index])._petInfo, (self._withPlay):GetPosY())
  MoveAni7:SetEndPosition((petIconPosX[index])._withPlay, (self._withPlay):GetPosY())
  ;
  (self._withPlay):SetShow(isPlayOpen)
end

PetControl_ButtonHide = function(index)
  -- function num : 0_25 , upvalues : petIcon, PetControl
  local self = petIcon[index]
  PetControl:ButtonShow(false, index)
end

Panel_Window_PetControl_ShowToggle = function()
  -- function num : 0_26 , upvalues : PetControl
  if Panel_Window_PetControl:GetShow() then
    Panel_Window_PetControl:SetShow(false)
  else
    Panel_Window_PetControl:SetShow(true)
    FGlobal_PetControl_CheckUnSealPet()
    local unSealPetCount = ToClient_getPetUnsealedList()
    for index = 0, unSealPetCount - 1 do
      PetControl_ButtonHide(index)
    end
  end
  do
    PetControl_RePos()
    ;
    (PetControl.Btn_AllSeal):SetShow(true)
    FGlobal_AllSealButtonPosition()
    if Panel_Party:GetShow() and Panel_Window_PetControl:GetShow() then
      local petCount = ToClient_getPetUnsealedList()
      local isOverlap = false
      for overlapY = Panel_Party:GetPosY(), Panel_Party:GetPosY() + Panel_Party:GetSizeY(), Panel_Party:GetSizeY() do
        if Panel_Window_PetControl:GetPosY() <= overlapY and overlapY <= Panel_Window_PetControl:GetPosY() + Panel_Window_PetControl:GetSizeY() then
          isOverlap = true
        end
      end
      if isOverlap then
        for overlapX = Panel_Party:GetPosX(), Panel_Party:GetPosX() + Panel_Party:GetSizeX(), Panel_Party:GetSizeX() do
          if Panel_Window_PetControl:GetPosX() <= overlapX and overlapX <= Panel_Window_PetControl:GetPosX() + (Panel_Window_PetControl:GetSizeX() + 10) * petCount + 60 then
            PartyPanel_Repos()
            return 
          end
        end
      end
    end
  end
end

PetControl_RePos = function()
  -- function num : 0_27
  local posX = Panel_Window_PetIcon:GetPosX()
  local posY = Panel_Window_PetIcon:GetPosY()
  local screenX = getScreenSizeX()
  if posX < screenX / 4 then
    Panel_Window_PetControl:SetPosX(10)
  else
    local unSealPetCount = ToClient_getPetUnsealedList()
    local controlSizeX = (math.max)(184, 57 * unSealPetCount + 70)
    if posX + controlSizeX <= screenX then
      Panel_Window_PetControl:SetPosX(posX)
    else
      Panel_Window_PetControl:SetPosX(screenX - controlSizeX)
    end
  end
  do
    Panel_Window_PetControl:SetPosY(posY + Panel_Window_PetIcon:GetSizeY() + 10)
  end
end

petControl_Button_Tooltip = function(isShow, buttonType, index)
  -- function num : 0_28 , upvalues : PetControl, petIcon
  if isShow == false then
    TooltipSimple_Hide()
    ;
    (PetControl.Txt_HungryAlert):SetShow(false)
    return 
  end
  local self, uiControl, name, desc = nil, nil, nil, nil
  if index ~= nil then
    self = petIcon[index]
  else
    if buttonType == 99 then
      uiControl = Panel_Window_PetIcon
      name = PAGetString(Defines.StringSheet_GAME, "LUA_PETCONTROL_BUTTONTOOLTIP_PETLIST_NAME")
      if ToClient_getPetUnsealedList() == 0 then
        desc = PAGetString(Defines.StringSheet_GAME, "LUA_PETCONTROL_BUTTONTOOLTIP_WAITPET_DESC")
      else
        if Panel_Window_PetControl:GetShow() then
          desc = PAGetString(Defines.StringSheet_GAME, "LUA_PETCONTROL_BUTTONTOOLTIP_ICONHIDE_DESC")
        else
          desc = PAGetString(Defines.StringSheet_GAME, "LUA_PETCONTROL_BUTTONTOOLTIP_ICONSHOW_DESC")
        end
        if PetHungryConditionCheck() then
          desc = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_PETCONTROL_BUTTONTOOLTIP_PETHUNGRY_DESC", "desc", desc)
        end
      end
    else
      return 
    end
    registTooltipControl(uiControl, Panel_Tooltip_SimpleText)
    TooltipSimple_Show(uiControl, name, desc)
    return 
  end
  if isShow == true then
    if buttonType == 0 then
      uiControl = self._follow
      name = PAGetString(Defines.StringSheet_GAME, "LUA_PETCONTROL_TOOLTIP_FOLLOW_NAME")
      desc = PAGetString(Defines.StringSheet_GAME, "LUA_PETCONTROL_TOOLTIP_FOLLOW_DESC")
    else
      if buttonType == 1 then
        uiControl = self._wait
        name = PAGetString(Defines.StringSheet_GAME, "LUA_PETCONTROL_TOOLTIP_WAIT_NAME")
        desc = PAGetString(Defines.StringSheet_GAME, "LUA_PETCONTROL_TOOLTIP_WAIT_DESC")
      else
        if buttonType == 2 then
          uiControl = self._getItem
          name = PAGetString(Defines.StringSheet_GAME, "LUA_PETCONTROL_TOOLTIP_GETITEM_NAME")
          desc = PAGetString(Defines.StringSheet_GAME, "LUA_PETCONTROL_TOOLTIP_GETITEM_DESC")
        else
          if buttonType == 3 then
            uiControl = self._find
            name = PAGetString(Defines.StringSheet_GAME, "LUA_PETCONTROL_TOOLTIP_FIND_NAME")
            desc = PAGetString(Defines.StringSheet_GAME, "LUA_PETCONTROL_TOOLTIP_FIND_DESC")
          else
            if buttonType == 4 then
              uiControl = self._petInfo
              name = PAGetString(Defines.StringSheet_GAME, "LUA_PETCONTROL_TOOLTIP_PETINFO_NAME")
              desc = PAGetString(Defines.StringSheet_GAME, "LUA_PETCONTROL_TOOLTIP_PETINFO_DESC")
            else
              if buttonType == 5 then
                local pcPetData = ToClient_getPetUnsealedDataByIndex(index)
                if pcPetData == nil then
                  return 
                end
                local petLootingType = pcPetData:getPetLootingType()
                local lootingTypeString = ""
                if petLootingType == 0 then
                  lootingTypeString = PAGetString(Defines.StringSheet_GAME, "LUA_IPETCONTROL_TOOLTIP_LOOTINGTYPE_0")
                else
                  if petLootingType == 1 then
                    lootingTypeString = PAGetString(Defines.StringSheet_GAME, "LUA_IPETCONTROL_TOOLTIP_LOOTINGTYPE_1")
                  else
                    if petLootingType == 2 then
                      lootingTypeString = PAGetString(Defines.StringSheet_GAME, "LUA_IPETCONTROL_TOOLTIP_LOOTINGTYPE_2")
                    end
                  end
                end
                uiControl = self._withPlay
                name = PAGetString(Defines.StringSheet_GAME, "LUA_PETCONTROL_TOOLTIP_PLAY_NAME") .. lootingTypeString
                desc = PAGetString(Defines.StringSheet_GAME, "LUA_PETCONTROL_TOOLTIP_PLAY_DESC")
              else
                do
                  if buttonType == 97 then
                    uiControl = self._seal
                    name = PAGetString(Defines.StringSheet_GAME, "LUA_PETCONTROL_TOOLTIP_PETSEAL_NAME")
                    desc = PAGetString(Defines.StringSheet_GAME, "LUA_PETCONTROL_TOOLTIP_PETSEAL_DESC")
                  else
                    if buttonType == 98 then
                      uiControl = self._iconPet
                      name = PAGetString(Defines.StringSheet_GAME, "LUA_PETCONTROL_TOOLTIP_PETCONTROL_NAME")
                      desc = PAGetString(Defines.StringSheet_GAME, "LUA_PETCONTROL_TOOLTIP_PETCONTROL_DESC")
                    end
                  end
                  registTooltipControl(uiControl, Panel_Tooltip_SimpleText)
                  TooltipSimple_Show(uiControl, name, desc)
                end
              end
            end
          end
        end
      end
    end
  end
end

FGlobal_PetContorl_HungryGaugeUpdate = function(petNo_s64)
  -- function num : 0_29 , upvalues : petIcon
  if isFlushedUI() then
    return 
  end
  local petCount = ToClient_getPetUnsealedList()
  if petCount == 0 then
    return 
  end
  local isHungry = false
  for index = 0, petCount - 1 do
    local pcPetData = ToClient_getPetUnsealedDataByIndex(index)
    if pcPetData ~= nil then
      local petStaticStatus = pcPetData:getPetStaticStatus()
      local petHungry = pcPetData:getHungry()
      local petMaxHungry = petStaticStatus._maxHungry
      local petHungryPercent = petHungry / petMaxHungry * 100
      ;
      ((petIcon[index])._progress):SetProgressRate(petHungryPercent)
      ;
      ((petIcon[index])._progress):SetShow(true)
      if petHungryPercent < 10 then
        isHungry = true
      end
    end
  end
  FGlobal_PetHungryAlert(isHungry)
end

local hungryCheck = false
FGlobal_PetHungryAlert = function(petHungryCheck)
  -- function num : 0_30 , upvalues : btnPetIcon, hungryCheck
  if isFlushedUI() then
    return 
  end
  btnPetIcon:EraseAllEffect()
  if petHungryCheck and ToClient_getPetUnsealedList() > 0 then
    btnPetIcon:AddEffect("fUI_Pet_01A", true, -1, -0.5)
  end
  hungryCheck = petHungryCheck
end

PetHungryConditionCheck = function()
  -- function num : 0_31 , upvalues : hungryCheck
  return hungryCheck
end

PetControl_registMessageHandler = function()
  -- function num : 0_32
  registerEvent("FromClient_PetAddList", "FGlobal_PetContorl_HungryGaugeUpdate")
  registerEvent("FromClient_PetInfoChanged", "FGlobal_PetContorl_HungryGaugeUpdate")
  registerEvent("FromClient_UpdateControlIconInfo", "UpdateControlIconInfo")
end

local petIndex = 0
UpdateControlIconInfo = function(petNo64, followAndWait, isFind, isGetItem)
  -- function num : 0_33 , upvalues : petCond, petIndex, petIcon, petOrderList, _unSealPetCount
  -- DECOMPILER ERROR at PC3: Confused about usage of register: R4 in 'UnsetPending'

  (petCond[petIndex])._petNo = petNo64
  if followAndWait then
    ToClient_callHandlerToPetNo("handlePetFollowMaster", petNo64)
  else
    ToClient_callHandlerToPetNo("handlePetWaitMaster", petNo64)
  end
  ;
  ((petIcon[petIndex])._follow):SetCheck(followAndWait)
  ;
  ((petIcon[petIndex])._wait):SetCheck(not followAndWait)
  ;
  ((petIcon[petIndex])._greenDotIcon):SetShow(followAndWait)
  ;
  ((petIcon[petIndex])._redDotIcon):SetShow(not followAndWait)
  if isFind then
    ToClient_callHandlerToPetNo("handlePetFindThatOn", petNo64)
  else
    ToClient_callHandlerToPetNo("handlePetFindThatOff", petNo64)
  end
  ;
  ((petIcon[petIndex])._find):SetCheck(isFind)
  ;
  ((petIcon[petIndex])._yellowDotIcon):SetShow(isFind)
  ;
  ((petIcon[petIndex])._grayDotIcon1):SetShow(not isFind)
  if isGetItem then
    ToClient_callHandlerToPetNo("handlePetGetItemOn", petNo64)
  else
    ToClient_callHandlerToPetNo("handlePetGetItemOff", petNo64)
  end
  ;
  ((petIcon[petIndex])._getItem):SetCheck(isGetItem)
  ;
  ((petIcon[petIndex])._purpleDotIcon):SetShow(isGetItem)
  ;
  ((petIcon[petIndex])._grayDotIcon2):SetShow(not isGetItem)
  -- DECOMPILER ERROR at PC110: Confused about usage of register: R4 in 'UnsetPending'

  ;
  (petCond[petIndex])._follow = followAndWait
  -- DECOMPILER ERROR at PC114: Confused about usage of register: R4 in 'UnsetPending'

  ;
  (petCond[petIndex])._find = isFind
  -- DECOMPILER ERROR at PC118: Confused about usage of register: R4 in 'UnsetPending'

  ;
  (petCond[petIndex])._getItem = isGetItem
  -- DECOMPILER ERROR at PC124: Confused about usage of register: R4 in 'UnsetPending'

  ;
  (petOrderList._follow)[tostring(petNo64)] = followAndWait
  -- DECOMPILER ERROR at PC130: Confused about usage of register: R4 in 'UnsetPending'

  ;
  (petOrderList._find)[tostring(petNo64)] = isFind
  -- DECOMPILER ERROR at PC136: Confused about usage of register: R4 in 'UnsetPending'

  ;
  (petOrderList._getItem)[tostring(petNo64)] = isGetItem
  petIndex = petIndex + 1
  _unSealPetCount = petIndex
end

PetControl_UnsealPetOrderInfo = function(petNo64)
  -- function num : 0_34 , upvalues : petOrderList, petCond
  if (petOrderList._follow)[tostring(petNo64)] == nil then
    for index = 0, ToClient_getPetUnsealedList() - 1 do
      local pcPetData = ToClient_getPetUnsealedDataByIndex(index)
      if pcPetData ~= nil and petNo64 == tostring(pcPetData:getPcPetNo()) then
        if pcPetData:getSkillParam(1) ~= nil then
          local isCheckTalent = (pcPetData:getSkillParam(1)):isPassiveSkill()
          -- DECOMPILER ERROR at PC40: Confused about usage of register: R7 in 'UnsetPending'

          ;
          (petOrderList._find)[tostring(petNo64)] = isCheckTalent
        else
          do
            do
              -- DECOMPILER ERROR at PC47: Confused about usage of register: R6 in 'UnsetPending'

              ;
              (petOrderList._find)[tostring(petNo64)] = false
              -- DECOMPILER ERROR at PC53: Confused about usage of register: R6 in 'UnsetPending'

              ;
              (petOrderList._follow)[tostring(petNo64)] = true
              -- DECOMPILER ERROR at PC59: Confused about usage of register: R6 in 'UnsetPending'

              ;
              (petOrderList._getItem)[tostring(petNo64)] = true
              -- DECOMPILER ERROR at PC73: Confused about usage of register: R6 in 'UnsetPending'

              if petNo64 == (petCond[index])._petNo then
                (petCond[index])._follow = (petOrderList._follow)[tostring(petNo64)]
                -- DECOMPILER ERROR at PC82: Confused about usage of register: R6 in 'UnsetPending'

                ;
                (petCond[index])._find = (petOrderList._find)[tostring(petNo64)]
                -- DECOMPILER ERROR at PC91: Confused about usage of register: R6 in 'UnsetPending'

                ;
                (petCond[index])._getItem = (petOrderList._getItem)[tostring(petNo64)]
              end
              PetInfoInit_ByPetNo()
              do return petOrderList end
              -- DECOMPILER ERROR at PC96: LeaveBlock: unexpected jumping out DO_STMT

              -- DECOMPILER ERROR at PC96: LeaveBlock: unexpected jumping out IF_ELSE_STMT

              -- DECOMPILER ERROR at PC96: LeaveBlock: unexpected jumping out IF_STMT

              -- DECOMPILER ERROR at PC96: LeaveBlock: unexpected jumping out IF_THEN_STMT

              -- DECOMPILER ERROR at PC96: LeaveBlock: unexpected jumping out IF_STMT

            end
          end
        end
      end
    end
  else
    return petOrderList
  end
end

PetControl:Init()
PetControl_registMessageHandler()
renderModeChange_PetControl_RestoreUI = function(prevRenderModeList, nextRenderModeList)
  -- function num : 0_35
  if CheckRenderModebyGameMode(nextRenderModeList) == false then
    return 
  end
  FGlobal_PetControl_RestoreUI()
end

registerEvent("FromClient_RenderModeChangeState", "renderModeChange_PetControl_RestoreUI")

