-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\widget\tutorial\panel_tutorial_uikeybutton.luac 

-- params : ...
-- function num : 0
local UI_color = Defines.Color
PaGlobal_TutorialUiKeyButton = {
_ui = {_button_Q = (UI.getChildControl)(Panel_Tutorial, "StaticText_Btn_Q"), _button_W = (UI.getChildControl)(Panel_Tutorial, "StaticText_Btn_W"), _button_A = (UI.getChildControl)(Panel_Tutorial, "StaticText_Btn_A"), _button_S = (UI.getChildControl)(Panel_Tutorial, "StaticText_Btn_S"), _button_D = (UI.getChildControl)(Panel_Tutorial, "StaticText_Btn_D"), _button_E = (UI.getChildControl)(Panel_Tutorial, "StaticText_Btn_E"), _button_F = (UI.getChildControl)(Panel_Tutorial, "StaticText_Btn_F"), _button_T = (UI.getChildControl)(Panel_Tutorial, "StaticText_Btn_T"), _button_Tab = (UI.getChildControl)(Panel_Tutorial, "StaticText_Btn_Tab"), _button_Shift = (UI.getChildControl)(Panel_Tutorial, "StaticText_Btn_Shift"), _button_Space = (UI.getChildControl)(Panel_Tutorial, "StaticText_Btn_Space"), _button_Ctrl = (UI.getChildControl)(Panel_Tutorial, "StaticText_Btn_Ctrl"), _m0 = (UI.getChildControl)(Panel_Tutorial, "StaticText_M0"), _m1 = (UI.getChildControl)(Panel_Tutorial, "StaticText_M1"), _mBody = (UI.getChildControl)(Panel_Tutorial, "StaticText_Mouse_Body"), _buttonLock = (UI.getChildControl)(Panel_Tutorial, "StaticText_Button_Lock"), _m0_Lock = (UI.getChildControl)(Panel_Tutorial, "StaticText_M0_Lock"), _m1_Lock = (UI.getChildControl)(Panel_Tutorial, "StaticText_M1_Lock")}
, 
_uvSet = {
_button_Q = {
on = {1, 1, 63, 65}
, 
click = {63, 0, 126, 65}
, 
off = {127, 1, 189, 65}
}
, 
_button_W = {
on = {1, 1, 63, 65}
, 
click = {63, 0, 126, 65}
, 
off = {127, 1, 189, 65}
}
, 
_button_A = {
on = {1, 1, 63, 65}
, 
click = {63, 0, 126, 65}
, 
off = {127, 1, 189, 65}
}
, 
_button_S = {
on = {1, 1, 63, 65}
, 
click = {63, 0, 126, 65}
, 
off = {127, 1, 189, 65}
}
, 
_button_D = {
on = {1, 1, 63, 65}
, 
click = {63, 0, 126, 65}
, 
off = {127, 1, 189, 65}
}
, 
_button_E = {
on = {1, 1, 63, 65}
, 
click = {63, 0, 126, 65}
, 
off = {127, 1, 189, 65}
}
, 
_button_F = {
on = {1, 1, 63, 65}
, 
click = {63, 0, 126, 65}
, 
off = {127, 1, 189, 65}
}
, 
_button_T = {
on = {1, 1, 63, 65}
, 
click = {63, 0, 126, 65}
, 
off = {127, 1, 189, 65}
}
, 
_button_Tab = {
on = {1, 1, 63, 65}
, 
click = {63, 0, 126, 65}
, 
off = {127, 1, 189, 65}
}
, 
_button_Shift = {
on = {1, 1, 63, 65}
, 
click = {63, 0, 126, 65}
, 
off = {127, 1, 189, 65}
}
, 
_button_Space = {
on = {1, 1, 63, 65}
, 
click = {63, 0, 126, 65}
, 
off = {127, 1, 189, 65}
}
, 
_button_Ctrl = {
on = {1, 1, 63, 65}
, 
click = {63, 0, 126, 65}
, 
off = {127, 1, 189, 65}
}
, 
_m0 = {
on = {1, 66, 74, 143}
, 
click = {75, 65, 148, 143}
, 
off = {149, 66, 222, 143}
}
, 
_m1 = {
on = {1, 144, 74, 221}
, 
click = {75, 143, 148, 221}
, 
off = {149, 144, 222, 221}
}
}
, 
_prevUsingKey = {}
, 
_keyToVirtualKey = {_m0 = 4, _m1 = 5, _button_Q = 12, _button_W = 0, _button_A = 2, _button_S = 1, _button_D = 3, _button_E = 13, _button_F = 14, _button_T = 9, _button_Tab = 10, _button_Shift = 6, _button_Space = 7, _button_Ctrl = 99, _button_R = 8}
}
-- DECOMPILER ERROR at PC459: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_TutorialUiKeyButton.changeActionKeyByKeySetting = function(self)
  -- function num : 0_0
  ((self._ui)._button_W):SetText(keyCustom_GetString_ActionKey((CppEnums.ActionInputType).ActionInputType_MoveFront))
  ;
  ((self._ui)._button_A):SetText(keyCustom_GetString_ActionKey((CppEnums.ActionInputType).ActionInputType_MoveLeft))
  ;
  ((self._ui)._button_S):SetText(keyCustom_GetString_ActionKey((CppEnums.ActionInputType).ActionInputType_MoveBack))
  ;
  ((self._ui)._button_D):SetText(keyCustom_GetString_ActionKey((CppEnums.ActionInputType).ActionInputType_MoveRight))
  ;
  ((self._ui)._button_Q):SetText(keyCustom_GetString_ActionKey((CppEnums.ActionInputType).ActionInputType_CrouchOrSkill))
  ;
  ((self._ui)._button_E):SetText(keyCustom_GetString_ActionKey((CppEnums.ActionInputType).ActionInputType_GrabOrGuard))
  ;
  ((self._ui)._button_F):SetText(keyCustom_GetString_ActionKey((CppEnums.ActionInputType).ActionInputType_Kick))
  ;
  ((self._ui)._button_T):SetText(keyCustom_GetString_ActionKey((CppEnums.ActionInputType).ActionInputType_AutoRun))
  ;
  ((self._ui)._button_Tab):SetText(keyCustom_GetString_ActionKey((CppEnums.ActionInputType).ActionInputType_WeaponInOut))
  ;
  ((self._ui)._button_Shift):SetText(keyCustom_GetString_ActionKey((CppEnums.ActionInputType).ActionInputType_Dash))
  ;
  ((self._ui)._button_Space):SetText(keyCustom_GetString_ActionKey((CppEnums.ActionInputType).ActionInputType_Jump))
  ;
  ((self._ui)._button_Ctrl):SetText(keyCustom_GetString_UiKey((CppEnums.UiInputType).UiInputType_CursorOnOff))
end

-- DECOMPILER ERROR at PC462: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_TutorialUiKeyButton.setShowAll = function(self, isShow)
  -- function num : 0_1
  self:resetVertexAniAll()
  self:eraseEffectAll()
  self:computePosAll()
  ;
  ((self._ui)._button_Q):SetShow(isShow)
  ;
  ((self._ui)._button_W):SetShow(isShow)
  ;
  ((self._ui)._button_A):SetShow(isShow)
  ;
  ((self._ui)._button_S):SetShow(isShow)
  ;
  ((self._ui)._button_D):SetShow(isShow)
  ;
  ((self._ui)._button_E):SetShow(isShow)
  ;
  ((self._ui)._button_F):SetShow(isShow)
  ;
  ((self._ui)._button_T):SetShow(false)
  ;
  ((self._ui)._button_Tab):SetShow(isShow)
  ;
  ((self._ui)._button_Shift):SetShow(isShow)
  ;
  ((self._ui)._button_Space):SetShow(isShow)
  ;
  ((self._ui)._button_Ctrl):SetShow(false)
  ;
  ((self._ui)._m0):SetShow(isShow)
  ;
  ((self._ui)._m1):SetShow(isShow)
  ;
  ((self._ui)._mBody):SetShow(isShow)
  if isShow == true then
    self:setAlphaAll(1)
  else
    if isShow == false then
      self:setAlphaAll(0)
    end
  end
end

-- DECOMPILER ERROR at PC465: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_TutorialUiKeyButton.computePosAll = function(self)
  -- function num : 0_2
  ((self._ui)._button_Q):ComputePos()
  ;
  ((self._ui)._button_W):ComputePos()
  ;
  ((self._ui)._button_A):ComputePos()
  ;
  ((self._ui)._button_S):ComputePos()
  ;
  ((self._ui)._button_D):ComputePos()
  ;
  ((self._ui)._button_E):ComputePos()
  ;
  ((self._ui)._button_F):ComputePos()
  ;
  ((self._ui)._button_T):ComputePos()
  ;
  ((self._ui)._button_Tab):ComputePos()
  ;
  ((self._ui)._button_Shift):ComputePos()
  ;
  ((self._ui)._button_Space):ComputePos()
  ;
  ((self._ui)._button_Ctrl):ComputePos()
  ;
  ((self._ui)._m0):ComputePos()
  ;
  ((self._ui)._m1):ComputePos()
  ;
  ((self._ui)._mBody):ComputePos()
end

-- DECOMPILER ERROR at PC468: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_TutorialUiKeyButton.resetVertexAniAll = function(self)
  -- function num : 0_3
  ((self._ui)._m0):ResetVertexAni()
  ;
  ((self._ui)._m1):ResetVertexAni()
  ;
  ((self._ui)._button_Q):ResetVertexAni()
  ;
  ((self._ui)._button_W):ResetVertexAni()
  ;
  ((self._ui)._button_A):ResetVertexAni()
  ;
  ((self._ui)._button_S):ResetVertexAni()
  ;
  ((self._ui)._button_D):ResetVertexAni()
  ;
  ((self._ui)._button_E):ResetVertexAni()
  ;
  ((self._ui)._button_F):ResetVertexAni()
  ;
  ((self._ui)._button_Tab):ResetVertexAni()
  ;
  ((self._ui)._button_Shift):ResetVertexAni()
  ;
  ((self._ui)._button_Space):ResetVertexAni()
  ;
  ((self._ui)._button_Ctrl):ResetVertexAni()
  ;
  ((self._ui)._mBody):ResetVertexAni()
end

-- DECOMPILER ERROR at PC471: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_TutorialUiKeyButton.disappearAll = function(self)
  -- function num : 0_4
  self:resetVertexAniAll()
  ;
  ((self._ui)._m0):SetVertexAniRun("Ani_Color_Disappear", true)
  ;
  ((self._ui)._m1):SetVertexAniRun("Ani_Color_Disappear", true)
  ;
  ((self._ui)._button_Q):SetVertexAniRun("Ani_Color_Disappear", true)
  ;
  ((self._ui)._button_W):SetVertexAniRun("Ani_Color_Disappear", true)
  ;
  ((self._ui)._button_A):SetVertexAniRun("Ani_Color_Disappear", true)
  ;
  ((self._ui)._button_S):SetVertexAniRun("Ani_Color_Disappear", true)
  ;
  ((self._ui)._button_D):SetVertexAniRun("Ani_Color_Disappear", true)
  ;
  ((self._ui)._button_E):SetVertexAniRun("Ani_Color_Disappear", true)
  ;
  ((self._ui)._button_F):SetVertexAniRun("Ani_Color_Disappear", true)
  ;
  ((self._ui)._button_Tab):SetVertexAniRun("Ani_Color_Disappear", true)
  ;
  ((self._ui)._button_Shift):SetVertexAniRun("Ani_Color_Disappear", true)
  ;
  ((self._ui)._button_Space):SetVertexAniRun("Ani_Color_Disappear", true)
  ;
  ((self._ui)._button_Ctrl):SetVertexAniRun("Ani_Color_Disappear", true)
  ;
  ((self._ui)._mBody):SetVertexAniRun("Ani_Color_Disappear", true)
end

-- DECOMPILER ERROR at PC474: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_TutorialUiKeyButton.setAlphaAll = function(self, value)
  -- function num : 0_5
  ((self._ui)._button_Q):SetAlpha(value)
  ;
  ((self._ui)._button_W):SetAlpha(value)
  ;
  ((self._ui)._button_A):SetAlpha(value)
  ;
  ((self._ui)._button_S):SetAlpha(value)
  ;
  ((self._ui)._button_D):SetAlpha(value)
  ;
  ((self._ui)._button_E):SetAlpha(value)
  ;
  ((self._ui)._button_F):SetAlpha(value)
  ;
  ((self._ui)._button_T):SetAlpha(0)
  ;
  ((self._ui)._button_Tab):SetAlpha(value)
  ;
  ((self._ui)._button_Shift):SetAlpha(value)
  ;
  ((self._ui)._button_Space):SetAlpha(value)
  ;
  ((self._ui)._button_Ctrl):SetAlpha(0)
  ;
  ((self._ui)._m0):SetAlpha(value)
  ;
  ((self._ui)._m1):SetAlpha(value)
  ;
  ((self._ui)._mBody):SetAlpha(value)
end

-- DECOMPILER ERROR at PC477: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_TutorialUiKeyButton.setShow = function(self, key, isShow)
  -- function num : 0_6
  ((self._ui)[key]):SetShow(isShow)
end

-- DECOMPILER ERROR at PC480: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_TutorialUiKeyButton.setAlpha = function(self, key, value)
  -- function num : 0_7
  ((self._ui)[key]):SetAlpha(value)
end

-- DECOMPILER ERROR at PC483: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_TutorialUiKeyButton.setPrevUsingKey = function(self, key, isPrevUsing)
  -- function num : 0_8
  -- DECOMPILER ERROR at PC1: Confused about usage of register: R3 in 'UnsetPending'

  (self._prevUsingKey)[key] = isPrevUsing
end

-- DECOMPILER ERROR at PC486: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_TutorialUiKeyButton.setPrevUsingKeyMany = function(self, isPrevUsing, ...)
  -- function num : 0_9
  for index,value in ipairs({...}) do
    -- DECOMPILER ERROR at PC7: Confused about usage of register: R8 in 'UnsetPending'

    (self._prevUsingKey)[value] = isPrevUsing
  end
end

-- DECOMPILER ERROR at PC489: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_TutorialUiKeyButton.setPrevUsingKeyAll = function(self, isPrevUsing)
  -- function num : 0_10
  for key,value in pairs(self._ui) do
    self:setPrevUsingKey(key, isPrevUsing)
  end
end

-- DECOMPILER ERROR at PC492: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_TutorialUiKeyButton.ButtonToggleAll = function(self, isOn)
  -- function num : 0_11
  for key,value in pairs(self._uvSet) do
    self:ButtonToggle(key, isOn)
  end
end

-- DECOMPILER ERROR at PC495: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_TutorialUiKeyButton.addEffect = function(self, key, effectName, isLoop, posX, posY)
  -- function num : 0_12
  ((self._ui)[key]):AddEffect(effectName, isLoop, posX, posY)
end

-- DECOMPILER ERROR at PC498: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_TutorialUiKeyButton.eraseEffectAll = function(self)
  -- function num : 0_13
  for key,value in pairs(self._ui) do
    value:EraseAllEffect()
  end
end

local index = 0
-- DECOMPILER ERROR at PC503: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_TutorialUiKeyButton.ButtonToggle = function(self, key, isOn)
  -- function num : 0_14 , upvalues : UI_color
  local aUI = (self._ui)[key]
  local keyName = "on"
  if isOn == false then
    keyName = "off"
  else
    if (self._prevUsingKey)[key] == true then
      aUI:SetFontColor(UI_color.C_FFC4BEBE)
    else
      aUI:SetFontColor(UI_color.C_FF00C0D7)
    end
  end
  -- DECOMPILER ERROR at PC31: Unhandled construct in 'MakeBoolean' P1

  if key == "_button_Ctrl" and isOn == true and keyCustom_IsPressed_Ui((CppEnums.UiInputType).UiInputType_CursorOnOff) then
    keyName = "click"
    aUI:SetFontColor(UI_color.C_FFFFCE22)
  end
  if isOn == true and keyCustom_IsPressed_Action((self._keyToVirtualKey)[key]) then
    keyName = "click"
    aUI:SetFontColor(UI_color.C_FFFFCE22)
  end
  local textureUV = ((self._uvSet)[key])[keyName]
  aUI:ChangeTextureInfoName("new_ui_common_forlua/widget/tutorial/tutorial_00.dds")
  local x1, y1, x2, y2 = setTextureUV_Func(aUI, textureUV[1], textureUV[2], textureUV[3], textureUV[4])
  ;
  (aUI:getBaseTexture()):setUV(x1, y1, x2, y2)
  aUI:setRenderTexture(aUI:getBaseTexture())
  if isOn then
    if key == "_m0" then
      aUI:SetText("L")
    else
      if key == "_m1" then
        aUI:SetText("R")
      else
        if key == "_button_Ctrl" then
          local actionString = ""
          if getGamePadEnable() then
            actionString = keyCustom_GetString_UiPad(0)
          else
            actionString = keyCustom_GetString_UiKey(0)
          end
          aUI:SetText(actionString)
        else
          do
            do
              local actionString = ""
              if getGamePadEnable() then
                actionString = keyCustom_GetString_ActionPad((self._keyToVirtualKey)[key])
              else
                actionString = keyCustom_GetString_ActionKey((self._keyToVirtualKey)[key])
              end
              aUI:SetText(actionString)
              aUI:SetText(" ")
            end
          end
        end
      end
    end
  end
end


