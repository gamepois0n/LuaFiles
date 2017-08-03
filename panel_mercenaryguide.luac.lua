-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\mercenary\panel_mercenaryguide.luac 

-- params : ...
-- function num : 0
Panel_Window_MercenaryDesc:SetShow(false)
local mercenaryGuide = {
_control = {
_radioBtn = {}
, 
_bg = {}
, 
_desc = {}
}
, _descTypeCount = 3, 
_descCount = {[1] = 4, [2] = 6, [3] = 4}
, _basePosY = 5, _baseGap = 5}
mercenaryGuide.Init = function(self)
  -- function num : 0_0
  local control = self._control
  for index = 0, self._descTypeCount - 1 do
    -- DECOMPILER ERROR at PC14: Confused about usage of register: R6 in 'UnsetPending'

    (control._radioBtn)[index] = (UI.getChildControl)(Panel_Window_MercenaryDesc, "RadioButton_Mercenary_Title" .. index + 1)
    ;
    ((control._radioBtn)[index]):addInputEvent("Mouse_LUp", "HandleClicked_MercenaryRadioBtn(" .. index .. ")")
    -- DECOMPILER ERROR at PC32: Confused about usage of register: R6 in 'UnsetPending'

    ;
    (control._bg)[index] = (UI.getChildControl)(Panel_Window_MercenaryDesc, "Static_BG_" .. index + 1)
    -- DECOMPILER ERROR at PC35: Confused about usage of register: R6 in 'UnsetPending'

    ;
    (control._desc)[index] = {}
    for descIndex = 1, (self._descCount)[index + 1] do
      -- DECOMPILER ERROR at PC59: Confused about usage of register: R10 in 'UnsetPending'

      ((control._desc)[index])[descIndex] = (UI.createAndCopyBasePropertyControl)((control._bg)[index], "StaticText_Desc" .. index + 1, (control._bg)[index], "StaticText_Mercenary_Desc_" .. index .. "_" .. descIndex)
      ;
      (((control._desc)[index])[descIndex]):SetTextMode((CppEnums.TextMode).eTextMode_AutoWrap)
      ;
      (((control._desc)[index])[descIndex]):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_MILITIA_DESC_" .. index + 1 .. "_" .. descIndex))
      if descIndex > 1 then
        (((control._desc)[index])[descIndex]):SetPosY((((control._desc)[index])[descIndex - 1]):GetPosY() + (((control._desc)[index])[descIndex - 1]):GetTextSizeY() + self._baseGap)
      else
        ;
        (((control._desc)[index])[descIndex]):SetPosY(self._basePosY)
      end
    end
  end
end

HandleClicked_MercenaryRadioBtn = function(index)
  -- function num : 0_1 , upvalues : mercenaryGuide
  local self = mercenaryGuide
  local control = self._control
  for index = 0, self._descTypeCount - 1 do
    local isShow = ((control._radioBtn)[index]):IsCheck()
    ;
    ((control._bg)[index]):SetShow(isShow)
    for descIndex = 1, (self._descCount)[index + 1] do
      (((control._desc)[index])[descIndex]):SetShow(false)
    end
  end
end

local spreadSpeed = 500
MercenaryDesc_ShowDesc = function(deltaTime)
  -- function num : 0_2 , upvalues : mercenaryGuide, spreadSpeed
  local self = mercenaryGuide
  do
    local control = self._control
    if ((control._radioBtn)[0]):IsCheck() then
      if ((control._bg)[0]):GetSizeY() < (((control._desc)[0])[4]):GetPosY() + (((control._desc)[0])[4]):GetTextSizeY() + 10 then
        ((control._bg)[0]):SetSize(((control._bg)[0]):GetSizeX(), ((control._bg)[0]):GetSizeY() + deltaTime * spreadSpeed)
      else
        ;
        ((control._bg)[0]):SetSize(((control._bg)[0]):GetSizeX(), (((control._desc)[0])[4]):GetPosY() + (((control._desc)[0])[4]):GetTextSizeY() + 10)
      end
      ;
      ((control._radioBtn)[1]):SetPosY(((control._bg)[0]):GetPosY() + ((control._bg)[0]):GetSizeY() + 10)
      ;
      ((control._radioBtn)[2]):SetPosY(((control._radioBtn)[1]):GetPosY() + ((control._radioBtn)[1]):GetSizeY() + 10)
      for descIndex = 1, (self._descCount)[1] do
        (((control._desc)[0])[descIndex]):SetShow((((control._desc)[0])[descIndex]):GetPosY() + (((control._desc)[0])[descIndex]):GetTextSizeY() + 5 < ((control._bg)[0]):GetSizeY())
      end
      ;
      ((control._bg)[1]):SetSize((((mercenaryGuide._control)._bg)[1]):GetSizeX(), 10)
      ;
      ((control._bg)[2]):SetSize((((mercenaryGuide._control)._bg)[2]):GetSizeX(), 10)
    end
    if ((control._radioBtn)[1]):IsCheck() then
      ((control._bg)[0]):SetSize((((mercenaryGuide._control)._bg)[0]):GetSizeX(), 10)
      if ((control._radioBtn)[0]):GetPosY() + ((control._radioBtn)[0]):GetSizeY() + 10 < ((control._radioBtn)[1]):GetPosY() then
        ((control._radioBtn)[1]):SetPosY(((control._radioBtn)[1]):GetPosY() - deltaTime * spreadSpeed * 2)
      else
        ((control._radioBtn)[1]):SetPosY(((control._radioBtn)[0]):GetPosY() + ((control._radioBtn)[0]):GetSizeY() + 10)
      end
      ;
      ((control._bg)[1]):SetPosY(((control._radioBtn)[1]):GetPosY() + ((control._radioBtn)[1]):GetSizeY() + 5)
      if ((control._bg)[1]):GetSizeY() < (((control._desc)[1])[6]):GetPosY() + (((control._desc)[1])[6]):GetTextSizeY() + 10 then
        ((control._bg)[1]):SetSize(((control._bg)[1]):GetSizeX(), ((control._bg)[1]):GetSizeY() + deltaTime * spreadSpeed)
      else
        ((control._bg)[1]):SetSize(((control._bg)[1]):GetSizeX(), (((control._desc)[1])[6]):GetPosY() + (((control._desc)[1])[6]):GetTextSizeY() + 10)
      end
      ;
      ((control._radioBtn)[2]):SetPosY(((control._bg)[1]):GetPosY() + ((control._bg)[1]):GetSizeY() + 10)
      for descIndex = 1, (self._descCount)[2] do
        (((control._desc)[1])[descIndex]):SetShow((((control._desc)[1])[descIndex]):GetPosY() + (((control._desc)[1])[descIndex]):GetTextSizeY() + 5 < ((control._bg)[1]):GetSizeY())
      end
    end
    if ((control._radioBtn)[2]):IsCheck() then
      ((control._bg)[0]):SetSize((((mercenaryGuide._control)._bg)[0]):GetSizeX(), 10)
      ;
      ((control._bg)[1]):SetSize((((mercenaryGuide._control)._bg)[1]):GetSizeX(), 10)
      if ((control._radioBtn)[1]):GetPosY() + ((control._radioBtn)[1]):GetSizeY() + 10 < ((control._radioBtn)[2]):GetPosY() then
        ((control._radioBtn)[2]):SetPosY(((control._radioBtn)[2]):GetPosY() - deltaTime * spreadSpeed * 2)
      else
        ((control._radioBtn)[2]):SetPosY(((control._radioBtn)[1]):GetPosY() + ((control._radioBtn)[1]):GetSizeY() + 10)
      end
      ;
      ((control._bg)[2]):SetPosY(((control._radioBtn)[2]):GetPosY() + ((control._radioBtn)[1]):GetSizeY() + 5)
      if ((control._bg)[2]):GetSizeY() < (((control._desc)[2])[4]):GetPosY() + (((control._desc)[2])[4]):GetTextSizeY() + 10 then
        ((control._bg)[2]):SetSize(((control._bg)[2]):GetSizeX(), ((control._bg)[2]):GetSizeY() + deltaTime * spreadSpeed)
      else
        ((control._bg)[2]):SetSize(((control._bg)[2]):GetSizeX(), (((control._desc)[2])[4]):GetPosY() + (((control._desc)[2])[4]):GetTextSizeY() + 10)
      end
      for descIndex = 1, (self._descCount)[3] do
        (((control._desc)[2])[descIndex]):SetShow((((control._desc)[2])[descIndex]):GetPosY() + (((control._desc)[2])[descIndex]):GetTextSizeY() + 5 < ((control._bg)[2]):GetSizeY())
      end
      if ((control._radioBtn)[0]):GetPosY() + ((control._radioBtn)[0]):GetSizeY() + 10 < ((control._radioBtn)[1]):GetPosY() then
        ((control._radioBtn)[1]):SetPosY(((control._radioBtn)[1]):GetPosY() - deltaTime * spreadSpeed * 2)
      else
        ((control._radioBtn)[1]):SetPosY(((control._radioBtn)[0]):GetPosY() + ((control._radioBtn)[0]):GetSizeY() + 10)
      end
    end
    -- DECOMPILER ERROR: 15 unprocessed JMP targets
  end
end

FGlobal_MercenaryDesc_Open = function()
  -- function num : 0_3 , upvalues : mercenaryGuide
  Panel_Window_MercenaryDesc:SetShow(true)
  Panel_Window_MercenaryDesc:SetPosX(Panel_Window_Mercenary:GetPosX() - Panel_Window_MercenaryDesc:GetSizeX() - 5)
  Panel_Window_MercenaryDesc:SetPosY(Panel_Window_Mercenary:GetPosY() + 5)
  ;
  (((mercenaryGuide._control)._radioBtn)[0]):SetCheck(true)
  ;
  (((mercenaryGuide._control)._radioBtn)[1]):SetCheck(false)
  ;
  (((mercenaryGuide._control)._radioBtn)[2]):SetCheck(false)
  ;
  (((mercenaryGuide._control)._bg)[0]):SetSize((((mercenaryGuide._control)._bg)[0]):GetSizeX(), 10)
  HandleClicked_MercenaryRadioBtn(0)
end

FGlobal_MercenaryDesc_Close = function()
  -- function num : 0_4
  Panel_Window_MercenaryDesc:SetShow(false)
end

FGlobal_MercenaryDesc_ShowToggle = function()
  -- function num : 0_5
  if Panel_Window_MercenaryDesc:GetShow() then
    FGlobal_MercenaryDesc_Close()
  else
    FGlobal_MercenaryDesc_Open()
  end
end

mercenaryGuide:Init()
Panel_Window_MercenaryDesc:RegisterUpdateFunc("MercenaryDesc_ShowDesc")

