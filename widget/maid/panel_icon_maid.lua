Panel_Icon_Maid:SetShow(false)
Panel_Icon_Maid:ActiveMouseEventEffect(true)
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
local UI_color = Defines.Color
local UI_PUCT = CppEnums.PA_UI_CONTROL_TYPE
local IM = CppEnums.EProcessorInputMode
local isEnableMaid = ToClient_IsContentsGroupOpen("355")
local MaidControl = {
  buttonMaid = UI.getChildControl(Panel_Icon_Maid, "Button_MaidIcon")
}
MaidControl.buttonMaid:addInputEvent("Mouse_LUp", "MaidList_Open()")
MaidControl.buttonMaid:addInputEvent("Mouse_On", "MaidFunc_ShowTooltip( true )")
MaidControl.buttonMaid:addInputEvent("Mouse_Out", "MaidFunc_ShowTooltip()")
MaidControl.buttonMaid:ActiveMouseEventEffect(true)
Panel_Window_MaidList:SetShow(false)
Panel_Window_MaidList:setGlassBackground(true)
Panel_Window_MaidList:ActiveMouseEventEffect(true)
local maidList = {
  contentBg = UI.getChildControl(Panel_Window_MaidList, "Static_MaidListContentBG"),
  name = UI.getChildControl(Panel_Window_MaidList, "StaticText_Name"),
  town = UI.getChildControl(Panel_Window_MaidList, "StaticText_Town"),
  func = UI.getChildControl(Panel_Window_MaidList, "StaticText_Func"),
  coolTime = UI.getChildControl(Panel_Window_MaidList, "StaticText_Cooltime"),
  btnWarehouse = UI.getChildControl(Panel_Window_MaidList, "Button_SummonMaid_Warehouse"),
  btnMarket = UI.getChildControl(Panel_Window_MaidList, "Button_SummonMaid_Market"),
  albeCount = UI.getChildControl(Panel_Window_MaidList, "StaticText_LeftMaidCount"),
  albeCountValue = UI.getChildControl(Panel_Window_MaidList, "StaticText_LeftMaidCountValue"),
  scroll = UI.getChildControl(Panel_Window_MaidList, "Scroll_MaidList"),
  btnClose = UI.getChildControl(Panel_Window_MaidList, "Button_Close"),
  config = {gapY = 25, normalSizeY = 155},
  maidInfo = {},
  maxShowCount = 5,
  startIndex = 0,
  scrollInterval = 0
}
local albeWarehouseMaidCount = 0
local albeMarketMaidCount = 0
maidList.scrollCtrlBtn = UI.getChildControl(maidList.scroll, "Scroll_CtrlButton")
maidList.scrollCtrlBtn:addInputEvent("Mouse_LPress", "HandleClicked_MaidList_ScrollBtn()")
maidList.btnClose:addInputEvent("Mouse_LUp", "MaidList_Close()")
maidList.contentBg:addInputEvent("Mouse_DownScroll", "MaidList_ScrollEvent( true )")
maidList.contentBg:addInputEvent("Mouse_UpScroll", "MaidList_ScrollEvent( false )")
maidList.scroll:addInputEvent("Mouse_LPress", "HandleClicked_MaidList_ScrollBtn()")
function maidList:Init()
  for maidIndex = 0, self.maxShowCount - 1 do
    local temp = {}
    temp.name = UI.createControl(CppEnums.PA_UI_CONTROL_TYPE.PA_UI_CONTROL_STATICTEXT, Panel_Window_MaidList, "StaticText_MaidName_" .. maidIndex)
    CopyBaseProperty(self.name, temp.name)
    temp.name:SetPosY(self.name:GetPosY() + maidIndex * self.config.gapY)
    temp.name:SetShow(false)
    temp.town = UI.createControl(CppEnums.PA_UI_CONTROL_TYPE.PA_UI_CONTROL_STATICTEXT, Panel_Window_MaidList, "StaticText_MaidTown_" .. maidIndex)
    CopyBaseProperty(self.town, temp.town)
    temp.town:SetPosY(self.town:GetPosY() + maidIndex * self.config.gapY)
    temp.town:SetShow(false)
    temp.func = UI.createControl(CppEnums.PA_UI_CONTROL_TYPE.PA_UI_CONTROL_STATICTEXT, Panel_Window_MaidList, "StaticText_MaidFunc_" .. maidIndex)
    CopyBaseProperty(self.func, temp.func)
    temp.func:SetPosY(self.func:GetPosY() + maidIndex * self.config.gapY)
    temp.func:SetShow(false)
    temp.coolTime = UI.createControl(CppEnums.PA_UI_CONTROL_TYPE.PA_UI_CONTROL_STATICTEXT, Panel_Window_MaidList, "StaticText_MaidCoolTime_" .. maidIndex)
    CopyBaseProperty(self.coolTime, temp.coolTime)
    temp.coolTime:SetPosY(self.coolTime:GetPosY() + maidIndex * self.config.gapY)
    temp.coolTime:SetShow(false)
    self.maidInfo[maidIndex] = temp
  end
  self.btnWarehouse:addInputEvent("Mouse_LUp", "FGlobal_WarehouseOpenByMaid(" .. 1 .. ")")
  self.btnMarket:addInputEvent("Mouse_LUp", "FGlobal_WarehouseOpenByMaid(" .. 0 .. ")")
  if isEnableMaid then
    self.btnWarehouse:setButtonShortcuts("PANEL_MAIDLIST_OPEN_WAREHOUSE")
    self.btnMarket:setButtonShortcuts("PANEL_MAIDLIST_OPEN_ITEMMARKET")
  end
end
maidList:Init()
function MaidList_Open()
  local self = maidList
  local maidCount = getTotalMaidList()
  if maidCount > self.maxShowCount then
    self.scroll:SetShow(true)
  elseif maidCount < 1 then
    _PA_LOG("\236\157\180\235\172\184\236\162\133", "\237\142\152\236\150\180\235\166\172 \236\167\145\236\130\172\234\176\128 0\235\170\133\236\157\180\235\157\188\235\139\136! \236\157\180\235\159\172\236\139\156\235\169\180 \234\179\164\235\158\128\237\149\169\235\139\136\235\139\164!")
    return
  else
    self.scroll:SetShow(false)
  end
  if Panel_Window_MaidList:GetShow() then
    Panel_Window_MaidList:SetShow(false)
  else
    Panel_Window_MaidList:SetShow(true)
  end
  Panel_Window_MaidList:SetPosX(Panel_Icon_Maid:GetPosX() + Panel_Icon_Maid:GetSizeX())
  Panel_Window_MaidList:SetPosY(Panel_Icon_Maid:GetPosY())
  MaidList_Set()
  if true == _ContentsGroup_RenewUI_Main then
    Panel_Window_MaidList:SetShow(false)
  end
end
function MaidList_Close()
  if Panel_Window_MaidList:GetShow() then
    Panel_Window_MaidList:SetShow(false)
  end
end
function MaidList_Set(startIndex)
  local self = maidList
  if not Panel_Icon_Maid:GetShow() and 0 == getTotalMaidList() then
    Panel_Window_MaidList:SetShow(false)
    return
  end
  if self.maxShowCount < getTotalMaidList() then
    self.scroll:SetShow(true)
  else
    self.scroll:SetShow(false)
  end
  if nil == startIndex or getTotalMaidList() <= self.maxShowCount then
    self.startIndex = 0
  end
  if 0 == self.startIndex then
    self.scroll:SetControlPos(0)
  end
end
function MaidCoolTime_Update()
  local self = maidList
  if nil == getSelfPlayer() then
    return
  end
  if false == _ContentsGroup_NewMaid then
    local regionInfo = getRegionInfoByPosition(getSelfPlayer():get():getPosition())
    if nil == regionInfo then
      return
    end
  end
  for index = 0, self.maxShowCount - 1 do
    if index < getTotalMaidList() then
      local maidInfoWrapper = getMaidDataByIndex(index + self.startIndex)
      if nil ~= maidInfoWrapper then
        self.maidInfo[index].name:SetText(maidInfoWrapper:getName())
        self.maidInfo[index].name:SetShow(true)
        if false == _ContentsGroup_NewMaid then
          self.maidInfo[index].town:SetText(getRegionInfoWrapper(maidInfoWrapper:getRegionKey()):getAreaName())
          self.maidInfo[index].town:SetShow(true)
        else
          self.maidInfo[index].town:SetShow(false)
        end
        if maidInfoWrapper:isAbleInWarehouse() or maidInfoWrapper:isAbleOutWarehouse() then
          self.maidInfo[index].func:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_MAIDLIST_WAREHOUSE"))
        elseif maidInfoWrapper:isAbleSubmitMarket() then
          self.maidInfo[index].func:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_MAIDLIST_MARKET"))
        end
        self.maidInfo[index].func:SetShow(true)
        self.maidInfo[index].coolTime:SetShow(true)
        local coolTime = maidInfoWrapper:getCoolTime()
        if coolTime > 0 then
          self.maidInfo[index].coolTime:SetFontColor(Defines.Color.C_FFC4BEBE)
          local oneMinute = 6000
          if true == _ContentsGroup_NewMaid then
            oneMinute = 60
          end
          if coolTime < oneMinute then
            self.maidInfo[index].coolTime:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_MAIDLIST_ONEMINUTELEFT"))
          else
            self.maidInfo[index].coolTime:SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_MAIDLIST_LEFTTIME", "minute", coolTime / oneMinute - coolTime / oneMinute % 1))
          end
        else
          if false == _ContentsGroup_NewMaid then
            self.maidInfo[index].coolTime:SetText(maidInfoWrapper:getName())
          end
          self.maidInfo[index].coolTime:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_MAIDLIST_POSSIBLE"))
          self.maidInfo[index].coolTime:SetFontColor(Defines.Color.C_FFC4BEBE)
        end
      end
    else
      self.maidInfo[index].name:SetShow(false)
      self.maidInfo[index].town:SetShow(false)
      self.maidInfo[index].func:SetShow(false)
      self.maidInfo[index].coolTime:SetShow(false)
    end
  end
  albeWarehouseMaidCount = 0
  albeMarketMaidCount = 0
  for index = 0, getTotalMaidList() - 1 do
    local maidInfoWrapper = getMaidDataByIndex(index)
    if nil ~= maidInfoWrapper and 0 == maidInfoWrapper:getCoolTime() then
      if maidInfoWrapper:isAbleInWarehouse() or maidInfoWrapper:isAbleOutWarehouse() then
        albeWarehouseMaidCount = albeWarehouseMaidCount + 1
      end
      if maidInfoWrapper:isAbleSubmitMarket() then
        albeMarketMaidCount = albeMarketMaidCount + 1
      end
    end
  end
  if albeWarehouseMaidCount > 0 then
    self.btnWarehouse:SetIgnore(false)
    self.btnWarehouse:SetMonoTone(false)
    self.btnWarehouse:SetFontColor(Defines.Color.C_FFEFEFEF)
  else
    self.btnWarehouse:SetIgnore(true)
    self.btnWarehouse:SetMonoTone(true)
    self.btnWarehouse:SetFontColor(Defines.Color.C_FFC4BEBE)
  end
  if albeMarketMaidCount > 0 then
    self.btnMarket:SetIgnore(false)
    self.btnMarket:SetMonoTone(false)
    self.btnMarket:SetFontColor(Defines.Color.C_FFEFEFEF)
  else
    self.btnMarket:SetIgnore(true)
    self.btnMarket:SetMonoTone(true)
    self.btnMarket:SetFontColor(Defines.Color.C_FFC4BEBE)
  end
  local countValuePos = self.albeCount:GetTextSizeX()
  local ableMaidCount = albeWarehouseMaidCount + albeMarketMaidCount
  self.albeCountValue:SetPosX(countValuePos)
  self.albeCountValue:SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_MAIDLIST_TOOLTIP_DESC_5", "maidCount", ableMaidCount))
end
function MaidList_SetScroll()
  local self = maidList
  local maidCount = getTotalMaidList()
  local pagePercent = self.maxShowCount / maidCount * 100
  local scroll_Interval = maidCount - self.maxShowCount
  local scrollSizeY = self.scroll:GetSizeY()
  local btn_scrollSizeY = scrollSizeY / 100 * pagePercent
  if btn_scrollSizeY < 30 then
    btn_scrollSizeY = 30
  end
  if scrollSizeY <= btn_scrollSizeY then
    btn_scrollSizeY = scrollSizeY * 0.99
  end
  self.scrollCtrlBtn:SetSize(self.scrollCtrlBtn:GetSizeX(), btn_scrollSizeY)
  self.scrollInterval = scroll_Interval
  self.scroll:SetInterval(self.scrollInterval)
end
function MaidList_ScrollEvent(isDown)
  local self = maidList
  local maidCount = getTotalMaidList()
  if maidCount <= self.maxShowCount then
    return
  end
  local index = self.startIndex
  if true == isDown then
    if index > maidCount - self.maxShowCount + 1 then
      return
    end
    if index < self.scrollInterval then
      self.scroll:ControlButtonDown()
      index = index + 1
    else
      return
    end
  elseif index > 0 then
    self.scroll:ControlButtonUp()
    index = index - 1
  else
    return
  end
  self.startIndex = index
  MaidList_Set(self.startIndex)
end
function HandleClicked_MaidList_ScrollBtn()
  local self = maidList
  local maidCount = getTotalMaidList()
  local posByIndex = 1 / (maidCount - self.maxShowCount)
  local currentIndex = math.floor(self.scroll:GetControlPos() / posByIndex)
  self.startIndex = currentIndex
  MaidList_Set(self.startIndex)
end
local dontGoMaid = -1
local maidType = -1
function FGlobal_WarehouseOpenByMaid(index)
  local selfProxy = getSelfPlayer()
  if nil == selfProxy then
    return
  end
  if false == _ContentsGroup_NewMaid then
    local regionInfo = getRegionInfoByPosition(getSelfPlayer():get():getPosition())
    if nil == regionInfo then
      return
    end
  end
  local isFreeBattle = selfProxy:get():isBattleGroundDefine()
  local isArshaJoin = ToClient_IsMyselfInArena()
  local localWarTeam = ToClient_GetMyTeamNoLocalWar()
  local isSpecialCharacter = getTemporaryInformationWrapper():isSpecialCharacter()
  local isSavageDefence = ToClient_getPlayNowSavageDefence()
  local isGuildBattle = ToClient_getJoinGuildBattle()
  if 0 ~= localWarTeam then
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
  if isGuildBattle then
    if true == ToClient_isPersonalBattle() then
      Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_ICON_MAID_PERSONALBATTLE"))
    else
      Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_ICON_MAID_GUILDBATTLE"))
    end
    return
  end
  local warehouseInMaid = checkMaid_WarehouseIn(true)
  local warehouseOutMaid = checkMaid_WarehouseOut(true)
  local marketMaid = checkMaid_SubmitMarket(true)
  local enableWarehouseMaid = checkMaid_WarehouseIn(false)
  local enableMarketMaid = checkMaid_SubmitMarket(false)
  if 0 == index then
    if marketMaid then
      FGlobal_ItemMarket_OpenByMaid()
      if ToClient_CheckExistSummonMaid() and -1 ~= dontGoMaid then
        if 0 == maidType then
          ToClient_CallHandlerMaid("_marketMaid")
        else
          for mIndex = 0, getTotalMaidList() - 1 do
            local maidInfoWrapper = getMaidDataByIndex(mIndex)
            if maidInfoWrapper:isAbleSubmitMarket() and 0 == maidInfoWrapper:getCoolTime() then
              if false == _ContentsGroup_NewMaid then
                ToClient_SummonMaid(maidInfoWrapper:getInstallationNo(), 1)
              else
                ToClient_SummonMaid(maidInfoWrapper:getMaidNo(), 1)
              end
              ToClient_CallHandlerMaid("_warehouseMaidLogOut")
              ToClient_CallHandlerMaid("_marketMaid")
              dontGoMaid = mIndex
              MaidList_Close()
              maidType = 0
              break
            end
          end
        end
        MaidList_Close()
      else
        for mIndex = 0, getTotalMaidList() - 1 do
          local maidInfoWrapper = getMaidDataByIndex(mIndex)
          if maidInfoWrapper:isAbleSubmitMarket() and 0 == maidInfoWrapper:getCoolTime() then
            if false == _ContentsGroup_NewMaid then
              ToClient_SummonMaid(maidInfoWrapper:getInstallationNo(), 1)
            else
              ToClient_SummonMaid(maidInfoWrapper:getMaidNo(), 1)
            end
            ToClient_CallHandlerMaid("_marketMaid")
            dontGoMaid = mIndex
            MaidList_Close()
            maidType = 0
            break
          end
        end
      end
    else
      if false == enableMarketMaid then
        Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_ICON_MAID_MARKETMAID_NONE"))
      else
        Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_ICON_MAID_MARKETMAID_COOLTIME"))
      end
      SetUIMode(Defines.UIMode.eUIMode_Default)
    end
  end
  if 1 == index then
    if warehouseOutMaid or warehouseInMaid then
      if IsSelfPlayerWaitAction() then
        Warehouse_OpenPanelFromMaid()
        if false == _ContentsGroup_NewMaid then
          local regionInfo = getRegionInfoByPosition(getSelfPlayer():get():getPosition())
          if nil == regionInfo then
            return
          end
        end
        if ToClient_CheckExistSummonMaid() and -1 ~= dontGoMaid then
          if 1 == maidType then
            ToClient_CallHandlerMaid("_warehouseMaid")
          else
            for mIndex = 0, getTotalMaidList() - 1 do
              local maidInfoWrapper = getMaidDataByIndex(mIndex)
              if (maidInfoWrapper:isAbleInWarehouse() or maidInfoWrapper:isAbleOutWarehouse()) and 0 == maidInfoWrapper:getCoolTime() then
                if false == _ContentsGroup_NewMaid then
                  ToClient_SummonMaid(maidInfoWrapper:getInstallationNo(), 1)
                else
                  ToClient_SummonMaid(maidInfoWrapper:getMaidNo(), 1)
                end
                ToClient_CallHandlerMaid("_marketMaidLogOut")
                ToClient_CallHandlerMaid("_warehouseMaid")
                dontGoMaid = mIndex
                MaidList_Close()
                maidType = 1
                break
              end
            end
          end
          MaidList_Close()
        else
          for mIndex = 0, getTotalMaidList() - 1 do
            local maidInfoWrapper = getMaidDataByIndex(mIndex)
            if (maidInfoWrapper:isAbleInWarehouse() or maidInfoWrapper:isAbleOutWarehouse()) and 0 == maidInfoWrapper:getCoolTime() then
              if false == _ContentsGroup_NewMaid then
                ToClient_SummonMaid(maidInfoWrapper:getInstallationNo(), 1)
              else
                ToClient_SummonMaid(maidInfoWrapper:getMaidNo(), 1)
              end
              ToClient_CallHandlerMaid("_warehouseMaid")
              dontGoMaid = mIndex
              MaidList_Close()
              maidType = 1
              break
            end
          end
        end
      else
        Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_MAIDLIST_ALERT"))
      end
    else
      if false == enableWarehouseMaid then
        Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_ICON_MAID_WAREHOUSEMAID_NONE"))
      else
        Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_ICON_MAID_WAREHOUSEMAID_COOLTIME"))
      end
      SetUIMode(Defines.UIMode.eUIMode_Default)
    end
  end
end
function maidList:setPosAndScrollReset()
  FGlobal_MaidIcon_SetPos(true)
end
function FGlobal_MaidIcon_SetPos(resetScroll)
  if isFlushedUI() or getSelfPlayer():get():getLevel() < 7 then
    return
  end
  if false == _ContentsGroup_NewMaid then
    local regionInfo = getRegionInfoByPosition(getSelfPlayer():get():getPosition())
    if nil == regionInfo then
      return
    end
  end
  local warehouseInMaid = checkMaid_WarehouseIn(true)
  local warehouseOutMaid = checkMaid_WarehouseOut(true)
  local marketMaid = checkMaid_SubmitMarket(true)
  if 0 < getTotalMaidList() then
    if true == _ContentsGroup_RenewUI_Main then
      Panel_Icon_Maid:SetShow(false)
    else
      Panel_Icon_Maid:SetShow(true)
    end
    MaidControl.buttonMaid:EraseAllEffect()
    if warehouseInMaid or warehouseOutMaid or marketMaid then
      MaidControl.buttonMaid:AddEffect("fUI_Maid_01A", false, -1, 2)
    else
      MaidControl.buttonMaid:AddEffect("fUI_Maid_02A", false, -1, 2)
    end
    local posX, posY
    if Panel_Window_PetIcon:GetShow() then
      posX = Panel_Window_PetIcon:GetPosX() + Panel_Window_PetIcon:GetSizeX() - 3
      posY = Panel_Window_PetIcon:GetPosY()
    elseif 0 < FGlobal_HouseIconCount() and Panel_MyHouseNavi:GetShow() then
      posX = Panel_MyHouseNavi:GetPosX() + 60 * FGlobal_HouseIconCount() - 3
      posY = Panel_MyHouseNavi:GetPosY()
    elseif 0 < FGlobal_ServantIconCount() and Panel_Window_Servant:GetShow() then
      posX = Panel_Window_Servant:GetPosX() + 60 * FGlobal_ServantIconCount() - 3
      posY = Panel_Window_Servant:GetPosY()
    else
      posX = 0
      posY = Panel_SelfPlayerExpGage:GetPosY() + Panel_SelfPlayerExpGage:GetSizeY() + 15
    end
    Panel_Icon_Maid:SetPosX(posX)
    Panel_Icon_Maid:SetPosY(posY)
    MaidList_SetScroll()
    if true == resetScroll and Panel_Window_MaidList:GetShow() then
      maidList.startIndex = 0
      MaidList_Set(maidList.startIndex)
      maidList.scroll:SetControlPos(0)
    end
  else
    Panel_Icon_Maid:SetShow(false)
  end
  PaGlobal_PvPBattle:setPosMatchIcon()
end
function MaidFunc_ShowTooltip(isShow)
  if nil == isShow then
    TooltipSimple_Hide()
    return
  end
  local name = PAGetString(Defines.StringSheet_GAME, "LUA_MAIDLIST_TOOLTIP_NAME")
  local desc = ""
  if false == _ContentsGroup_NewMaid then
    local regionInfo = getRegionInfoByPosition(getSelfPlayer():get():getPosition())
    if nil == regionInfo then
      return
    end
  end
  local warehouseInMaid = checkMaid_WarehouseIn(true)
  local warehouseOutMaid = checkMaid_WarehouseOut(true)
  local marketMaid = checkMaid_SubmitMarket(true)
  if warehouseInMaid or warehouseOutMaid then
    desc = "<" .. PAGetString(Defines.StringSheet_GAME, "LUA_MAIDLIST_WAREHOUSE") .. ">"
  end
  if marketMaid then
    if "" == desc then
      desc = "<" .. PAGetString(Defines.StringSheet_GAME, "LUA_MAIDLIST_MARKET") .. ">"
    else
      desc = desc .. ", <" .. PAGetString(Defines.StringSheet_GAME, "LUA_MAIDLIST_MARKET") .. ">"
    end
  end
  local maidCount = getTotalMaidList()
  local cooltimeText = ""
  local maidAffiliatedTownName = ""
  local areaName = {}
  local sameAreaCoolTime = {}
  local oneMinute
  if false == _ContentsGroup_NewMaid then
    oneMinute = 6000
  else
    oneMinute = 60
  end
  local mIndex = 0
  local usableMaidCount = 0
  if false == _ContentsGroup_NewMaid then
    for index = 0, maidCount - 1 do
      local maidInfoWrapper = getMaidDataByIndex(index)
      areaName[index] = getRegionInfoWrapper(maidInfoWrapper:getRegionKey()):getAreaName()
      local sameAreaNameCheck = false
      if index > 0 then
        for ii = 0, index - 1 do
          if areaName[index] == areaName[ii] then
            sameAreaNameCheck = true
          end
        end
      end
      if "" == maidAffiliatedTownName then
        maidAffiliatedTownName = PAGetString(Defines.StringSheet_GAME, "LUA_MAIDLIST_TOOLTIP_DESC_1") .. " " .. areaName[index]
      elseif false == sameAreaNameCheck then
        maidAffiliatedTownName = maidAffiliatedTownName .. " / " .. areaName[index]
      end
    end
  end
  if "" == desc then
    desc = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_MAIDLIST_TOOLTIP_DESC_2", "maidCount", maidCount)
  else
    desc = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_MAIDLIST_TOOLTIP_DESC_3", "desc", desc, "maidCount", maidCount)
  end
  if "" ~= maidAffiliatedTownName then
    desc = desc .. "\n" .. maidAffiliatedTownName
  end
  if not warehouseInMaid and not warehouseOutMaid and "" ~= cooltimeText then
    desc = desc .. "\n" .. cooltimeText
  end
  local hotkeyDesc = PAGetString(Defines.StringSheet_GAME, "LUA_MAIDLIST_TOOLTIP_DESC_4")
  desc = desc .. "\n" .. hotkeyDesc
  TooltipSimple_Show(MaidControl.buttonMaid, name, desc)
end
function LogInMaidShow()
  if 6 < getSelfPlayer():get():getLevel() and 0 < getTotalMaidList() then
    ToClient_CallHandlerMaid("_StrAllmaidLogOut")
    local randomMaidIndex = math.random(getTotalMaidList()) - 1
    local maidInfoWrapper = getMaidDataByIndex(randomMaidIndex)
    if nil ~= maidInfoWrapper then
      local aiVariable = 2
      if false == _ContentsGroup_NewMaid then
        local installationNo = maidInfoWrapper:getInstallationNo()
        ToClient_SummonMaid(installationNo, aiVariable)
      else
        local maidNo = maidInfoWrapper:getMaidNo()
        ToClient_SummonMaid(maidNo, aiVariable)
      end
    end
  end
end
function renderModeChange_FGlobal_MaidIcon_SetPos(prevRenderModeList, nextRenderModeList)
  if CheckRenderModebyGameMode(nextRenderModeList) == false then
    return
  end
  FGlobal_MaidIcon_SetPos(true)
end
function FromClient_Refresh()
  FGlobal_MaidIcon_SetPos(true)
end
Panel_Window_MaidList:RegisterUpdateFunc("MaidCoolTime_Update")
registerEvent("FromClient_RefreshMaidList", "FromClient_Refresh")
registerEvent("FromClient_luaLoadComplete", "FromClient_luaLoadComplete_Icon_Maid")
function FromClient_luaLoadComplete_Icon_Maid()
  Panel_MyHouseNavi_Update(true)
  MaidCoolTime_Update()
  LogInMaidShow()
end