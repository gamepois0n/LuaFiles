-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\ingamecashshop\panel_ingamecashshop_coupon.luac 

-- params : ...
-- function num : 0
local UI_TM = CppEnums.TextMode
local UI_color = Defines.Color
Panel_IngameCashShop_Coupon:SetShow(false)
local categoryStringList = {PAGetString(Defines.StringSheet_GAME, "LUA_CASHSHOPCATEGORY_0"), PAGetString(Defines.StringSheet_GAME, "LUA_CASHSHOPCATEGORY_1"), PAGetString(Defines.StringSheet_GAME, "LUA_CASHSHOPCATEGORY_2"), PAGetString(Defines.StringSheet_GAME, "LUA_CASHSHOPCATEGORY_3"), PAGetString(Defines.StringSheet_GAME, "LUA_CASHSHOPCATEGORY_4"), PAGetString(Defines.StringSheet_GAME, "LUA_CASHSHOPCATEGORY_5"), PAGetString(Defines.StringSheet_GAME, "LUA_CASHSHOPCATEGORY_6"), PAGetString(Defines.StringSheet_GAME, "LUA_CASHSHOPCATEGORY_7"), PAGetString(Defines.StringSheet_GAME, "LUA_CASHSHOPCATEGORY_8"), PAGetString(Defines.StringSheet_GAME, "LUA_CASHSHOPCATEGORY_9")}
local MAXCATEGORYCOUNT = 9
local isCouponOpen = ToClient_IsContentsGroupOpen("224")
local cashCoupon = {_list2 = (UI.getChildControl)(Panel_IngameCashShop_Coupon, "List2_CouponList"), _list2_Unused = (UI.getChildControl)(Panel_IngameCashShop_Coupon, "List2_CouponList_Unused"), btn_X = (UI.getChildControl)(Panel_IngameCashShop_Coupon, "Button_Win_Close"), btn_Use = (UI.getChildControl)(Panel_IngameCashShop_Coupon, "RadioButton_Use"), btn_UseComplete = (UI.getChildControl)(Panel_IngameCashShop_Coupon, "RadioButton_UseComplete"), 
couponList = {}
, savedOpenType = nil, savedCouponKey = nil, savedCouponNo = nil, savedCouponIndex = nil, savedCouponWrapper = nil}
local selectKey = -1
IngameCashShopCoupon_Init = function()
  -- function num : 0_0 , upvalues : cashCoupon
  local self = cashCoupon
  ;
  (self._list2):changeAnimationSpeed(10)
  ;
  (self._list2):registEvent((CppEnums.PAUIList2EventType).luaChangeContent, "IngameCashShopCoupon_ListUpdate")
  ;
  (self._list2):createChildContent((CppEnums.PAUIList2ElementManagerType).list)
  ;
  ((self._list2):getElementManager()):clearKey()
  ;
  (self._list2_Unused):changeAnimationSpeed(10)
  ;
  (self._list2_Unused):registEvent((CppEnums.PAUIList2EventType).luaChangeContent, "IngameCashShopCoupon_ListUpdate_Unused")
  ;
  (self._list2_Unused):createChildContent((CppEnums.PAUIList2ElementManagerType).list)
  ;
  ((self._list2_Unused):getElementManager()):clearKey()
  ;
  (self.btn_X):addInputEvent("Mouse_LUp", "IngameCashShopCoupon_Close( true )")
  ;
  (self.btn_Use):addInputEvent("Mouse_LUp", "IngameCashShopCoupon_CheckBTN( 0 )")
  ;
  (self.btn_UseComplete):addInputEvent("Mouse_LUp", "IngameCashShopCoupon_CheckBTN( 1 )")
  ;
  (self.btn_X):SetShow(true)
end

IngameCashShopCoupon_ListUpdate = function(contents, key)
  -- function num : 0_1 , upvalues : cashCoupon, selectKey, UI_TM
  local self = cashCoupon
  local idx = Int64toInt32(key)
  local btn_Coupon = (UI.getChildControl)(contents, "RadioButton_CouponBG")
  local txt_Title = (UI.getChildControl)(contents, "StaticText_CouponTItle")
  local txt_Date = (UI.getChildControl)(contents, "StaticText_CouponDate")
  local txt_Rate = (UI.getChildControl)(contents, "StaticText_CouponRate")
  local txt_Desc = (UI.getChildControl)(contents, "StaticText_CouponDesc")
  local txt_CategoryDesc = (UI.getChildControl)(contents, "StaticText_CouponCategoryDesc")
  local txt_PearlIcon = (UI.getChildControl)(contents, "StaticText_PearlIcon")
  local btn_CouponApply = (UI.getChildControl)(contents, "Button_CouponApply")
  btn_Coupon:setNotImpactScrollEvent(true)
  local couponWrapper = ToClient_GetCouponInfoWrapper(idx)
  local isCouponSavedIdx = selectKey
  self.savedCouponWrapper = couponWrapper
  btn_Coupon:ChangeTextureInfoName("new_ui_common_forlua/window/ingamecashshop/cashshop_coupon_01.dds")
  local x1, y1, x2, y2 = setTextureUV_Func(btn_Coupon, 1, 1, 364, 98)
  ;
  (btn_Coupon:getBaseTexture()):setUV(x1, y1, x2, y2)
  btn_Coupon:setRenderTexture(btn_Coupon:getBaseTexture())
  btn_Coupon:ChangeClickTextureInfoName("new_ui_common_forlua/window/ingamecashshop/cashshop_coupon_01.dds")
  if idx ~= isCouponSavedIdx then
    local x1, y1, x2, y2 = setTextureUV_Func(btn_Coupon, 1, 1, 364, 98)
    ;
    (btn_Coupon:getClickTexture()):setUV(x1, y1, x2, y2)
    btn_Coupon:setRenderTexture(btn_Coupon:getClickTexture())
    txt_Rate:SetFontColor(4293914607)
  else
    do
      do
        local x1, y1, x2, y2 = setTextureUV_Func(btn_Coupon, 1, 199, 364, 296)
        ;
        (btn_Coupon:getClickTexture()):setUV(x1, y1, x2, y2)
        btn_Coupon:setRenderTexture(btn_Coupon:getClickTexture())
        txt_Rate:SetFontColor(4294096979)
        if couponWrapper ~= nil then
          local couponName = couponWrapper:getCouponName()
          local couponKey = couponWrapper:getCouponKey()
          local couponState = couponWrapper:getCouponState()
          local couponExpirationDate = couponWrapper:getExpirationDateTime()
          local couponRate = couponWrapper:getCouponDisCountRate()
          local couponMaxDiscount = couponWrapper:getCouponMaxDisCountPearl()
          local couponCategory = couponWrapper:getCouponCategoryExpression()
          btn_Coupon:SetShow(true)
          txt_Title:SetShow(true)
          txt_Date:SetShow(true)
          txt_Rate:SetShow(true)
          txt_Desc:SetShow(true)
          if self.savedOpenType ~= nil then
            btn_CouponApply:SetShow(false)
          else
            btn_CouponApply:SetShow(false)
          end
          btn_Coupon:SetPosX(10)
          btn_Coupon:SetPosY(0)
          btn_Coupon:addInputEvent("Mouse_LUp", "IngameCashShopCoupon_SavedCouponIndex(" .. idx .. ")")
          btn_Coupon:addInputEvent("Mouse_On", "IngameCashShopCoupon_MouseOver( true, " .. idx .. " )")
          btn_Coupon:addInputEvent("Mouse_Out", "IngameCashShopCoupon_MouseOver( false, " .. idx .. " )")
          txt_Title:SetTextMode(UI_TM.eTextMode_LimitText)
          txt_Title:SetText(couponName)
          if txt_Title:IsLimitText() then
            txt_Title:addInputEvent("Mouse_On", "IngameCashShopCoupon_SimpletooltipTitle(true, " .. idx .. ")")
            txt_Title:addInputEvent("Mouse_Out", "IngameCashShopCoupon_SimpletooltipTitle()")
          else
            txt_Title:addInputEvent("Mouse_On", "")
            txt_Title:addInputEvent("Mouse_Out", "")
          end
          txt_Title:SetPosX(25)
          txt_Title:SetPosY(10)
          txt_Rate:SetText(couponRate / 10000 .. "%")
          txt_Rate:SetPosX(315)
          txt_Rate:SetPosY(65)
          if couponState == 2 or couponState == 1 then
            txt_Date:SetFontColor((Defines.Color).C_FFF26A6A)
          else
            txt_Date:SetFontColor((Defines.Color).C_FFC4BEBE)
          end
          if isGameTypeRussia() or isGameTypeEnglish() or isGameTypeTaiwan() then
            txt_Date:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_COUPON_PERIOD") .. " " .. couponExpirationDate)
          else
            txt_Date:SetText(couponExpirationDate .. " " .. PAGetString(Defines.StringSheet_GAME, "LUA_COUPON_PERIOD"))
          end
          txt_Date:SetPosX(25)
          txt_Date:SetPosY(37)
          if toInt64(0, 0) < couponMaxDiscount then
            txt_Desc:SetShow(true)
            txt_PearlIcon:SetShow(true)
            txt_CategoryDesc:SetPosY(72)
          else
            txt_Desc:SetShow(false)
            txt_PearlIcon:SetShow(false)
            txt_CategoryDesc:SetPosY(52)
          end
          txt_Desc:setLineCountByLimitAutoWrap(2)
          txt_Desc:SetTextMode(UI_TM.eTextMode_Limit_AutoWrap)
          txt_Desc:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_COUPON_DISCOUNT") .. " : ")
          txt_Desc:SetPosX(25)
          txt_Desc:SetPosY(53)
          txt_PearlIcon:SetText(tostring(couponMaxDiscount))
          txt_PearlIcon:SetPosX(txt_Desc:GetPosX() + txt_Desc:GetTextSizeX())
          txt_PearlIcon:SetPosY(52)
          txt_CategoryDesc:SetShow(true)
          txt_CategoryDesc:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_COUPON_USECATEGORY") .. " : " .. tostring(couponCategory))
          txt_CategoryDesc:SetPosX(25)
          btn_CouponApply:SetPosX(288)
          btn_CouponApply:SetPosY(30)
          btn_CouponApply:addInputEvent("Mouse_LUp", "IngameCashShopCoupon_SavedCouponIndex(" .. idx .. ")")
        end
      end
    end
  end
end

IngameCashShopCoupon_ListUpdate_Unused = function(contents, key)
  -- function num : 0_2 , upvalues : cashCoupon, UI_TM
  local self = cashCoupon
  local idx = Int64toInt32(key)
  local btn_Coupon = (UI.getChildControl)(contents, "RadioButton_CouponBG")
  local txt_Title = (UI.getChildControl)(contents, "StaticText_CouponTItle")
  local txt_Date = (UI.getChildControl)(contents, "StaticText_CouponDate")
  local txt_Rate = (UI.getChildControl)(contents, "StaticText_CouponRate")
  local txt_Desc = (UI.getChildControl)(contents, "StaticText_CouponDesc")
  local btn_CouponDelete = (UI.getChildControl)(contents, "Button_CouponApply")
  local couponWrapper = ToClient_GetCouponInfoWrapper(idx)
  if couponWrapper ~= nil then
    local couponName = couponWrapper:getCouponName()
    local couponKey = couponWrapper:getCouponKey()
    local couponState = couponWrapper:getCouponState()
    local couponExpirationDate = couponWrapper:getExpirationDateTime()
    local couponRate = couponWrapper:getCouponDisCountRate()
    local couponMaxDiscount = couponWrapper:getCouponMaxDisCountPearl()
    local couponNo = couponWrapper:getCouponNo()
    btn_Coupon:setNotImpactScrollEvent(true)
    btn_Coupon:SetShow(true)
    txt_Title:SetShow(true)
    txt_Date:SetShow(true)
    txt_Rate:SetShow(true)
    txt_Desc:SetShow(false)
    btn_CouponDelete:SetShow(false)
    btn_Coupon:SetPosX(10)
    btn_Coupon:SetPosY(0)
    txt_Title:SetText(couponName)
    txt_Title:SetPosX(25)
    txt_Title:SetPosY(10)
    txt_Rate:SetText(couponRate / 10000 .. "%")
    txt_Rate:SetPosX(225)
    txt_Rate:SetPosY(7)
    if couponState == 2 or couponState == 1 then
      txt_Date:SetFontColor((Defines.Color).C_FFF26A6A)
    else
      txt_Date:SetFontColor((Defines.Color).C_FFC4BEBE)
    end
    txt_Date:SetText(couponExpirationDate)
    txt_Date:SetPosX(25)
    txt_Date:SetPosY(37)
    txt_Desc:setLineCountByLimitAutoWrap(2)
    txt_Desc:SetTextMode(UI_TM.eTextMode_Limit_AutoWrap)
    txt_Desc:SetText("최대 할인 : " .. tostring(couponMaxDiscount))
    txt_Desc:SetPosX(25)
    txt_Desc:SetPosY(52)
    btn_CouponDelete:SetShow(true)
    btn_CouponDelete:SetText("삭제")
    btn_CouponDelete:addInputEvent("Mouse_LUp", "IngameCashShopCoupon_Delete( " .. tostring(couponNo) .. ")")
  end
end

IngameCashShopCoupon_Update = function(productNoRaw)
  -- function num : 0_3 , upvalues : cashCoupon
  local self = cashCoupon
  local count = (ToClient_GetCouponInfoCount())
  local cashProduct = nil
  local main = -1
  local middle = -1
  local small = -1
  local tcount = 0
  if productNoRaw ~= nil then
    cashProduct = (getIngameCashMall()):getCashProductStaticStatusByProductNoRaw(productNoRaw)
    main = cashProduct:getMainCategory()
    middle = cashProduct:getMiddleCategory()
    small = cashProduct:getSmallCategory()
  end
  ;
  ((self._list2):getElementManager()):clearKey()
  for i = 0, count - 1 do
    local couponWrapper = ToClient_GetCouponInfoWrapper(i)
    if couponWrapper:getCouponState() == 0 then
      if cashProduct == nil then
        tcount = tcount + 1
        ;
        ((self._list2):getElementManager()):pushKey(toInt64(0, i))
      else
        if couponWrapper:checkCategory(main, middle, small) == true then
          tcount = tcount + 1
          ;
          ((self._list2):getElementManager()):pushKey(toInt64(0, i))
        end
      end
    end
  end
  ;
  ((self._list2_Unused):getElementManager()):clearKey()
  for ii = 0, count - 1 do
    local couponWrapper = ToClient_GetCouponInfoWrapper(ii)
    if couponWrapper:getCouponState() ~= 0 then
      ((self._list2_Unused):getElementManager()):pushKey(toInt64(0, ii))
    end
  end
  if Panel_IngameCashShop_BuyOrGift:GetShow() then
    (self.btn_X):SetShow(false)
  else
    ;
    (self.btn_X):SetShow(true)
  end
  if tcount == 0 and cashProduct ~= nil then
    Panel_IngameCashShop_Coupon:SetShow(false)
  end
end

IngameCashShopCoupon_Delete = function(couponNo)
  -- function num : 0_4
  if couponNo == nil then
    return 
  end
  ToClient_DeleteCoupon(tonumber64(couponNo))
end

local pevCouponIdx = nil
IngameCashShopCoupon_MouseOver = function(isShow, idx)
  -- function num : 0_5 , upvalues : cashCoupon, selectKey, pevCouponIdx
  local self = cashCoupon
  local contents = (self._list2):GetContentByKey(toInt64(0, idx))
  local btn_Coupon = (UI.getChildControl)(contents, "RadioButton_CouponBG")
  local isCouponSavedIdx = selectKey
  btn_Coupon:ChangeOnTextureInfoName("new_ui_common_forlua/window/ingamecashshop/cashshop_coupon_01.dds")
  do
    if isCouponSavedIdx == idx then
      local x1, y1, x2, y2 = setTextureUV_Func(btn_Coupon, 1, 199, 364, 296)
      ;
      (btn_Coupon:getOnTexture()):setUV(x1, y1, x2, y2)
      btn_Coupon:setRenderTexture(btn_Coupon:getOnTexture())
      pevCouponIdx = isCouponSavedIdx
      return 
    end
    if isShow == true then
      local x1, y1, x2, y2 = setTextureUV_Func(btn_Coupon, 1, 100, 364, 197)
      ;
      (btn_Coupon:getOnTexture()):setUV(x1, y1, x2, y2)
      btn_Coupon:setRenderTexture(btn_Coupon:getOnTexture())
    else
      do
        local x1, y1, x2, y2 = setTextureUV_Func(btn_Coupon, 1, 1, 364, 98)
        ;
        (btn_Coupon:getOnTexture()):setUV(x1, y1, x2, y2)
        btn_Coupon:setRenderTexture(btn_Coupon:getOnTexture())
      end
    end
  end
end

IngameCashShopCoupon_CheckBTN = function(checkType)
  -- function num : 0_6 , upvalues : cashCoupon
  local self = cashCoupon
  if checkType == 0 then
    (self._list2):SetShow(true)
    ;
    (self._list2_Unused):SetShow(false)
  else
    if checkType == 1 then
      (self._list2):SetShow(false)
      ;
      (self._list2_Unused):SetShow(true)
    end
  end
  IngameCashShopCoupon_Update()
end

IngameCashShopCoupon_SavedCouponIndex = function(index)
  -- function num : 0_7 , upvalues : cashCoupon, selectKey
  if not Panel_IngameCashShop_BuyOrGift:GetShow() then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_COUPON_BUYWHENAPPLY"))
    return 
  end
  local self = cashCoupon
  self.savedCouponIndex = index
  local savedIndex = selectKey
  selectKey = index
  local contents = (self._list2):GetContentByKey(toInt64(0, index))
  local btn_Coupon = (UI.getChildControl)(contents, "RadioButton_CouponBG")
  local txt_Rate = (UI.getChildControl)(contents, "StaticText_CouponRate")
  if savedIndex ~= -1 then
    (self._list2):requestUpdateByKey(toInt64(0, savedIndex))
  end
  btn_Coupon:ChangeTextureInfoName("new_ui_common_forlua/window/ingamecashshop/cashshop_coupon_01.dds")
  local x1, y1, x2, y2 = setTextureUV_Func(btn_Coupon, 1, 199, 364, 296)
  ;
  (btn_Coupon:getBaseTexture()):setUV(x1, y1, x2, y2)
  btn_Coupon:setRenderTexture(btn_Coupon:getBaseTexture())
  txt_Rate:SetFontColor(4293914607)
  FGlobal_IngameShopBuy_Update(true)
end

IngameCashShopCoupon_SimpletooltipTitle = function(isShow, index)
  -- function num : 0_8 , upvalues : cashCoupon
  if isShow == nil then
    TooltipSimple_Hide()
    return 
  end
  local self = cashCoupon
  local name, desc, control = nil, nil, nil
  local contents = (self._list2):GetContentByKey(toInt64(0, index))
  local coupon_Title = (UI.getChildControl)(contents, "StaticText_CouponTItle")
  local couponWrapper = ToClient_GetCouponInfoWrapper(index)
  if couponWrapper ~= nil then
    local couponName = couponWrapper:getCouponName()
    name = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_COUPON_TITLE")
    desc = couponName
    control = coupon_Title
    TooltipSimple_Show(control, name, desc)
  end
end

FGlobal_IngameCashShopCoupon_RefreshList = function(productNoRaw)
  -- function num : 0_9 , upvalues : cashCoupon, selectKey
  local self = cashCoupon
  local savedIndex = selectKey
  selectKey = -1
  if savedIndex ~= -1 then
    (self._list2):requestUpdateByKey(toInt64(0, savedIndex))
  end
  IngameCashShopCoupon_Update(productNoRaw)
end

FGlobal_IngameCashShopCoupon_ReturnWrapperValue = function()
  -- function num : 0_10 , upvalues : cashCoupon
  local self = cashCoupon
  return self.savedCouponWrapper
end

FGlobal_IngameCashShopCoupon_ReturnValue = function()
  -- function num : 0_11 , upvalues : cashCoupon
  local self = cashCoupon
  return self.savedCouponIndex
end

FGlobal_IngameCashShopCoupon_ReturnValueCancel = function()
  -- function num : 0_12 , upvalues : cashCoupon
  local self = cashCoupon
  self.savedCouponIndex = nil
  return self.savedCouponIndex
end

FromClient_UpdateCouponInfo = function()
  -- function num : 0_13
  IngameCashShopCoupon_Update()
end

FromClient_DeleteCoupon = function(checkDelete)
  -- function num : 0_14
  if checkDelete then
    IngameCashShopCoupon_Update()
    return 
  end
end

IngameCashShopCoupon_Open = function(openType, productNoRaw)
  -- function num : 0_15 , upvalues : cashCoupon, isCouponOpen, selectKey
  local self = cashCoupon
  if not isCouponOpen then
    return 
  end
  local count = ToClient_GetCouponInfoUsableCount()
  if count == 0 and openType == 0 then
    return 
  end
  selectKey = -1
  ;
  (self.btn_Use):SetCheck(true)
  ;
  (self.btn_UseComplete):SetCheck(false)
  ;
  (self._list2):SetShow(true)
  ;
  (self._list2_Unused):SetShow(false)
  self.savedOpenType = openType
  Panel_IngameCashShop_Coupon:SetShow(true)
  if self.savedOpenType == nil then
    Panel_IngameCashShop_Coupon:SetPosX(getScreenSizeX() / 2 - Panel_IngameCashShop_Coupon:GetSizeX() / 2)
    Panel_IngameCashShop_Coupon:SetPosY(getScreenSizeY() / 2 - Panel_IngameCashShop_Coupon:GetSizeY() / 2)
    InGameShopBuy_Close()
  else
    if self.savedOpenType == 0 then
      Panel_IngameCashShop_Coupon:SetPosX(Panel_IngameCashShop_BuyOrGift:GetPosX() + Panel_IngameCashShop_BuyOrGift:GetSizeX() + 10)
    end
  end
  FGlobal_IngameCashShopCoupon_ReturnValueCancel()
  IngameCashShopCoupon_Update(productNoRaw)
end

IngameCashShopCoupon_Close = function(isCheck)
  -- function num : 0_16 , upvalues : cashCoupon
  local self = cashCoupon
  Panel_IngameCashShop_Coupon:SetShow(false)
  self.savedOpenType = nil
  if not isCheck then
    self.savedCouponIndex = nil
  end
  FGlobal_IngameShopBuy_Update()
end

IngameCashShopCoupon_Init()
IngameCashShopCoupon_Update()
registerEvent("FromClient_UpdateCouponInfo", "FromClient_UpdateCouponInfo")
registerEvent("FromClient_DeleteCoupon", "FromClient_DeleteCoupon")

