-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\auction\panel_worker_auction.luac 

-- params : ...
-- function num : 0
Panel_Worker_Auction:SetShow(false)
Panel_Worker_Auction:setMaskingChild(true)
Panel_Worker_Auction:ActiveMouseEventEffect(true)
Panel_Worker_Auction:SetDragEnable(true)
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
local UI_color = Defines.Color
local auctionInfo = RequestGetAuctionInfo()
local workerList = {}
local workerAuction = {
_config = {
slot = {startX = 5, startY = 5, gapY = 115}
, 
skill = {gapX = 4}
, slotCount = 4}
, _mainBG = (UI.getChildControl)(Panel_Worker_Auction, "Static_BG"), _listBG = (UI.getChildControl)(Panel_Worker_Auction, "Static_BG_1"), _topBG = (UI.getChildControl)(Panel_Worker_Auction, "Static_BG_Top"), _btnWinQuestion = (UI.getChildControl)(Panel_Worker_Auction, "Button_Question"), _btnWinClose = (UI.getChildControl)(Panel_Worker_Auction, "Button_Win_Close"), _btnTabMarket = (UI.getChildControl)(Panel_Worker_Auction, "radioButton_MarketList"), _btnTabMine = (UI.getChildControl)(Panel_Worker_Auction, "radioButton_MyList"), _filterBG = (UI.getChildControl)(Panel_Worker_Auction, "Static_FilterBG"), _comboFilterZone = (UI.getChildControl)(Panel_Worker_Auction, "Combobox_Filter_Zone"), _comboFilterTribe = (UI.getChildControl)(Panel_Worker_Auction, "Combobox_Filter_Tribe"), _comboFilterSkill = (UI.getChildControl)(Panel_Worker_Auction, "Combobox_Filter_Skill"), _slots = (Array.new)(), _btnResist = (UI.getChildControl)(Panel_Worker_Auction, "Button_WorkerResist"), _btnBuy = (UI.getChildControl)(Panel_Worker_Auction, "Button_Buy"), _btnReceive = (UI.getChildControl)(Panel_Worker_Auction, "Button_Receive"), _btnCancel = (UI.getChildControl)(Panel_Worker_Auction, "Button_Cancel"), _btnEnd = (UI.getChildControl)(Panel_Worker_Auction, "Button_End"), _radioInvenMoney = (UI.getChildControl)(Panel_Worker_Auction, "RadioButton_Inventory"), _radioWareHouseMoney = (UI.getChildControl)(Panel_Worker_Auction, "RadioButton_Warehouse"), _textInvenMoney = (UI.getChildControl)(Panel_Worker_Auction, "Static_Text_Money1"), _textWareHouseMoney = (UI.getChildControl)(Panel_Worker_Auction, "Static_Text_Money2"), _staticInvenMoney = (UI.getChildControl)(Panel_Worker_Auction, "StaticText_InventoryMoney"), _staticWareHouseMoney = (UI.getChildControl)(Panel_Worker_Auction, "StaticText_WareHouseMoney"), _btnPrev = (UI.getChildControl)(Panel_Worker_Auction, "Button_Prev"), _staticPageNo = (UI.getChildControl)(Panel_Worker_Auction, "Static_PageNo"), _btnNext = (UI.getChildControl)(Panel_Worker_Auction, "Button_Next"), _slotCount = 4, _skillCount = 7, _selectSlotNo = nil, _selectPage = 0, _selectMaxPage = 0, _isTabMine = false, _plantKey = nil, _isPaging = false}
local createAndCopyBasePropertyControlSetPosition = function(fromParent, fromStrID, parent, strID, originalParent)
  -- function num : 0_0
  local ui = (UI.createAndCopyBasePropertyControl)(fromParent, fromStrID, parent, strID)
  if originalParent ~= nil then
    local originalParentUI = (UI.getChildControl)(Panel_Worker_Auction, originalParent)
    local originalUI = (UI.getChildControl)(Panel_Worker_Auction, fromStrID)
    ui:SetPosX(originalUI:GetPosX() - originalParentUI:GetPosX())
    ui:SetPosY(originalUI:GetPosY() - originalParentUI:GetPosY())
  else
    do
      ui:SetPosX(ui:GetPosX() - parent:GetPosX())
      ui:SetPosY(ui:GetPosY() - parent:GetPosY())
      return ui
    end
  end
end

workerAuction.Init = function(self)
  -- function num : 0_1 , upvalues : createAndCopyBasePropertyControlSetPosition
  for ii = 0, self._slotCount - 1 do
    local slot = {}
    slot.slotNo = ii
    slot._panel = Panel_Worker_Auction
    slot._startSlotIndex = 0
    slot._learnSkillCount = 0
    slot._baseSlotBG = createAndCopyBasePropertyControlSetPosition(Panel_Worker_Auction, "Static_LineBG_1", self._listBG, "workerMarket_Slot_" .. ii)
    slot._workerIconBG = createAndCopyBasePropertyControlSetPosition(Panel_Worker_Auction, "Static_WorkerIconBG", slot._baseSlotBG, "workerMarket_Slot_workerIconBG" .. ii, "Static_LineBG_1")
    slot._workerIcon = createAndCopyBasePropertyControlSetPosition(Panel_Worker_Auction, "Static_workerIcon", slot._workerIconBG, "workerMarket_Slot_workerIcon" .. ii, "Static_WorkerIconBG")
    slot._workerLv = createAndCopyBasePropertyControlSetPosition(Panel_Worker_Auction, "Static_WorkerLevel", slot._workerIconBG, "workerMarket_Slot_workerLv" .. ii, "Static_WorkerIconBG")
    slot._workerName = createAndCopyBasePropertyControlSetPosition(Panel_Worker_Auction, "Static_Name", slot._baseSlotBG, "workerMarket_Slot_workerName" .. ii, "Static_LineBG_1")
    slot._workerZone = createAndCopyBasePropertyControlSetPosition(Panel_Worker_Auction, "Static_Zone", slot._baseSlotBG, "workerMarket_Slot_workerZone" .. ii, "Static_LineBG_1")
    slot._workSpeed = createAndCopyBasePropertyControlSetPosition(Panel_Worker_Auction, "Static_WorkSpeed", slot._baseSlotBG, "workerMarket_Slot_workSpeed" .. ii, "Static_LineBG_1")
    slot._workSpeedValue = createAndCopyBasePropertyControlSetPosition(Panel_Worker_Auction, "Static_WorkSpeedValue", slot._baseSlotBG, "workerMarket_Slot_workSpeedValue" .. ii, "Static_LineBG_1")
    slot._moveSpeed = createAndCopyBasePropertyControlSetPosition(Panel_Worker_Auction, "Static_MoveSpeed", slot._baseSlotBG, "workerMarket_Slot_moveSpeed" .. ii, "Static_LineBG_1")
    slot._moveSpeedValue = createAndCopyBasePropertyControlSetPosition(Panel_Worker_Auction, "Static_MoveSpeedValue", slot._baseSlotBG, "workerMarket_Slot_moveSpeedValue" .. ii, "Static_LineBG_1")
    slot._luck = createAndCopyBasePropertyControlSetPosition(Panel_Worker_Auction, "Static_Luck", slot._baseSlotBG, "workerMarket_Slot_luck" .. ii, "Static_LineBG_1")
    slot._luckValue = createAndCopyBasePropertyControlSetPosition(Panel_Worker_Auction, "Static_LuckValue", slot._baseSlotBG, "workerMarket_Slot_luckValue" .. ii, "Static_LineBG_1")
    slot._actionPoint = createAndCopyBasePropertyControlSetPosition(Panel_Worker_Auction, "Static_ActionPoint", slot._baseSlotBG, "workerMarket_Slot_actionPoint" .. ii, "Static_LineBG_1")
    slot._actionPointValue = createAndCopyBasePropertyControlSetPosition(Panel_Worker_Auction, "Static_ActionPointValue", slot._baseSlotBG, "workerMarket_Slot_actionPointValue" .. ii, "Static_LineBG_1")
    slot._upgradeChance = createAndCopyBasePropertyControlSetPosition(Panel_Worker_Auction, "Static_UpgradeChance", slot._baseSlotBG, "workerMarket_Slot_upgradeChance" .. ii, "Static_LineBG_1")
    slot._upgradeChanceValue = createAndCopyBasePropertyControlSetPosition(Panel_Worker_Auction, "Static_UpgradeChanceValue", slot._baseSlotBG, "workerMarket_Slot_upgradeChanceValue" .. ii, "Static_LineBG_1")
    slot._workerPrice = createAndCopyBasePropertyControlSetPosition(Panel_Worker_Auction, "Static_Price", slot._baseSlotBG, "workerMarket_Slot_workerPrice" .. ii, "Static_LineBG_1")
    slot._workerPriceValue = createAndCopyBasePropertyControlSetPosition(Panel_Worker_Auction, "Static_PriceValue", slot._baseSlotBG, "workerMarket_Slot_workerPriceValue" .. ii, "Static_LineBG_1")
    slot._SkillBG = createAndCopyBasePropertyControlSetPosition(Panel_Worker_Auction, "Static_WorkerSkillSlotBG", slot._baseSlotBG, "workerMarket_Slot_SkillBG" .. ii, "Static_LineBG_1")
    slot._skill = (Array.new)()
    for jj = 0, self._skillCount - 1 do
      local skill = {}
      skill._SkillIconBG = createAndCopyBasePropertyControlSetPosition(Panel_Worker_Auction, "Static_SkillIconBG_01", slot._SkillBG, "workerMarket_Slot_slotSkillIconBG" .. ii .. "_" .. jj, "Static_WorkerSkillSlotBG")
      ;
      (skill._SkillIconBG):SetPosX(jj * (((self._config).skill).gapX + (skill._SkillIconBG):GetSizeX()))
      skill._SkillIcon = createAndCopyBasePropertyControlSetPosition(Panel_Worker_Auction, "Static_SkillSlot_01", slot._SkillBG, "workerMarket_Slot_slotSkillIcon" .. ii .. "_" .. jj, "Static_WorkerSkillSlotBG")
      ;
      (skill._SkillIcon):SetPosX(jj * (((self._config).skill).gapX + (skill._SkillIconBG):GetSizeX()))
      -- DECOMPILER ERROR at PC257: Confused about usage of register: R11 in 'UnsetPending'

      ;
      (slot._skill)[jj] = skill
    end
    slot._btnBuy = createAndCopyBasePropertyControlSetPosition(Panel_Worker_Auction, "Button_Buy", slot._baseSlotBG, "workerMarket_Slot_buttonBuy" .. ii, "Static_LineBG_1")
    slot._btnReceive = createAndCopyBasePropertyControlSetPosition(Panel_Worker_Auction, "Button_Receive", slot._baseSlotBG, "workerMarket_Slot_buttonReceive" .. ii, "Static_LineBG_1")
    slot._btnCancel = createAndCopyBasePropertyControlSetPosition(Panel_Worker_Auction, "Button_Cancel", slot._baseSlotBG, "workerMarket_Slot_buttonCancel" .. ii, "Static_LineBG_1")
    slot._btnEnd = createAndCopyBasePropertyControlSetPosition(Panel_Worker_Auction, "Button_End", slot._baseSlotBG, "workerMarket_Slot_buttonEnd" .. ii, "Static_LineBG_1")
    ;
    (self._btnPrev):SetAutoDisableTime(1)
    ;
    (self._btnNext):SetAutoDisableTime(1)
    ;
    (slot._btnBuy):SetAutoDisableTime(3)
    ;
    (slot._btnReceive):SetAutoDisableTime(3)
    ;
    (slot._btnCancel):SetAutoDisableTime(3)
    ;
    (slot._btnEnd):SetAutoDisableTime(3)
    local slotConfig = (self._config).slot
    ;
    (slot._baseSlotBG):SetPosX(slotConfig.startX)
    ;
    (slot._baseSlotBG):SetPosY(slotConfig.startY + slotConfig.gapY * ii)
    -- DECOMPILER ERROR at PC337: Confused about usage of register: R7 in 'UnsetPending'

    ;
    (self._slots)[ii] = slot
  end
  ;
  (self._btnWinQuestion):SetShow(false)
  ;
  (self._filterBG):SetShow(false)
  ;
  (self._comboFilterZone):SetShow(false)
  ;
  (self._comboFilterTribe):SetShow(false)
  ;
  (self._comboFilterSkill):SetShow(false)
  ;
  (self._btnResist):SetShow(true)
  Panel_Worker_Auction:SetSize(Panel_Worker_Auction:GetSizeX(), Panel_Worker_Auction:GetSizeY() - 35)
  ;
  (self._mainBG):SetSize((self._mainBG):GetSizeX(), 515)
  ;
  (self._listBG):SetSize((self._listBG):GetSizeX(), 465)
  ;
  (self._listBG):SetPosY((self._topBG):GetPosY() + (self._topBG):GetSizeY() + 5)
  ;
  (self._radioInvenMoney):ComputePos()
  ;
  (self._radioWareHouseMoney):ComputePos()
  ;
  (self._textInvenMoney):ComputePos()
  ;
  (self._textWareHouseMoney):ComputePos()
  ;
  (self._staticInvenMoney):ComputePos()
  ;
  (self._staticWareHouseMoney):ComputePos()
  ;
  (self._btnPrev):ComputePos()
  ;
  (self._staticPageNo):ComputePos()
  ;
  (self._btnNext):ComputePos()
  ;
  (self._btnPrev):SetEnable(false)
  ;
  (self._btnNext):SetEnable(false)
  ;
  (self._btnTabMarket):SetCheck(true)
  ;
  (self._radioInvenMoney):SetCheck(false)
  ;
  (self._radioWareHouseMoney):SetCheck(true)
end

workerAuction.registEventHandler = function(self)
  -- function num : 0_2
  (self._btnWinClose):addInputEvent("Mouse_LUp", "WorkerAuction_Close()")
  ;
  (self._btnTabMarket):addInputEvent("Mouse_LUp", "workerAuction_TabEvent( false )")
  ;
  (self._btnTabMine):addInputEvent("Mouse_LUp", "workerAuction_TabEvent( true )")
  ;
  (self._btnResist):addInputEvent("Mouse_LUp", "FGlobal_AuctionResist_WorkerList()")
  ;
  (self._btnNext):addInputEvent("Mouse_LUp", "WorkerAuction_NextPage()")
  ;
  (self._btnPrev):addInputEvent("Mouse_LUp", "WorkerAuction_PrevPage()")
end

workerAuction.Update = function(self)
  -- function num : 0_3 , upvalues : workerAuction, workerList, auctionInfo, UI_color
  WorkerAuction_UpdateMoney()
  local self = workerAuction
  for ii = 0, self._slotCount - 1 do
    local slot = (self._slots)[ii]
    ;
    (slot._baseSlotBG):SetShow(false)
  end
  workerList = {}
  local startSlotNo = 0
  local endSlotNo = 0
  do
    if workerAuction_IsTabMine() then
      startSlotNo = self._selectPage * self._slotCount
      endSlotNo = startSlotNo + self._slotCount - 1
      local maxCount = auctionInfo:getWorkerAuctionCount()
      self._selectMaxPage = (math.floor)(maxCount / self._slotCount) - 1
      if maxCount % self._slotCount > 0 then
        self._selectMaxPage = self._selectMaxPage + 1
      end
    else
      do
        endSlotNo = auctionInfo:getWorkerAuctionCount()
        local uiIdx = 0
        do
          for index = startSlotNo, endSlotNo do
            local workerNoRaw = auctionInfo:getWorkerAuction(index)
            local workerWrapper = getWorkerWrapperByAuction(workerNoRaw, true)
            -- DECOMPILER ERROR at PC65: Confused about usage of register: R11 in 'UnsetPending'

            workerList[index] = workerWrapper
            if workerWrapper ~= nil then
              local slot = (self._slots)[uiIdx]
              local workerIcon = workerWrapper:getWorkerIcon()
              local workerLv = workerWrapper:getLevel()
              local workerName = workerWrapper:getName()
              local workerPrice = auctionInfo:getWorkerAuctionPrice(workerNoRaw)
              local workerZone = workerWrapper:getHomeWaypoint()
              local workerUpgradeCount = workerWrapper:getUpgradePoint()
              local moveSpeedValue = workerWrapper:getMoveSpeed()
              local luckValue = workerWrapper:getLuck()
              local actionPointValue = workerWrapper:getActionPoint()
              local workerZoneName = ToClient_GetNodeNameByWaypointKey(workerZone)
              local workSpeedValue = 0
              if workSpeedValue < workerWrapper:getWorkEfficiency(2) then
                workSpeedValue = workerWrapper:getWorkEfficiency(2)
              end
              if workSpeedValue < workerWrapper:getWorkEfficiency(5) then
                workSpeedValue = workerWrapper:getWorkEfficiency(5)
              end
              if workSpeedValue < workerWrapper:getWorkEfficiency(6) then
                workSpeedValue = workerWrapper:getWorkEfficiency(6)
              end
              if workSpeedValue < workerWrapper:getWorkEfficiency(8) then
                workSpeedValue = workerWrapper:getWorkEfficiency(8)
              end
              ;
              (slot._workerIcon):ChangeTextureInfoName(workerIcon)
              ;
              (slot._workerLv):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_LV") .. "." .. tostring(workerLv))
              ;
              (slot._workerName):SetText(workerWrapper:getGradeToColorString() .. workerName .. "<PAColor0xffc4bebe> (" .. workerZoneName .. ")<PAOldColor>")
              ;
              (slot._upgradeChanceValue):SetText(tostring(workerUpgradeCount))
              ;
              (slot._moveSpeedValue):SetText((string.format)("%.2f", moveSpeedValue / 100))
              ;
              (slot._workSpeedValue):SetText((string.format)("%.2f", workSpeedValue / 1000000))
              ;
              (slot._luckValue):SetText((string.format)("%.2f", luckValue / 10000))
              ;
              (slot._actionPointValue):SetText(tostring(actionPointValue))
              ;
              (slot._workerPriceValue):SetText(makeDotMoney(workerPrice))
              ;
              (slot._upgradeChanceValue):SetPosX((slot._upgradeChance):GetPosX() + (slot._upgradeChance):GetTextSizeX() + 10)
              ;
              (slot._baseSlotBG):SetShow(true)
              ;
              (slot._workerIcon):SetShow(true)
              ;
              (slot._workerLv):SetShow(true)
              ;
              (slot._workerName):SetShow(true)
              ;
              (slot._workerZone):SetShow(false)
              ;
              (slot._upgradeChanceValue):SetShow(true)
              ;
              (slot._moveSpeedValue):SetShow(true)
              ;
              (slot._workSpeedValue):SetShow(true)
              ;
              (slot._luckValue):SetShow(true)
              ;
              (slot._actionPointValue):SetShow(true)
              if workerWrapper:getGrade() >= 4 then
                (slot._upgradeChance):SetMonoTone(true)
                ;
                (slot._upgradeChance):SetFontColor(UI_color.C_FF515151)
                ;
                (slot._upgradeChance):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_WORKERAUCTION_CANNOTUPGRADE"))
                ;
                (slot._upgradeChanceValue):SetShow(false)
              else
                ;
                (slot._upgradeChance):SetMonoTone(false)
                ;
                (slot._upgradeChance):SetFontColor(UI_color.C_FFFF7C67)
                ;
                (slot._upgradeChance):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_WORKERAUCTION_UPGRADECHANCE"))
                ;
                (slot._upgradeChanceValue):SetShow(true)
              end
              if workerWrapper:isMine() == true then
                (slot._btnBuy):SetEnable(false)
                ;
                (slot._btnBuy):SetMonoTone(true)
                ;
                (slot._btnBuy):SetFontColor(UI_color.C_FF515151)
                ;
                (slot._btnBuy):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_WORKERAUCTION_MYWORKER"))
              else
                ;
                (slot._btnBuy):SetEnable(true)
                ;
                (slot._btnBuy):SetMonoTone(false)
                ;
                (slot._btnBuy):SetFontColor(UI_color.C_FFEFEFEF)
                ;
                (slot._btnBuy):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_WORKERAUCTION_BUYWORKER"))
              end
              ;
              (slot._btnBuy):addInputEvent("Mouse_LUp", "WorkerAuction_Buy(" .. index .. ")")
              ;
              (slot._btnReceive):addInputEvent("Mouse_LUp", "WorkerAuction_Receive(" .. index .. ")")
              ;
              (slot._btnCancel):addInputEvent("Mouse_LUp", "WorkerAuction_Cancel(" .. index .. ")")
              for ii = 0, self._skillCount - 1 do
                (((slot._skill)[ii])._SkillIconBG):SetShow(false)
                ;
                (((slot._skill)[ii])._SkillIcon):SetShow(false)
              end
              workerWrapper:foreachSkillList(function(skillIdx, skillStaticStatusWrapper)
    -- function num : 0_3_0 , upvalues : slot, index, uiIdx
    if (slot._skill)[skillIdx] == nil then
      return true
    end
    ;
    (((slot._skill)[skillIdx])._SkillIconBG):SetShow(true)
    ;
    (((slot._skill)[skillIdx])._SkillIcon):SetShow(true)
    ;
    (((slot._skill)[skillIdx])._SkillIcon):ChangeTextureInfoName(skillStaticStatusWrapper:getIconPath())
    ;
    (((slot._skill)[skillIdx])._SkillIcon):addInputEvent("Mouse_On", "workerAuction_SkillTooltip( true, " .. index .. ", " .. uiIdx .. ", " .. skillIdx .. ")")
    ;
    (((slot._skill)[skillIdx])._SkillIcon):addInputEvent("Mouse_Out", "workerAuction_SkillTooltip( false )")
    return false
  end
)
              slot._learnSkillCount = 0
              local tempIndex = 0
              local slotIndex = 0
              ;
              (slot._btnBuy):SetShow(false)
              ;
              (slot._btnReceive):SetShow(false)
              ;
              (slot._btnCancel):SetShow(false)
              ;
              (slot._btnEnd):SetShow(false)
              if workerAuction_IsTabMine() then
                (slot._btnBuy):SetShow(false)
                local isEndAuction = auctionInfo:getWorkerAuctionEnd(workerNoRaw)
                if isEndAuction == true then
                  (slot._btnReceive):SetShow(true)
                else
                  ;
                  (slot._btnCancel):SetShow(true)
                end
              else
                do
                  do
                    ;
                    (slot._btnBuy):SetShow(true)
                    uiIdx = uiIdx + 1
                    -- DECOMPILER ERROR at PC442: LeaveBlock: unexpected jumping out DO_STMT

                    -- DECOMPILER ERROR at PC442: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                    -- DECOMPILER ERROR at PC442: LeaveBlock: unexpected jumping out IF_STMT

                    -- DECOMPILER ERROR at PC442: LeaveBlock: unexpected jumping out IF_THEN_STMT

                    -- DECOMPILER ERROR at PC442: LeaveBlock: unexpected jumping out IF_STMT

                  end
                end
              end
            end
          end
        end
        ;
        (self._staticPageNo):SetText(self._selectPage + 1)
      end
    end
  end
end

workerAuction_SkillTooltip = function(isShow, dataIdx, uiIdx, skillIdx)
  -- function num : 0_4 , upvalues : auctionInfo, workerAuction
  if isShow == true then
    local workerNoRaw = auctionInfo:getWorkerAuction(dataIdx)
    local workerWrapperLua = getWorkerWrapperByAuction(workerNoRaw, true)
    local skillSSW = workerWrapperLua:getSkillSSW(skillIdx)
    local slot = (workerAuction._slots)[uiIdx]
    local uiControl = ((slot._skill)[skillIdx])._SkillIcon
    local name = skillSSW:getName()
    local desc = skillSSW:getDescription()
    TooltipSimple_Show(uiControl, name, desc)
  else
    do
      TooltipSimple_Hide()
    end
  end
end

workerAuction_TabEvent = function(isTabMine)
  -- function num : 0_5 , upvalues : workerAuction
  local self = workerAuction
  workerAuction_TabToList(isTabMine)
end

workerAuction_TabToList = function(isTabMine)
  -- function num : 0_6 , upvalues : workerAuction
  local self = workerAuction
  self._selectPage = 0
  self._selectMaxPage = 0
  self._isTabMine = isTabMine
  if workerAuction_IsTabMine() then
    requestMyWorkerList()
  else
    RequestAuctionListPage((CppEnums.AuctionType).AuctionGoods_WorkerNpc)
  end
end

workerAuction_IsTabMine = function()
  -- function num : 0_7 , upvalues : workerAuction
  local self = workerAuction
  return self._isTabMine
end

WorkerAuction_PrevPage = function()
  -- function num : 0_8 , upvalues : workerAuction
  local self = workerAuction
  -- DECOMPILER ERROR at PC10: Unhandled construct in 'MakeBoolean' P1

  if workerAuction_IsTabMine() and self._selectPage > 0 then
    self._selectPage = self._selectPage - 1
    self._isPaging = true
    workerAuction:Update()
  end
  if self._selectPage > 0 then
    self._selectPage = self._selectPage - 1
    self._isPaging = true
    ;
    (self._btnPrev):SetEnable(false)
    ;
    (self._btnNext):SetEnable(false)
    RequestAuctionPrevPage()
  else
    return 
  end
end

WorkerAuction_NextPage = function()
  -- function num : 0_9 , upvalues : workerAuction
  local self = workerAuction
  if workerAuction_IsTabMine() then
    if self._selectMaxPage <= self._selectPage then
      return 
    end
    self._selectPage = self._selectPage + 1
    self._isPaging = true
    workerAuction:Update()
  else
    self._selectPage = self._selectPage + 1
    self._isPaging = true
    ;
    (self._btnPrev):SetEnable(false)
    ;
    (self._btnNext):SetEnable(false)
    RequestAuctionNextPage()
  end
end

WorkerAuction_Buy = function(slotNo)
  -- function num : 0_10 , upvalues : workerAuction, auctionInfo
  local self = workerAuction
  self._selectSlotNo = slotNo
  local workerNoRaw = auctionInfo:getWorkerAuction(self._selectSlotNo)
  local workerWrapper = getWorkerWrapperByAuction(workerNoRaw, true)
  local workerLv = workerWrapper:getLevel()
  local workerName = workerWrapper:getName()
  local workerPrice = auctionInfo:getWorkerAuctionPrice(workerNoRaw)
  local titleString = PAGetString(Defines.StringSheet_GAME, "LUA_WORKERAUCTION_BUYCONFIRM")
  local contentString = workerWrapper:getGradeToColorString() .. PAGetStringParam3(Defines.StringSheet_GAME, "LUA_WORKERAUCTION_BUYCONFIRM_TITLE", "level", tostring(workerLv), "name", workerName, "price", makeDotMoney(workerPrice)) .. "<PAOldColor>"
  local messageboxData = {title = titleString, content = contentString, functionYes = WorkerAuction_BuyXXX, functionCancel = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
  ;
  (MessageBox.showMessageBox)(messageboxData)
end

WorkerAuction_BuyXXX = function()
  -- function num : 0_11 , upvalues : workerAuction, auctionInfo
  local self = workerAuction
  local workerNoRaw = auctionInfo:getWorkerAuction(self._selectSlotNo)
  local fromWhereType = (CppEnums.ItemWhereType).eInventory
  if (self._radioWareHouseMoney):IsCheck() then
    fromWhereType = (CppEnums.ItemWhereType).eWarehouse
  end
  auctionInfo:requestBuyItNowWorker(workerNoRaw, fromWhereType)
  self._selectSlotNo = nil
end

WorkerAuction_Cancel = function(slotNo)
  -- function num : 0_12 , upvalues : workerAuction, auctionInfo
  local self = workerAuction
  self._selectSlotNo = slotNo
  local workerNoRaw = auctionInfo:getWorkerAuction(self._selectSlotNo)
  local workerWrapper = getWorkerWrapperByAuction(workerNoRaw, true)
  local workerLv = workerWrapper:getLevel()
  local workerName = workerWrapper:getName()
  local titleString = PAGetString(Defines.StringSheet_GAME, "LUA_WORKERAUCTION_CANCELCONFIRM")
  local contentString = workerWrapper:getGradeToColorString() .. PAGetStringParam2(Defines.StringSheet_GAME, "LUA_WORKERAUCTION_CANCELCONFIRM_TITLE", "level", tostring(workerLv), "name", workerName) .. "<PAOldColor>"
  local messageboxData = {title = titleString, content = contentString, functionYes = WorkerAuction_CancelXXX, functionCancel = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
  ;
  (MessageBox.showMessageBox)(messageboxData)
end

WorkerAuction_CancelXXX = function()
  -- function num : 0_13 , upvalues : workerAuction, auctionInfo
  local self = workerAuction
  local workerNoRaw = auctionInfo:getWorkerAuction(self._selectSlotNo)
  ToClient_requestCancelRegisterMyWorkerAuction(workerNoRaw)
  self._selectSlotNo = nil
end

WorkerAuction_Receive = function(slotNo)
  -- function num : 0_14 , upvalues : workerAuction, auctionInfo
  local self = workerAuction
  self._selectSlotNo = slotNo
  local workerNoRaw = auctionInfo:getWorkerAuction(self._selectSlotNo)
  local fromWhereType = (CppEnums.ItemWhereType).eInventory
  if (self._radioWareHouseMoney):IsCheck() then
    fromWhereType = (CppEnums.ItemWhereType).eWarehouse
  end
  auctionInfo:requestPopWorkerPrice(workerNoRaw, fromWhereType)
  self._selectSlotNo = nil
end

WorkerAuction_Open = function()
  -- function num : 0_15
end

WorkerAuction_Close = function()
  -- function num : 0_16
  if not Panel_Worker_Auction:IsShow() then
    return 
  end
  Panel_Worker_Auction:SetShow(false)
  Panel_WorkerList_Auction:SetShow(false)
  Panel_WorkerResist_Auction:SetShow(false)
end

WorkerAuction_UpdateMoney = function()
  -- function num : 0_17 , upvalues : workerAuction
  local self = workerAuction
  ;
  (self._staticInvenMoney):SetText(makeDotMoney((((getSelfPlayer()):get()):getInventory()):getMoney_s64()))
  ;
  (self._staticWareHouseMoney):SetText(makeDotMoney(warehouse_moneyFromNpcShop_s64()))
end

FromClient_ResponseWorkerAuction = function()
  -- function num : 0_18 , upvalues : workerAuction
  if Panel_Window_WorkerRandomSelect:IsShow() then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_WORKERAUCTION_COMPLETE_WORKERCONTRACT"))
  else
    local totalSizeY = Panel_Npc_Dialog:GetSizeY() * 2 + Panel_Worker_Auction:GetSizeY()
    local subSizeY = Panel_Npc_Dialog:GetSizeY() + Panel_Worker_Auction:GetSizeY()
    Panel_Worker_Auction:SetPosX(getScreenSizeX() / 2 - Panel_Worker_Auction:GetSizeX() / 2)
    if totalSizeY < getScreenSizeY() then
      Panel_Worker_Auction:SetPosY(getScreenSizeY() - Panel_Npc_Dialog:GetSizeY() - Panel_Worker_Auction:GetSizeY())
    else
      if getScreenSizeY() < subSizeY then
        Panel_Worker_Auction:SetPosY(5)
      else
        Panel_Worker_Auction:SetPosY(getScreenSizeY() / 2 - Panel_Worker_Auction:GetSizeY() / 2)
      end
    end
    Panel_Worker_Auction:SetShow(true)
    local self = workerAuction
    ;
    (self._btnTabMarket):SetCheck(true)
    ;
    (self._btnTabMine):SetCheck(false)
    if self._isPaging ~= true then
      self._selectPage = 0
    end
    self._isTabMine = false
    workerAuction:Update()
    self._isPaging = false
    ;
    (self._btnPrev):SetEnable(true)
    ;
    (self._btnNext):SetEnable(true)
    warehouse_requestInfoFromNpc()
  end
end

FromClient_ResponseMyWorkerAuction = function()
  -- function num : 0_19 , upvalues : workerAuction
  self = workerAuction
  -- DECOMPILER ERROR at PC7: Confused about usage of register: R0 in 'UnsetPending'

  if self._isPaging == false then
    self._selectPage = 0
  end
  -- DECOMPILER ERROR at PC9: Confused about usage of register: R0 in 'UnsetPending'

  self._isTabMine = true
  workerAuction:Update()
  -- DECOMPILER ERROR at PC14: Confused about usage of register: R0 in 'UnsetPending'

  self._isPaging = false
end

FromClient_RegistAuction = function()
  -- function num : 0_20 , upvalues : workerAuction
  Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_WORKERAUCTION_REGISTCOMPLETE"))
  workerAuction:Update()
  FGlobal_MyworkerList_Update()
end

FromClient_BuyWorkerAuction = function()
  -- function num : 0_21 , upvalues : workerAuction
  Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_WORKERAUCTION_BUYCOMPLETE"))
  workerAuction:Update()
end

FromClient_PopWorkerPriceAuction = function()
  -- function num : 0_22 , upvalues : workerAuction
  Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_WORKERAUCTION_RECEIVE_PRICE"))
  workerAuction:Update()
end

FromClient_CancelRegistAuction = function()
  -- function num : 0_23 , upvalues : workerAuction
  Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_WORKERAUCTION_COMPLETE_CANCELREGIST"))
  workerAuction:Update()
end

registerEvent("EventWarehouseUpdate", "WorkerAuction_UpdateMoney")
registerEvent("FromClient_ResponseWorkerAuction", "FromClient_ResponseWorkerAuction")
registerEvent("FromClient_ResponseMyWorkerAuction", "FromClient_ResponseMyWorkerAuction")
registerEvent("FromClient_RegistAuction", "FromClient_RegistAuction")
registerEvent("FromClient_BuyWorkerAuction", "FromClient_BuyWorkerAuction")
registerEvent("FromClient_PopWorkerPriceAuction", "FromClient_PopWorkerPriceAuction")
registerEvent("FromClient_CancelRegistAuction", "FromClient_CancelRegistAuction")
workerAuction:Init()
workerAuction:registEventHandler()

