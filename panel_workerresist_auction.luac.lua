-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\window\auction\panel_workerresist_auction.luac 

-- params : ...
-- function num : 0
Panel_WorkerResist_Auction:SetShow(false)
Panel_WorkerResist_Auction:setMaskingChild(true)
Panel_WorkerResist_Auction:ActiveMouseEventEffect(true)
Panel_WorkerResist_Auction:SetDragEnable(true)
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
local UI_color = Defines.Color
local resistWorker = {_btnConfirm = (UI.getChildControl)(Panel_WorkerResist_Auction, "Button_Confirm"), _btnCancel = (UI.getChildControl)(Panel_WorkerResist_Auction, "Button_Cancel"), _iconBG = (UI.getChildControl)(Panel_WorkerResist_Auction, "Static_IconBG"), _icon = (UI.getChildControl)(Panel_WorkerResist_Auction, "Static_Icon"), _statusBG = (UI.getChildControl)(Panel_WorkerResist_Auction, "Static_StatusBack"), _workerName = (UI.getChildControl)(Panel_WorkerResist_Auction, "StaticText_WorkerName"), _workSpeed = (UI.getChildControl)(Panel_WorkerResist_Auction, "Static_WorkSpeed"), _workSpeedValue = (UI.getChildControl)(Panel_WorkerResist_Auction, "Static_WorkSpeedValue"), _moveSpeed = (UI.getChildControl)(Panel_WorkerResist_Auction, "Static_MoveSpeed"), _moveSpeedValue = (UI.getChildControl)(Panel_WorkerResist_Auction, "Static_MoveSpeedValue"), _luck = (UI.getChildControl)(Panel_WorkerResist_Auction, "Static_Luck"), _luckValue = (UI.getChildControl)(Panel_WorkerResist_Auction, "Static_LuckValue"), _actionPoint = (UI.getChildControl)(Panel_WorkerResist_Auction, "Static_ActionPoint"), _actionPointValue = (UI.getChildControl)(Panel_WorkerResist_Auction, "Static_ActionPointValue"), _priceBG = (UI.getChildControl)(Panel_WorkerResist_Auction, "Static_PriceBG"), _workerPrice = (UI.getChildControl)(Panel_WorkerResist_Auction, "StaticText_WorkerPrice"), _taxhelp = (UI.getChildControl)(Panel_WorkerResist_Auction, "StaticText_TaxHelp"), _workerNoRaw = nil}
resistWorker.Init = function(self)
  -- function num : 0_0
  (self._btnConfirm):SetShow(true)
  ;
  (self._btnCancel):SetShow(true)
  ;
  (self._iconBG):SetShow(true)
  ;
  (self._icon):SetShow(true)
  ;
  (self._statusBG):SetShow(true)
  ;
  (self._workerName):SetShow(true)
  ;
  (self._workSpeed):SetShow(true)
  ;
  (self._workSpeedValue):SetShow(true)
  ;
  (self._moveSpeed):SetShow(true)
  ;
  (self._moveSpeedValue):SetShow(true)
  ;
  (self._luck):SetShow(true)
  ;
  (self._luckValue):SetShow(true)
  ;
  (self._actionPoint):SetShow(true)
  ;
  (self._actionPointValue):SetShow(true)
  ;
  (self._priceBG):SetShow(true)
  ;
  (self._workerPrice):SetShow(true)
  local percent = 30
  ;
  (self._taxhelp):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_PANEL_WORKERRESIST_AUCTION_DESC", "per", percent))
end

resistWorker.Update = function(self)
  -- function num : 0_1
  local workerNoRaw = self._workerNoRaw
  local workerWrapperLua = getWorkerWrapper(workerNoRaw, false)
  if workerWrapperLua == nil then
    return 
  end
  local workerIcon = workerWrapperLua:getWorkerIcon()
  local workSpeedValue = 0
  if workSpeedValue < workerWrapperLua:getWorkEfficiency(2) then
    workSpeedValue = workerWrapperLua:getWorkEfficiency(2)
  end
  if workSpeedValue < workerWrapperLua:getWorkEfficiency(5) then
    workSpeedValue = workerWrapperLua:getWorkEfficiency(5)
  end
  if workSpeedValue < workerWrapperLua:getWorkEfficiency(6) then
    workSpeedValue = workerWrapperLua:getWorkEfficiency(6)
  end
  if workSpeedValue < workerWrapperLua:getWorkEfficiency(8) then
    workSpeedValue = workerWrapperLua:getWorkEfficiency(8)
  end
  ;
  (self._icon):ChangeTextureInfoName(workerIcon)
  ;
  (self._workerName):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_LV") .. "." .. workerWrapperLua:getLevel() .. " " .. workerWrapperLua:getGradeToColorString() .. workerWrapperLua:getName() .. "<PAOldColor>")
  ;
  (self._workSpeedValue):SetText((string.format)("%.2f", workSpeedValue / 1000000))
  ;
  (self._moveSpeedValue):SetText((string.format)("%.2f", workerWrapperLua:getMoveSpeed() / 100))
  ;
  (self._luckValue):SetText((string.format)("%.2f", workerWrapperLua:getLuck() / 10000))
  ;
  (self._actionPointValue):SetText(tostring(workerWrapperLua:getActionPoint()))
  ;
  (self._workerPrice):SetText(makeDotMoney(workerWrapperLua:getWorkerMaxPrice()))
end

resistWorker.registEventHandler = function(self)
  -- function num : 0_2
  (self._btnConfirm):addInputEvent("Mouse_LUp", "HandleClicked_ResistWorker_BuyConfirm()")
  ;
  (self._btnCancel):addInputEvent("Mouse_LUp", "HandleClicked_ResistWorker_BuyCancel()")
end

HandleClicked_ResistWorker_BuyCancel = function()
  -- function num : 0_3
  FGlobal_ResistWorker_BuyCancel()
end

HandleClicked_ResistWorker_BuyConfirm = function()
  -- function num : 0_4 , upvalues : resistWorker
  local self = resistWorker
  local workerNoRaw = self._workerNoRaw
  local workerWrapperLua = getWorkerWrapper(workerNoRaw, false)
  local transferType = 0
  if workerWrapperLua:checkValidWorkerPrice(workerWrapperLua:getWorkerMaxPrice()) == true then
    ToClient_requestRegisterNpcWorkerAuction(workerNoRaw, transferType, workerWrapperLua:getWorkerMaxPrice())
    Panel_WorkerResist_Auction:SetShow(false)
  end
end

FGlobal_ResistWorker_BuyCancel = function()
  -- function num : 0_5
  if Panel_WorkerResist_Auction:GetShow() == false then
    return 
  end
  Panel_WorkerResist_Auction:SetShow(false)
end

FGlobal_ResistWorkerToAuction = function(workerNoRaw)
  -- function num : 0_6 , upvalues : resistWorker
  local self = resistWorker
  if Int64toInt32(workerNoRaw) == 0 then
    return 
  end
  self._workerNoRaw = workerNoRaw
  if Panel_WorkerResist_Auction:GetShow() == false then
    Panel_WorkerResist_Auction:SetShow(true)
  end
  resistWorker:Update()
end

FGlobal_ResistWorkerToAuction_Close = function()
  -- function num : 0_7
  Panel_WorkerResist_Auction:SetShow(false)
end

resistWorker:Init()
resistWorker:registEventHandler()

