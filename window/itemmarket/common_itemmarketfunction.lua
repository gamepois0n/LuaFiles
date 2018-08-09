function PaGlobalFunc_ItemMarket_GetShow()
  if true == _ContentsGroup_RenewUI_ItemMarketPlace then
    return PaGlobalFunc_MarketPlace_GetShow()
  else
    return Panel_Window_ItemMarket:GetShow()
  end
end
function PaGlobalFunc_ItemMarket_IsUISubApp()
  if true == _ContentsGroup_RenewUI_ItemMarketPlace then
    return false
  else
    return Panel_Window_ItemMarket:IsUISubApp()
  end
end
function PaGlobalFunc_ItemMarketBidDesc_GetShow()
  if true == _ContentsGroup_RenewUI_ItemMarketPlace then
    return false
  else
    return Panel_ItemMarket_BidDesc:GetShow()
  end
end
function PaGlobalFunc_ItemMarketFunction_GetShow()
  if true == _ContentsGroup_RenewUI_ItemMarketPlace then
    return PaGlobalFunc_MarketPlace_IsOpenFromDialog()
  else
    return Panel_Window_ItemMarket_Function:GetShow()
  end
end
function PaGlobalFunc_ItemMarketAlarmList_GetShow()
  if true == _ContentsGroup_RenewUI_ItemMarketPlace then
    return false
  else
    return Panel_Window_ItemMarketAlarmList_New:GetShow()
  end
end
function PaGlobalFunc_ItemMarketAlarmList_IsUISubApp()
  if true == _ContentsGroup_RenewUI_ItemMarketPlace then
    return false
  else
    return Panel_Window_ItemMarketAlarmList_New:IsUISubApp()
  end
end
function PaGlobalFunc_ItemMarketRegistItem_GetShow()
  if true == _ContentsGroup_RenewUI_ItemMarketPlace then
    return false
  else
    return Panel_Window_ItemMarket_RegistItem:GetShow()
  end
end
function PaGlobalFunc_ItemMarketRegistItem_SetShow(isShow)
  if true ~= _ContentsGroup_RenewUI_ItemMarketPlace then
    return Panel_Window_ItemMarket_RegistItem:SetShow(isShow)
  end
end
function PaGlobalFunc_ItemMarketBuyConfirm_GetShow()
  if true == _ContentsGroup_RenewUI_ItemMarketPlace then
    return false
  else
    return Panel_Window_ItemMarket_BuyConfirm:GetShow()
  end
end
function PaGlobalFunc_ItemMarketItemSet_GetShow()
  if true == _ContentsGroup_RenewUI_ItemMarketPlace then
    return false
  else
    return Panel_Window_ItemMarket_ItemSet:GetShow()
  end
end
