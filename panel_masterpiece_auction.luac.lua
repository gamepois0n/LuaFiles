-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\window\auction\panel_masterpiece_auction.luac 

-- params : ...
-- function num : 0
Panel_Masterpiece_Auction:SetShow(false, false)
Panel_Masterpiece_Auction:setMaskingChild(true)
Panel_Masterpiece_Auction:ActiveMouseEventEffect(true)
Panel_Masterpiece_Auction:setGlassBackground(true)
Panel_Masterpiece_Auction:RegisterShowEventFunc(true, "MasterpieceAuction_ShowAni()")
Panel_Masterpiece_Auction:RegisterShowEventFunc(false, "MasterpieceAuction_HideAni()")
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
MasterpieceAuction_ShowAni = function()
  -- function num : 0_0 , upvalues : UI_ANI_ADV
  (UIAni.fadeInSCR_Down)(Panel_Masterpiece_Auction)
  local aniInfo1 = Panel_Masterpiece_Auction:addScaleAnimation(0, 0.08, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo1:SetStartScale(0.5)
  aniInfo1:SetEndScale(1.1)
  aniInfo1.AxisX = Panel_Masterpiece_Auction:GetSizeX() / 2
  aniInfo1.AxisY = Panel_Masterpiece_Auction:GetSizeY() / 2
  aniInfo1.ScaleType = 2
  aniInfo1.IsChangeChild = true
  local aniInfo2 = Panel_Masterpiece_Auction:addScaleAnimation(0.08, 0.15, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo2:SetStartScale(1.1)
  aniInfo2:SetEndScale(1)
  aniInfo2.AxisX = Panel_Masterpiece_Auction:GetSizeX() / 2
  aniInfo2.AxisY = Panel_Masterpiece_Auction:GetSizeY() / 2
  aniInfo2.ScaleType = 2
  aniInfo2.IsChangeChild = true
end

MasterpieceAuction_HideAni = function()
  -- function num : 0_1 , upvalues : UI_ANI_ADV
  Panel_Masterpiece_Auction:SetShowWithFade(UI_PSFT.PAUI_ANI_TYPE_FADE_OUT)
  local aniInfo1 = Panel_Masterpiece_Auction:addColorAnimation(0, 0.25, UI_ANI_ADV.PAUI_ANIM_ADVANCE_SIN_HALF_PI)
  aniInfo1:SetStartColor(UI_color.C_FFFFFFFF)
  aniInfo1:SetEndColor(UI_color.C_00FFFFFF)
  aniInfo1:SetStartIntensity(3)
  aniInfo1:SetEndIntensity(1)
  aniInfo1.IsChangeChild = true
  aniInfo1:SetHideAtEnd(true)
  aniInfo1:SetDisableWhileAni(true)
end

local masterpieceAuction = {
_control = {_mainBg = (UI.getChildControl)(Panel_Masterpiece_Auction, "Static_BackGround"), _buttonQuestion = (UI.getChildControl)(Panel_Masterpiece_Auction, "Button_Question"), _buttonClose = (UI.getChildControl)(Panel_Masterpiece_Auction, "Button_Win_Close"), _buttonMylist = (UI.getChildControl)(Panel_Masterpiece_Auction, "Button_MyBidList"), _buttonReload = (UI.getChildControl)(Panel_Masterpiece_Auction, "Button_Reload"), _curretnrPage = (UI.getChildControl)(Panel_Masterpiece_Auction, "StaticText_List"), _nextButton = (UI.getChildControl)(Panel_Masterpiece_Auction, "Button_List_Right"), _prevButton = (UI.getChildControl)(Panel_Masterpiece_Auction, "Button_List_Left"), _warehouseMoney = (UI.getChildControl)(Panel_Masterpiece_Auction, "StaticText_WarehouseMoney"), _readyPage = (UI.getChildControl)(Panel_Masterpiece_Auction, "StaticText_Ready"), _descBg = (UI.getChildControl)(Panel_Masterpiece_Auction, "Static_BottomDescBg"), _desc = (UI.getChildControl)(Panel_Masterpiece_Auction, "StaticText_Desc"), 
_itemListBg = {}
, 
_itemName = {}
, 
_itemBg = {}
, 
_itemSlot = {}
, 
_remainTime = {}
, 
_highPrice = {}
, 
_myPrice = {}
, 
_editBidText = {}
, 
_silverText = {}
, 
_btnBid = {}
}
, 
_config = {createBorder = true, createClassEquipBG = true}
, _maxUiViewCount = 4, 
_inputPrice = {}
}
masterpieceAuction.Init = function(self)
  -- function num : 0_2
  local control = self._control
  for index = 0, self._maxUiViewCount - 1 do
    -- DECOMPILER ERROR at PC16: Confused about usage of register: R6 in 'UnsetPending'

    (control._itemListBg)[index] = (UI.createAndCopyBasePropertyControl)(Panel_Masterpiece_Auction, "Template_Style_BG", Panel_Masterpiece_Auction, "Static_Masterpiece_ItemListBg_" .. index)
    ;
    ((control._itemListBg)[index]):SetPosX(10 + index % 2 * 460)
    ;
    ((control._itemListBg)[index]):SetPosY(50 + (math.floor)(index / 2) * 230)
    ;
    ((control._itemListBg)[index]):SetShow(false)
    -- DECOMPILER ERROR at PC50: Confused about usage of register: R6 in 'UnsetPending'

    ;
    (control._itemName)[index] = (UI.createAndCopyBasePropertyControl)(Panel_Masterpiece_Auction, "StaticText_Name", (control._itemListBg)[index], "StaticText_Masterpiece_ItemName_" .. index)
    ;
    ((control._itemName)[index]):SetPosX(20)
    ;
    ((control._itemName)[index]):SetPosY(15)
    ;
    ((control._itemName)[index]):SetShow(true)
    -- DECOMPILER ERROR at PC77: Confused about usage of register: R6 in 'UnsetPending'

    ;
    (control._itemBg)[index] = (UI.createAndCopyBasePropertyControl)(Panel_Masterpiece_Auction, "Static_ItemSlotBg", (control._itemListBg)[index], "Static_Masterpiece_ItemSlotBg_" .. index)
    ;
    ((control._itemBg)[index]):SetPosX(55)
    ;
    ((control._itemBg)[index]):SetPosY(65)
    ;
    ((control._itemBg)[index]):SetShow(true)
    -- DECOMPILER ERROR at PC95: Confused about usage of register: R6 in 'UnsetPending'

    ;
    (control._itemSlot)[index] = {}
    ;
    (SlotItem.new)((control._itemSlot)[index], "MasterpieceAuction_" .. index, index, (control._itemBg)[index], self._config)
    -- DECOMPILER ERROR at PC119: Confused about usage of register: R6 in 'UnsetPending'

    ;
    (control._remainTime)[index] = (UI.createAndCopyBasePropertyControl)(Panel_Masterpiece_Auction, "StaticText_LeftTime", (control._itemListBg)[index], "StaticText_Masterpiece_RemainTime_" .. index)
    ;
    ((control._remainTime)[index]):SetPosX(375)
    ;
    ((control._remainTime)[index]):SetPosY(45)
    ;
    ((control._remainTime)[index]):SetShow(true)
    -- DECOMPILER ERROR at PC146: Confused about usage of register: R6 in 'UnsetPending'

    ;
    (control._highPrice)[index] = (UI.createAndCopyBasePropertyControl)(Panel_Masterpiece_Auction, "StaticText_AucPrice", (control._itemListBg)[index], "StaticText_Masterpiece_HighPrice_" .. index)
    ;
    ((control._highPrice)[index]):SetPosX(375)
    ;
    ((control._highPrice)[index]):SetPosY(70)
    ;
    ((control._highPrice)[index]):SetShow(true)
    -- DECOMPILER ERROR at PC173: Confused about usage of register: R6 in 'UnsetPending'

    ;
    (control._myPrice)[index] = (UI.createAndCopyBasePropertyControl)(Panel_Masterpiece_Auction, "StaticText_MyPrice", (control._itemListBg)[index], "StaticText_Masterpiece_MyPrice_" .. index)
    ;
    ((control._myPrice)[index]):SetPosX(375)
    ;
    ((control._myPrice)[index]):SetPosY(95)
    ;
    ((control._myPrice)[index]):SetShow(false)
    -- DECOMPILER ERROR at PC200: Confused about usage of register: R6 in 'UnsetPending'

    ;
    (control._editBidText)[index] = (UI.createAndCopyBasePropertyControl)(Panel_Masterpiece_Auction, "Edit_InGold", (control._itemListBg)[index], "StaticText_Masterpiece_Editbox_" .. index)
    ;
    ((control._editBidText)[index]):SetPosX(270)
    ;
    ((control._editBidText)[index]):SetPosY(100)
    ;
    ((control._editBidText)[index]):SetShow(true)
    -- DECOMPILER ERROR at PC227: Confused about usage of register: R6 in 'UnsetPending'

    ;
    (control._silverText)[index] = (UI.createAndCopyBasePropertyControl)(Panel_Masterpiece_Auction, "StaticText_MoneyText", (control._itemListBg)[index], "StaticText_Masterpiece_MoneyText_" .. index)
    ;
    ((control._silverText)[index]):SetPosX(375)
    ;
    ((control._silverText)[index]):SetPosY(103)
    ;
    ((control._silverText)[index]):SetShow(true)
    -- DECOMPILER ERROR at PC254: Confused about usage of register: R6 in 'UnsetPending'

    ;
    (control._btnBid)[index] = (UI.createAndCopyBasePropertyControl)(Panel_Masterpiece_Auction, "Button_Bid", (control._itemListBg)[index], "Button_Masterpiece_Bid_" .. index)
    ;
    ((control._btnBid)[index]):SetPosX(180)
    ;
    ((control._btnBid)[index]):SetPosY(145)
    ;
    ((control._btnBid)[index]):SetShow(true)
  end
  ;
  (control._desc):SetTextMode((CppEnums.TextMode).eTextMode_AutoWrap)
  ;
  (control._desc):SetText((control._desc):GetText())
  ;
  (control._descBg):SetSize((control._descBg):GetSizeX(), (control._desc):GetTextSizeY() + 15)
  Panel_Masterpiece_Auction:SetSize(Panel_Masterpiece_Auction:GetSizeX(), (control._descBg):GetPosY() + (control._descBg):GetSizeY() + 50)
  ;
  (control._mainBg):SetSize(Panel_Masterpiece_Auction:GetSizeX(), Panel_Masterpiece_Auction:GetSizeY())
  ;
  (control._buttonReload):ComputePos()
  ;
  (control._buttonMylist):ComputePos()
end

masterpieceAuction.Update = function(self)
  -- function num : 0_3
  local control = self._control
  local myAuctionInfo = RequestGetAuctionInfo()
  local auctionType = myAuctionInfo:getAuctionType()
  if (CppEnums.AuctionTabType).AuctionTab_SellItem == auctionType or (CppEnums.AuctionTabType).AuctionTab_MySellPage == auctionType then
    local itemListCount = 0
    if (CppEnums.AuctionTabType).AuctionTab_SellItem == auctionType then
      itemListCount = myAuctionInfo:getItemAuctionListCount()
    else
      if (CppEnums.AuctionTabType).AuctionTab_MySellPage == auctionType then
        itemListCount = myAuctionInfo:getMySellingItemAuctionCount()
      end
    end
    for index = 0, self._maxUiViewCount - 1 do
      ((control._itemListBg)[index]):SetShow(false)
      -- DECOMPILER ERROR at PC48: Confused about usage of register: R9 in 'UnsetPending'

      ;
      (self._inputPrice)[index] = toInt64(0, 0)
    end
    ;
    (control._readyPage):SetShow(false)
    if itemListCount == 0 then
      if myAuctionInfo:getCurrentPage() == 0 then
        (control._readyPage):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_MASTERPIECE_READY"))
        ;
        (control._readyPage):SetShow(true)
      else
        Masterpiece_prevPage()
        return 
      end
    end
    ;
    (control._curretnrPage):SetText(tostring(myAuctionInfo:getCurrentPage() + 1))
    for ii = 0, itemListCount - 1 do
      local goodsInfo = nil
      if (CppEnums.AuctionTabType).AuctionTab_SellItem == auctionType then
        goodsInfo = myAuctionInfo:getItemAuctionListAt(R12_PC96)
      else
        if (CppEnums.AuctionTabType).AuctionTab_MySellPage == auctionType then
          goodsInfo = myAuctionInfo:getMySellingItemAuctionAt(R12_PC96)
        end
      end
      if goodsInfo == nil then
        break
      end
      local itemWrapper = goodsInfo:getItem()
      -- DECOMPILER ERROR at PC113: Overwrote pending register: R12 in 'AssignReg'

      local itemSSW = itemWrapper:getStaticStatus()
      -- DECOMPILER ERROR at PC115: Overwrote pending register: R12 in 'AssignReg'

      -- DECOMPILER ERROR at PC116: Overwrote pending register: R12 in 'AssignReg'

      -- DECOMPILER ERROR at PC117: Overwrote pending register: R12 in 'AssignReg'

      R12_PC96(R12_PC96, itemSSW:getName())
      -- DECOMPILER ERROR at PC121: Overwrote pending register: R12 in 'AssignReg'

      -- DECOMPILER ERROR at PC122: Overwrote pending register: R12 in 'AssignReg'

      -- DECOMPILER ERROR at PC123: Overwrote pending register: R12 in 'AssignReg'

      R12_PC96(R12_PC96, itemSSW)
      -- DECOMPILER ERROR at PC126: Overwrote pending register: R12 in 'AssignReg'

      -- DECOMPILER ERROR at PC127: Overwrote pending register: R12 in 'AssignReg'

      -- DECOMPILER ERROR at PC128: Overwrote pending register: R12 in 'AssignReg'

      -- DECOMPILER ERROR at PC129: Overwrote pending register: R12 in 'AssignReg'

      R12_PC96(R12_PC96, "Mouse_On", "MasterpieceAuction_TooltipShow(" .. R16_PC136 .. "," .. auctionType .. ")")
      -- DECOMPILER ERROR at PC138: Overwrote pending register: R12 in 'AssignReg'

      -- DECOMPILER ERROR at PC139: Overwrote pending register: R12 in 'AssignReg'

      -- DECOMPILER ERROR at PC140: Overwrote pending register: R12 in 'AssignReg'

      -- DECOMPILER ERROR at PC141: Overwrote pending register: R12 in 'AssignReg'

      R12_PC96(R12_PC96, "Mouse_Out", "MasterpieceAuction_TooltipHide()")
      -- DECOMPILER ERROR at PC145: Overwrote pending register: R12 in 'AssignReg'

      R12_PC96 = R12_PC96(goodsInfo)
      local leftTime_u64 = nil
      local highPrice_s64 = goodsInfo:getHighPrice_s64()
      local isBiddable = goodsInfo:isBiddable()
      local isEnd = goodsInfo:isAuctionEnd()
      -- DECOMPILER ERROR at PC155: Overwrote pending register: R16 in 'AssignReg'

      -- DECOMPILER ERROR at PC156: Overwrote pending register: R16 in 'AssignReg'

      -- DECOMPILER ERROR at PC157: Overwrote pending register: R16 in 'AssignReg'

      if isEnd == false then
        R16_PC136(R16_PC136, true)
        -- DECOMPILER ERROR at PC160: Overwrote pending register: R16 in 'AssignReg'

        -- DECOMPILER ERROR at PC161: Overwrote pending register: R16 in 'AssignReg'

        -- DECOMPILER ERROR at PC162: Overwrote pending register: R16 in 'AssignReg'

        R16_PC136(R16_PC136, PAGetStringParam1(Defines.StringSheet_GAME, "LUA_MASTERPIECE_LEFTTIME", "time", tostring(((Util.Time).timeFormatting_Minute)(Int64toInt32(leftTime_u64)))))
        -- DECOMPILER ERROR at PC179: Overwrote pending register: R16 in 'AssignReg'

        -- DECOMPILER ERROR at PC180: Overwrote pending register: R16 in 'AssignReg'

        -- DECOMPILER ERROR at PC181: Overwrote pending register: R16 in 'AssignReg'

        R16_PC136(R16_PC136, PAGetStringParam1(Defines.StringSheet_GAME, "LUA_MASTERPIECE_CURRENTPRICE", "price", makeDotMoney(highPrice_s64)))
        -- DECOMPILER ERROR at PC192: Overwrote pending register: R16 in 'AssignReg'

        -- DECOMPILER ERROR at PC193: Overwrote pending register: R16 in 'AssignReg'

        -- DECOMPILER ERROR at PC194: Overwrote pending register: R16 in 'AssignReg'

        R16_PC136(R16_PC136, isBiddable)
        -- DECOMPILER ERROR at PC197: Overwrote pending register: R16 in 'AssignReg'

        -- DECOMPILER ERROR at PC198: Overwrote pending register: R16 in 'AssignReg'

        -- DECOMPILER ERROR at PC199: Overwrote pending register: R16 in 'AssignReg'

        R16_PC136(R16_PC136, "Mouse_LUp", "MasterpieceAuction_bidItem(" .. R20_PC204 .. ")")
      end
      -- DECOMPILER ERROR at PC206: Overwrote pending register: R16 in 'AssignReg'

      -- DECOMPILER ERROR at PC207: Overwrote pending register: R16 in 'AssignReg'

      -- DECOMPILER ERROR at PC208: Overwrote pending register: R16 in 'AssignReg'

      R16_PC136(R16_PC136, false)
      -- DECOMPILER ERROR at PC211: Overwrote pending register: R16 in 'AssignReg'

      -- DECOMPILER ERROR at PC212: Overwrote pending register: R16 in 'AssignReg'

      -- DECOMPILER ERROR at PC213: Overwrote pending register: R16 in 'AssignReg'

      R16_PC136(R16_PC136, true)
      -- DECOMPILER ERROR at PC216: Overwrote pending register: R16 in 'AssignReg'

      -- DECOMPILER ERROR at PC217: Overwrote pending register: R16 in 'AssignReg'

      -- DECOMPILER ERROR at PC218: Overwrote pending register: R16 in 'AssignReg'

      R16_PC136(R16_PC136, "Mouse_LUp", "MasterpieceAuction_SetPrice(" .. R20_PC204 .. ")")
      -- DECOMPILER ERROR at PC225: Overwrote pending register: R16 in 'AssignReg'

      -- DECOMPILER ERROR at PC226: Overwrote pending register: R16 in 'AssignReg'

      -- DECOMPILER ERROR at PC227: Overwrote pending register: R16 in 'AssignReg'

      R16_PC136(R16_PC136, "")
      -- DECOMPILER ERROR at PC230: Overwrote pending register: R16 in 'AssignReg'

      -- DECOMPILER ERROR at PC231: Overwrote pending register: R16 in 'AssignReg'

      -- DECOMPILER ERROR at PC232: Overwrote pending register: R16 in 'AssignReg'

      R16_PC136(R16_PC136, true)
    end
  else
    do
      if (CppEnums.AuctionTabType).AuctionTab_MyBidPage == auctionType then
        local itemListCount = myAuctionInfo:getMyItemBidListCount()
        for index = 0, self._maxUiViewCount - 1 do
          ((control._itemListBg)[index]):SetShow(false)
        end
        ;
        (control._readyPage):SetShow(true)
        if itemListCount == 0 then
          if myAuctionInfo:getCurrentPage() == 0 then
            (control._readyPage):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_MASTERPIECE_NOBID"))
            ;
            (control._readyPage):SetShow(true)
          else
            Masterpiece_prevPage()
            return 
          end
        end
        ;
        (control._curretnrPage):SetText(tostring(myAuctionInfo:getCurrentPage() + 1))
        for ii = 0, itemListCount - 1 do
          local goodsInfo = myAuctionInfo:getMyItemBidListAt(R11_PC295)
          if goodsInfo == nil then
            break
          end
          local itemWrapper = goodsInfo:getItem()
          -- DECOMPILER ERROR at PC301: Overwrote pending register: R11 in 'AssignReg'

          R11_PC295 = R11_PC295(itemWrapper)
          local itemSSW = nil
          ;
          ((control._itemName)[ii]):SetText(itemSSW:getName())
          ;
          ((control._itemSlot)[ii]):setItemByStaticStatus(itemSSW)
          -- DECOMPILER ERROR at PC320: Overwrote pending register: R16 in 'AssignReg'

          ;
          (((control._itemSlot)[ii]).icon):addInputEvent("Mouse_On", "MasterpieceAuction_TooltipShow(" .. R16_PC136 .. "," .. auctionType .. ")")
          ;
          (((control._itemSlot)[ii]).icon):addInputEvent("Mouse_Out", "MasterpieceAuction_TooltipHide()")
          local leftTime_u64 = goodsInfo:getExpireTime_u64()
          local highPrice_s64 = goodsInfo:getUpperBidPrice_s64()
          local myPrice_s64 = goodsInfo:getMyBidPrice_s64()
          -- DECOMPILER ERROR at PC339: Overwrote pending register: R16 in 'AssignReg'

          local isBiddable = goodsInfo:isSuccessBid()
          -- DECOMPILER ERROR at PC341: Overwrote pending register: R16 in 'AssignReg'

          -- DECOMPILER ERROR at PC342: Overwrote pending register: R16 in 'AssignReg'

          -- DECOMPILER ERROR at PC343: Overwrote pending register: R16 in 'AssignReg'

          R16_PC136(R16_PC136, true)
          -- DECOMPILER ERROR at PC346: Overwrote pending register: R16 in 'AssignReg'

          -- DECOMPILER ERROR at PC347: Overwrote pending register: R16 in 'AssignReg'

          -- DECOMPILER ERROR at PC348: Overwrote pending register: R16 in 'AssignReg'

          -- DECOMPILER ERROR at PC352: Overwrote pending register: R20 in 'AssignReg'

          R16_PC136(R16_PC136, PAGetStringParam1(Defines.StringSheet_GAME, R20_PC204, "time", tostring(((Util.Time).timeFormatting_Minute)(Int64toInt32(leftTime_u64)))))
          -- DECOMPILER ERROR at PC367: Overwrote pending register: R16 in 'AssignReg'

          -- DECOMPILER ERROR at PC368: Overwrote pending register: R16 in 'AssignReg'

          -- DECOMPILER ERROR at PC369: Overwrote pending register: R16 in 'AssignReg'

          -- DECOMPILER ERROR at PC373: Overwrote pending register: R20 in 'AssignReg'

          if isBiddable then
            R16_PC136(R16_PC136, PAGetStringParam1(Defines.StringSheet_GAME, R20_PC204, "price", makeDotMoney(highPrice_s64)))
          else
            -- DECOMPILER ERROR at PC381: Overwrote pending register: R16 in 'AssignReg'

            -- DECOMPILER ERROR at PC382: Overwrote pending register: R16 in 'AssignReg'

            -- DECOMPILER ERROR at PC383: Overwrote pending register: R16 in 'AssignReg'

            -- DECOMPILER ERROR at PC387: Overwrote pending register: R20 in 'AssignReg'

            R16_PC136(R16_PC136, PAGetString(Defines.StringSheet_GAME, R20_PC204))
          end
          -- DECOMPILER ERROR at PC390: Overwrote pending register: R16 in 'AssignReg'

          -- DECOMPILER ERROR at PC391: Overwrote pending register: R16 in 'AssignReg'

          -- DECOMPILER ERROR at PC392: Overwrote pending register: R16 in 'AssignReg'

          -- DECOMPILER ERROR at PC396: Overwrote pending register: R20 in 'AssignReg'

          R16_PC136(R16_PC136, PAGetStringParam1(Defines.StringSheet_GAME, R20_PC204, "price", makeDotMoney(myPrice_s64)))
          -- DECOMPILER ERROR at PC403: Overwrote pending register: R16 in 'AssignReg'

          -- DECOMPILER ERROR at PC404: Overwrote pending register: R16 in 'AssignReg'

          -- DECOMPILER ERROR at PC405: Overwrote pending register: R16 in 'AssignReg'

          R16_PC136(R16_PC136, true)
          -- DECOMPILER ERROR at PC408: Overwrote pending register: R16 in 'AssignReg'

          -- DECOMPILER ERROR at PC409: Overwrote pending register: R16 in 'AssignReg'

          -- DECOMPILER ERROR at PC410: Overwrote pending register: R16 in 'AssignReg'

          R16_PC136(R16_PC136, false)
          -- DECOMPILER ERROR at PC413: Overwrote pending register: R16 in 'AssignReg'

          -- DECOMPILER ERROR at PC414: Overwrote pending register: R16 in 'AssignReg'

          -- DECOMPILER ERROR at PC415: Overwrote pending register: R16 in 'AssignReg'

          R16_PC136(R16_PC136, false)
          -- DECOMPILER ERROR at PC420: Overwrote pending register: R16 in 'AssignReg'

          -- DECOMPILER ERROR at PC421: Overwrote pending register: R16 in 'AssignReg'

          -- DECOMPILER ERROR at PC422: Overwrote pending register: R16 in 'AssignReg'

          -- DECOMPILER ERROR at PC426: Overwrote pending register: R20 in 'AssignReg'

          if myPrice_s64 < highPrice_s64 then
            R16_PC136(R16_PC136, PAGetString(Defines.StringSheet_GAME, R20_PC204))
            -- DECOMPILER ERROR at PC429: Overwrote pending register: R16 in 'AssignReg'

            -- DECOMPILER ERROR at PC430: Overwrote pending register: R16 in 'AssignReg'

            -- DECOMPILER ERROR at PC431: Overwrote pending register: R16 in 'AssignReg'

            -- DECOMPILER ERROR at PC434: Overwrote pending register: R20 in 'AssignReg'

            R16_PC136(R16_PC136, "Mouse_LUp", "MasterpieceAuction_cancelBidorSell(" .. R20_PC204 .. ")")
            -- DECOMPILER ERROR at PC438: Overwrote pending register: R16 in 'AssignReg'

            -- DECOMPILER ERROR at PC439: Overwrote pending register: R16 in 'AssignReg'

            -- DECOMPILER ERROR at PC440: Overwrote pending register: R16 in 'AssignReg'

            R16_PC136(R16_PC136, true)
          else
            -- DECOMPILER ERROR at PC446: Overwrote pending register: R16 in 'AssignReg'

            -- DECOMPILER ERROR at PC447: Overwrote pending register: R16 in 'AssignReg'

            -- DECOMPILER ERROR at PC448: Overwrote pending register: R16 in 'AssignReg'

            -- DECOMPILER ERROR at PC452: Overwrote pending register: R20 in 'AssignReg'

            if isBiddable then
              R16_PC136(R16_PC136, PAGetString(Defines.StringSheet_GAME, R20_PC204))
              -- DECOMPILER ERROR at PC455: Overwrote pending register: R16 in 'AssignReg'

              -- DECOMPILER ERROR at PC456: Overwrote pending register: R16 in 'AssignReg'

              -- DECOMPILER ERROR at PC457: Overwrote pending register: R16 in 'AssignReg'

              -- DECOMPILER ERROR at PC460: Overwrote pending register: R20 in 'AssignReg'

              R16_PC136(R16_PC136, "Mouse_LUp", "MasterpieceAuction_getSuccessItemorMoney(" .. R20_PC204 .. ")")
              -- DECOMPILER ERROR at PC464: Overwrote pending register: R16 in 'AssignReg'

              -- DECOMPILER ERROR at PC465: Overwrote pending register: R16 in 'AssignReg'

              -- DECOMPILER ERROR at PC466: Overwrote pending register: R16 in 'AssignReg'

              R16_PC136(R16_PC136, true)
            else
              -- DECOMPILER ERROR at PC470: Overwrote pending register: R16 in 'AssignReg'

              -- DECOMPILER ERROR at PC471: Overwrote pending register: R16 in 'AssignReg'

              -- DECOMPILER ERROR at PC472: Overwrote pending register: R16 in 'AssignReg'

              R16_PC136(R16_PC136, false)
            end
          end
        end
      end
      do
        ;
        (control._warehouseMoney):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_MASTERPIECE_WAREHOUSEMONEY", "money", makeDotMoney(warehouse_moneyFromNpcShop_s64())))
        ;
        (control._warehouseMoney):SetSize((control._warehouseMoney):GetTextSizeX() + 45, (control._warehouseMoney):GetSizeY())
        ;
        (control._warehouseMoney):ComputePos()
      end
    end
  end
end

MasterpieceAuction_SetPrice = function(index)
  -- function num : 0_4 , upvalues : masterpieceAuction
  local setEditText = function(inputNumber)
    -- function num : 0_4_0 , upvalues : masterpieceAuction, index
    (((masterpieceAuction._control)._editBidText)[index]):SetText(makeDotMoney(inputNumber))
    -- DECOMPILER ERROR at PC13: Confused about usage of register: R1 in 'UnsetPending'

    ;
    (masterpieceAuction._inputPrice)[index] = inputNumber
  end

  local s64_maxNumber = warehouse_moneyFromNpcShop_s64()
  Panel_NumberPad_Show(true, s64_maxNumber, 0, setEditText)
end

MasterpieceAuction_bidItem = function(index)
  -- function num : 0_5 , upvalues : masterpieceAuction
  local myAuctionInfo = RequestGetAuctionInfo()
  local goodsInfo = myAuctionInfo:getItemAuctionListAt(index)
  local highPrice = goodsInfo:getHighPrice_s64()
  if highPrice < (masterpieceAuction._inputPrice)[index] then
    RequestBidAuction(index, (masterpieceAuction._inputPrice)[index])
  else
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_MASTERPIECE_PRICEALERT"))
  end
  -- DECOMPILER ERROR at PC32: Confused about usage of register: R4 in 'UnsetPending'

  ;
  (masterpieceAuction._inputPrice)[index] = toInt64(0, 0)
  ;
  (((masterpieceAuction._control)._editBidText)[index]):SetText("")
end

MasterpieceAuction_TooltipShow = function(index, auctionType)
  -- function num : 0_6 , upvalues : masterpieceAuction
  Panel_Tooltip_Item_SetPosition(index, ((masterpieceAuction._control)._itemSlot)[index], "masterpiecdAuction")
  Panel_Tooltip_Item_Show_GeneralStatic(index, "masterpiecdAuction", true, auctionType)
end

MasterpieceAuction_TooltipHide = function()
  -- function num : 0_7
  Panel_Tooltip_Item_hideTooltip()
end

Masterpiece_getAuctionItemList = function()
  -- function num : 0_8
  RequestAuctionListPage()
end

MasterpieceAuction_getMybidList = function()
  -- function num : 0_9
  RequestBiddingPage()
end

MasterpieceAuction_getSuccessItemorMoney = function(index)
  -- function num : 0_10
  RequestAuction_GetGoods(index)
end

MasterpieceAuction_cancelBidorSell = function(index)
  -- function num : 0_11
  RequestAuction_CancelGoods(index)
end

Masterpiece_nextPage = function()
  -- function num : 0_12
  RequestAuctionNextPage()
end

Masterpiece_prevPage = function()
  -- function num : 0_13
  RequestAuctionPrevPage()
end

MasterpieceAuction_Open = function()
  -- function num : 0_14
  Panel_Masterpiece_Auction:SetShow(true, true)
end

MasterpieceAuction_Close = function()
  -- function num : 0_15
  Panel_Masterpiece_Auction:SetShow(false, false)
  Panel_Tooltip_Item_hideTooltip()
end

FromClient_ResponseAuction_UpdateAuctionList_MasterpieceAuction = function()
  -- function num : 0_16 , upvalues : masterpieceAuction
  local myAuctionInfo = RequestGetAuctionInfo()
  local auctionType = myAuctionInfo:getAuctionType()
  if (CppEnums.AuctionTabType).AuctionTab_SellItem == auctionType or (CppEnums.AuctionTabType).AuctionTab_MySellPage == auctionType then
    MasterpieceAuction_Open()
  end
  masterpieceAuction:Update()
end

FromClient_BidAuctionGoods = function()
  -- function num : 0_17
  RequestAuctionListPage()
end

masterpieceAuction.RegisterEvent = function(self)
  -- function num : 0_18
  registerEvent("FromClient_ResponseAuction_UpdateAuctionList", "FromClient_ResponseAuction_UpdateAuctionList_MasterpieceAuction")
  registerEvent("FromClient_BidAuctionGoods", "FromClient_BidAuctionGoods")
  ;
  ((self._control)._buttonClose):addInputEvent("Mouse_LUp", "MasterpieceAuction_Close()")
  ;
  ((self._control)._buttonMylist):addInputEvent("Mouse_LUp", "MasterpieceAuction_getMybidList()")
  ;
  ((self._control)._buttonReload):addInputEvent("Mouse_LUp", "Masterpiece_getAuctionItemList()")
  ;
  ((self._control)._nextButton):addInputEvent("Mouse_LUp", "Masterpiece_nextPage()")
  ;
  ((self._control)._prevButton):addInputEvent("Mouse_LUp", "Masterpiece_prevPage()")
end

masterpieceAuction:Init()
masterpieceAuction:RegisterEvent()

