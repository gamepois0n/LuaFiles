-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\houseinfo\panel_myhousenavi.luac 

-- params : ...
-- function num : 0
local UI_TM = CppEnums.TextMode
local isharvestManagement = true
Panel_MyHouseNavi:RegisterShowEventFunc(true, "MyHouseNaviShowAni()")
Panel_MyHouseNavi:RegisterShowEventFunc(false, "MyHouseNaviHideAni()")
Panel_MyHouseNavi:SetDragEnable(false)
Panel_MyHouseNavi:SetPosY(Panel_SelfPlayerExpGage:GetPosY() + Panel_SelfPlayerExpGage:GetSizeY() + 15)
MyHouseNaviShowAni = function()
  -- function num : 0_0
  (UIAni.fadeInSCR_Down)(Panel_MyHouseNavi)
end

MyHouseNaviHideAni = function()
  -- function num : 0_1
  Panel_MyHouseNavi:SetShowWithFade((CppEnums.PAUI_SHOW_FADE_TYPE).PAUI_ANI_TYPE_FADE_OUT)
  local aniInfo1 = Panel_MyHouseNavi:addColorAnimation(0, 0.22, UI_ANI_ADV.PAUI_ANIM_ADVANCE_SIN_HALF_PI)
  aniInfo1:SetStartColor(UI_color.C_FFFFFFFF)
  aniInfo1:SetEndColor(UI_color.C_00FFFFFF)
  aniInfo1:SetStartIntensity(3)
  aniInfo1:SetEndIntensity(1)
  aniInfo1.IsChangeChild = true
  aniInfo1:SetHideAtEnd(true)
  aniInfo1:SetDisableWhileAni(true)
end

local isCheckTentPosition = false
local isCheckHousePosition = false
local _houseIcon = (UI.getChildControl)(Panel_MyHouseNavi, "Static_Icon_House")
local _houseBorder = (UI.getChildControl)(Panel_MyHouseNavi, "Static_SlotBackground")
local _tentIcon = (UI.getChildControl)(Panel_MyHouseNavi, "Static_Icon_Tent")
local _tentBorder = (UI.getChildControl)(Panel_MyHouseNavi, "Static_SlotBackground_Tent")
local _territoryIcon = (UI.getChildControl)(Panel_MyHouseNavi, "Static_Icon_TerritoryAuth")
local _territoryBorder = (UI.getChildControl)(Panel_MyHouseNavi, "Static_SlotBackground_TerritoryAuth")
local _workerIcon = (UI.getChildControl)(Panel_MyHouseNavi, "Static_Icon_Worker")
local _helpTooltip = (UI.getChildControl)(Panel_MyHouseNavi, "StaticText_Helper")
Panel_MyHouseNavi:SetShow(false)
_houseIcon:SetShow(false)
_tentIcon:SetShow(false)
_territoryIcon:SetShow(false)
_houseIcon:SetIgnore(true)
_tentIcon:SetIgnore(true)
_territoryIcon:SetIgnore(true)
_houseBorder:SetShow(false)
_tentBorder:SetShow(false)
_territoryBorder:SetShow(false)
_helpTooltip:SetShow(false)
_workerIcon:SetShow(false)
local posY, posX = nil, nil
local Panel_MyHouseNavi_Init = function()
  -- function num : 0_2 , upvalues : posY, posX
  posY = Panel_SelfPlayerExpGage:GetPosY() + Panel_SelfPlayerExpGage:GetSizeY() + 15
  posX = 0
  if Panel_Window_Servant:GetShow() then
    posX = Panel_Window_Servant:GetPosX() + Panel_Window_Servant:GetSizeX()
  else
    posX = 10
  end
  local servantIconCount = FGlobal_ServantIconCount()
  if CppDefine.ChangeUIAndResolution == true then
    if Panel_MyHouseNavi:GetRelativePosX() == -1 and Panel_MyHouseNavi:GetRelativePosY() == -1 then
      local isChangePosition = changePositionBySever(Panel_MyHouseNavi, (CppEnums.PAGameUIType).PAGameUIPanel_MyHouseNavi, false, true, false)
      if not isChangePosition then
        if Panel_Window_Servant:GetShow() then
          Panel_MyHouseNavi:SetPosX(posX)
          Panel_MyHouseNavi:SetPosY(Panel_Window_Servant:GetPosY())
        else
          Panel_MyHouseNavi:SetPosX(10)
          Panel_MyHouseNavi:SetPosY(posY)
        end
      else
        if Panel_Window_Servant:GetShow() then
          local x1 = Panel_Window_Servant:GetPosX()
          local y1 = Panel_Window_Servant:GetPosY()
          local x2 = Panel_Window_Servant:GetPosX() + Panel_Window_Servant:GetSizeX()
          local y2 = Panel_Window_Servant:GetPosY() + Panel_Window_Servant:GetSizeY()
          for index = 0, Panel_MyHouseNavi:GetSizeX(), 10 do
            -- DECOMPILER ERROR at PC179: Unhandled construct in 'MakeBoolean' P3

            if (y1 <= Panel_MyHouseNavi:GetPosY() and Panel_MyHouseNavi:GetPosY() <= y2) or y1 > Panel_MyHouseNavi:GetPosY() + Panel_MyHouseNavi:GetSizeY() / 2 or y1 <= Panel_MyHouseNavi:GetPosY() + Panel_MyHouseNavi:GetSizeY() and Panel_MyHouseNavi:GetPosY() + Panel_MyHouseNavi:GetSizeY() <= y2 then
              Panel_MyHouseNavi:SetPosX(Panel_Window_Servant:GetPosX() + Panel_Window_Servant:GetSizeX())
              Panel_MyHouseNavi:SetPosY(Panel_Window_Servant:GetPosY())
            end
          end
        else
          do
            do
              local lPanel = Panel_MyHouseNavi
              if not isChangePosition then
                lPanel:SetRelativePosX(0)
                lPanel:SetRelativePosY(0)
              else
                lPanel:SetRelativePosX((lPanel:GetPosX() + lPanel:GetSizeX() / 2) / getScreenSizeX())
                lPanel:SetRelativePosY((lPanel:GetPosY() + lPanel:GetSizeY() / 2) / getScreenSizeY())
              end
              if Panel_MyHouseNavi:GetRelativePosX() == 0 and Panel_MyHouseNavi:GetRelativePosY() == 0 then
                if Panel_Window_Servant:GetShow() then
                  Panel_MyHouseNavi:SetPosX(posX)
                  Panel_MyHouseNavi:SetPosY(Panel_Window_Servant:GetPosY())
                else
                  Panel_MyHouseNavi:SetPosX(10)
                  Panel_MyHouseNavi:SetPosY(posY)
                end
              else
                if Panel_Window_Servant:GetShow() then
                  local x1 = Panel_Window_Servant:GetPosX()
                  local y1 = Panel_Window_Servant:GetPosY()
                  local x2 = Panel_Window_Servant:GetPosX() + Panel_Window_Servant:GetSizeX()
                  local y2 = Panel_Window_Servant:GetPosY() + Panel_Window_Servant:GetSizeY()
                  Panel_MyHouseNavi:SetPosX(getScreenSizeX() * Panel_MyHouseNavi:GetRelativePosX() - Panel_MyHouseNavi:GetSizeX() / 2)
                  Panel_MyHouseNavi:SetPosY(getScreenSizeY() * Panel_MyHouseNavi:GetRelativePosY() - Panel_MyHouseNavi:GetSizeY() / 2)
                  for index = 0, Panel_MyHouseNavi:GetSizeX(), 10 do
                    -- DECOMPILER ERROR at PC384: Unhandled construct in 'MakeBoolean' P3

                    if (y1 <= Panel_MyHouseNavi:GetPosY() and Panel_MyHouseNavi:GetPosY() <= y2) or y1 > Panel_MyHouseNavi:GetPosY() + Panel_MyHouseNavi:GetSizeY() / 2 or y1 <= Panel_MyHouseNavi:GetPosY() + Panel_MyHouseNavi:GetSizeY() and Panel_MyHouseNavi:GetPosY() + Panel_MyHouseNavi:GetSizeY() <= y2 then
                      Panel_MyHouseNavi:SetPosX(Panel_Window_Servant:GetPosX() + Panel_Window_Servant:GetSizeX())
                      Panel_MyHouseNavi:SetPosY(Panel_Window_Servant:GetPosY())
                    end
                  end
                else
                  do
                    Panel_MyHouseNavi:SetPosX(getScreenSizeX() * Panel_MyHouseNavi:GetRelativePosX() - Panel_MyHouseNavi:GetSizeX() / 2)
                    Panel_MyHouseNavi:SetPosY(getScreenSizeY() * Panel_MyHouseNavi:GetRelativePosY() - Panel_MyHouseNavi:GetSizeY() / 2)
                    if not changePositionBySever(Panel_MyHouseNavi, (CppEnums.PAGameUIType).PAGameUIPanel_MyHouseNavi, false, true, false) then
                      if Panel_Window_Servant:GetShow() then
                        Panel_MyHouseNavi:SetPosX(posX)
                        Panel_MyHouseNavi:SetPosY(Panel_Window_Servant:GetPosY())
                      else
                        Panel_MyHouseNavi:SetPosX(10)
                        Panel_MyHouseNavi:SetPosY(posY)
                      end
                    else
                      if Panel_Window_Servant:GetShow() then
                        local x1 = Panel_Window_Servant:GetPosX()
                        local y1 = Panel_Window_Servant:GetPosY()
                        local x2 = Panel_Window_Servant:GetPosX() + Panel_Window_Servant:GetSizeX()
                        local y2 = Panel_Window_Servant:GetPosY() + Panel_Window_Servant:GetSizeY()
                        for index = 0, Panel_MyHouseNavi:GetSizeX(), 10 do
                          -- DECOMPILER ERROR at PC558: Unhandled construct in 'MakeBoolean' P3

                          if (y1 <= Panel_MyHouseNavi:GetPosY() and Panel_MyHouseNavi:GetPosY() <= y2) or y1 > Panel_MyHouseNavi:GetPosY() + Panel_MyHouseNavi:GetSizeY() / 2 or y1 <= Panel_MyHouseNavi:GetPosY() + Panel_MyHouseNavi:GetSizeY() and Panel_MyHouseNavi:GetPosY() + Panel_MyHouseNavi:GetSizeY() <= y2 then
                            Panel_MyHouseNavi:SetPosX(Panel_Window_Servant:GetPosX() + Panel_Window_Servant:GetSizeX())
                            Panel_MyHouseNavi:SetPosY(Panel_Window_Servant:GetPosY())
                          end
                        end
                      end
                    end
                    do
                      FGlobal_PanelRepostionbyScreenOut(Panel_MyHouseNavi)
                      FGlobal_PetListNew_NoPet()
                      checkAndSetPosInScreen(Panel_MyHouseNavi)
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end
end

HouseNaviBasicInitPosition = function()
  -- function num : 0_3 , upvalues : posX
  if Panel_Window_Servant:GetShow() then
    posX = Panel_Window_Servant:GetPosX() + Panel_Window_Servant:GetSizeX()
  else
    posX = 10
  end
  Panel_MyHouseNavi:SetPosX(posX)
  Panel_MyHouseNavi:SetPosY(Panel_Window_Servant:GetPosY())
  checkAndSetPosInScreen(Panel_MyHouseNavi)
end

local houseIconCount = 0
local gapX = _houseIcon:GetSizeX()
local firstLoadingCheck = true
Panel_MyHouseNavi_Update = function(init, listCount)
  -- function num : 0_4 , upvalues : _houseIcon, _houseBorder, _tentIcon, _tentBorder, gapX, isharvestManagement, _workerIcon, _territoryIcon, _territoryBorder, Panel_MyHouseNavi_Init, houseIconCount, firstLoadingCheck
  if (init == nil and isFlushedUI()) or isFlushedUI() then
    return 
  end
  if PaGlobal_TutorialManager:isDoingTutorial() == true then
    return 
  end
  local iconNums = 0
  local isHaveDwelling = ToClient_IsHaveDwelling()
  local panelSizeX = 0
  if isHaveDwelling == true then
    _houseIcon:SetShow(true)
    _houseIcon:SetIgnore(false)
    _houseIcon:ActiveMouseEventEffect(true)
    _houseBorder:SetShow(false)
    _houseBorder:SetIgnore(true)
    _houseIcon:addInputEvent("Mouse_LUp", "FGlobal_HousingList_Open()")
    _houseIcon:addInputEvent("Mouse_On", "HandleMouseOnTooltip( \"selfHouse\", true )")
    _houseIcon:addInputEvent("Mouse_Out", "HandleMouseOnTooltip( \"selfHouse\", false )")
    iconNums = iconNums + 1
  else
    _houseIcon:SetShow(false)
    _houseIcon:SetIgnore(true)
    _houseIcon:ActiveMouseEventEffect(false)
    _houseBorder:SetShow(false)
    _houseBorder:SetIgnore(true)
  end
  local temporaryWrapper = getTemporaryInformationWrapper()
  local tentCheck = (temporaryWrapper ~= nil and temporaryWrapper:isSelfTent())
  if tentCheck then
    _tentIcon:SetShow(true)
    _tentIcon:SetIgnore(false)
    _tentIcon:ActiveMouseEventEffect(true)
    _tentBorder:SetShow(false)
    _tentBorder:SetIgnore(true)
    _tentIcon:SetPosX((iconNums) * gapX - 3)
    if isharvestManagement then
      _tentIcon:addInputEvent("Mouse_LUp", "HandleClicked_TentList_ShowToggle()")
    else
      _tentIcon:addInputEvent("Mouse_LUp", "")
    end
    _tentIcon:addInputEvent("Mouse_RUp", "Panel_MyHouseNavi_FindWay( \"tent\" )")
    _tentIcon:addInputEvent("Mouse_On", "HandleMouseOnTooltip( \"tent\", true )")
    _tentIcon:addInputEvent("Mouse_Out", "HandleMouseOnTooltip( \"tent\", false )")
    iconNums = iconNums + 1
  else
    _tentIcon:SetShow(false)
    _tentIcon:SetIgnore(true)
    _tentIcon:ActiveMouseEventEffect(false)
    _tentBorder:SetShow(false)
    _tentBorder:SetIgnore(true)
  end
  do
    local isNpcWorkerCount = 0
    if listCount ~= nil then
      isNpcWorkerCount = listCount
    else
      isNpcWorkerCount = ToClient_getMyNpcWorkerCount()
    end
    if isNpcWorkerCount > 0 then
      _workerIcon:SetShow(true)
      _workerIcon:ActiveMouseEventEffect(true)
      _workerIcon:SetPosX((iconNums) * gapX - 3)
      _workerIcon:addInputEvent("Mouse_LUp", "WorkerManager_ShowToggle()")
      _workerIcon:addInputEvent("Mouse_On", "HandleMouseOnTooltip( \"worker\", true )")
      _workerIcon:addInputEvent("Mouse_Out", "HandleMouseOnTooltip( \"worker\", false )")
      iconNums = iconNums + 1
    else
      _workerIcon:SetShow(false)
    end
    if isHaveTerritoryTradeAuthority(0) or isHaveTerritoryTradeAuthority(1) or isHaveTerritoryTradeAuthority(2) or isHaveTerritoryTradeAuthority(3) then
      _territoryIcon:SetShow(true)
      _territoryIcon:SetIgnore(false)
      _territoryIcon:ActiveMouseEventEffect(true)
      _territoryBorder:SetShow(false)
      _territoryBorder:SetIgnore(true)
      _territoryIcon:SetPosX((iconNums) * gapX - 3)
      _territoryIcon:addInputEvent("Mouse_On", "HandleMouseOnTooltip( \"territoryAuth\", true )")
      _territoryIcon:addInputEvent("Mouse_Out", "HandleMouseOnTooltip( \"territoryAuth\", false )")
      iconNums = iconNums + 1
    else
      _territoryIcon:SetShow(false)
      _territoryIcon:SetIgnore(true)
      _territoryIcon:ActiveMouseEventEffect(false)
      _territoryBorder:SetShow(false)
      _territoryBorder:SetIgnore(true)
    end
    panelSizeX = (iconNums) * gapX
    if panelSizeX == 0 then
      panelSizeX = 60
    end
    if iconNums > 0 then
      Panel_MyHouseNavi:SetShow(true)
      Panel_MyHouseNavi_Init()
    else
      Panel_MyHouseNavi:SetShow(false)
    end
    Panel_MyHouseNavi:SetSize(panelSizeX, Panel_MyHouseNavi:GetSizeY())
    houseIconCount = iconNums
    if firstLoadingCheck then
      firstLoadingCheck = false
      return 
    end
    FGlobal_PetListNew_NoPet()
    -- DECOMPILER ERROR: 17 unprocessed JMP targets
  end
end

return_ServantIconNums = function(icons)
  -- function num : 0_5 , upvalues : posY
  if Panel_MyHouseNavi:GetPosX() <= 60 * icons then
    Panel_MyHouseNavi:SetPosX(60 * icons)
    Panel_MyHouseNavi:SetPosY(posY)
  else
    changePositionBySever(Panel_MyHouseNavi, (CppEnums.PAGameUIType).PAGameUIPanel_MyHouseNavi, true, true, false)
  end
end

FGlobal_HouseIconCount = function()
  -- function num : 0_6 , upvalues : houseIconCount
  return houseIconCount
end

WorkerManager_ShowToggle = function()
  -- function num : 0_7
  FGlobal_WorkerManger_ShowToggle()
end

HandleMouseOnTooltip = function(naviType, isShow)
  -- function num : 0_8 , upvalues : _houseIcon, isharvestManagement, _tentIcon, _workerIcon, _territoryIcon
  local name, desc, uiControl = nil
  if naviType == "selfHouse" then
    name = PAGetString(Defines.StringSheet_GAME, "LUA_MYHOUSENAVI_TOOLTIP_SELFHOUSE_NAME")
    desc = PAGetString(Defines.StringSheet_GAME, "LUA_MYHOUSENAVI_TOOLTIP_SELFHOUSE_DESC")
    uiControl = _houseIcon
  else
    if naviType == "tent" then
      name = PAGetString(Defines.StringSheet_GAME, "LUA_MYHOUSENAVI_TOOLTIP_TENT_NAME")
      if isharvestManagement then
        desc = PAGetString(Defines.StringSheet_GAME, "LUA_MYHOUSENAVI_TOOLTIP_TENT_DESC")
      else
        desc = PAGetString(Defines.StringSheet_GAME, "LUA_MYHOUSENAVI_TOOLTIP_TENT_DESC_2")
      end
      uiControl = _tentIcon
    else
      if naviType == "worker" then
        name = PAGetString(Defines.StringSheet_GAME, "LUA_MYHOUSENAVI_WORKER_TOOLTIP_NAME")
        desc = PAGetString(Defines.StringSheet_GAME, "LUA_MYHOUSENAVI_WORKER_TOOLTIP_DESC")
        uiControl = _workerIcon
      else
        if naviType == "territoryAuth" then
          local territoryName = {[0] = tostring(PAGetString(Defines.StringSheet_GAME, "LUA_TERRITORYAUTHORITY_KEY_0")), [1] = tostring(PAGetString(Defines.StringSheet_GAME, "LUA_TERRITORYAUTHORITY_KEY_1")), [2] = tostring(PAGetString(Defines.StringSheet_GAME, "LUA_TERRITORYAUTHORITY_KEY_2")), [3] = tostring(PAGetString(Defines.StringSheet_GAME, "LUA_TERRITORYAUTHORITY_KEY_3"))}
          name = PAGetString(Defines.StringSheet_GAME, "LUA_MYHOUSENAVI_TOOLTIP_TERRITORYAUTH_NAME")
          desc = ""
          uiControl = _territoryIcon
          for territoryIndex = 0, 3 do
            if isHaveTerritoryTradeAuthority(territoryIndex) == true then
              if desc == "" then
                desc = territoryName[territoryIndex]
              else
                desc = desc .. " / " .. territoryName[territoryIndex]
              end
            end
          end
          if desc ~= "" then
            desc = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_MYHOUSENAVI_TOOLTIP_TERRITORYAUTH_DESC", "desc", desc)
          end
        end
      end
    end
  end
  do
    if isShow == true then
      TooltipSimple_Show(uiControl, name, desc)
      if getEnableSimpleUI() then
        House_UpdateSimpleUI(true)
      end
    else
      TooltipSimple_Hide()
      if getEnableSimpleUI() then
        House_UpdateSimpleUI(false)
      end
    end
  end
end

local _houseSimpleUIAlpha = 0.7
House_UpdateSimpleUI = function(isOver)
  -- function num : 0_9 , upvalues : _houseSimpleUIAlpha
  _houseSimpleUIAlpha = 0.7
  if isOver then
    _houseSimpleUIAlpha = 1
  end
end

Panel_MyHouseNavi_FindWay = function(naviType)
  -- function num : 0_10 , upvalues : isCheckTentPosition, isCheckHousePosition
  if naviType == "tent" and isCheckTentPosition == false then
    ToClient_DeleteNaviGuideByGroup(0)
    local navigationGuideParam = NavigationGuideParam()
    navigationGuideParam._isAutoErase = true
    local temporaryWrapper = getTemporaryInformationWrapper()
    if temporaryWrapper ~= nil then
      local myTentCount = temporaryWrapper:getSelfTentCount()
      for textIdx = 0, myTentCount - 1 do
        local tentWrapper = temporaryWrapper:getSelfTentWrapperByIndex(textIdx)
        local tentPosX = tentWrapper:getSelfTentPositionX()
        local tentPosY = tentWrapper:getSelfTentPositionY()
        local tentPosZ = tentWrapper:getSelfTentPositionZ()
        local tentPos = float3(tentPosX, tentPosY, tentPosZ)
        worldmapNavigatorStart(tentPos, navigationGuideParam, false, false, true)
      end
      audioPostEvent_SystemUi(0, 14)
      isCheckTentPosition = true
    end
  else
    do
      if isCheckTentPosition == true or isCheckHousePosition == true then
        ToClient_DeleteNaviGuideByGroup(0)
        audioPostEvent_SystemUi(0, 15)
        isCheckTentPosition = false
        isCheckHousePosition = false
      else
        if naviType == "selfHouse" and isCheckHousePosition == false then
          ToClient_DeleteNaviGuideByGroup(0)
          audioPostEvent_SystemUi(0, 14)
          local characterStaticStatusWrapper = ToClient_getMyDwelling(0)
          if characterStaticStatusWrapper == nil then
            _PA_ASSERT(false, "주거�\128 정보�\128 없습니다.")
            return 
          end
          local houseX = (characterStaticStatusWrapper:getObjectStaticStatus()):getHousePosX()
          local houseY = (characterStaticStatusWrapper:getObjectStaticStatus()):getHousePosY()
          local houseZ = (characterStaticStatusWrapper:getObjectStaticStatus()):getHousePosZ()
          local housePos = float3(houseX, houseY, houseZ)
          worldmapNavigatorStart(housePos, NavigationGuideParam(), false, false, true)
          isCheckHousePosition = true
        end
      end
    end
  end
end

HandleClicked_TentList_ShowToggle = function()
  -- function num : 0_11
  if Panel_HarvestList:GetShow() then
    HarvestList_Close()
    return 
  end
  FGlobal_HarvestList_Open()
end

Panel_MyHouseNavi_ShowToggle = function()
  -- function num : 0_12 , upvalues : _territoryIcon
  if not ToClient_IsHaveDwelling() and _territoryIcon:GetShow() == false then
    return 
  end
  if Panel_MyHouseNavi:GetShow() then
    Panel_MyHouseNavi:SetShow(false, false)
    Panel_WidgetControl_Toggle("Panel_MyHouseNavi", false)
  else
    Panel_MyHouseNavi:SetShow(true, true)
    Panel_WidgetControl_Toggle("Panel_MyHouseNavi", true)
  end
end

PanelMyHouseNavi_RefreshPosition = function()
  -- function num : 0_13
  ResetPos_WidgetButton()
end

Panel_MyHouseNavi_PositionReset = function()
  -- function num : 0_14 , upvalues : Panel_MyHouseNavi_Init
  Panel_MyHouseNavi_Init()
end

-- DECOMPILER ERROR at PC171: Confused about usage of register: R19 in 'UnsetPending'

Panel_MyHouseNavi.registEventHandler = function(self)
  -- function num : 0_15
  Panel_MyHouseNavi:addInputEvent("Mouse_PressMove", "PanelMyHouseNavi_RefreshPosition()")
  Panel_MyHouseNavi:addInputEvent("Mouse_LUp", "ResetPos_WidgetButton()")
end

FGlobal_MyHouseNavi_Update = function()
  -- function num : 0_16
  Panel_MyHouseNavi_Update(true)
end

FromClient_ChangeWorkerCount = function(isInitialize, listCount)
  -- function num : 0_17
  Panel_MyHouseNavi_Update(isInitialize, listCount)
end

registerEvent("FromClient_ReceiveSetMyHouse", "FGlobal_MyHouseNavi_Update")
registerEvent("FromClient_ReceiveReturnHouse", "FGlobal_MyHouseNavi_Update")
registerEvent("FromClient_SetSelfTent", "FGlobal_MyHouseNavi_Update")
registerEvent("FromClient_ResponseAuctionInfo", "FGlobal_MyHouseNavi_Update")
registerEvent("WorldMap_WorkerDataUpdate", "FGlobal_MyHouseNavi_Update")
registerEvent("onScreenResize", "Panel_MyHouseNavi_PositionReset")
registerEvent("FromClient_ChangeWorkerCount", "FromClient_ChangeWorkerCount")
registerEvent("FromClient_luaLoadComplete", "FromClient_luaLoadComplete_MyHouseNavi")
FromClient_luaLoadComplete_MyHouseNavi = function()
  -- function num : 0_18
  Panel_MyHouseNavi:registEventHandler()
  FGlobal_PanelMove(Panel_MyHouseNavi, true)
  changePositionBySever(Panel_MyHouseNavi, (CppEnums.PAGameUIType).PAGameUIPanel_MyHouseNavi, true, true, false)
end

renderModeChange_MyHouseNavi_Update = function(prevRenderModeList, nextRenderModeList)
  -- function num : 0_19
  local currentRenderMode = {(Defines.RenderMode).eRenderMode_Default}
  if CheckRenderMode(prevRenderModeList, currentRenderMode) or CheckRenderModebyGameMode(nextRenderModeList) then
    Panel_MyHouseNavi_Update()
  end
  Panel_MyHouseNavi_PositionReset()
end

registerEvent("FromClient_RenderModeChangeState", "renderModeChange_MyHouseNavi_Update")

