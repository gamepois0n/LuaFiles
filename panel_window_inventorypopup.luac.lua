-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\window\inventory\console\panel_window_inventorypopup.luac 

-- params : ...
-- function num : 0
local _panel = Panel_Window_InventoryPopup_Renew
local BUTTON = {UP = (CppEnums.PA_CONSOLE_UI_EVENT_TYPE).eCONSOLE_UI_EVENT_TYPE_UP, DOWN = (CppEnums.PA_CONSOLE_UI_EVENT_TYPE).eCONSOLE_UI_EVENT_TYPE_DOWN, LEFT = (CppEnums.PA_CONSOLE_UI_EVENT_TYPE).eCONSOLE_UI_EVENT_TYPE_LEFT, RIGHT = (CppEnums.PA_CONSOLE_UI_EVENT_TYPE).eCONSOLE_UI_EVENT_TYPE_RIGHT, LB = (CppEnums.PA_CONSOLE_UI_EVENT_TYPE).eCONSOLE_UI_EVENT_TYPE_LB, RB = (CppEnums.PA_CONSOLE_UI_EVENT_TYPE).eCONSOLE_UI_EVENT_TYPE_RB, LB2 = (CppEnums.PA_CONSOLE_UI_EVENT_TYPE).eCONSOLE_UI_EVENT_TYPE_LB2, RB2 = (CppEnums.PA_CONSOLE_UI_EVENT_TYPE).eCONSOLE_UI_EVENT_TYPE_RB2, X = 8, Y = 9, A = 10, B = 11}
local InventoryPopup = {
_ui = {stc_BG = (UI.getChildControl)(_panel, "Static_BG"), btn_ButtonTemplate = nil, txt_descTemplate = nil, stc_iconTemplate = nil, 
btn_functions = {}
, 
stc_icons = {}
, 
txt_descriptions = {}
}
, _buttonYGab = nil, _pooledButtonCount = 0, _visibleButtonCount = 0}
local _buttonUV = {
[BUTTON.UP] = {181, 136, 225, 180}
, 
[BUTTON.DOWN] = {181, 46, 225, 90}
, 
[BUTTON.LEFT] = {181, 91, 225, 135}
, 
[BUTTON.RIGHT] = {181, 1, 225, 45}
, 
[BUTTON.LB] = {91, 136, 135, 180}
, 
[BUTTON.RB] = {136, 136, 180, 180}
, 
[BUTTON.X] = {136, 1, 180, 45}
, 
[BUTTON.Y] = {46, 1, 90, 45}
, 
[BUTTON.A] = {1, 1, 45, 45}
, 
[BUTTON.B] = {91, 1, 135, 45}
}
local _popupConfig = {
[1] = {func = nil, param = nil, icon = nil, desc = nil}
}
FromClient_luaLoadComplete_InventoryPopup_Init = function()
  -- function num : 0_0 , upvalues : InventoryPopup
  InventoryPopup:initialize()
end

registerEvent("FromClient_luaLoadComplete", "FromClient_luaLoadComplete_InventoryPopup_Init")
InventoryPopup.initialize = function(self)
  -- function num : 0_1
  -- DECOMPILER ERROR at PC7: Confused about usage of register: R1 in 'UnsetPending'

  (self._ui).btn_ButtonTemplate = (UI.getChildControl)((self._ui).stc_BG, "Button_Template")
  -- DECOMPILER ERROR at PC15: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).txt_descTemplate = (UI.getChildControl)((self._ui).btn_ButtonTemplate, "StaticText_DescTemplate")
  -- DECOMPILER ERROR at PC23: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).stc_iconTemplate = (UI.getChildControl)((self._ui).btn_ButtonTemplate, "Static_IconTemplate")
  self._buttonYGab = ((self._ui).btn_ButtonTemplate):GetSizeY() + 10
  self:registEventHandler()
end

InventoryPopup.registEventHandler = function(self)
  -- function num : 0_2
  ((self._ui).stc_BG):addInputEvent("Mouse_Out", "PaGlobalFunc_InventoryPopup_CheckMouseAndClose()")
end

PaGlobalFunc_InventoryPopup_Open = function(option, posX, posY)
  -- function num : 0_3 , upvalues : InventoryPopup, _popupConfig, _panel, _buttonUV
  local self = InventoryPopup
  if option == nil then
    return 
  end
  _popupConfig = nil
  _popupConfig = option
  _panel:SetShow(true)
  self._visibleButtonCount = 0
  for ii = 1, #_popupConfig do
    -- DECOMPILER ERROR at PC47: Confused about usage of register: R8 in 'UnsetPending'

    if (_popupConfig[ii]).func ~= nil and type((_popupConfig[ii]).func) == "function" then
      if ((self._ui).btn_functions)[ii] == nil then
        ((self._ui).btn_functions)[ii] = (UI.createAndCopyBasePropertyControl)((self._ui).stc_BG, "Button_Template", (self._ui).stc_BG, "Button_" .. ii)
        -- DECOMPILER ERROR at PC62: Confused about usage of register: R8 in 'UnsetPending'

        ;
        ((self._ui).stc_icons)[ii] = (UI.createAndCopyBasePropertyControl)((self._ui).btn_ButtonTemplate, "Static_IconTemplate", ((self._ui).btn_functions)[ii], "Static_Icon_" .. ii)
        -- DECOMPILER ERROR at PC77: Confused about usage of register: R8 in 'UnsetPending'

        ;
        ((self._ui).txt_descriptions)[ii] = (UI.createAndCopyBasePropertyControl)((self._ui).btn_ButtonTemplate, "StaticText_DescTemplate", ((self._ui).btn_functions)[ii], "StaticText_Desc_" .. ii)
        ;
        (((self._ui).btn_functions)[ii]):SetPosY(((self._ui).btn_ButtonTemplate):GetPosY() + (ii - 1) * self._buttonYGab)
        self._pooledButtonCount = self._pooledButtonCount + 1
      end
      ;
      (((self._ui).btn_functions)[ii]):SetShow(true)
      ;
      (((self._ui).btn_functions)[ii]):addInputEvent("Mouse_LUp", "PaGlobalFunc_InventoryPopup_ProcessFunc(" .. ii .. ")")
      ;
      (((self._ui).btn_functions)[ii]):addInputEvent("Mouse_RUp", "PaGlobalFunc_InventoryPopup_Close()")
      ;
      (((self._ui).btn_functions)[ii]):addInputEvent("Mouse_Out", "PaGlobalFunc_InventoryPopup_CheckMouseAndClose()")
      if (_popupConfig[ii]).enable ~= nil then
        (((self._ui).btn_functions)[ii]):SetEnable((_popupConfig[ii]).enable)
        ;
        (((self._ui).btn_functions)[ii]):SetMonoTone(not (_popupConfig[ii]).enable)
      else
        ;
        (((self._ui).btn_functions)[ii]):SetEnable(true)
        ;
        (((self._ui).btn_functions)[ii]):SetMonoTone(false)
      end
      local icon = ((self._ui).stc_icons)[ii]
      if (_popupConfig[ii]).icon ~= nil then
        icon:SetShow(true)
        local x1, y1, x2, y2 = setTextureUV_Func(icon, (_buttonUV[ii])[1], (_buttonUV[ii])[2], (_buttonUV[ii])[3], (_buttonUV[ii])[4])
        ;
        (icon:getBaseTexture()):setUV(x1, y1, x2, y2)
        icon:setRenderTexture(icon:getBaseTexture())
      else
        do
          do
            icon:SetShow(false)
            ;
            (((self._ui).txt_descriptions)[ii]):SetTextMode((CppEnums.TextMode).eTextMode_AutoWrap)
            ;
            (((self._ui).txt_descriptions)[ii]):SetText((_popupConfig[ii]).desc)
            self._visibleButtonCount = self._visibleButtonCount + 1
            -- DECOMPILER ERROR at PC220: LeaveBlock: unexpected jumping out DO_STMT

            -- DECOMPILER ERROR at PC220: LeaveBlock: unexpected jumping out IF_ELSE_STMT

            -- DECOMPILER ERROR at PC220: LeaveBlock: unexpected jumping out IF_STMT

            -- DECOMPILER ERROR at PC220: LeaveBlock: unexpected jumping out IF_THEN_STMT

            -- DECOMPILER ERROR at PC220: LeaveBlock: unexpected jumping out IF_STMT

          end
        end
      end
    end
  end
  if self._visibleButtonCount < 1 then
    PaGlobalFunc_InventoryPopup_Close()
    return 
  end
  for ii = #_popupConfig + 1, #(self._ui).btn_functions do
    (((self._ui).btn_functions)[ii]):SetShow(false)
  end
  local bgYResize = self._visibleButtonCount * self._buttonYGab + ((self._ui).btn_ButtonTemplate):GetPosY()
  _panel:SetSize(_panel:GetSizeX(), bgYResize)
  ;
  ((self._ui).stc_BG):SetSize(_panel:GetSizeX(), bgYResize)
  ;
  ((self._ui).stc_BG):ComputePos()
  if posX ~= nil and posY ~= nil then
    self:setPosition(posX, posY)
  end
end

InventoryPopup.setPosition = function(self, posX, posY)
  -- function num : 0_4 , upvalues : _panel
  local targetX, targetY = posX, posY
  local screenX, screenY = getScreenSizeX(), getScreenSizeY()
  local bgSizeX = _panel:GetSizeX()
  local bgSizeY = _panel:GetSizeY()
  if screenX < targetX + bgSizeX then
    targetX = targetX - bgSizeX
  end
  if screenY < targetY + bgSizeY then
    targetY = targetY - bgSizeY
  end
  _panel:SetPosX(targetX)
  _panel:SetPosY(targetY)
end

PaGlobalFunc_InventoryPopup_ProcessFunc = function(index)
  -- function num : 0_5 , upvalues : _popupConfig
  if (_popupConfig[index]).func ~= nil and type((_popupConfig[index]).func) == "function" then
    ((_popupConfig[index]).func)((_popupConfig[index]).param)
    PaGlobalFunc_InventoryPopup_Close()
  end
end

PaGlobalFunc_InventoryPopup_CheckMouseAndClose = function()
  -- function num : 0_6 , upvalues : _panel
  if _panel:IsShow() == false then
    return 
  end
  local panelPosX, panelPosY = _panel:GetPosX(), _panel:GetPosY()
  local panelSizeX, panelSizeY = _panel:GetSizeX(), _panel:GetSizeY()
  local mousePosX, mousePosY = getMousePosX(), getMousePosY()
  if panelPosX <= mousePosX and mousePosX <= panelPosX + panelSizeX and panelPosY <= mousePosY and mousePosY <= panelPosY + panelSizeY then
    return 
  end
  PaGlobalFunc_InventoryPopup_Close()
end

PaGlobalFunc_InventoryPopup_IsOpened = function()
  -- function num : 0_7
end

PaGlobalFunc_InventoryPopup_Close = function()
  -- function num : 0_8 , upvalues : _panel
  _panel:SetShow(false)
end


