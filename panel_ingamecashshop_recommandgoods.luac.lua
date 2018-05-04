-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\window\ingamecashshop\panel_ingamecashshop_recommandgoods.luac 

-- params : ...
-- function num : 0
local UI_TM = CppEnums.TextMode
PaGlobal_RecommendGoods = {_currentPage = 0, _maxPage = 0, _CONST_MAX_PAGE_SIZE = 7, 
_ui = {
_goodsBg = {[0] = (UI.getChildControl)(Panel_Window_RecommandGoods, "Static_TempBg0"), [1] = (UI.getChildControl)(Panel_Window_RecommandGoods, "Static_TempBg1"), [2] = (UI.getChildControl)(Panel_Window_RecommandGoods, "Static_TempBg2")}
, _close = (UI.getChildControl)(Panel_Window_RecommandGoods, "Button_Close"), _btn_Left = (UI.getChildControl)(Panel_Window_RecommandGoods, "Button_Left"), _btn_Right = (UI.getChildControl)(Panel_Window_RecommandGoods, "Button_Right"), _text_Title = (UI.getChildControl)(Panel_Window_RecommandGoods, "StaticText_Title")}
}
-- DECOMPILER ERROR at PC55: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_RecommendGoods.Initialize = function(self)
  -- function num : 0_0
  -- DECOMPILER ERROR at PC20: Confused about usage of register: R1 in 'UnsetPending'

  (self._ui)._goodsBG = {[0] = (UI.getChildControl)(Panel_Window_RecommandGoods, "Static_TempBg0"), [1] = (UI.getChildControl)(Panel_Window_RecommandGoods, "Static_TempBg1"), [2] = (UI.getChildControl)(Panel_Window_RecommandGoods, "Static_TempBg2")}
  -- DECOMPILER ERROR at PC47: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._goodsImage = {[0] = (UI.getChildControl)(((self._ui)._goodsBG)[0], "Static_BannerImage"), [1] = (UI.getChildControl)(((self._ui)._goodsBG)[1], "Static_BannerImage"), [2] = (UI.getChildControl)(((self._ui)._goodsBG)[2], "Static_BannerImage")}
  -- DECOMPILER ERROR at PC74: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._goodsName = {[0] = (UI.getChildControl)(((self._ui)._goodsBG)[0], "StaticText_GoodsName"), [1] = (UI.getChildControl)(((self._ui)._goodsBG)[1], "StaticText_GoodsName"), [2] = (UI.getChildControl)(((self._ui)._goodsBG)[2], "StaticText_GoodsName")}
  -- DECOMPILER ERROR at PC101: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._goodsPrice = {[0] = (UI.getChildControl)(((self._ui)._goodsBG)[0], "StaticText_Price"), [1] = (UI.getChildControl)(((self._ui)._goodsBG)[1], "StaticText_Price"), [2] = (UI.getChildControl)(((self._ui)._goodsBG)[2], "StaticText_Price")}
  -- DECOMPILER ERROR at PC146: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._radioBtn = {[0] = (UI.getChildControl)(Panel_Window_RecommandGoods, "RadioButton_TempPage0"), [1] = (UI.getChildControl)(Panel_Window_RecommandGoods, "RadioButton_TempPage1"), [2] = (UI.getChildControl)(Panel_Window_RecommandGoods, "RadioButton_TempPage2"), [3] = (UI.getChildControl)(Panel_Window_RecommandGoods, "RadioButton_TempPage3"), [4] = (UI.getChildControl)(Panel_Window_RecommandGoods, "RadioButton_TempPage4"), [5] = (UI.getChildControl)(Panel_Window_RecommandGoods, "RadioButton_TempPage5"), [6] = (UI.getChildControl)(Panel_Window_RecommandGoods, "RadioButton_TempPage6")}
  ;
  ((self._ui)._btn_Left):addInputEvent("Mouse_LUp", "PaGlobal_RecommendGoods:Click_Slide(true)")
  ;
  ((self._ui)._btn_Right):addInputEvent("Mouse_LUp", "PaGlobal_RecommendGoods:Click_Slide(false)")
  ;
  ((self._ui)._close):SetIgnore(true)
  ;
  ((self._ui)._close):SetShow(false)
  for ii = 0, 2 do
    (((self._ui)._goodsName)[ii]):SetIgnore(true)
    ;
    (((self._ui)._goodsImage)[ii]):SetIgnore(true)
    ;
    (((self._ui)._goodsPrice)[ii]):SetIgnore(true)
    ;
    (((self._ui)._goodsBg)[ii]):addInputEvent("Mouse_UpScroll", "PaGlobal_RecommendGoods:Click_Slide(true)")
    ;
    (((self._ui)._goodsBg)[ii]):addInputEvent("Mouse_DownScroll", "PaGlobal_RecommendGoods:Click_Slide(false)")
  end
end

-- DECOMPILER ERROR at PC58: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_RecommendGoods.Clear_OnlyProduct = function(self)
  -- function num : 0_1
  for ii = 0, 2 do
    (((self._ui)._goodsBG)[ii]):SetShow(false)
  end
end

-- DECOMPILER ERROR at PC61: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_RecommendGoods.Click_Slide = function(self, isLeft)
  -- function num : 0_2
  if isLeft == true then
    self._currentPage = (math.max)(0, self._currentPage - 1)
  else
    self._currentPage = (math.min)(self._currentPage + 1, self._maxPage)
  end
  self:Clear_OnlyProduct()
  self:Update()
end

-- DECOMPILER ERROR at PC64: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_RecommendGoods.Click_Radio = function(self, idx)
  -- function num : 0_3
  self._currentPage = idx
  self:Clear_OnlyProduct()
  self:Update()
end

-- DECOMPILER ERROR at PC68: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_RecommendGoods.Update = function(self)
  -- function num : 0_4 , upvalues : UI_TM
  local uiRow = 0
  local size = ToClient_getCashRecommendList()
  if size == 0 then
    return false
  end
  self._maxPage = (math.floor)(size / 3) - 1
  if self._CONST_MAX_PAGE_SIZE - 1 < self._maxPage then
    self._maxPage = self._CONST_MAX_PAGE_SIZE - 1
  end
  local loopStart = self._currentPage * 3
  local loopEnd = loopStart + 2
  if self._maxPage < loopEnd then
    for ii = loopStart, loopEnd do
      local productNo = ToClient_getRecommendCashProductNoByIndex(ii)
      local cashProduct = (getIngameCashMall()):getCashProductStaticStatusByProductNoRaw(productNo)
      if cashProduct ~= nil then
        (((self._ui)._goodsBG)[uiRow]):SetShow(true)
        ;
        (((self._ui)._goodsName)[uiRow]):SetTextMode(UI_TM.eTextMode_AutoWrap)
        ;
        (((self._ui)._goodsName)[uiRow]):SetText(tostring(cashProduct:getName()))
        ;
        (((self._ui)._goodsPrice)[uiRow]):SetText(tostring(cashProduct:getPrice()))
        ;
        (((self._ui)._goodsImage)[uiRow]):ChangeTextureInfoName(cashProduct:getPackageIcon())
        ;
        (((self._ui)._goodsBG)[uiRow]):addInputEvent("Mouse_LUp", "PaGlobal_RecommendGoods:GoToProduct(" .. productNo .. "," .. "1" .. ")")
        ;
        (((self._ui)._goodsImage)[uiRow]):addInputEvent("Mouse_LUp", "PaGlobal_RecommendGoods:GoToProduct(" .. productNo .. "," .. "1" .. ")")
        uiRow = uiRow + 1
      end
    end
    if self._currentPage == 0 then
      ((self._ui)._btn_Left):SetShow(false)
    else
      ;
      ((self._ui)._btn_Left):SetShow(true)
    end
    if self._maxPage <= self._currentPage then
      ((self._ui)._btn_Right):SetShow(false)
    else
      ;
      ((self._ui)._btn_Right):SetShow(true)
    end
    for ii = 0, self._maxPage do
      local jj = self._maxPage - ii
      ;
      (((self._ui)._radioBtn)[ii]):SetShow(true)
      ;
      (((self._ui)._radioBtn)[ii]):addInputEvent("Mouse_LUp", "PaGlobal_RecommendGoods:Click_Radio(" .. jj .. ")")
      ;
      (((self._ui)._radioBtn)[ii]):SetCheck(false)
    end
    local calcPageNo = self._maxPage - self._currentPage
    if calcPageNo < 0 then
      (((self._ui)._radioBtn)[0]):SetCheck(true)
    else
      ;
      (((self._ui)._radioBtn)[calcPageNo]):SetCheck(true)
    end
    return true
  end
end

-- DECOMPILER ERROR at PC71: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_RecommendGoods.Open = function(self)
  -- function num : 0_5
  if _ContentsGroup_Recommend == false then
    return 
  end
  local selfPlayer = getSelfPlayer()
  if selfPlayer ~= nil then
    local userNickName = (getSelfPlayer()):getUserNickname()
    ;
    ((self._ui)._text_Title):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_INGAMECASH_RECOMMEND_TITLE", "userName", tostring(userNickName)))
  else
    do
      ;
      ((self._ui)._text_Title):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_INGAMECASH_RECOMMEND_TITLE", "userName", ""))
      self:Clear()
      if self:Update() == false then
        return 
      end
      Panel_Window_RecommandGoods:SetPosX(50)
      Panel_Window_RecommandGoods:SetPosY(3)
      Panel_Window_RecommandGoods:SetShow(true)
    end
  end
end

-- DECOMPILER ERROR at PC74: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_RecommendGoods.Clear = function(self)
  -- function num : 0_6
  self._currentPage = 0
  self._maxPage = 0
  for ii = 0, 2 do
    (((self._ui)._goodsBG)[ii]):SetShow(false)
  end
  for _,value in pairs((self._ui)._radioBtn) do
    value:SetShow(false)
  end
end

-- DECOMPILER ERROR at PC77: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_RecommendGoods.Close = function(self)
  -- function num : 0_7
  self:Clear()
  Panel_Window_RecommandGoods:SetShow(false)
end

-- DECOMPILER ERROR at PC80: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_RecommendGoods.GoToProduct = function(self, cashProductNo, clickType)
  -- function num : 0_8
  local mainCashProductNo = ToClient_getRealTargetCashProductNo(cashProductNo)
  ToClient_RequestShowProduct(mainCashProductNo, nil, clickType)
end

PaGlobal_RecommendGoods:Initialize()

