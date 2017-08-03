-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\auction\panel_workerlist_auction.luac 

-- params : ...
-- function num : 0
Panel_WorkerList_Auction:SetShow(false)
Panel_WorkerList_Auction:setMaskingChild(true)
Panel_WorkerList_Auction:ActiveMouseEventEffect(true)
Panel_WorkerList_Auction:SetDragEnable(true)
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
local UI_color = Defines.Color
local UI_TM = CppEnums.TextMode
local auctionInfo = RequestGetAuctionInfo()
local MyworkerList = {plantKey = nil, _slotMaxCount = 4, _listCount = 0, _startIndex = 0, startPosY = 5, 
_slots = {}
, _btnWinClose = (UI.getChildControl)(Panel_WorkerList_Auction, "Button_Close"), _btnWinQuestion = (UI.getChildControl)(Panel_WorkerList_Auction, "Button_Question"), _workerListBG = (UI.getChildControl)(Panel_WorkerList_Auction, "Static_WorkerList_BG"), _scroll = (UI.getChildControl)(Panel_WorkerList_Auction, "WorkerList_ScrollBar")}
MyworkerList._scrollbtn = (UI.getChildControl)(MyworkerList._scroll, "Frame_ScrollBar_thumb")
MyworkerList.Init = function(self)
  -- function num : 0_0 , upvalues : MyworkerList
  for ii = 0, self._slotMaxCount - 1 do
    local slot = {}
    slot.slotNo = ii
    slot._panel = Panel_WorkerList_Auction
    slot._startSlotIndex = 0
    slot._workerBG = (UI.createAndCopyBasePropertyControl)(Panel_WorkerList_Auction, "Static_workerBG", self._workerListBG, "workerListBG_" .. ii)
    slot._workerIconBG = (UI.createAndCopyBasePropertyControl)(Panel_WorkerList_Auction, "Static_WorkerIconBG", slot._workerBG, "workerIconBG_" .. ii)
    slot._workerIcon = (UI.createAndCopyBasePropertyControl)(Panel_WorkerList_Auction, "Static_workerIcon", slot._workerIconBG, "workerIcon_" .. ii)
    slot._workerLv = (UI.createAndCopyBasePropertyControl)(Panel_WorkerList_Auction, "Static_WorkerLevel", slot._workerIconBG, "workerLv_" .. ii)
    slot._workerName = (UI.createAndCopyBasePropertyControl)(Panel_WorkerList_Auction, "StaticText_WorkerName", slot._workerBG, "workerName_" .. ii)
    slot._upgradeChance = (UI.createAndCopyBasePropertyControl)(Panel_WorkerList_Auction, "Static_UpgradeChance", slot._workerBG, "upgradeChance_" .. ii)
    slot._workerPrice = (UI.createAndCopyBasePropertyControl)(Panel_WorkerList_Auction, "StaticText_WorkerPrice", slot._workerBG, "maxPriceIcon_" .. ii)
    slot._btnResist = (UI.createAndCopyBasePropertyControl)(Panel_WorkerList_Auction, "Button_WorkerResist", slot._workerBG, "button_Resist_" .. ii)
    ;
    (slot._workerBG):SetPosX(5)
    ;
    (slot._workerBG):SetPosY(self.startPosY + ((slot._workerBG):GetSizeY() + 5) * ii)
    ;
    (slot._workerIconBG):SetPosX(5)
    ;
    (slot._workerIconBG):SetPosY(10)
    ;
    (slot._workerIcon):SetPosX(0)
    ;
    (slot._workerIcon):SetPosY(0)
    ;
    (slot._workerLv):SetPosX((slot._workerIconBG):GetPosX() + (slot._workerIconBG):GetSizeX() + 5)
    ;
    (slot._workerLv):SetPosY(4)
    ;
    (slot._workerName):SetPosX((slot._workerLv):GetPosX() + (slot._workerLv):GetTextSizeX() + 3)
    ;
    (slot._workerName):SetPosY((slot._workerLv):GetPosY() + 1)
    ;
    (slot._upgradeChance):SetPosX((slot._workerIconBG):GetPosX() + (slot._workerIconBG):GetSizeX() + 10)
    ;
    (slot._upgradeChance):SetPosY((slot._workerName):GetPosY() + (slot._workerName):GetSizeY() + 3)
    ;
    (slot._workerPrice):SetPosX((slot._workerIconBG):GetPosX() + (slot._workerIconBG):GetSizeX() + 10)
    ;
    (slot._workerPrice):SetPosY((slot._workerName):GetPosY() + (slot._workerName):GetSizeY() + 28)
    ;
    (slot._btnResist):SetPosX((slot._workerBG):GetSizeX() - (slot._btnResist):GetSizeX() - 3)
    ;
    (slot._btnResist):SetPosY((slot._workerName):GetPosY() + 27)
    ;
    (slot._workerBG):addInputEvent("Mouse_UpScroll", "MyworkerList_ScrollEvent( true )")
    ;
    (slot._workerBG):addInputEvent("Mouse_DownScroll", "MyworkerList_ScrollEvent( false )")
    ;
    (slot._workerIcon):addInputEvent("Mouse_UpScroll", "MyworkerList_ScrollEvent( true )")
    ;
    (slot._workerIcon):addInputEvent("Mouse_DownScroll", "MyworkerList_ScrollEvent( false )")
    ;
    (slot._btnResist):addInputEvent("Mouse_UpScroll", "MyworkerList_ScrollEvent( true )")
    ;
    (slot._btnResist):addInputEvent("Mouse_DownScroll", "MyworkerList_ScrollEvent( false )")
    ;
    (slot._workerName):addInputEvent("Mouse_UpScroll", "MyworkerList_ScrollEvent( true )")
    ;
    (slot._workerName):addInputEvent("Mouse_DownScroll", "MyworkerList_ScrollEvent( false )")
    ;
    (slot._workerPrice):addInputEvent("Mouse_UpScroll", "MyworkerList_ScrollEvent( true )")
    ;
    (slot._workerPrice):addInputEvent("Mouse_DownScroll", "MyworkerList_ScrollEvent( false )")
    -- DECOMPILER ERROR at PC266: Confused about usage of register: R6 in 'UnsetPending'

    ;
    (self._slots)[ii] = slot
  end
  ;
  (self._btnWinClose):addInputEvent("Mouse_LUp", "MyworkerList_Close()")
  ;
  (UIScroll.InputEvent)(MyworkerList._scroll, "MyworkerList_ScrollEvent")
end

local MyworkerList_Update = function()
  -- function num : 0_1 , upvalues : MyworkerList, UI_color, UI_TM
  local self = MyworkerList
  for ii = 0, self._slotMaxCount - 1 do
    local slot = (self._slots)[ii]
    ;
    (slot._workerBG):SetShow(false)
  end
  if self.plantKey ~= nil then
    self._listCount = ToClient_getPlantWaitWorkerListCount(self.plantKey, 0)
  end
  local uiIndex = 0
  for worker_Index = self._startIndex, self._listCount - 1 do
    if self._slotMaxCount - 1 < uiIndex then
      break
    end
    local workerNoRaw = ToClient_getPlantWaitWorkerNoRawByIndex(self.plantKey, worker_Index)
    local workerWrapperLua = getWorkerWrapper(workerNoRaw, false)
    if workerWrapperLua ~= nil then
      local slot = (self._slots)[uiIndex]
      local workerIcon = workerWrapperLua:getWorkerIcon()
      local workerName = workerWrapperLua:getGradeToColorString() .. workerWrapperLua:getName() .. "<PAOldColor>"
      local workerLv = workerWrapperLua:getLevel()
      local workerUpgradeCount = workerWrapperLua:getUpgradePoint()
      local workerMinPrice = workerWrapperLua:getWorkerMinPrice()
      local workerMaxPrice = workerWrapperLua:getWorkerMaxPrice()
      if workerWrapperLua:getIsAuctionInsert() == true then
        (slot._btnResist):SetEnable(false)
        ;
        (slot._btnResist):SetMonoTone(true)
        ;
        (slot._btnResist):SetFontColor(UI_color.C_FF515151)
        ;
        (slot._btnResist):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_WORKERAUCTION_REGISTINGNOW"))
      else
        if workerWrapperLua:isWorking() == true then
          (slot._btnResist):SetEnable(false)
          ;
          (slot._btnResist):SetMonoTone(true)
          ;
          (slot._btnResist):SetFontColor(UI_color.C_FF515151)
          ;
          (slot._btnResist):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_WORKERAUCTION_WORKINGNOW"))
        else
          if workerWrapperLua:getActionPoint() ~= workerWrapperLua:getMaxActionPoint() then
            (slot._btnResist):SetEnable(false)
            ;
            (slot._btnResist):SetMonoTone(true)
            ;
            (slot._btnResist):SetFontColor(UI_color.C_FF515151)
            ;
            (slot._btnResist):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_WORKERAUCTION_NOTENOUGH_ACTIONPOINT"))
          else
            if workerWrapperLua:getGrade() < 2 then
              (slot._btnResist):SetEnable(false)
              ;
              (slot._btnResist):SetMonoTone(true)
              ;
              (slot._btnResist):SetFontColor(UI_color.C_FF515151)
              ;
              (slot._btnResist):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_WORKERAUCTION_NOTENOUGH_GRADE"))
            else
              if workerWrapperLua:getWorkerDefaultSkillStaticStatus() then
                (slot._btnResist):SetEnable(false)
                ;
                (slot._btnResist):SetMonoTone(true)
                ;
                (slot._btnResist):SetFontColor(UI_color.C_FF515151)
                ;
                (slot._btnResist):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_WORKERAUCTION_CANNOT_REGIST"))
              else
                ;
                (slot._btnResist):SetEnable(true)
                ;
                (slot._btnResist):SetMonoTone(false)
                ;
                (slot._btnResist):SetFontColor(UI_color.C_FFEFEFEF)
                ;
                (slot._btnResist):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_WORKERAUCTION_REGIST"))
              end
            end
          end
        end
      end
      ;
      (slot._workerIcon):ChangeTextureInfoName(workerIcon)
      ;
      (slot._workerLv):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_WORKERAUCTION_WORKERLEVEL", "level", tostring(workerLv)))
      ;
      (slot._workerName):SetPosX((slot._workerLv):GetPosX() + (slot._workerLv):GetTextSizeX() + 10)
      ;
      (slot._workerName):SetTextMode(UI_TM.eTextMode_LimitText)
      ;
      (slot._workerName):SetText(workerName)
      ;
      (slot._upgradeChance):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_WORKERAUCTION_UPGRADECOUNT", "upgradecount", workerUpgradeCount))
      ;
      (slot._workerPrice):SetText(makeDotMoney(workerMaxPrice))
      ;
      (slot._workerBG):SetShow(true)
      ;
      (slot._workerIconBG):SetShow(true)
      ;
      (slot._workerIcon):SetShow(true)
      ;
      (slot._workerLv):SetShow(true)
      ;
      (slot._workerName):SetShow(true)
      ;
      (slot._upgradeChance):SetShow(true)
      ;
      (slot._workerPrice):SetShow(true)
      ;
      (slot._btnResist):SetShow(true)
      if workerWrapperLua:getGrade() >= 4 then
        (slot._upgradeChance):SetMonoTone(true)
        ;
        (slot._upgradeChance):SetFontColor(UI_color.C_FF515151)
        ;
        (slot._upgradeChance):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_WORKERAUCTION_CANNOTUPGRADE"))
      else
        ;
        (slot._upgradeChance):SetMonoTone(false)
        ;
        (slot._upgradeChance):SetFontColor(UI_color.C_FFFF7C67)
        ;
        (slot._upgradeChance):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_WORKERAUCTION_UPGRADECOUNT", "upgradecount", workerUpgradeCount))
      end
      ;
      (slot._workerBG):addInputEvent("Mouse_On", "MyworkerList_ShowWorkerTooltip(true, " .. worker_Index .. ", " .. uiIndex .. ")")
      ;
      (slot._workerBG):addInputEvent("Mouse_Out", "MyworkerList_ShowWorkerTooltip(false)")
      ;
      (slot._workerBG):setTooltipEventRegistFunc("MyworkerList_ShowWorkerTooltip(true, " .. worker_Index .. ", " .. uiIndex .. ")")
      ;
      (slot._btnResist):addInputEvent("Mouse_LUp", "HandleClicked_MyWorkerList_ResistToAuction(" .. worker_Index .. " )")
      uiIndex = uiIndex + 1
    end
  end
  do
    ;
    (UIScroll.SetButtonSize)(self._scroll, self._slotMaxCount, self._listCount)
    if uiIndex < self._listCount then
      (self._scroll):SetShow(true)
    else
      ;
      (self._scroll):SetShow(false)
    end
  end
end

MyworkerList_Close = function()
  -- function num : 0_2
  if not Panel_WorkerList_Auction:IsShow() then
    return 
  end
  Panel_WorkerList_Auction:SetShow(false)
  Panel_WorkerResist_Auction:SetShow(false)
  Panel_Worker_Tooltip:SetShow(false)
  if Panel_WorkerManager:IsUISubApp() then
    Panel_Worker_Tooltip:CloseUISubApp()
  end
end

HandleClicked_MyWorkerList_ResistToAuction = function(worker_Index)
  -- function num : 0_3 , upvalues : MyworkerList
  local self = MyworkerList
  local workerNoRaw = ToClient_getPlantWaitWorkerNoRawByIndex(self.plantKey, worker_Index)
  FGlobal_ResistWorkerToAuction(workerNoRaw)
end

MyworkerList_ScrollEvent = function(isUp)
  -- function num : 0_4 , upvalues : MyworkerList, MyworkerList_Update
  local self = MyworkerList
  self._startIndex = (UIScroll.ScrollEvent)(self._scroll, isUp, self._slotMaxCount, self._listCount, self._startIndex, 1)
  MyworkerList_Update()
end

MyworkerList_ShowWorkerTooltip = function(isShow, worker_Index, uiIndex)
  -- function num : 0_5 , upvalues : MyworkerList
  local self = MyworkerList
  if isShow == true then
    local workerNoRaw = ToClient_getPlantWaitWorkerNoRawByIndex(self.plantKey, worker_Index)
    local uiBase = ((self._slots)[uiIndex])._workerBG
    registTooltipControl(uiBase, Panel_Worker_Tooltip)
    FGlobal_ShowWorkerTooltipByWorkerNoRaw(workerNoRaw, uiBase)
  else
    do
      FGlobal_HideWorkerTooltip()
    end
  end
end

FGlobal_AuctionResist_WorkerList = function()
  -- function num : 0_6 , upvalues : MyworkerList, MyworkerList_Update
  local self = MyworkerList
  self.plantKey = ToClient_convertWaypointKeyToPlantKey(getCurrentWaypointKey())
  if self.plantKey ~= nil then
    self._listCount = ToClient_getPlantWaitWorkerListCount(self.plantKey, 0)
  end
  if self._listCount > 0 then
    local totalSize = Panel_WorkerList_Auction:GetSizeX() * 2 + Panel_Worker_Auction:GetSizeX()
    if totalSize < getScreenSizeX() then
      Panel_WorkerList_Auction:SetPosX(getScreenSizeX() / 2 + Panel_Worker_Auction:GetSizeX() / 2 - 25)
    else
      Panel_WorkerList_Auction:SetPosX(getScreenSizeX() - Panel_WorkerList_Auction:GetSizeX() * 1.1)
    end
    Panel_WorkerList_Auction:SetPosY(Panel_Worker_Auction:GetPosY() + 55)
    Panel_WorkerList_Auction:SetShow(true)
    MyworkerList_Update()
  else
    do
      Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_WORKERAUCTION_NOWORKER"))
      do return  end
    end
  end
end

FGlobal_MyworkerList_Update = function()
  -- function num : 0_7 , upvalues : MyworkerList_Update
  MyworkerList_Update()
end

MyworkerList:Init()

