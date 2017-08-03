-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\housing\panel_house_installationmode_objectcontrol.luac 

-- params : ...
-- function num : 0
local UI_TM = CppEnums.TextMode
local UI_PUCT = CppEnums.PA_UI_CONTROL_TYPE
local UI_color = Defines.Color
local UI_CIT = CppEnums.InstallationType
local IM = CppEnums.EProcessorInputMode
Panel_House_InstallationMode_ObjectControl:SetShow(false)
local HouseInstallationControl = {btn_Confirm = (UI.getChildControl)(Panel_House_InstallationMode_ObjectControl, "Button_Confirm"), btn_Rotate_Right = (UI.getChildControl)(Panel_House_InstallationMode_ObjectControl, "Button_Rotate_Right"), btn_Rotate_Left = (UI.getChildControl)(Panel_House_InstallationMode_ObjectControl, "Button_Rotate_Left"), btn_Delete = (UI.getChildControl)(Panel_House_InstallationMode_ObjectControl, "Button_Delete"), btn_Move = (UI.getChildControl)(Panel_House_InstallationMode_ObjectControl, "Button_Move"), btn_Cancel = (UI.getChildControl)(Panel_House_InstallationMode_ObjectControl, "Button_Cancel"), btn_Resize = (UI.getChildControl)(Panel_House_InstallationMode_ObjectControl, "Button_Resize"), staticText_DetailGuide = (UI.getChildControl)(Panel_House_InstallationMode_ObjectControl, "StaticText_DetailGuide"), txt_RotateDesc = (UI.getChildControl)(Panel_House_InstallationMode_ObjectControl, "StaticText_RotateDesc"), warCountInstallationCountTitle = (UI.getChildControl)(Panel_House_WarInformation, "StaticText_ObjectCountTitle"), warCountInstallationCount = (UI.getChildControl)(Panel_House_WarInformation, "StaticText_ObjectCount"), warCountInnerObjectTitle = (UI.getChildControl)(Panel_House_WarInformation, "StaticText_EnalbeSizeTitle"), warCountInnerObjectMaxSize = (UI.getChildControl)(Panel_House_WarInformation, "StaticText_MaxInnerSize"), warCountInnerBigTitle_Limit = (UI.getChildControl)(Panel_House_WarInformation, "StaticText_InnerObjectMaxCountTitle"), templateInnerObjectName = (UI.getChildControl)(Panel_House_WarInformation, "StaticText_InnerObjectName"), templateInnerObjectCount = (UI.getChildControl)(Panel_House_WarInformation, "StaticText_InnerObjectCurrentCount"), telplateInnerObjectSize = (UI.getChildControl)(Panel_House_WarInformation, "StaticText_InnerObjectSize"), templateInnerObjectMaxCount = (UI.getChildControl)(Panel_House_WarInformation, "StaticText_InnerObjectMaxCount")}
local _txt_btnDesc = (UI.getChildControl)(Panel_House_InstallationMode_ObjectControl, "StaticText_Desc")
local _isInnterOjbectCount = 13
local innerObjectName = {[0] = PAGetString(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_HEALINGTOWER"), [1] = PAGetString(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_OBSERVATORY"), [2] = PAGetString(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_ELEPHANTBARN"), [3] = PAGetString(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_CATAPULTFACTORY"), [4] = PAGetString(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_FLAMEFACTORY"), [5] = PAGetString(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_DISTRIBUTOR"), [6] = PAGetString(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_BARRICADE"), [7] = PAGetString(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_BARRICADEGATE"), [8] = PAGetString(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_WOODENFENCE"), [9] = PAGetString(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_DEFFENCETOWER"), [10] = PAGetString(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_SIEGETOWER"), [11] = PAGetString(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_LARGESIEGETOWER"), [12] = PAGetString(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_ADVANCEBASETOWER")}
local innerObjectSize = {3, 5, 3, 3, 5, 1, 2, 1, 0, 3, 5, 3; [0] = 1}
local innerObjectKind = {11, 12, 17, 18, 19, 3, 20, 21, 22, 23, 24, 26; [0] = 10}
if isGameTypeTaiwan() then
  _isInnterOjbectCount = 9
  innerObjectName = {[0] = PAGetString(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_HEALINGTOWER"), [1] = PAGetString(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_OBSERVATORY"), [2] = PAGetString(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_CATAPULTFACTORY"), [3] = PAGetString(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_FLAMEFACTORY"), [4] = PAGetString(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_DISTRIBUTOR"), [5] = PAGetString(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_BARRICADE"), [6] = PAGetString(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_BARRICADEGATE"), [7] = PAGetString(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_DEFFENCETOWER"), [8] = PAGetString(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_ADVANCEBASETOWER")}
  innerObjectSize = {[0] = 1, [1] = 3, [2] = 3, [3] = 3, [4] = 5, [5] = 1, [6] = 2, [7] = 0, [8] = 3}
  innerObjectKind = {[0] = 10, [1] = 11, [2] = 17, [3] = 18, [4] = 19, [5] = 3, [6] = 20, [7] = 22, [8] = 26}
end
local innerObjectCount = _isInnterOjbectCount
local gapY = 20
local basePosY = (HouseInstallationControl.templateInnerObjectName):GetPosY()
local innerObject = {}
InnerObject_ControlInit = function()
  -- function num : 0_0 , upvalues : HouseInstallationControl, innerObjectCount, innerObject, basePosY, gapY, innerObjectName, innerObjectSize
  local temp = {}
  local self = HouseInstallationControl
  for index = 0, innerObjectCount - 1 do
    temp[index] = {}
    -- DECOMPILER ERROR at PC11: Confused about usage of register: R6 in 'UnsetPending'

    innerObject[index] = {}
    -- DECOMPILER ERROR at PC23: Confused about usage of register: R6 in 'UnsetPending'

    ;
    (temp[index])._name = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATICTEXT, Panel_House_WarInformation, "StaticText_InnerObjectName_" .. index)
    CopyBaseProperty(self.templateInnerObjectName, (temp[index])._name)
    ;
    ((temp[index])._name):SetPosY(basePosY + gapY * index)
    ;
    ((temp[index])._name):SetText(innerObjectName[index])
    ;
    ((temp[index])._name):SetShow(true)
    -- DECOMPILER ERROR at PC59: Confused about usage of register: R6 in 'UnsetPending'

    ;
    (temp[index])._count = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATICTEXT, Panel_House_WarInformation, "StaticText_InnerObjectCount_" .. index)
    CopyBaseProperty(self.templateInnerObjectCount, (temp[index])._count)
    ;
    ((temp[index])._count):SetPosY(basePosY + gapY * index)
    ;
    ((temp[index])._count):SetShow(true)
    -- DECOMPILER ERROR at PC89: Confused about usage of register: R6 in 'UnsetPending'

    ;
    (temp[index])._size = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATICTEXT, Panel_House_WarInformation, "StaticText_InnerObjectSize_" .. index)
    CopyBaseProperty(self.telplateInnerObjectSize, (temp[index])._size)
    ;
    ((temp[index])._size):SetPosY(basePosY + gapY * index)
    ;
    ((temp[index])._size):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_INNEROBJECTSIZE", "size", innerObjectSize[index]))
    ;
    ((temp[index])._size):SetShow(true)
    -- DECOMPILER ERROR at PC131: Confused about usage of register: R6 in 'UnsetPending'

    ;
    (temp[index])._maxCount = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATICTEXT, Panel_House_WarInformation, "StaticText_InnerObjectMaxCount_" .. index)
    CopyBaseProperty(self.templateInnerObjectMaxCount, (temp[index])._maxCount)
    ;
    ((temp[index])._maxCount):SetPosY(basePosY + gapY * index)
    ;
    ((temp[index])._maxCount):SetShow(true)
    -- DECOMPILER ERROR at PC152: Confused about usage of register: R6 in 'UnsetPending'

    innerObject[index] = temp[index]
  end
  ;
  (self.txt_RotateDesc):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_CART_ROTATE_DESC"))
  Panel_House_WarInformation:SetSize(Panel_House_WarInformation:GetSizeX(), 150 + innerObjectCount * 20)
  ;
  (self.warCountInnerObjectTitle):ComputePos()
  ;
  (self.warCountInnerObjectMaxSize):ComputePos()
  ;
  (self.warCountInstallationCountTitle):ComputePos()
  ;
  (self.warCountInstallationCount):ComputePos()
end

InnerObject_ControlInit()
HouseInstallationControl.Initialize = function(self)
  -- function num : 0_1
  (self.btn_Confirm):SetShow(false)
  ;
  (self.btn_Rotate_Right):SetShow(false)
  ;
  (self.btn_Rotate_Left):SetShow(false)
  ;
  (self.btn_Delete):SetShow(false)
  ;
  (self.btn_Move):SetShow(false)
  ;
  (self.btn_Cancel):SetShow(false)
  ;
  (self.btn_Resize):SetShow(false)
  ;
  (self.staticText_DetailGuide):SetShow(false)
end

local HouseInstallationControl_Is_Open = false
local isConfirmStep = false
local typeIsHavest = false
HouseInstallationControl.Close = function(self)
  -- function num : 0_2 , upvalues : HouseInstallationControl_Is_Open
  Panel_House_InstallationMode_ObjectControl:SetShow(false)
  HouseInstallationControl_Is_Open = false
end

Is_Show_HouseInstallationControl = function()
  -- function num : 0_3 , upvalues : HouseInstallationControl_Is_Open
  return HouseInstallationControl_Is_Open
end

Panel_House_ObjectControlDescFunc = function(isOn, btnType)
  -- function num : 0_4 , upvalues : _txt_btnDesc, typeIsHavest
  if isOn == true then
    _txt_btnDesc:SetAlpha(0)
    _txt_btnDesc:SetFontAlpha(0)
    _txt_btnDesc:ResetVertexAni()
    local AniInfo = (UIAni.AlphaAnimation)(1, _txt_btnDesc, 0, 0.2)
    _txt_btnDesc:SetShow(true)
    if btnType == 1 then
      if FGlobal_HouseInstallationControl_IsConfirmStep() == false then
        _txt_btnDesc:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_OBJECTCONTROL_CONFIRM"))
      else
        _txt_btnDesc:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_OBJECTCONTROL_CONFIRM") .. "(SpaceBar)")
      end
    else
      if btnType == 2 then
        _txt_btnDesc:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_OBJECTCONTROL_RIGHTROTATION"))
      else
        if btnType == 3 then
          _txt_btnDesc:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_OBJECTCONTROL_LEFTROTATION"))
        else
          if btnType == 4 then
            if typeIsHavest then
              _txt_btnDesc:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_OBJECTCONTROL_DELETE"))
            else
              _txt_btnDesc:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_OBJECTCONTROL_RETURN"))
            end
          else
            if btnType == 5 then
              _txt_btnDesc:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_OBJECTCONTROL_MOVE"))
            else
              if btnType == 6 then
                _txt_btnDesc:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_OBJECTCONTROL_CANCEL"))
              else
                if btnType == 7 then
                  _txt_btnDesc:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_OBJECTCONTROL_ZOOMIN"))
                end
              end
            end
          end
        end
      end
    end
    _txt_btnDesc:SetSize(_txt_btnDesc:GetTextSizeX() + 50 + (_txt_btnDesc:GetSpanSize()).x, _txt_btnDesc:GetSizeY())
  else
    do
      _txt_btnDesc:ResetVertexAni()
      do
        local AniInfo = (UIAni.AlphaAnimation)(0, _txt_btnDesc, 0, 0.2)
        AniInfo:SetHideAtEnd(true)
        _txt_btnDesc:ComputePos()
      end
    end
  end
end

Panel_House_ObjectControl_Confirm = function()
  -- function num : 0_5 , upvalues : HouseInstallationControl, UI_CIT
  if housing_isInstallMode() then
    local doit = function()
    -- function num : 0_5_0 , upvalues : HouseInstallationControl
    housing_InstallObject()
    FGlobal_House_InstallationModeCart_Update()
    HouseInstallationControl:Close()
  end

    local doCancel = function()
    -- function num : 0_5_1
    FGlobal_HouseInstallationControl_Close()
    return 
  end

    local installationType = UI_CIT.TypeCount
    local characterStaticWrapper = housing_getCreatedCharacterStaticWrapper()
    if characterStaticWrapper ~= nil then
      installationType = (characterStaticWrapper:getObjectStaticStatus()):getInstallationType()
      if installationType == UI_CIT.eType_WallPaper or installationType == UI_CIT.eType_FloorMaterial then
        local titleString = PAGetString(Defines.StringSheet_GAME, "LUA_HOUSING_TITLE_WALLPAPERDONTCANCLE")
        local contentString = PAGetString(Defines.StringSheet_GAME, "LUA_HOUSING_MEMO_WALLPAPERDONTCANCLE")
        local messageboxData = {title = titleString, content = contentString, functionYes = doit, functionCancel = doCancel, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
        ;
        (MessageBox.showMessageBox)(messageboxData)
        return 
      end
    end
    do
      do
        doit()
        if housing_isBuildMode() then
          local characterStaticWrapper = housing_getCreatedCharacterStaticWrapper()
          if characterStaticWrapper ~= nil then
            local objectStaticWrapper = characterStaticWrapper:getObjectStaticStatus()
            local isVillageTent = objectStaticWrapper:isVillageTent()
            if isVillageTent then
              FGlobal_VillageTent_SelectPopup()
              return 
            end
          end
          do
            local regionKeyRaw = 0
            if characterStaticWrapper ~= nil then
              local objectStaticWrapper = characterStaticWrapper:getObjectStaticStatus()
              if objectStaticWrapper:isAdvancedBase() then
                local myGuildInfo = ToClient_GetMyGuildInfoWrapper()
                if myGuildInfo ~= nil then
                  local guildNo = myGuildInfo:getGuildNo_s64()
                  if ToClient_IsInSiegeBattle(guildNo) then
                    regionKeyRaw = Panel_HouseGetRegionRaw()
                  end
                end
              end
            end
            do
              do
                housing_InstallObject(regionKeyRaw)
                FGlobal_HouseInstallationControl_Close()
                FGlobal_House_InstallationMode_Close()
                FGlobal_House_InstallationMode_Close()
              end
            end
          end
        end
      end
    end
  end
end

Panel_HouseGetRegionRaw = function()
  -- function num : 0_6
  local tempregionKeyRaw = 0
  local position = housing_getInstallationPos()
  local currentDay = ToClient_GetCurrentInstallableTentDayOfWeek(position)
  local dayCount = housing_getInstallableSiegeKeyList(position)
  for ii = 0, dayCount - 1 do
    local regionInfoWrapper = housing_getInstallableSiegeRegionInfo(ii)
    local day = regionInfoWrapper:getVillageSiegeType()
    if currentDay == day then
      tempregionKeyRaw = ((regionInfoWrapper:get())._regionKey):get()
      return tempregionKeyRaw
    end
  end
  return tempregionKeyRaw
end

HandleClicked_HouseInstallationControl_Confirm = function()
  -- function num : 0_7
  Panel_House_ObjectControl_Confirm()
end

HandleClicked_HouseInstallationControl_Rotate = function(isRight)
  -- function num : 0_8
  if isRight == true then
    housing_rotateObject(2)
  else
    housing_rotateObject(1)
  end
end

HandleClicked_HouseInstallationControl_Delete = function()
  -- function num : 0_9 , upvalues : HouseInstallationControl
  housing_deleteObject()
  HouseInstallationControl:Close()
  FGlobal_House_InstallationModeCart_Update()
end

HandleClicked_HouseInstallationControl_Move = function()
  -- function num : 0_10 , upvalues : HouseInstallationControl
  housing_moveObject()
  HouseInstallationControl:Close()
end

HandleClicked_HouseInstallationControl_Cancel = function()
  -- function num : 0_11 , upvalues : HouseInstallationControl
  housing_CancelInstallObject()
  HouseInstallationControl:Close()
  PAHousing_FarmInfo_Close()
  FGlobal_House_InstallationModeCart_Update()
end

FGlobal_HouseInstallationControl_Open = function(installMode, posX, posY, isShow, isShowMove, isShowFix, isShowDelete, isShowCancel)
  -- function num : 0_12 , upvalues : HouseInstallationControl, _txt_btnDesc, isConfirmStep, UI_CIT, typeIsHavest, IM, HouseInstallationControl_Is_Open
  if Panel_Win_System:GetShow() then
    return 
  end
  local self = HouseInstallationControl
  local characterStaticWrapper = (housing_getCreatedCharacterStaticWrapper())
  local installationType = nil
  local isCurtain = false
  if characterStaticWrapper ~= nil then
    installationType = (characterStaticWrapper:getObjectStaticStatus()):getInstallationType()
  end
  _txt_btnDesc:SetShow(false)
  local houseBuildMode = housing_isBuildMode()
  local houseWrapper = (housing_getHouseholdActor_CurrentPosition())
  local isFixed = nil
  if houseWrapper ~= nil and not ((houseWrapper:getStaticStatusWrapper()):getObjectStaticStatus()):isFixedHouse() then
    isFixed = ((houseWrapper:getStaticStatusWrapper()):getObjectStaticStatus()):isInnRoom()
  end
  local tempShow = isShow
  if installMode == 2 and houseBuildMode == false then
    tempShow = false
  end
  local tempisShowDelete = isShowDelete
  ;
  (self.btn_Resize):SetShow(false)
  ;
  (self.btn_Confirm):SetShow(tempShow)
  ;
  (self.btn_Rotate_Right):SetShow(tempShow)
  ;
  (self.btn_Rotate_Left):SetShow(tempShow)
  ;
  (self.btn_Delete):SetShow(tempisShowDelete)
  ;
  (self.btn_Move):SetShow(isShowMove)
  ;
  (self.btn_Cancel):SetShow(isShowCancel)
  if (self.btn_Confirm):GetShow() and installMode == 3 then
    isConfirmStep = true
  else
    isConfirmStep = false
  end
  Panel_House_InstallationMode_ObjectControl:SetIgnore(false)
  if installMode > 0 and not housing_isBuildMode() then
    (self.staticText_DetailGuide):SetShow(true)
  else
    ;
    (self.staticText_DetailGuide):SetShow(false)
  end
  ;
  (self.staticText_DetailGuide):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_OBJECTCONTROL_DESC"))
  if isShowMove then
    (self.staticText_DetailGuide):SetPosY(120)
  else
    ;
    (self.staticText_DetailGuide):SetPosY(98)
  end
  if UI_CIT.eType_Chandelier == installationType and installMode == 2 then
    Panel_House_InstallationMode_ObjectControl:SetIgnore(true)
    ;
    (self.staticText_DetailGuide):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_OBJECTCONTROL_DETAILGUIDE1"))
    typeIsHavest = false
  else
    if (UI_CIT.eType_Curtain == installationType or UI_CIT.eType_Curtain_Tied == installationType) and installMode == 2 then
      Panel_House_InstallationMode_ObjectControl:SetIgnore(true)
      ;
      (self.staticText_DetailGuide):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_OBJECTCONTROL_DETAILGUIDE2"))
      typeIsHavest = false
    else
      if UI_CIT.eType_WallPaper == installationType and installMode == 3 then
        (self.btn_Rotate_Right):SetShow(false)
        ;
        (self.btn_Rotate_Left):SetShow(false)
        typeIsHavest = false
      else
        if UI_CIT.eType_FloorMaterial == installationType and installMode == 3 then
          (self.btn_Rotate_Right):SetShow(false)
          ;
          (self.btn_Rotate_Left):SetShow(false)
          typeIsHavest = false
        else
          if (UI_CIT.eType_Havest == installationType or UI_CIT.eType_LivestockHarvest == installationType) and isFixed == false then
            typeIsHavest = true
            ;
            (self.btn_Rotate_Right):SetShow(false)
            ;
            (self.btn_Rotate_Left):SetShow(false)
          else
            typeIsHavest = false
          end
        end
      end
    end
  end
  local isRotatePossible = housing_isAvailableRotateSelectedObject()
  if isRotatePossible then
    (self.txt_RotateDesc):SetShow(true)
    ;
    (self.txt_RotateDesc):SetPosY((self.staticText_DetailGuide):GetPosY() + (self.staticText_DetailGuide):GetSizeY())
  else
    ;
    (self.txt_RotateDesc):SetShow(false)
  end
  if characterStaticWrapper ~= nil then
    local objectStaticWrapper = characterStaticWrapper:getObjectStaticStatus()
    local isPersonalTent = objectStaticWrapper:isPersonalTent()
    if isPersonalTent then
      (self.btn_Rotate_Right):SetShow(false)
      ;
      (self.btn_Rotate_Left):SetShow(false)
    end
  end
  do
    if houseBuildMode then
      (self.btn_Cancel):SetShow(false)
    end
    Panel_House_InstallationMode_ObjectControl:SetPosX(posX)
    Panel_House_InstallationMode_ObjectControl:SetPosY(posY)
    Panel_House_InstallationMode_ObjectControl:SetShow(isShow)
    ;
    (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_UiMode)
    HouseInstallationControl_Is_Open = true
  end
end

FGlobal_HouseInstallation_MinorWar_Open = function(buildingInfo)
  -- function num : 0_13 , upvalues : innerObjectCount, innerObject, innerObjectKind, innerObjectSize, HouseInstallationControl
  local houseWrapper = housing_getHouseholdActor_CurrentPosition()
  -- DECOMPILER ERROR at PC13: Unhandled construct in 'MakeBoolean' P1

  if buildingInfo == nil and houseWrapper ~= nil and houseWrapper:getStaticStatusWrapper() ~= nil then
    Panel_House_WarInformation:SetShow(true)
    Panel_House_WarInformation:SetSpanSize(50, 50)
    local actorKeyRaw = houseWrapper:getActorKey()
    local buildingInfo = ToClient_getBuildingInfo(actorKeyRaw)
    if buildingInfo ~= nil then
      local allCount = buildingInfo:getAllInstanceObjectCount()
      local cOSW = (houseWrapper:getStaticStatusWrapper()):getObjectStaticStatus()
      for index = 0, innerObjectCount - 1 do
        ((innerObject[index])._maxCount):SetShow(true)
      end
      for index = 0, innerObjectCount - 1 do
        ((innerObject[index])._count):SetShow(true)
      end
      if isGameTypeTaiwan() then
        ((innerObject[0])._maxCount):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_INNEROBJECTMAXCOUNT", "count", cOSW:getHealingTownerMaxCount()))
        ;
        ((innerObject[1])._maxCount):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_INNEROBJECTMAXCOUNT", "count", cOSW:getObservatoryMaxCount()))
        ;
        ((innerObject[2])._maxCount):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_INNEROBJECTMAXCOUNT", "count", cOSW:getCatapultFactoryMaxCount()))
        ;
        ((innerObject[3])._maxCount):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_INNEROBJECTMAXCOUNT", "count", cOSW:getFlameFactoryMaxCount()))
        ;
        ((innerObject[4])._maxCount):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_INNEROBJECTMAXCOUNT", "count", cOSW:getDistributorMaxCount()))
        ;
        ((innerObject[5])._maxCount):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_INNEROBJECTMAXCOUNT", "count", cOSW:getBarricadeMaxCount()))
        ;
        ((innerObject[6])._maxCount):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_INNEROBJECTMAXCOUNT", "count", cOSW:getBarricadeGateMaxCount()))
        ;
        ((innerObject[7])._maxCount):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_INNEROBJECTMAXCOUNT", "count", cOSW:getDefenceTowerMaxCount()))
        ;
        ((innerObject[8])._maxCount):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_INNEROBJECTMAXCOUNT", "count", cOSW:getAdvancedBaseTowerMaxCount()))
        ;
        ((innerObject[0])._count):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_INNEROBJECTMAXCOUNT", "count", buildingInfo:getInstanceObjectCount(innerObjectKind[0])))
        ;
        ((innerObject[1])._count):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_INNEROBJECTMAXCOUNT", "count", buildingInfo:getInstanceObjectCount(innerObjectKind[1])))
        ;
        ((innerObject[2])._count):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_INNEROBJECTMAXCOUNT", "count", buildingInfo:getInstanceObjectCount(innerObjectKind[3])))
        ;
        ((innerObject[3])._count):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_INNEROBJECTMAXCOUNT", "count", buildingInfo:getInstanceObjectCount(innerObjectKind[4])))
        ;
        ((innerObject[4])._count):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_INNEROBJECTMAXCOUNT", "count", buildingInfo:getInstanceObjectCount(innerObjectKind[5])))
        ;
        ((innerObject[5])._count):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_INNEROBJECTMAXCOUNT", "count", buildingInfo:getInstanceObjectCount(innerObjectKind[6])))
        ;
        ((innerObject[6])._count):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_INNEROBJECTMAXCOUNT", "count", buildingInfo:getInstanceObjectCount(innerObjectKind[7])))
        ;
        ((innerObject[7])._count):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_INNEROBJECTMAXCOUNT", "count", buildingInfo:getInstanceObjectCount(innerObjectKind[9])))
        ;
        ((innerObject[8])._count):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_INNEROBJECTMAXCOUNT", "count", buildingInfo:getInstanceObjectCount(innerObjectKind[12])))
      else
        ;
        ((innerObject[0])._maxCount):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_INNEROBJECTMAXCOUNT", "count", cOSW:getHealingTownerMaxCount()))
        ;
        ((innerObject[1])._maxCount):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_INNEROBJECTMAXCOUNT", "count", cOSW:getObservatoryMaxCount()))
        ;
        ((innerObject[2])._maxCount):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_INNEROBJECTMAXCOUNT", "count", cOSW:getElephantBarnMaxCount()))
        ;
        ((innerObject[3])._maxCount):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_INNEROBJECTMAXCOUNT", "count", cOSW:getCatapultFactoryMaxCount()))
        ;
        ((innerObject[4])._maxCount):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_INNEROBJECTMAXCOUNT", "count", cOSW:getFlameFactoryMaxCount()))
        ;
        ((innerObject[5])._maxCount):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_INNEROBJECTMAXCOUNT", "count", cOSW:getDistributorMaxCount()))
        ;
        ((innerObject[6])._maxCount):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_INNEROBJECTMAXCOUNT", "count", cOSW:getBarricadeMaxCount()))
        ;
        ((innerObject[7])._maxCount):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_INNEROBJECTMAXCOUNT", "count", cOSW:getBarricadeGateMaxCount()))
        ;
        ((innerObject[8])._maxCount):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_INNEROBJECTMAXCOUNT", "count", cOSW:getWoodenFenceMaxCount()))
        ;
        ((innerObject[9])._maxCount):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_INNEROBJECTMAXCOUNT", "count", cOSW:getDefenceTowerMaxCount()))
        ;
        ((innerObject[10])._maxCount):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_INNEROBJECTMAXCOUNT", "count", cOSW:getSiegeTowerMaxCount()))
        ;
        ((innerObject[11])._maxCount):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_INNEROBJECTMAXCOUNT", "count", cOSW:getLargeSiegeTowerMaxCount()))
        ;
        ((innerObject[12])._maxCount):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_INNEROBJECTMAXCOUNT", "count", cOSW:getAdvancedBaseTowerMaxCount()))
        ;
        ((innerObject[0])._count):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_INNEROBJECTMAXCOUNT", "count", buildingInfo:getInstanceObjectCount(innerObjectKind[0])))
        ;
        ((innerObject[1])._count):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_INNEROBJECTMAXCOUNT", "count", buildingInfo:getInstanceObjectCount(innerObjectKind[1])))
        ;
        ((innerObject[2])._count):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_INNEROBJECTMAXCOUNT", "count", buildingInfo:getInstanceObjectCount(innerObjectKind[2])))
        ;
        ((innerObject[3])._count):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_INNEROBJECTMAXCOUNT", "count", buildingInfo:getInstanceObjectCount(innerObjectKind[3])))
        ;
        ((innerObject[4])._count):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_INNEROBJECTMAXCOUNT", "count", buildingInfo:getInstanceObjectCount(innerObjectKind[4])))
        ;
        ((innerObject[5])._count):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_INNEROBJECTMAXCOUNT", "count", buildingInfo:getInstanceObjectCount(innerObjectKind[5])))
        ;
        ((innerObject[6])._count):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_INNEROBJECTMAXCOUNT", "count", buildingInfo:getInstanceObjectCount(innerObjectKind[6])))
        ;
        ((innerObject[7])._count):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_INNEROBJECTMAXCOUNT", "count", buildingInfo:getInstanceObjectCount(innerObjectKind[7])))
        ;
        ((innerObject[8])._count):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_INNEROBJECTMAXCOUNT", "count", buildingInfo:getInstanceObjectCount(innerObjectKind[8])))
        ;
        ((innerObject[9])._count):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_INNEROBJECTMAXCOUNT", "count", buildingInfo:getInstanceObjectCount(innerObjectKind[9])))
        ;
        ((innerObject[10])._count):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_INNEROBJECTMAXCOUNT", "count", buildingInfo:getInstanceObjectCount(innerObjectKind[10])))
        ;
        ((innerObject[11])._count):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_INNEROBJECTMAXCOUNT", "count", buildingInfo:getInstanceObjectCount(innerObjectKind[11])))
        ;
        ((innerObject[12])._count):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_INNEROBJECTMAXCOUNT", "count", buildingInfo:getInstanceObjectCount(innerObjectKind[12])))
      end
      local usedCount = 0
      for index = 0, innerObjectCount - 1 do
        usedCount = usedCount + innerObjectSize[index] * buildingInfo:getInstanceObjectCount(innerObjectKind[index])
      end
      ;
      (HouseInstallationControl.warCountInnerObjectMaxSize):SetShow(true)
      ;
      (HouseInstallationControl.warCountInnerObjectTitle):SetShow(true)
      ;
      (HouseInstallationControl.warCountInnerBigTitle_Limit):SetShow(true)
      ;
      (HouseInstallationControl.warCountInstallationCount):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_INNEROBJECTMAXCOUNT", "count", allCount))
      ;
      (HouseInstallationControl.warCountInnerObjectMaxSize):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_INNEROBJECTSIZE", "size", cOSW:getInnerObjectSize()) .. PAGetStringParam1(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_INNEROBJECTLEFTCOUNT", "count", cOSW:getInnerObjectSize() - (usedCount)))
      Panel_House_WarInformation:ComputePos()
    end
  end
  do
    Panel_House_WarInformation:SetShow(true)
    Panel_House_WarInformation:SetPosY((string.format)("%d", buildingInfo:GetPosY()) + 50)
    Panel_House_WarInformation:SetPosX((string.format)("%d", buildingInfo:GetPosX()) + 50)
    local buildInfo = buildingInfo:ToClient_getBuildingStaticStatus()
    if buildInfo ~= nil then
      local CSSW = buildInfo:getCharacterStaticStatusWrapper()
      if CSSW ~= nil then
        local OSSW = CSSW:getObjectStaticStatus()
        local allCount = buildInfo:getAllInstanceObjectCount()
        if isGameTypeTaiwan() then
          ((innerObject[0])._maxCount):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_INNEROBJECTMAXCOUNT", "count", OSSW:getHealingTownerMaxCount()))
          ;
          ((innerObject[1])._maxCount):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_INNEROBJECTMAXCOUNT", "count", OSSW:getObservatoryMaxCount()))
          ;
          ((innerObject[2])._maxCount):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_INNEROBJECTMAXCOUNT", "count", OSSW:getCatapultFactoryMaxCount()))
          ;
          ((innerObject[3])._maxCount):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_INNEROBJECTMAXCOUNT", "count", OSSW:getFlameFactoryMaxCount()))
          ;
          ((innerObject[4])._maxCount):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_INNEROBJECTMAXCOUNT", "count", OSSW:getDistributorMaxCount()))
          ;
          ((innerObject[5])._maxCount):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_INNEROBJECTMAXCOUNT", "count", OSSW:getBarricadeMaxCount()))
          ;
          ((innerObject[6])._maxCount):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_INNEROBJECTMAXCOUNT", "count", OSSW:getBarricadeGateMaxCount()))
          ;
          ((innerObject[7])._maxCount):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_INNEROBJECTMAXCOUNT", "count", OSSW:getDefenceTowerMaxCount()))
          ;
          ((innerObject[8])._maxCount):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_INNEROBJECTMAXCOUNT", "count", OSSW:getAdvancedBaseTowerMaxCount()))
          ;
          ((innerObject[0])._count):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_INNEROBJECTMAXCOUNT", "count", buildInfo:getInstanceObjectCount(innerObjectKind[0])))
          ;
          ((innerObject[1])._count):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_INNEROBJECTMAXCOUNT", "count", buildInfo:getInstanceObjectCount(innerObjectKind[1])))
          ;
          ((innerObject[2])._count):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_INNEROBJECTMAXCOUNT", "count", buildInfo:getInstanceObjectCount(innerObjectKind[3])))
          ;
          ((innerObject[3])._count):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_INNEROBJECTMAXCOUNT", "count", buildInfo:getInstanceObjectCount(innerObjectKind[4])))
          ;
          ((innerObject[4])._count):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_INNEROBJECTMAXCOUNT", "count", buildInfo:getInstanceObjectCount(innerObjectKind[5])))
          ;
          ((innerObject[5])._count):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_INNEROBJECTMAXCOUNT", "count", buildInfo:getInstanceObjectCount(innerObjectKind[6])))
          ;
          ((innerObject[6])._count):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_INNEROBJECTMAXCOUNT", "count", buildInfo:getInstanceObjectCount(innerObjectKind[7])))
          ;
          ((innerObject[7])._count):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_INNEROBJECTMAXCOUNT", "count", buildInfo:getInstanceObjectCount(innerObjectKind[9])))
          ;
          ((innerObject[8])._count):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_INNEROBJECTMAXCOUNT", "count", buildInfo:getInstanceObjectCount(innerObjectKind[12])))
        else
          ;
          ((innerObject[0])._maxCount):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_INNEROBJECTMAXCOUNT", "count", OSSW:getHealingTownerMaxCount()))
          ;
          ((innerObject[1])._maxCount):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_INNEROBJECTMAXCOUNT", "count", OSSW:getObservatoryMaxCount()))
          ;
          ((innerObject[2])._maxCount):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_INNEROBJECTMAXCOUNT", "count", OSSW:getElephantBarnMaxCount()))
          ;
          ((innerObject[3])._maxCount):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_INNEROBJECTMAXCOUNT", "count", OSSW:getCatapultFactoryMaxCount()))
          ;
          ((innerObject[4])._maxCount):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_INNEROBJECTMAXCOUNT", "count", OSSW:getFlameFactoryMaxCount()))
          ;
          ((innerObject[5])._maxCount):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_INNEROBJECTMAXCOUNT", "count", OSSW:getDistributorMaxCount()))
          ;
          ((innerObject[6])._maxCount):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_INNEROBJECTMAXCOUNT", "count", OSSW:getBarricadeMaxCount()))
          ;
          ((innerObject[7])._maxCount):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_INNEROBJECTMAXCOUNT", "count", OSSW:getBarricadeGateMaxCount()))
          ;
          ((innerObject[8])._maxCount):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_INNEROBJECTMAXCOUNT", "count", OSSW:getWoodenFenceMaxCount()))
          ;
          ((innerObject[9])._maxCount):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_INNEROBJECTMAXCOUNT", "count", OSSW:getDefenceTowerMaxCount()))
          ;
          ((innerObject[10])._maxCount):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_INNEROBJECTMAXCOUNT", "count", OSSW:getSiegeTowerMaxCount()))
          ;
          ((innerObject[11])._maxCount):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_INNEROBJECTMAXCOUNT", "count", OSSW:getLargeSiegeTowerMaxCount()))
          ;
          ((innerObject[12])._maxCount):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_INNEROBJECTMAXCOUNT", "count", OSSW:getAdvancedBaseTowerMaxCount()))
          ;
          ((innerObject[0])._count):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_INNEROBJECTMAXCOUNT", "count", buildInfo:getInstanceObjectCount(innerObjectKind[0])))
          ;
          ((innerObject[1])._count):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_INNEROBJECTMAXCOUNT", "count", buildInfo:getInstanceObjectCount(innerObjectKind[1])))
          ;
          ((innerObject[2])._count):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_INNEROBJECTMAXCOUNT", "count", buildInfo:getInstanceObjectCount(innerObjectKind[2])))
          ;
          ((innerObject[3])._count):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_INNEROBJECTMAXCOUNT", "count", buildInfo:getInstanceObjectCount(innerObjectKind[3])))
          ;
          ((innerObject[4])._count):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_INNEROBJECTMAXCOUNT", "count", buildInfo:getInstanceObjectCount(innerObjectKind[4])))
          ;
          ((innerObject[5])._count):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_INNEROBJECTMAXCOUNT", "count", buildInfo:getInstanceObjectCount(innerObjectKind[5])))
          ;
          ((innerObject[6])._count):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_INNEROBJECTMAXCOUNT", "count", buildInfo:getInstanceObjectCount(innerObjectKind[6])))
          ;
          ((innerObject[7])._count):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_INNEROBJECTMAXCOUNT", "count", buildInfo:getInstanceObjectCount(innerObjectKind[7])))
          ;
          ((innerObject[8])._count):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_INNEROBJECTMAXCOUNT", "count", buildInfo:getInstanceObjectCount(innerObjectKind[8])))
          ;
          ((innerObject[9])._count):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_INNEROBJECTMAXCOUNT", "count", buildInfo:getInstanceObjectCount(innerObjectKind[9])))
          ;
          ((innerObject[10])._count):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_INNEROBJECTMAXCOUNT", "count", buildInfo:getInstanceObjectCount(innerObjectKind[10])))
          ;
          ((innerObject[11])._count):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_INNEROBJECTMAXCOUNT", "count", buildInfo:getInstanceObjectCount(innerObjectKind[11])))
          ;
          ((innerObject[12])._count):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_INNEROBJECTMAXCOUNT", "count", buildInfo:getInstanceObjectCount(innerObjectKind[12])))
        end
        local usedCount = 0
        for index = 0, innerObjectCount - 1 do
          usedCount = usedCount + innerObjectSize[index] * buildInfo:getInstanceObjectCount(innerObjectKind[index])
        end
        ;
        (HouseInstallationControl.warCountInstallationCount):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_INNEROBJECTMAXCOUNT", "count", allCount))
        ;
        (HouseInstallationControl.warCountInnerObjectMaxSize):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_INNEROBJECTSIZE", "size", OSSW:getInnerObjectSize()) .. PAGetStringParam1(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_INNEROBJECTLEFTCOUNT", "count", OSSW:getInnerObjectSize() - (usedCount)))
      end
    end
  end
end

FGlobal_HouseInstallation_MinorWar_Close = function()
  -- function num : 0_14
  Panel_House_WarInformation:SetShow(false)
end

FGlobal_HouseInstallationControl_Close = function()
  -- function num : 0_15 , upvalues : HouseInstallationControl_Is_Open
  housing_CancelInstallObject()
  Panel_House_InstallationMode_ObjectControl:SetShow(false)
  HouseInstallationControl_Is_Open = false
  VillageTent_Close()
end

FGlobal_HouseInstallationControl_Move = function()
  -- function num : 0_16 , upvalues : HouseInstallationControl
  housing_moveObject()
  HouseInstallationControl:Close()
end

FGlobal_HouseInstallationControl_CloseOuter = function()
  -- function num : 0_17 , upvalues : HouseInstallationControl
  HouseInstallationControl:Close()
end

FGlobal_HouseInstallationControl_Confirm = function()
  -- function num : 0_18
  Panel_House_ObjectControl_Confirm()
end

FGlobal_HouseInstallationControl_IsConfirmStep = function()
  -- function num : 0_19 , upvalues : isConfirmStep
  return isConfirmStep
end

HouseInstallationControl.registEventHandler = function(self)
  -- function num : 0_20
  (self.btn_Confirm):addInputEvent("Mouse_LUp", "HandleClicked_HouseInstallationControl_Confirm()")
  ;
  (self.btn_Rotate_Right):addInputEvent("Mouse_LUp", "HandleClicked_HouseInstallationControl_Rotate( true )")
  ;
  (self.btn_Rotate_Left):addInputEvent("Mouse_LUp", "HandleClicked_HouseInstallationControl_Rotate( false )")
  ;
  (self.btn_Delete):addInputEvent("Mouse_LUp", "HandleClicked_HouseInstallationControl_Delete()")
  ;
  (self.btn_Move):addInputEvent("Mouse_LUp", "HandleClicked_HouseInstallationControl_Move()")
  ;
  (self.btn_Cancel):addInputEvent("Mouse_LUp", "HandleClicked_HouseInstallationControl_Cancel()")
  ;
  (self.btn_Confirm):ActiveMouseEventEffect(true)
  ;
  (self.btn_Rotate_Right):ActiveMouseEventEffect(true)
  ;
  (self.btn_Rotate_Left):ActiveMouseEventEffect(true)
  ;
  (self.btn_Delete):ActiveMouseEventEffect(true)
  ;
  (self.btn_Move):ActiveMouseEventEffect(true)
  ;
  (self.btn_Cancel):ActiveMouseEventEffect(true)
  ;
  (self.btn_Confirm):addInputEvent("Mouse_On", "Panel_House_ObjectControlDescFunc( true, " .. 1 .. ")")
  ;
  (self.btn_Rotate_Right):addInputEvent("Mouse_On", "Panel_House_ObjectControlDescFunc( true, " .. 2 .. ")")
  ;
  (self.btn_Rotate_Left):addInputEvent("Mouse_On", "Panel_House_ObjectControlDescFunc( true, " .. 3 .. ")")
  ;
  (self.btn_Delete):addInputEvent("Mouse_On", "Panel_House_ObjectControlDescFunc( true, " .. 4 .. ")")
  ;
  (self.btn_Move):addInputEvent("Mouse_On", "Panel_House_ObjectControlDescFunc( true, " .. 5 .. ")")
  ;
  (self.btn_Cancel):addInputEvent("Mouse_On", "Panel_House_ObjectControlDescFunc( true, " .. 6 .. ")")
  ;
  (self.btn_Resize):addInputEvent("Mouse_On", "Panel_House_ObjectControlDescFunc( true, " .. 7 .. ")")
  ;
  (self.btn_Confirm):addInputEvent("Mouse_Out", "Panel_House_ObjectControlDescFunc( false," .. 1 .. ")")
  ;
  (self.btn_Rotate_Right):addInputEvent("Mouse_Out", "Panel_House_ObjectControlDescFunc( false," .. 2 .. ")")
  ;
  (self.btn_Rotate_Left):addInputEvent("Mouse_Out", "Panel_House_ObjectControlDescFunc( false," .. 3 .. ")")
  ;
  (self.btn_Delete):addInputEvent("Mouse_Out", "Panel_House_ObjectControlDescFunc( false," .. 4 .. ")")
  ;
  (self.btn_Move):addInputEvent("Mouse_Out", "Panel_House_ObjectControlDescFunc( false," .. 5 .. ")")
  ;
  (self.btn_Cancel):addInputEvent("Mouse_Out", "Panel_House_ObjectControlDescFunc( false," .. 6 .. ")")
  ;
  (self.btn_Resize):addInputEvent("Mouse_Out", "Panel_House_ObjectControlDescFunc( false," .. 7 .. ")")
end

HouseInstallationControl.registMessageHandler = function(self)
  -- function num : 0_21
end

HouseInstallationControl:Initialize()
HouseInstallationControl:registEventHandler()
HouseInstallationControl:registMessageHandler()

