-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\window\ingamecashshop\panel_ingamecashshop_recommandgoods_popup.luac 

-- params : ...
-- function num : 0
local UI_TM = CppEnums.TextMode
Panel_Window_RecommandGoods_PopUp:SetShow(false)
PaGlobal_Recommend_PopUp = {
_ui = {_topBg = (UI.getChildControl)(Panel_Window_RecommandGoods_PopUp, "Static_TopBg"), _mainBG = (UI.getChildControl)(Panel_Window_RecommandGoods_PopUp, "Static_Bg"), _close = (UI.getChildControl)(Panel_Window_RecommandGoods_PopUp, "Button_Close"), _btn_Left = (UI.getChildControl)(Panel_Window_RecommandGoods_PopUp, "Button_Left"), _btn_Right = (UI.getChildControl)(Panel_Window_RecommandGoods_PopUp, "Button_Right")}
, _maxPage = 0, _currentPage = 0}
-- DECOMPILER ERROR at PC44: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_Recommend_PopUp.Initialize = function(self)
  -- function num : 0_0
  -- DECOMPILER ERROR at PC50: Confused about usage of register: R1 in 'UnsetPending'

  (self._ui)._goodsBG = {[0] = (UI.getChildControl)((PaGlobal_Recommend_PopUp._ui)._mainBG, "Static_TempBg0"), [1] = (UI.getChildControl)((PaGlobal_Recommend_PopUp._ui)._mainBG, "Static_TempBg1"), [2] = (UI.getChildControl)((PaGlobal_Recommend_PopUp._ui)._mainBG, "Static_TempBg2"), [3] = (UI.getChildControl)((PaGlobal_Recommend_PopUp._ui)._mainBG, "Static_TempBg3"), [4] = (UI.getChildControl)((PaGlobal_Recommend_PopUp._ui)._mainBG, "Static_TempBg4"), [5] = (UI.getChildControl)((PaGlobal_Recommend_PopUp._ui)._mainBG, "Static_TempBg5")}
  -- DECOMPILER ERROR at PC101: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._goodsImage = {[0] = (UI.getChildControl)(((self._ui)._goodsBG)[0], "Static_BannerImage"), [1] = (UI.getChildControl)(((self._ui)._goodsBG)[1], "Static_BannerImage"), [2] = (UI.getChildControl)(((self._ui)._goodsBG)[2], "Static_BannerImage"), [3] = (UI.getChildControl)(((self._ui)._goodsBG)[3], "Static_BannerImage"), [4] = (UI.getChildControl)(((self._ui)._goodsBG)[4], "Static_BannerImage"), [5] = (UI.getChildControl)(((self._ui)._goodsBG)[5], "Static_BannerImage")}
  -- DECOMPILER ERROR at PC152: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._goodsName = {[0] = (UI.getChildControl)(((self._ui)._goodsBG)[0], "StaticText_GoodsName"), [1] = (UI.getChildControl)(((self._ui)._goodsBG)[1], "StaticText_GoodsName"), [2] = (UI.getChildControl)(((self._ui)._goodsBG)[2], "StaticText_GoodsName"), [3] = (UI.getChildControl)(((self._ui)._goodsBG)[3], "StaticText_GoodsName"), [4] = (UI.getChildControl)(((self._ui)._goodsBG)[4], "StaticText_GoodsName"), [5] = (UI.getChildControl)(((self._ui)._goodsBG)[5], "StaticText_GoodsName")}
  -- DECOMPILER ERROR at PC203: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._goodsPrice = {[0] = (UI.getChildControl)(((self._ui)._goodsBG)[0], "StaticText_Price"), [1] = (UI.getChildControl)(((self._ui)._goodsBG)[1], "StaticText_Price"), [2] = (UI.getChildControl)(((self._ui)._goodsBG)[2], "StaticText_Price"), [3] = (UI.getChildControl)(((self._ui)._goodsBG)[3], "StaticText_Price"), [4] = (UI.getChildControl)(((self._ui)._goodsBG)[4], "StaticText_Price"), [5] = (UI.getChildControl)(((self._ui)._goodsBG)[5], "StaticText_Price")}
  ;
  ((self._ui)._close):addInputEvent("Mouse_LUp", "PaGlobal_Recommend_PopUp:Close()")
  ;
  ((self._ui)._btn_Left):addInputEvent("Mouse_LUp", "PaGlobal_Recommend_PopUp:Click_Slide(true)")
  ;
  ((self._ui)._btn_Right):addInputEvent("Mouse_LUp", "PaGlobal_Recommend_PopUp:Click_Slide(false)")
end

-- DECOMPILER ERROR at PC47: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_Recommend_PopUp.Clear = function(self)
  -- function num : 0_1
  for ii = 0, 5 do
    (((self._ui)._goodsBG)[ii]):SetShow(false)
  end
  self._maxPage = 0
  self._currentPage = 0
end

-- DECOMPILER ERROR at PC50: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_Recommend_PopUp.Open = function(self)
  -- function num : 0_2
  if _ContentsGroup_Recommend == false then
    return 
  end
  self:Clear()
  self:Update()
  Panel_Window_RecommandGoods_PopUp:SetPosX(getScreenSizeX() / 2 - Panel_Window_RecommandGoods_PopUp:GetSizeX() / 2)
  Panel_Window_RecommandGoods_PopUp:SetPosY(getScreenSizeY() / 2 - Panel_Window_RecommandGoods_PopUp:GetSizeY() / 2)
  Panel_Window_RecommandGoods_PopUp:SetShow(true)
end

-- DECOMPILER ERROR at PC54: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_Recommend_PopUp.Update = function(self)
  -- function num : 0_3 , upvalues : UI_TM
  local uiRow = 0
  local size = ToClient_getCashBuyRecommendList()
  self._maxPage = (math.floor)(size / 6)
  local loopStart = self._currentPage * 6
  local loopEnd = loopStart + 5
  if self._maxPage < loopEnd then
    for ii = loopStart, loopEnd do
      local productNo = ToClient_getRecommendBuyCashProductNoByIndex(ii)
      local cashProduct = (getIngameCashMall()):getCashProductStaticStatusByProductNoRaw(productNo)
      if cashProduct ~= nil and cashProduct:isSellTimeOver() == false then
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
        (((self._ui)._goodsBG)[uiRow]):addInputEvent("Mouse_LUp", "PaGlobal_RecommendGoods:GoToProduct(" .. productNo .. ")")
        ;
        (((self._ui)._goodsImage)[uiRow]):addInputEvent("Mouse_LUp", "PaGlobal_RecommendGoods:GoToProduct(" .. productNo .. ")")
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
  end
end

-- DECOMPILER ERROR at PC57: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_Recommend_PopUp.Close = function(self)
  -- function num : 0_4
  Panel_Window_RecommandGoods_PopUp:SetShow(false)
end

-- DECOMPILER ERROR at PC60: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_Recommend_PopUp.Clear_OnlyProduct = function(self)
  -- function num : 0_5
  for ii = 0, 5 do
    (((self._ui)._goodsBG)[ii]):SetShow(false)
  end
end

-- DECOMPILER ERROR at PC63: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_Recommend_PopUp.Click_Slide = function(self, isLeft)
  -- function num : 0_6
  if isLeft == true then
    self._currentPage = (math.max)(0, self._currentPage - 1)
  else
    self._currentPage = (math.min)(self._currentPage + 1, self._maxPage)
  end
  self:Clear_OnlyProduct()
  self:Update()
end

PaGlobal_Recommend_PopUp:Initialize()

