-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\auction\panel_territoryauthority_auction.luac 

-- params : ...
-- function num : 0
Panel_TerritoryAuth_Auction:SetShow(false, false)
Panel_TerritoryAuth_Auction:setMaskingChild(true)
Panel_TerritoryAuth_Auction:ActiveMouseEventEffect(true)
Panel_TerritoryAuth_Auction:RegisterShowEventFunc(true, "TerritoryAuth_AuctionShowAni()")
Panel_TerritoryAuth_Auction:RegisterShowEventFunc(false, "TerritoryAuth_AuctionHideAni()")
Panel_TerritoryAuth_Auction:setGlassBackground(true)
TerritoryAuth_AuctionShowAni = function()
  -- function num : 0_0
  (UIAni.fadeInSCR_Down)(Panel_TerritoryAuth_Auction)
end

TerritoryAuth_AuctionHideAni = function()
  -- function num : 0_1
  (UIAni.closeAni)(Panel_TerritoryAuth_Auction)
end

local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
local UI_TM = CppEnums.TextMode
local UI_color = Defines.Color
local screenX, screenY = nil, nil
local maxCount = 5
local minBid = 10000
local isEnableSupplyTrade = ToClient_IsContentsGroupOpen("22")
local closeBtn = (UI.getChildControl)(Panel_TerritoryAuth_Auction, "Button_Win_Close")
local bidBtn = (UI.getChildControl)(Panel_TerritoryAuth_Auction, "Button_Biding")
local withdrawBidprice = (UI.getChildControl)(Panel_TerritoryAuth_Auction, "Button_MoneyBack")
local txtExplain = (UI.getChildControl)(Panel_TerritoryAuth_Auction, "StaticText_Explain")
local txtBidinFinish = (UI.getChildControl)(Panel_TerritoryAuth_Auction, "StaticText_BiddingFinish")
local txtRemainTime = (UI.getChildControl)(Panel_TerritoryAuth_Auction, "StaticText_Remain_Time")
local editBidPrice = (UI.getChildControl)(Panel_TerritoryAuth_Auction, "Edit_BidPrice")
local slotBG = (UI.getChildControl)(Panel_TerritoryAuth_Auction, "Static_SlotBG")
closeBtn:addInputEvent("Mouse_LUp", "Button_TerritoryAuthAuctionClose_Click()")
bidBtn:addInputEvent("Mouse_LUp", "Button_TerritoryAuthAuctionBid_Click()")
txtExplain:SetTextMode(UI_TM.eTextMode_AutoWrap)
editBidPrice:SetNumberMode(true)
local slotConfig = {createIcon = true, createBorder = true, createCount = true, createCooltime = true, createCash = true}
local slots = {}
local slot_BG = {}
TerritoryAuth_Resize = function()
  -- function num : 0_2
end

EventNotifyResponseAuctionInfo = function(goodsType, sendType, tempStr, tempStr2, bidRv, param1)
  -- function num : 0_3
  local strGoodsType = ""
  local msg = ""
  if goodsType == (CppEnums.AuctionType).AuctionGoods_House then
    if not ToClient_IsContentsGroupOpen("36") then
      return 
    end
    strGoodsType = PAGetString(Defines.StringSheet_GAME, "LUA_TERRITORYAUTHORITY_AUCTION_STRGOODSTYPE")
    if sendType == 0 then
      msg = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_TERRITORYAUTHORITY_AUCTION_SENDTYPE0_MSG", "tempStr", tempStr) .. " " .. PAGetString(Defines.StringSheet_GAME, "LUA_TERRITORYAUTHORITY_MESSAGE_7")
    else
      if sendType == 1 then
        if bidRv == 0 then
          msg = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_TERRITORYAUTHORITY_AUCTION_SENDTYPE1_MSG1", "tempStr", tempStr, "tempStr2", tempStr2)
        else
          msg = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_TERRITORYAUTHORITY_AUCTION_SENDTYPE1_MSG2", "tempStr", tempStr)
        end
      else
        _PA_ASSERT(false, "작업해주세요")
      end
    end
  else
    if goodsType == (CppEnums.AuctionType).AuctionGoods_TerritoryTradeAuthority then
      strGoodsType = PAGetString(Defines.StringSheet_GAME, "LUA_TERRITORYAUTHORITY_MESSAGE_9")
      if sendType == 0 then
        msg = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_TERRITORYAUTHORITY_AUCTION_AUCTION", "tempStr", tempStr, "strGoodsType", strGoodsType) .. " " .. PAGetString(Defines.StringSheet_GAME, "LUA_TERRITORYAUTHORITY_MESSAGE_7")
      else
        if sendType == 1 then
          msg = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_TERRITORYAUTHORITY_AUCTION_AUCTION", "tempStr", tempStr, "strGoodsType", strGoodsType) .. " " .. PAGetString(Defines.StringSheet_GAME, "LUA_TERRITORYAUTHORITY_MESSAGE_8")
        else
          _PA_ASSERT(false, "작업해주세요")
        end
      end
    else
      if goodsType == (CppEnums.AuctionType).AuctionGoods_Villa then
        strGoodsType = PAGetString(Defines.StringSheet_GAME, "LUA_TERRITORYAUTHORITY_MESSAGE_15")
        if sendType == 0 then
          msg = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_TERRITORYAUTHORITY_AUCTION_AUCTION", "tempStr", tempStr, "strGoodsType", strGoodsType) .. " " .. PAGetString(Defines.StringSheet_GAME, "LUA_TERRITORYAUTHORITY_MESSAGE_7")
        else
          if sendType == 1 then
            msg = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_TERRITORYAUTHORITY_AUCTION_AUCTION", "tempStr", tempStr, "strGoodsType", strGoodsType) .. " " .. PAGetString(Defines.StringSheet_GAME, "LUA_TERRITORYAUTHORITY_MESSAGE_8")
          else
            _PA_ASSERT(false, "작업해주세요")
          end
        end
      else
        if goodsType == (CppEnums.AuctionType).AuctionGoods_Item then
          strGoodsType = PAGetString(Defines.StringSheet_GAME, "LUA_TERRITORYAUTHORITY_MESSAGE_16")
          if sendType == 0 then
            msg = PAGetString(Defines.StringSheet_GAME, "LUA_MASTERPIECEAUCTION_STARTMSG")
          else
            if sendType == 1 then
              local itemKey = param1
              local itemSSW = getItemEnchantStaticStatus(ItemEnchantKey(itemKey))
              if itemSSW == nil then
                return 
              end
              local itemName = itemSSW:getName()
              if bidRv == 0 then
                msg = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_MASTERPIECE_AUCTION_SUCCESS", "itemName", itemName, "familyName", tempStr)
              else
                msg = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_MASTERPIECE_AUCTION_FAIL", "itemName", itemName)
              end
            else
              do
                _PA_ASSERT(false, "작업해주세요")
                do
                  local message = {main = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_TERRITORYAUTHORITY_AUCTION_AUCTION_MSG_MAIN", "strGoodsType", strGoodsType), sub = msg, addMsg = ""}
                  Proc_ShowMessage_Ack_For_RewardSelect(message, 3, 68)
                  do return  end
                  _PA_ASSERT(false, "작업해주세요")
                  Panel_MyHouseNavi_Update(true)
                  local message = {main = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_TERRITORYAUTHORITY_AUCTION_AUCTION_MSG_MAIN", "strGoodsType", strGoodsType), sub = msg, addMsg = ""}
                  Proc_ShowMessage_Ack_For_RewardSelect(message, 3, 7)
                end
              end
            end
          end
        end
      end
    end
  end
end

EventNotifyBidAuctionGoods = function(goodsType, param1, param2)
  -- function num : 0_4
  if goodsType == 2 then
    local text = PAGetString(Defines.StringSheet_GAME, "LUA_TERRITORYAUTHORITY_AUCTION_NOTIFYBIDAUCTIONGOODS")
    Proc_ShowMessage_Ack(text)
  end
end

local bidButtonCheck = false
local _buttonInit = function()
  -- function num : 0_5 , upvalues : withdrawBidprice, editBidPrice, bidBtn, bidButtonCheck, txtBidinFinish
  withdrawBidprice:SetShow(false)
  editBidPrice:SetShow(false)
  editBidPrice:SetEditText("")
  bidBtn:SetShow(false)
  if bidButtonCheck == true then
    txtBidinFinish:SetShow(true)
  else
    txtBidinFinish:SetShow(false)
  end
end

local territoryAuth_AuctionProgress = false
EventNotifyTerritoryTradeAuthority = function(msgType, territoryKey, bidPrice)
  -- function num : 0_6 , upvalues : _buttonInit, txtBidinFinish, territoryAuth_AuctionProgress, editBidPrice, bidBtn, withdrawBidprice, txtExplain
  _buttonInit()
  txtBidinFinish:SetShow(false)
  territoryAuth_AuctionProgress = false
  local territoryName = {[0] = tostring(PAGetString(Defines.StringSheet_GAME, "LUA_TERRITORYAUTHORITY_KEY_0")), [1] = tostring(PAGetString(Defines.StringSheet_GAME, "LUA_TERRITORYAUTHORITY_KEY_1")), [2] = tostring(PAGetString(Defines.StringSheet_GAME, "LUA_TERRITORYAUTHORITY_KEY_2")), [3] = tostring(PAGetString(Defines.StringSheet_GAME, "LUA_TERRITORYAUTHORITY_KEY_3"))}
  if msgType == 0 then
    Panel_MyHouseNavi_Update(true)
  else
    if msgType == 1 then
      local strDesc = territoryName[territoryKey] .. PAGetString(Defines.StringSheet_GAME, "LUA_TERRITORYAUTHORITY_MESSAGE_1")
      Proc_ShowMessage_Ack(strDesc)
    else
      do
        if msgType == 2 then
          TerritoryAuth_Auction_ShowToggle()
          local myAuctionInfo = RequestGetAuctionInfo()
          local tempPrice = myAuctionInfo:getTerritoryTradeBidPrice()
          if (Defines.s64_const).s64_0 < tempPrice then
            local strbid = "<PAColor0xFF96D4FC>" .. makeDotMoney(bidPrice) .. "<PAOldColor> " .. PAGetString(Defines.StringSheet_GAME, "LUA_TERRITORYAUTHORITY_MESSAGE_2")
            txtBidinFinish:SetShow(true)
            txtBidinFinish:SetText(strbid)
          else
            do
              do
                editBidPrice:SetEditText("")
                editBidPrice:SetShow(true)
                bidBtn:SetShow(true)
                TerritoryAuth_UpdateData()
                if msgType == 3 then
                  local strDesc = territoryName[territoryKey] .. PAGetString(Defines.StringSheet_GAME, "LUA_TERRITORYAUTHORITY_MESSAGE_3")
                  local message = {main = PAGetString(Defines.StringSheet_GAME, "LUA_TERRITORYAUTHORITY_AUCTION_IMPERIAL_BID"), sub = strDesc, addMsg = ""}
                  Proc_ShowMessage_Ack_For_RewardSelect(message, 3, 7)
                else
                  do
                    if msgType == 4 then
                      local strDesc = territoryName[territoryKey] .. PAGetString(Defines.StringSheet_GAME, "LUA_TERRITORYAUTHORITY_MESSAGE_4")
                      local message = {main = PAGetString(Defines.StringSheet_GAME, "LUA_TERRITORYAUTHORITY_AUCTION_IMPERIAL_RETURN"), sub = strDesc, addMsg = ""}
                      Proc_ShowMessage_Ack_For_RewardSelect(message, 3, 7)
                    else
                      do
                        if msgType == 5 then
                          TerritoryAuth_Auction_ShowToggle()
                          withdrawBidprice:SetShow(true)
                          withdrawBidprice:addInputEvent("Mouse_LUp", "Button_TerritoryTradeAuctionWithdrawMoney_Click(" .. bidPrice .. ")")
                          TerritoryAuth_UpdateData()
                        else
                          if msgType == 6 then
                            Panel_TerritoryAuth_Auction:SetShow(true, true)
                            territoryAuth_AuctionProgress = true
                            TerritoryAuth_UpdateData()
                          end
                        end
                        Panel_MyHouseNavi_Update(true)
                        txtExplain:SetText(territoryName[territoryKey] .. PAGetString(Defines.StringSheet_GAME, "LUA_TERRITORYAUTHORITY_MESSAGE_5"))
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

FromClientNotifySupplyTradeStart = function()
  -- function num : 0_7 , upvalues : isEnableSupplyTrade
  if isEnableSupplyTrade then
    return 
  end
  local msg = {main = PAGetString(Defines.StringSheet_GAME, "LUA_TERRITORYAUTHORITY_AUCTION_IMPERIAL_START"), sub = PAGetString(Defines.StringSheet_GAME, "LUA_TERRITORYAUTHORITY_MESSAGE_10"), addMsg = ""}
  Proc_ShowMessage_Ack_For_RewardSelect(msg, 3, 8)
end

FromClientNotifySupplyShopReset = function()
  -- function num : 0_8
  local msg = {main = PAGetString(Defines.StringSheet_GAME, "LUA_TERRITORYAUTHORITY_AUCTION_MSG_MAIN"), sub = PAGetString(Defines.StringSheet_GAME, "LUA_TERRITORYAUTHORITY_AUCTION_MSG_SUB"), addMsg = ""}
  Proc_ShowMessage_Ack_For_RewardSelect(msg, 3, 8)
end

TerritoryAuth_UpdateData = function()
  -- function num : 0_9 , upvalues : slotBG, slots, slot_BG, territoryAuth_AuctionProgress, txtRemainTime
  local myAuctionInfo = RequestGetAuctionInfo()
  local itemCount = myAuctionInfo:getTerritoryTradeItemCount()
  local sizeX = slotBG:GetSizeX()
  local gap = sizeX * 0.6
  local startPosX = (Panel_TerritoryAuth_Auction:GetSizeX() - (sizeX * itemCount + gap * (itemCount - 1))) / 2
  do
    if itemCount > 0 then
      local tradeCount = 0
      for i = 0, itemCount - 1 do
        local itemStaticWrapper = myAuctionInfo:getTerritoryTradeitem(i)
        if itemStaticWrapper ~= nil then
          (slots[i]):setItemByStaticStatus(itemStaticWrapper)
          tradeCount = tradeCount + 1
          ;
          ((slots[i]).icon):addInputEvent("Mouse_On", "TerritoryAuth_Tooltip_Show(" .. i .. ")")
          ;
          ((slots[i]).icon):addInputEvent("Mouse_Out", "TerritoryAuth_Tooltip_Hide(" .. i .. ")")
          Panel_Tooltip_Item_SetPosition(i, slots[i], "TerritoryAuth_Auction")
          local posX = startPosX + (sizeX + gap) * i
          ;
          ((slots[i]).icon):SetPosX(posX)
          ;
          ((slots[i]).icon):SetPosY(sizeX * 1.2)
          ;
          (slot_BG[i]):SetPosX(-4)
          ;
          (slot_BG[i]):SetPosY(-4)
          ;
          (slot_BG[i]):SetShow(true)
        else
          do
            do
              ;
              (slots[i]):clearItem()
              ;
              (slot_BG[i]):SetShow(false)
              -- DECOMPILER ERROR at PC101: LeaveBlock: unexpected jumping out DO_STMT

              -- DECOMPILER ERROR at PC101: LeaveBlock: unexpected jumping out IF_ELSE_STMT

              -- DECOMPILER ERROR at PC101: LeaveBlock: unexpected jumping out IF_STMT

            end
          end
        end
      end
    end
    local s64_remainTime = myAuctionInfo:getTerritoryTradeAuctionRemainTime()
    local tempStr = ""
    if territoryAuth_AuctionProgress == true then
      tempStr = PAGetString(Defines.StringSheet_GAME, "LUA_TERRITORYAUTHORITY_MESSAGE_11") .. " : " .. TerritoryAuth_TimeFormatting((math.floor)(Int64toInt32(s64_remainTime) / 1000))
    else
      tempStr = PAGetString(Defines.StringSheet_GAME, "LUA_TERRITORYAUTHORITY_MESSAGE_12") .. " : " .. TerritoryAuth_TimeFormatting((math.floor)(Int64toInt32(s64_remainTime) / 1000))
    end
    txtRemainTime:SetText(tempStr)
    txtRemainTime:SetShow(false)
  end
end

TerritoryAuth_TimeFormatting = function(second)
  -- function num : 0_10
  local formatter = {[0] = PAGetString(Defines.StringSheet_GAME, "LUA_GLOBAL_TIME_MINUTE"), [1] = PAGetString(Defines.StringSheet_GAME, "LUA_GLOBAL_TIME_HOUR"), [2] = PAGetString(Defines.StringSheet_GAME, "LUA_GLOBAL_TIME_DAY")}
  local timeVal = {}
  timeVal[0] = (math.floor)(second / 60)
  timeVal[1] = (math.floor)(timeVal[0] / 60)
  timeVal[2] = (math.floor)(timeVal[1] / 24)
  local resultString = ""
  if timeVal[2] > 0 then
    resultString = timeVal[2] .. formatter[2]
  end
  if timeVal[1] > 0 then
    resultString = resultString .. " " .. timeVal[1] % 24 .. formatter[1]
  end
  if timeVal[0] > 0 then
    resultString = resultString .. " " .. timeVal[0] % 60 .. formatter[0]
  end
  if second < 60 then
    resultString = PAGetString(Defines.StringSheet_GAME, "LUA_TERRITORYAUTHORITY_AUCTION_UNDER_ONEMINUTE")
  end
  return resultString
end

Button_TerritoryAuthAuctionClose_Click = function()
  -- function num : 0_11
  TerritoryAuth_Auction_ShowToggle()
end

Button_TerritoryAuthAuctionBid_Click = function()
  -- function num : 0_12 , upvalues : editBidPrice
  if editBidPrice:GetEditText() == "" then
    return 
  end
  local messageBoxMemo = makeDotMoney(tonumber(editBidPrice:GetEditText())) .. " " .. PAGetString(Defines.StringSheet_GAME, "LUA_TERRITORYAUTHORITY_MESSAGE_13")
  local messageBoxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_TERRITORYAUTHORITY_MESSAGE_14"), content = messageBoxMemo, functionYes = TerritoryAuth_BidAccept, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
  ;
  (MessageBox.showMessageBox)(messageBoxData)
end

TerritoryAuth_BidAccept = function()
  -- function num : 0_13 , upvalues : editBidPrice, bidButtonCheck, minBid, txtBidinFinish, bidBtn
  requestBidTerritoryTradeAuth(editBidPrice:GetEditText())
  bidButtonCheck = true
  local selfMoney = Int64toInt32((((getSelfPlayer()):get()):getInventory()):getMoney_s64())
  local _bidMoney = tonumber(editBidPrice:GetEditText())
  if minBid <= _bidMoney and _bidMoney <= selfMoney then
    txtBidinFinish:SetShow(false)
    editBidPrice:SetShow(false)
    bidBtn:SetShow(false)
    TerritoryAuth_Auction_ShowToggle()
  else
    txtBidinFinish:SetShow(false)
  end
end

Button_TerritoryTradeAuctionWithdrawMoney_Click = function(bidPrice)
  -- function num : 0_14
  requestWithdrawFailbidPriceForTerritoryTrade()
  TerritoryAuth_Auction_ShowToggle()
  local message = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_TERRITORYAUTHORITY_AUCTION_RETURN_MONEY", "bidPrice", makeDotMoney(bidPrice))
  Proc_ShowMessage_Ack_WithOut_ChattingMessage(message)
end

TerritoryAuth_Auction_ShowToggle = function()
  -- function num : 0_15 , upvalues : bidButtonCheck
  if Panel_TerritoryAuth_Auction:GetShow() then
    Panel_TerritoryAuth_Auction:SetShow(false, false)
    bidButtonCheck = false
  else
    Panel_TerritoryAuth_Auction:SetShow(true, true)
  end
end

TerritoryAuth_Auction_Close = function()
  -- function num : 0_16
  Panel_TerritoryAuth_Auction:SetShow(false, false)
end

TerritoryAuth_CreateSlot = function()
  -- function num : 0_17 , upvalues : maxCount, slotConfig, slots, slotBG, slot_BG
  for i = 0, maxCount - 1 do
    local slot = {}
    ;
    (SlotItem.new)(slot, "Territory_" .. i, i, Panel_TerritoryAuth_Auction, slotConfig)
    slot:createChild()
    -- DECOMPILER ERROR at PC19: Confused about usage of register: R5 in 'UnsetPending'

    slots[i] = slot
    local tempItemSlotBG = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATIC, slot.icon, "Static_Slot_" .. i)
    CopyBaseProperty(slotBG, tempItemSlotBG)
    -- DECOMPILER ERROR at PC35: Confused about usage of register: R6 in 'UnsetPending'

    slot_BG[i] = tempItemSlotBG
    ;
    (slot_BG[i]):SetShow(false)
  end
end

TerritoryAuth_Tooltip_Show = function(slotNo)
  -- function num : 0_18
  Panel_Tooltip_Item_Show_GeneralStatic(slotNo, "TerritoryAuth_Auction", true)
end

TerritoryAuth_Tooltip_Hide = function(slotNo)
  -- function num : 0_19
  Panel_Tooltip_Item_Show_GeneralStatic(slotNo, "TerritoryAuth_Auction", false)
end

_buttonQuestion = (UI.getChildControl)(Panel_TerritoryAuth_Auction, "Button_Question")
_buttonQuestion:addInputEvent("Mouse_LUp", "Panel_WebHelper_ShowToggle( \"TerritoryAuth\" )")
_buttonQuestion:addInputEvent("Mouse_On", "HelpMessageQuestion_Show( \"TerritoryAuth\", \"true\")")
_buttonQuestion:addInputEvent("Mouse_Out", "HelpMessageQuestion_Show( \"TerritoryAuth\", \"false\")")
TerritoryAuth_CreateSlot()
registerEvent("onScreenResize", "TerritoryAuth_Resize")
registerEvent("EventNotifyTerritoryTradeAuthority", "EventNotifyTerritoryTradeAuthority")
registerEvent("FromClientNotifySupplyTradeStart", "FromClientNotifySupplyTradeStart")
registerEvent("FromClient_ResponseAuctionInfo", "EventNotifyResponseAuctionInfo")
registerEvent("FromClient_BidAuctionGoods", "EventNotifyBidAuctionGoods")
registerEvent("FromClientNotifySupplyShopReset", "FromClientNotifySupplyShopReset")

