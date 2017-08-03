-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\widget\maid\panel_icon_maid.luac 

-- params : ...
-- function num : 0
Panel_Icon_Maid:SetShow(false)
Panel_Icon_Maid:ActiveMouseEventEffect(true)
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
local UI_color = Defines.Color
local UI_PUCT = CppEnums.PA_UI_CONTROL_TYPE
local IM = CppEnums.EProcessorInputMode
local MaidControl = {buttonMaid = (UI.getChildControl)(Panel_Icon_Maid, "Button_MaidIcon")}
;
(MaidControl.buttonMaid):addInputEvent("Mouse_LUp", "MaidList_Open()")
;
(MaidControl.buttonMaid):addInputEvent("Mouse_On", "MaidFunc_ShowTooltip( true )")
;
(MaidControl.buttonMaid):addInputEvent("Mouse_Out", "MaidFunc_ShowTooltip()")
;
(MaidControl.buttonMaid):ActiveMouseEventEffect(true)
Panel_Window_MaidList:SetShow(false)
Panel_Window_MaidList:setGlassBackground(true)
Panel_Window_MaidList:ActiveMouseEventEffect(true)
local maidList = {contentBg = (UI.getChildControl)(Panel_Window_MaidList, "Static_MaidListContentBG"), name = (UI.getChildControl)(Panel_Window_MaidList, "StaticText_Name"), town = (UI.getChildControl)(Panel_Window_MaidList, "StaticText_Town"), func = (UI.getChildControl)(Panel_Window_MaidList, "StaticText_Func"), coolTime = (UI.getChildControl)(Panel_Window_MaidList, "StaticText_Cooltime"), btnWarehouse = (UI.getChildControl)(Panel_Window_MaidList, "Button_SummonMaid_Warehouse"), btnMarket = (UI.getChildControl)(Panel_Window_MaidList, "Button_SummonMaid_Market"), albeCount = (UI.getChildControl)(Panel_Window_MaidList, "StaticText_LeftMaidCount"), albeCountValue = (UI.getChildControl)(Panel_Window_MaidList, "StaticText_LeftMaidCountValue"), scroll = (UI.getChildControl)(Panel_Window_MaidList, "Scroll_MaidList"), btnClose = (UI.getChildControl)(Panel_Window_MaidList, "Button_Close"), 
config = {gapY = 25, normalSizeY = 155}
, 
maidInfo = {}
, maxShowCount = 5, startIndex = 0, scrollInterval = 0}
maidList.scrollCtrlBtn = (UI.getChildControl)(maidList.scroll, "Scroll_CtrlButton")
;
(maidList.scrollCtrlBtn):addInputEvent("Mouse_LPress", "HandleClicked_MaidList_ScrollBtn()")
;
(maidList.btnClose):addInputEvent("Mouse_LUp", "MaidList_Close()")
;
(maidList.contentBg):addInputEvent("Mouse_DownScroll", "MaidList_ScrollEvent( true )")
;
(maidList.contentBg):addInputEvent("Mouse_UpScroll", "MaidList_ScrollEvent( false )")
maidList.Init = function(self)
  -- function num : 0_0
  for maidIndex = 0, self.maxShowCount - 1 do
    local temp = {}
    temp.name = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATICTEXT, Panel_Window_MaidList, "StaticText_MaidName_" .. maidIndex)
    CopyBaseProperty(self.name, temp.name)
    ;
    (temp.name):SetPosY((self.name):GetPosY() + maidIndex * (self.config).gapY)
    ;
    (temp.name):SetShow(false)
    temp.town = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATICTEXT, Panel_Window_MaidList, "StaticText_MaidTown_" .. maidIndex)
    CopyBaseProperty(self.town, temp.town)
    ;
    (temp.town):SetPosY((self.town):GetPosY() + maidIndex * (self.config).gapY)
    ;
    (temp.town):SetShow(false)
    temp.func = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATICTEXT, Panel_Window_MaidList, "StaticText_MaidFunc_" .. maidIndex)
    CopyBaseProperty(self.func, temp.func)
    ;
    (temp.func):SetPosY((self.func):GetPosY() + maidIndex * (self.config).gapY)
    ;
    (temp.func):SetShow(false)
    temp.coolTime = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATICTEXT, Panel_Window_MaidList, "StaticText_MaidCoolTime_" .. maidIndex)
    CopyBaseProperty(self.coolTime, temp.coolTime)
    ;
    (temp.coolTime):SetPosY((self.coolTime):GetPosY() + maidIndex * (self.config).gapY)
    ;
    (temp.coolTime):SetShow(false)
    -- DECOMPILER ERROR at PC123: Confused about usage of register: R6 in 'UnsetPending'

    ;
    (self.maidInfo)[maidIndex] = temp
  end
end

maidList:Init()
MaidList_Open = function()
  -- function num : 0_1 , upvalues : maidList
  local self = maidList
  local maidCount = getTotalMaidList()
  if self.maxShowCount < maidCount then
    (self.scroll):SetShow(true)
  else
    if maidCount < 1 then
      _PA_LOG("이문�\133", "페어�\172 집사�\128 0명이라니! 이러시면 곤란합니�\164!")
      return 
    else
      ;
      (self.scroll):SetShow(false)
    end
  end
  if Panel_Window_MaidList:GetShow() then
    Panel_Window_MaidList:SetShow(false)
  else
    Panel_Window_MaidList:SetShow(true)
  end
  Panel_Window_MaidList:SetPosX(Panel_Icon_Maid:GetPosX() + Panel_Icon_Maid:GetSizeX())
  Panel_Window_MaidList:SetPosY(Panel_Icon_Maid:GetPosY())
  MaidList_Set()
end

MaidList_Close = function()
  -- function num : 0_2
  if Panel_Window_MaidList:GetShow() then
    Panel_Window_MaidList:SetShow(false)
  end
end

MaidList_Set = function(startIndex)
  -- function num : 0_3 , upvalues : maidList
  local self = maidList
  if not Panel_Icon_Maid:GetShow() and getTotalMaidList() == 0 then
    Panel_Window_MaidList:SetShow(false)
    return 
  end
  if self.maxShowCount < getTotalMaidList() then
    (self.scroll):SetShow(true)
  else
    ;
    (self.scroll):SetShow(false)
  end
  if startIndex == nil or getTotalMaidList() <= self.maxShowCount then
    self.startIndex = 0
  end
  if self.startIndex == 0 then
    (self.scroll):SetControlPos(0)
  end
end

MaidCoolTime_Update = function()
  -- function num : 0_4 , upvalues : maidList
  local self = maidList
  local regionInfo = getRegionInfoByPosition(((getSelfPlayer()):get()):getPosition())
  if regionInfo == nil then
    return 
  end
  for index = 0, self.maxShowCount - 1 do
    if index < getTotalMaidList() then
      local maidInfoWrapper = getMaidDataByIndex(index + self.startIndex)
      if maidInfoWrapper ~= nil then
        (((self.maidInfo)[index]).name):SetText(maidInfoWrapper:getName())
        ;
        (((self.maidInfo)[index]).name):SetShow(true)
        ;
        (((self.maidInfo)[index]).town):SetText((getRegionInfoWrapper(maidInfoWrapper:getRegionKey())):getAreaName())
        ;
        (((self.maidInfo)[index]).town):SetShow(true)
        if maidInfoWrapper:isAbleInWarehouse() or maidInfoWrapper:isAbleOutWarehouse() then
          (((self.maidInfo)[index]).func):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_MAIDLIST_WAREHOUSE"))
        else
          if maidInfoWrapper:isAbleSubmitMarket() then
            (((self.maidInfo)[index]).func):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_MAIDLIST_MARKET"))
          end
        end
        ;
        (((self.maidInfo)[index]).func):SetShow(true)
        ;
        (((self.maidInfo)[index]).coolTime):SetShow(true)
        local coolTime = maidInfoWrapper:getCoolTime()
        if coolTime > 0 then
          (((self.maidInfo)[index]).coolTime):SetFontColor((Defines.Color).C_FFC4BEBE)
          local oneMinute = 60000
          if coolTime < oneMinute then
            (((self.maidInfo)[index]).coolTime):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_MAIDLIST_ONEMINUTELEFT"))
          else
            ;
            (((self.maidInfo)[index]).coolTime):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_MAIDLIST_LEFTTIME", "minute", coolTime / oneMinute - coolTime / oneMinute % 1))
          end
        else
          do
            do
              do
                ;
                (((self.maidInfo)[index]).coolTime):SetText(maidInfoWrapper:getName())
                ;
                (((self.maidInfo)[index]).coolTime):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_MAIDLIST_POSSIBLE"))
                ;
                (((self.maidInfo)[index]).coolTime):SetFontColor((Defines.Color).C_FFC4BEBE)
                ;
                (((self.maidInfo)[index]).name):SetShow(false)
                ;
                (((self.maidInfo)[index]).town):SetShow(false)
                ;
                (((self.maidInfo)[index]).func):SetShow(false)
                ;
                (((self.maidInfo)[index]).coolTime):SetShow(false)
                -- DECOMPILER ERROR at PC194: LeaveBlock: unexpected jumping out DO_STMT

                -- DECOMPILER ERROR at PC194: LeaveBlock: unexpected jumping out DO_STMT

                -- DECOMPILER ERROR at PC194: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                -- DECOMPILER ERROR at PC194: LeaveBlock: unexpected jumping out IF_STMT

                -- DECOMPILER ERROR at PC194: LeaveBlock: unexpected jumping out IF_THEN_STMT

                -- DECOMPILER ERROR at PC194: LeaveBlock: unexpected jumping out IF_STMT

                -- DECOMPILER ERROR at PC194: LeaveBlock: unexpected jumping out IF_THEN_STMT

                -- DECOMPILER ERROR at PC194: LeaveBlock: unexpected jumping out IF_STMT

              end
            end
          end
        end
      end
    end
  end
  local albeWarehouseMaidCount = 0
  local albeMarketMaidCount = 0
  for index = 0, getTotalMaidList() - 1 do
    local maidInfoWrapper = getMaidDataByIndex(index)
    if maidInfoWrapper ~= nil and maidInfoWrapper:getCoolTime() == 0 then
      if maidInfoWrapper:isAbleInWarehouse() or maidInfoWrapper:isAbleOutWarehouse() then
        albeWarehouseMaidCount = albeWarehouseMaidCount + 1
      end
      if maidInfoWrapper:isAbleSubmitMarket() then
        albeMarketMaidCount = albeMarketMaidCount + 1
      end
    end
  end
  if albeWarehouseMaidCount > 0 then
    (self.btnWarehouse):SetIgnore(false)
    ;
    (self.btnWarehouse):SetMonoTone(false)
    ;
    (self.btnWarehouse):SetFontColor((Defines.Color).C_FFEFEFEF)
    ;
    (self.btnWarehouse):addInputEvent("Mouse_LUp", "FGlobal_WarehouseOpenByMaid(" .. 1 .. ")")
  else
    ;
    (self.btnWarehouse):SetIgnore(true)
    ;
    (self.btnWarehouse):SetMonoTone(true)
    ;
    (self.btnWarehouse):SetFontColor((Defines.Color).C_FFC4BEBE)
  end
  if albeMarketMaidCount > 0 then
    (self.btnMarket):SetIgnore(false)
    ;
    (self.btnMarket):SetMonoTone(false)
    ;
    (self.btnMarket):SetFontColor((Defines.Color).C_FFEFEFEF)
    ;
    (self.btnMarket):addInputEvent("Mouse_LUp", "FGlobal_WarehouseOpenByMaid(" .. 0 .. ")")
  else
    ;
    (self.btnMarket):SetIgnore(true)
    ;
    (self.btnMarket):SetMonoTone(true)
    ;
    (self.btnMarket):SetFontColor((Defines.Color).C_FFC4BEBE)
  end
  local countValuePos = (self.albeCount):GetTextSizeX()
  local ableMaidCount = albeWarehouseMaidCount + (albeMarketMaidCount)
  ;
  (self.albeCountValue):SetPosX(countValuePos)
  ;
  (self.albeCountValue):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_MAIDLIST_TOOLTIP_DESC_5", "maidCount", ableMaidCount))
end

MaidList_SetScroll = function()
  -- function num : 0_5 , upvalues : maidList
  local self = maidList
  local maidCount = getTotalMaidList()
  local pagePercent = self.maxShowCount / maidCount * 100
  local scroll_Interval = maidCount - self.maxShowCount
  local scrollSizeY = (self.scroll):GetSizeY()
  local btn_scrollSizeY = scrollSizeY / 100 * pagePercent
  if btn_scrollSizeY < 10 then
    btn_scrollSizeY = 10
  end
  if scrollSizeY <= btn_scrollSizeY then
    btn_scrollSizeY = scrollSizeY * 0.99
  end
  ;
  (self.scrollCtrlBtn):SetSize((self.scrollCtrlBtn):GetSizeX(), btn_scrollSizeY)
  self.scrollInterval = scroll_Interval
  ;
  (self.scroll):SetInterval(self.scrollInterval)
end

MaidList_ScrollEvent = function(isDown)
  -- function num : 0_6 , upvalues : maidList
  local self = maidList
  local maidCount = getTotalMaidList()
  if maidCount <= self.maxShowCount then
    return 
  end
  local index = self.startIndex
  if isDown == true then
    if maidCount - self.maxShowCount + 1 < index then
      return 
    end
    if index < self.scrollInterval then
      (self.scroll):ControlButtonDown()
      index = index + 1
    else
      return 
    end
  else
    if index > 0 then
      (self.scroll):ControlButtonUp()
      index = index - 1
    else
      return 
    end
  end
  self.startIndex = index
  MaidList_Set(self.startIndex)
end

HandleClicked_MaidList_ScrollBtn = function()
  -- function num : 0_7 , upvalues : maidList
  local self = maidList
  local maidCount = getTotalMaidList()
  local posByIndex = 1 / (maidCount - self.maxShowCount)
  local currentIndex = (math.floor)((self.scroll):GetControlPos() / posByIndex)
  self.startIndex = currentIndex
  MaidList_Set(self.startIndex)
end

local dontGoMaid = -1
local maidType = -1
FGlobal_WarehouseOpenByMaid = function(index)
  -- function num : 0_8 , upvalues : dontGoMaid, maidType, IM
  local selfProxy = getSelfPlayer()
  if selfProxy == nil then
    return 
  end
  local regionInfo = getRegionInfoByPosition(((getSelfPlayer()):get()):getPosition())
  if regionInfo == nil then
    return 
  end
  local isFreeBattle = (selfProxy:get()):isBattleGroundDefine()
  local isArshaJoin = ToClient_IsMyselfInArena()
  local localWarTeam = ToClient_GetMyTeamNoLocalWar()
  local isSpecialCharacter = (getTemporaryInformationWrapper()):isSpecialCharacter()
  local isSavageDefence = ToClient_getPlayNowSavageDefence()
  if localWarTeam ~= 0 then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_ICON_MAID_DONT_SUMMON_LOCALWAR"))
    return 
  end
  if isFreeBattle then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_WARNING_FREEBATTLE"))
    return 
  end
  if isArshaJoin then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_WARNING_ARSHA"))
    return 
  end
  if selfplayerIsInHorseRace() then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_ICON_MAID_DONT_SUMMON_HORSERACE"))
    return 
  end
  if isSpecialCharacter then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_WARNING_PREMIUMCHARACTER"))
    return 
  end
  if isSavageDefence then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_SymbolNo, "eErrNoCantPlayingSavageDefence"))
    return 
  end
  local myAffiliatedTownRegionKey = regionInfo:getAffiliatedTownRegionKey()
  local warehouseInMaid = checkMaid_WarehouseIn(true)
  local warehouseOutMaid = checkMaid_WarehouseOut(true)
  local marketMaid = checkMaid_SubmitMarket(true)
  if index == 0 then
    if marketMaid then
      FGlobal_ItemMarket_OpenByMaid()
      if ToClient_CheckExistSummonMaid() and dontGoMaid ~= -1 then
        if maidType == 0 then
          ToClient_CallHandlerMaid("_marketMaid")
        else
          for mIndex = 0, getTotalMaidList() - 1 do
            local maidInfoWrapper = getMaidDataByIndex(mIndex)
            if maidInfoWrapper:isAbleSubmitMarket() and maidInfoWrapper:getCoolTime() == 0 then
              ToClient_SummonMaid(maidInfoWrapper:getInstallationNo(), 1)
              ToClient_CallHandlerMaid("_warehouseMaidLogOut")
              ToClient_CallHandlerMaid("_marketMaid")
              dontGoMaid = mIndex
              MaidList_Close()
              maidType = 0
              break
            end
          end
        end
        do
          MaidList_Close()
          for mIndex = 0, getTotalMaidList() - 1 do
            local maidInfoWrapper = getMaidDataByIndex(mIndex)
            if maidInfoWrapper:isAbleSubmitMarket() and maidInfoWrapper:getCoolTime() == 0 then
              ToClient_SummonMaid(maidInfoWrapper:getInstallationNo(), 1)
              ToClient_CallHandlerMaid("_marketMaid")
              dontGoMaid = mIndex
              MaidList_Close()
              maidType = 0
              break
            end
          end
          do
            ;
            (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_UiMode)
            SetUIMode((Defines.UIMode).eUIMode_Default)
            if index == 1 then
              if warehouseOutMaid or warehouseInMaid then
                if IsSelfPlayerWaitAction() then
                  Warehouse_OpenPanelFromMaid()
                  local regionInfo = getRegionInfoByPosition(((getSelfPlayer()):get()):getPosition())
                  if regionInfo == nil then
                    return 
                  end
                  if ToClient_CheckExistSummonMaid() and dontGoMaid ~= -1 then
                    if maidType == 1 then
                      ToClient_CallHandlerMaid("_warehouseMaid")
                    else
                      for mIndex = 0, getTotalMaidList() - 1 do
                        local maidInfoWrapper = getMaidDataByIndex(mIndex)
                        if (maidInfoWrapper:isAbleInWarehouse() or maidInfoWrapper:isAbleOutWarehouse()) and maidInfoWrapper:getCoolTime() == 0 then
                          ToClient_SummonMaid(maidInfoWrapper:getInstallationNo(), 1)
                          ToClient_CallHandlerMaid("_marketMaidLogOut")
                          ToClient_CallHandlerMaid("_warehouseMaid")
                          dontGoMaid = mIndex
                          MaidList_Close()
                          maidType = 1
                          break
                        end
                      end
                    end
                    do
                      MaidList_Close()
                      for mIndex = 0, getTotalMaidList() - 1 do
                        local maidInfoWrapper = getMaidDataByIndex(mIndex)
                        if (maidInfoWrapper:isAbleInWarehouse() or maidInfoWrapper:isAbleOutWarehouse()) and maidInfoWrapper:getCoolTime() == 0 then
                          ToClient_SummonMaid(maidInfoWrapper:getInstallationNo(), 1)
                          ToClient_CallHandlerMaid("_warehouseMaid")
                          dontGoMaid = mIndex
                          MaidList_Close()
                          maidType = 1
                          break
                        end
                      end
                      do
                        Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_MAIDLIST_ALERT"))
                        ;
                        (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_UiMode)
                        SetUIMode((Defines.UIMode).eUIMode_Default)
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
end

FGlobal_MaidIcon_SetPos = function()
  -- function num : 0_9 , upvalues : MaidControl, maidList
  if isFlushedUI() or ((getSelfPlayer()):get()):getLevel() < 7 then
    return 
  end
  local regionInfo = getRegionInfoByPosition(((getSelfPlayer()):get()):getPosition())
  if regionInfo == nil then
    return 
  end
  local warehouseInMaid = checkMaid_WarehouseIn(true)
  local warehouseOutMaid = checkMaid_WarehouseOut(true)
  local marketMaid = checkMaid_SubmitMarket(true)
  if getTotalMaidList() > 0 then
    Panel_Icon_Maid:SetShow(true)
    ;
    (MaidControl.buttonMaid):EraseAllEffect()
    if warehouseInMaid or warehouseOutMaid or marketMaid then
      (MaidControl.buttonMaid):AddEffect("fUI_Maid_01A", false, -1, 2)
    else
      ;
      (MaidControl.buttonMaid):AddEffect("fUI_Maid_02A", false, -1, 2)
    end
    local posX, posY = nil, nil
    if Panel_Window_PetIcon:GetShow() then
      posX = Panel_Window_PetIcon:GetPosX() + Panel_Window_PetIcon:GetSizeX() - 3
      posY = Panel_Window_PetIcon:GetPosY()
    else
      if FGlobal_HouseIconCount() > 0 and Panel_MyHouseNavi:GetShow() then
        posX = Panel_MyHouseNavi:GetPosX() + 60 * FGlobal_HouseIconCount() - 3
        posY = Panel_MyHouseNavi:GetPosY()
      else
        if FGlobal_ServantIconCount() > 0 and Panel_Window_Servant:GetShow() then
          posX = Panel_Window_Servant:GetPosX() + 60 * FGlobal_ServantIconCount() - 3
          posY = Panel_Window_Servant:GetPosY()
        else
          posX = 0
          posY = Panel_SelfPlayerExpGage:GetPosY() + Panel_SelfPlayerExpGage:GetSizeY() + 15
        end
      end
    end
    Panel_Icon_Maid:SetPosX(posX)
    Panel_Icon_Maid:SetPosY(posY)
    MaidList_SetScroll()
    -- DECOMPILER ERROR at PC156: Confused about usage of register: R6 in 'UnsetPending'

    if Panel_Window_MaidList:GetShow() then
      maidList.startIndex = 0
      MaidList_Set(maidList.startIndex)
      ;
      (maidList.scroll):SetControlPos(0)
    end
  else
    do
      Panel_Icon_Maid:SetShow(false)
      PaGlobal_PvPBattle:setPosMatchIcon()
    end
  end
end

MaidFunc_ShowTooltip = function(isShow)
  -- function num : 0_10 , upvalues : MaidControl
  if isShow == nil then
    TooltipSimple_Hide()
    return 
  end
  local name = PAGetString(Defines.StringSheet_GAME, "LUA_MAIDLIST_TOOLTIP_NAME")
  local desc = ""
  local regionInfo = getRegionInfoByPosition(((getSelfPlayer()):get()):getPosition())
  if regionInfo == nil then
    return 
  end
  local warehouseInMaid = checkMaid_WarehouseIn(true)
  local warehouseOutMaid = checkMaid_WarehouseOut(true)
  local marketMaid = checkMaid_SubmitMarket(true)
  if warehouseInMaid or warehouseOutMaid then
    desc = "<" .. PAGetString(Defines.StringSheet_GAME, "LUA_MAIDLIST_WAREHOUSE") .. ">"
  end
  if marketMaid then
    if desc == "" then
      desc = "<" .. PAGetString(Defines.StringSheet_GAME, "LUA_MAIDLIST_MARKET") .. ">"
    else
      desc = desc .. ", <" .. PAGetString(Defines.StringSheet_GAME, "LUA_MAIDLIST_MARKET") .. ">"
    end
  end
  local maidCount = getTotalMaidList()
  local myAffiliatedTownRegionKey = regionInfo:getAffiliatedTownRegionKey()
  local cooltimeText = ""
  local maidAffiliatedTownName = ""
  local areaName = {}
  local sameAreaCoolTime = {}
  local oneMinute = 60000
  local mIndex = 0
  local usableMaidCount = 0
  for index = 0, maidCount - 1 do
    local maidInfoWrapper = getMaidDataByIndex(index)
    areaName[index] = (getRegionInfoWrapper(maidInfoWrapper:getRegionKey())):getAreaName()
    local sameAreaNameCheck = false
    if index > 0 then
      for ii = 0, index - 1 do
        if areaName[index] == areaName[ii] then
          sameAreaNameCheck = true
        end
      end
    end
    do
      do
        if maidAffiliatedTownName == "" then
          maidAffiliatedTownName = PAGetString(Defines.StringSheet_GAME, "LUA_MAIDLIST_TOOLTIP_DESC_1") .. " " .. areaName[index]
        else
          if sameAreaNameCheck == false then
            maidAffiliatedTownName = maidAffiliatedTownName .. " / " .. areaName[index]
          end
        end
        -- DECOMPILER ERROR at PC120: LeaveBlock: unexpected jumping out DO_STMT

      end
    end
  end
  if desc == "" then
    desc = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_MAIDLIST_TOOLTIP_DESC_2", "maidCount", maidCount)
  else
    desc = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_MAIDLIST_TOOLTIP_DESC_3", "desc", desc, "maidCount", maidCount)
  end
  if maidAffiliatedTownName ~= "" then
    desc = desc .. "\n" .. maidAffiliatedTownName
  end
  if not warehouseInMaid and not warehouseOutMaid and cooltimeText ~= "" then
    desc = desc .. "\n" .. cooltimeText
  end
  local hotkeyDesc = PAGetString(Defines.StringSheet_GAME, "LUA_MAIDLIST_TOOLTIP_DESC_4")
  desc = desc .. "\n" .. hotkeyDesc
  TooltipSimple_Show(MaidControl.buttonMaid, name, desc)
end

LogInMaidShow = function()
  -- function num : 0_11
  if ((getSelfPlayer()):get()):getLevel() > 6 and getTotalMaidList() > 0 then
    ToClient_CallHandlerMaid("_StrAllmaidLogOut")
    local randomMaidIndex = (math.random)(getTotalMaidList()) - 1
    local maidInfoWrapper = getMaidDataByIndex(randomMaidIndex)
    if maidInfoWrapper ~= nil then
      local installationNo = maidInfoWrapper:getInstallationNo()
      local aiVariable = 2
      ToClient_SummonMaid(installationNo, aiVariable)
    end
  end
end

renderModeChange_FGlobal_MaidIcon_SetPos = function(prevRenderModeList, nextRenderModeList)
  -- function num : 0_12
  if CheckRenderModebyGameMode(nextRenderModeList) == false then
    return 
  end
  FGlobal_MaidIcon_SetPos()
end

registerEvent("FromClient_RenderModeChangeState", "renderModeChange_FGlobal_MaidIcon_SetPos")
Panel_Window_MaidList:RegisterUpdateFunc("MaidCoolTime_Update")
registerEvent("selfPlayer_regionChanged", "FGlobal_MaidIcon_SetPos")
registerEvent("FromClient_RefreshMaidList", "FGlobal_MaidIcon_SetPos")
registerEvent("FromClient_luaLoadComplete", "FromClient_luaLoadComplete_Icon_Maid")
FromClient_luaLoadComplete_Icon_Maid = function()
  -- function num : 0_13
  Panel_MyHouseNavi_Update(true)
  LogInMaidShow()
end


