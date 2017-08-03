-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\ingamecashshop\panel_ingamecashshop_howusepearlshop.luac 

-- params : ...
-- function num : 0
local UI_TM = CppEnums.TextMode
local howUsePearlShop = {_stc_Bg = (UI.getChildControl)(Panel_IngameCashShop_HowUsePearlShop, "Static_BG"), _stc_NaverBG = (UI.getChildControl)(Panel_IngameCashShop_HowUsePearlShop, "Static_NaverDescBG"), _btn_Close = (UI.getChildControl)(Panel_IngameCashShop_HowUsePearlShop, "Button_Close")}
howUsePearlShop._txt_Desc = (UI.getChildControl)(howUsePearlShop._stc_Bg, "StaticText_Desc")
howUsePearlShop._txt_NaverDesc = (UI.getChildControl)(howUsePearlShop._stc_NaverBG, "StaticText_NaverDesc")
Panel_IngameCashShop_HowUsePearlShop_Init = function()
  -- function num : 0_0 , upvalues : howUsePearlShop, UI_TM
  local self = howUsePearlShop
  ;
  (self._txt_Desc):SetTextMode(UI_TM.eTextMode_AutoWrap)
  ;
  (self._txt_Desc):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_HOWUSEPEARLSHOP_MAINDESC"))
  ;
  (self._txt_NaverDesc):SetTextMode(UI_TM.eTextMode_AutoWrap)
  ;
  (self._txt_NaverDesc):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_HOWUSEPEARLSHOP_NAVERDESC"))
  do
    if (self._stc_Bg):GetSizeY() < (self._txt_Desc):GetTextSizeY() + 60 then
      local minusSizeY = (self._txt_Desc):GetTextSizeY() - (self._stc_Bg):GetSizeY() + 60
      Panel_IngameCashShop_HowUsePearlShop:SetSize(Panel_IngameCashShop_HowUsePearlShop:GetSizeX(), Panel_IngameCashShop_HowUsePearlShop:GetSizeY() + minusSizeY)
      ;
      (self._stc_Bg):SetSize((self._stc_Bg):GetSizeX(), (self._stc_Bg):GetSizeY() + minusSizeY)
      ;
      (self._stc_NaverBG):SetPosY((self._stc_NaverBG):GetPosY() + minusSizeY)
    end
    do
      if (self._stc_NaverBG):GetSizeY() < (self._txt_NaverDesc):GetTextSizeY() + 60 then
        local minusSizeY = (self._txt_NaverDesc):GetTextSizeY() - (self._stc_NaverBG):GetSizeY() + 60
        Panel_IngameCashShop_HowUsePearlShop:SetSize(Panel_IngameCashShop_HowUsePearlShop:GetSizeX(), Panel_IngameCashShop_HowUsePearlShop:GetSizeY() + minusSizeY)
        ;
        (self._stc_NaverBG):SetSize((self._stc_NaverBG):GetSizeX(), (self._stc_NaverBG):GetSizeY() + minusSizeY)
      end
      ;
      (self._btn_Close):addInputEvent("Mouse_LUp", "Panel_IngameCashShop_HowUsePearlShop_Close()")
    end
  end
end

Panel_IngameCashShop_HowUsePearlShop_Open = function()
  -- function num : 0_1
  Panel_IngameCashShop_HowUsePearlShop:SetShow(true)
end

Panel_IngameCashShop_HowUsePearlShop_Close = function()
  -- function num : 0_2
  Panel_IngameCashShop_HowUsePearlShop:SetShow(false)
end

Panel_IngameCashShop_HowUsePearlShop_Init()

