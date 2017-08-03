-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\widget\tutorial\panel_lifetutorial.luac 

-- params : ...
-- function num : 0
local UI_TM = CppEnums.TextMode
local VCK = CppEnums.VirtualKeyCode
local UI_color = Defines.Color
local UI_classType = CppEnums.ClassType
local IM = CppEnums.EProcessorInputMode
local _updateTime = 0
local _stepNo = 0
local ui = {_obsidian = (UI.getChildControl)(Panel_LifeTutorial, "Static_Obsidian"), _obsidian_B = (UI.getChildControl)(Panel_LifeTutorial, "Static_Obsidian_B"), _obsidian_B_Left = (UI.getChildControl)(Panel_LifeTutorial, "Static_Obsidian_B_Left"), _obsidian_Text = (UI.getChildControl)(Panel_LifeTutorial, "StaticText_Obsidian_B"), _obsidian_Text_2 = (UI.getChildControl)(Panel_LifeTutorial, "StaticText_Obsidian_B_2"), _purposeText = (UI.getChildControl)(Panel_LifeTutorial, "StaticText_Purpose"), _nextStep_1 = (UI.getChildControl)(Panel_LifeTutorial, "StaticText_Step_1"), _nextStep_2 = (UI.getChildControl)(Panel_LifeTutorial, "StaticText_Step_2"), _nextStep_3 = (UI.getChildControl)(Panel_LifeTutorial, "StaticText_Step_3"), _nextStep_4 = (UI.getChildControl)(Panel_LifeTutorial, "StaticText_Step_4"), _nextArrow_0 = (UI.getChildControl)(Panel_LifeTutorial, "Static_NextArrow_0"), _nextArrow_1 = (UI.getChildControl)(Panel_LifeTutorial, "Static_NextArrow_1"), _nextArrow_2 = (UI.getChildControl)(Panel_LifeTutorial, "Static_NextArrow_2"), _button_Q = (UI.getChildControl)(Panel_LifeTutorial, "StaticText_Btn_Q"), _button_W = (UI.getChildControl)(Panel_LifeTutorial, "StaticText_Btn_W"), _button_A = (UI.getChildControl)(Panel_LifeTutorial, "StaticText_Btn_A"), _button_S = (UI.getChildControl)(Panel_LifeTutorial, "StaticText_Btn_S"), _button_D = (UI.getChildControl)(Panel_LifeTutorial, "StaticText_Btn_D"), _button_E = (UI.getChildControl)(Panel_LifeTutorial, "StaticText_Btn_E"), _button_F = (UI.getChildControl)(Panel_LifeTutorial, "StaticText_Btn_F"), _button_T = (UI.getChildControl)(Panel_LifeTutorial, "StaticText_Btn_T"), _button_Tab = (UI.getChildControl)(Panel_LifeTutorial, "StaticText_Btn_Tab"), _button_Shift = (UI.getChildControl)(Panel_LifeTutorial, "StaticText_Btn_Shift"), _button_Space = (UI.getChildControl)(Panel_LifeTutorial, "StaticText_Btn_Space"), _button_Ctrl = (UI.getChildControl)(Panel_LifeTutorial, "StaticText_Btn_Ctrl"), _m0 = (UI.getChildControl)(Panel_LifeTutorial, "StaticText_M0"), _m1 = (UI.getChildControl)(Panel_LifeTutorial, "StaticText_M1"), _mBody = (UI.getChildControl)(Panel_LifeTutorial, "StaticText_Mouse_Body"), _buttonLock = (UI.getChildControl)(Panel_LifeTutorial, "StaticText_Button_Lock"), _m0_Lock = (UI.getChildControl)(Panel_LifeTutorial, "StaticText_M0_Lock"), _m1_Lock = (UI.getChildControl)(Panel_LifeTutorial, "StaticText_M1_Lock"), _clearStep_1 = (UI.getChildControl)(Panel_LifeTutorial, "Static_Clear_Step1"), _clearStep_2 = (UI.getChildControl)(Panel_LifeTutorial, "Static_Clear_Step2"), _clearStep_3 = (UI.getChildControl)(Panel_LifeTutorial, "Static_Clear_Step3"), _clearStep_4 = (UI.getChildControl)(Panel_LifeTutorial, "Static_Clear_Step4"), _bubbleKey_W = (UI.getChildControl)(Panel_LifeTutorial, "StaticText_BubbleKey_W"), _bubbleKey_A = (UI.getChildControl)(Panel_LifeTutorial, "StaticText_BubbleKey_A"), _bubbleKey_S = (UI.getChildControl)(Panel_LifeTutorial, "StaticText_BubbleKey_S"), _bubbleKey_D = (UI.getChildControl)(Panel_LifeTutorial, "StaticText_BubbleKey_D"), _bubbleKey_I = (UI.getChildControl)(Panel_LifeTutorial, "StaticText_BubbleKey_I"), _bubbleKey_R = (UI.getChildControl)(Panel_LifeTutorial, "StaticText_BubbleKey_R"), _bubbleKey_T = (UI.getChildControl)(Panel_LifeTutorial, "StaticText_BubbleKey_T"), _bubbleKey_Shift = (UI.getChildControl)(Panel_LifeTutorial, "StaticText_BubbleKey_Shift"), _bubbleKey_Ctrl = (UI.getChildControl)(Panel_LifeTutorial, "StaticText_BubbleKey_Ctrl")}
local uvSet = {
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
local keyIndexSet = {_m0 = 4, _m1 = 5, _button_Q = 12, _button_W = 0, _button_A = 2, _button_S = 1, _button_D = 3, _button_E = 13, _button_F = 14, _button_T = 9, _button_Tab = 10, _button_Shift = 6, _button_Space = 7, _button_Ctrl = 99}
local keyToVirtualKey = {_m0 = 4, _m1 = 5, _button_Q = 12, _button_W = 0, _button_A = 2, _button_S = 1, _button_D = 3, _button_E = 13, _button_F = 14, _button_T = 9, _button_Tab = 10, _button_Shift = 6, _button_Space = 7, _button_Ctrl = 99, _button_R = 8}
local ui_Show = function(isShow)
  -- function num : 0_0 , upvalues : ui
  for v,control in pairs(ui) do
    control:SetShow(ui)
  end
end

ui_Show(false)
local arrow_Show = function(isShow)
  -- function num : 0_1 , upvalues : ui
  (ui._nextStep_1):SetShow(isShow)
  ;
  (ui._nextStep_2):SetShow(isShow)
  ;
  (ui._nextStep_3):SetShow(isShow)
  ;
  (ui._nextStep_4):SetShow(isShow)
  ;
  (ui._nextArrow_0):SetShow(isShow)
  ;
  (ui._nextArrow_1):SetShow(isShow)
  ;
  (ui._nextArrow_2):SetShow(isShow)
  ;
  (ui._clearStep_1):SetShow(isShow)
  ;
  (ui._clearStep_2):SetShow(isShow)
  ;
  (ui._clearStep_3):SetShow(isShow)
  ;
  (ui._clearStep_4):SetShow(isShow)
end

local button_Show = function(isShow)
  -- function num : 0_2 , upvalues : ui
  (ui._button_Q):SetShow(isShow)
  ;
  (ui._button_W):SetShow(isShow)
  ;
  (ui._button_A):SetShow(isShow)
  ;
  (ui._button_S):SetShow(isShow)
  ;
  (ui._button_D):SetShow(isShow)
  ;
  (ui._button_E):SetShow(isShow)
  ;
  (ui._button_F):SetShow(isShow)
  ;
  (ui._button_T):SetShow(isShow)
  ;
  (ui._button_Tab):SetShow(isShow)
  ;
  (ui._button_Shift):SetShow(isShow)
  ;
  (ui._button_Space):SetShow(isShow)
  ;
  (ui._m0):SetShow(isShow)
  ;
  (ui._m1):SetShow(isShow)
  ;
  (ui._mBody):SetShow(isShow)
  ;
  (ui._buttonLock):SetShow(isShow)
  ;
  (ui._m0_Lock):SetShow(isShow)
  ;
  (ui._m1_Lock):SetShow(isShow)
end

local bubbleKey_Show = function(isShow)
  -- function num : 0_3 , upvalues : ui
  (ui._bubbleKey_W):SetShow(isShow)
  ;
  (ui._bubbleKey_A):SetShow(isShow)
  ;
  (ui._bubbleKey_S):SetShow(isShow)
  ;
  (ui._bubbleKey_D):SetShow(isShow)
  ;
  (ui._bubbleKey_I):SetShow(isShow)
  ;
  (ui._bubbleKey_R):SetShow(isShow)
  ;
  (ui._bubbleKey_T):SetShow(isShow)
  ;
  (ui._bubbleKey_Shift):SetShow(isShow)
  ;
  (ui._button_Ctrl):SetShow(isShow)
end

local actionKey_Change = function()
  -- function num : 0_4 , upvalues : ui
  (ui._button_W):SetText(keyCustom_GetString_ActionKey((CppEnums.ActionInputType).ActionInputType_MoveFront))
  ;
  (ui._button_A):SetText(keyCustom_GetString_ActionKey((CppEnums.ActionInputType).ActionInputType_MoveLeft))
  ;
  (ui._button_S):SetText(keyCustom_GetString_ActionKey((CppEnums.ActionInputType).ActionInputType_MoveBack))
  ;
  (ui._button_D):SetText(keyCustom_GetString_ActionKey((CppEnums.ActionInputType).ActionInputType_MoveRight))
  ;
  (ui._button_Q):SetText(keyCustom_GetString_ActionKey((CppEnums.ActionInputType).ActionInputType_CrouchOrSkill))
  ;
  (ui._button_E):SetText(keyCustom_GetString_ActionKey((CppEnums.ActionInputType).ActionInputType_GrabOrGuard))
  ;
  (ui._button_F):SetText(keyCustom_GetString_ActionKey((CppEnums.ActionInputType).ActionInputType_Kick))
  ;
  (ui._button_T):SetText(keyCustom_GetString_ActionKey((CppEnums.ActionInputType).ActionInputType_AutoRun))
  ;
  (ui._button_Tab):SetText(keyCustom_GetString_ActionKey((CppEnums.ActionInputType).ActionInputType_WeaponInOut))
  ;
  (ui._button_Shift):SetText(keyCustom_GetString_ActionKey((CppEnums.ActionInputType).ActionInputType_Dash))
  ;
  (ui._button_Space):SetText(keyCustom_GetString_ActionKey((CppEnums.ActionInputType).ActionInputType_Jump))
  ;
  (ui._button_Ctrl):SetText(keyCustom_GetString_UiKey((CppEnums.UiInputType).UiInputType_CursorOnOff))
end

local bubbleKey_Change = function()
  -- function num : 0_5 , upvalues : ui
  (ui._bubbleKey_W):SetText(keyCustom_GetString_ActionKey((CppEnums.ActionInputType).ActionInputType_MoveFront))
  ;
  (ui._bubbleKey_A):SetText(keyCustom_GetString_ActionKey((CppEnums.ActionInputType).ActionInputType_MoveLeft))
  ;
  (ui._bubbleKey_S):SetText(keyCustom_GetString_ActionKey((CppEnums.ActionInputType).ActionInputType_MoveBack))
  ;
  (ui._bubbleKey_D):SetText(keyCustom_GetString_ActionKey((CppEnums.ActionInputType).ActionInputType_MoveRight))
  ;
  (ui._bubbleKey_I):SetText(keyCustom_GetString_UiKey((CppEnums.UiInputType).UiInputType_Inventory))
  ;
  (ui._bubbleKey_R):SetText(keyCustom_GetString_ActionKey((CppEnums.ActionInputType).ActionInputType_Interaction))
  ;
  (ui._bubbleKey_T):SetText(keyCustom_GetString_ActionKey((CppEnums.ActionInputType).ActionInputType_AutoRun))
  ;
  (ui._bubbleKey_Shift):SetText(keyCustom_GetString_ActionKey((CppEnums.ActionInputType).ActionInputType_Dash))
  ;
  (ui._bubbleKey_Ctrl):SetText(keyCustom_GetString_UiKey((CppEnums.UiInputType).UiInputType_CursorOnOff))
end

FGlobal_GetFirstTutorialState = function()
  -- function num : 0_6
  if welcomeToTheWorld == true then
    return true
  end
  return false
end

LifeTutorial_ScreenRePosition = function()
  -- function num : 0_7 , upvalues : ui
  local scrX = getScreenSizeX()
  local scrY = getScreenSizeY()
  Panel_LifeTutorial:SetSize(scrX, scrY)
  Panel_LifeTutorial:SetPosX(0)
  Panel_LifeTutorial:SetPosY(0)
  for key,value in pairs(ui) do
    value:ComputePos()
  end
end

local index = 0
local ButtonToggle = function(key, isOn)
  -- function num : 0_8 , upvalues : ui, UI_color, keyToVirtualKey, uvSet, keyIndexSet
  local aUI = ui[key]
  local keyName = "on"
  if isOn == false then
    keyName = "off"
  else
    if prevUsingKey[key] == true then
      aUI:SetFontColor(UI_color.C_FFC4BEBE)
    else
      aUI:SetFontColor(UI_color.C_FF00C0D7)
    end
  end
  -- DECOMPILER ERROR at PC29: Unhandled construct in 'MakeBoolean' P1

  if key == "_button_Ctrl" and isOn == true and keyCustom_IsPressed_Ui(0) then
    keyName = "click"
    aUI:SetFontColor(UI_color.C_FFFFCE22)
  end
  if isOn == true and keyCustom_IsPressed_Action(keyToVirtualKey[key]) then
    keyName = "click"
    aUI:SetFontColor(UI_color.C_FFFFCE22)
  end
  local textureUV = (uvSet[key])[keyName]
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
                actionString = keyCustom_GetString_ActionPad(keyIndexSet[key])
              else
                actionString = keyCustom_GetString_ActionKey(keyIndexSet[key])
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

local ButtonToggleAll = function(isOn)
  -- function num : 0_9 , upvalues : uvSet, ButtonToggle
  for key,value in pairs(uvSet) do
    ButtonToggle(key, isOn)
  end
end

local lifeTutorialQuestInfo = {
[0] = {questGroup = 1068, questId = 1}
, 
[1] = {questGroup = 1068, questId = 3}
, 
[2] = {questGroup = 1068, questId = 5}
}
local lifeTutorial_HuntingDesc = {
[0] = {
[0] = {PAGetString(Defines.StringSheet_GAME, "LUA_LIFETUTORIAL_HUNTINGDESC_0_0_1"); [0] = PAGetString(Defines.StringSheet_GAME, "LUA_LIFETUTORIAL_HUNTINGDESC_0_0_0")}
, 
[1] = {PAGetString(Defines.StringSheet_GAME, "LUA_LIFETUTORIAL_HUNTINGDESC_0_1_1"); [0] = PAGetString(Defines.StringSheet_GAME, "LUA_LIFETUTORIAL_HUNTINGDESC_0_1_0")}
, 
[2] = {PAGetString(Defines.StringSheet_GAME, "LUA_LIFETUTORIAL_HUNTINGDESC_0_2_1"); [0] = PAGetString(Defines.StringSheet_GAME, "LUA_LIFETUTORIAL_HUNTINGDESC_0_2_0")}
}
, 
[1] = {
[0] = {PAGetString(Defines.StringSheet_GAME, "LUA_LIFETUTORIAL_HUNTINGDESC_1_0_1"); [0] = PAGetString(Defines.StringSheet_GAME, "LUA_LIFETUTORIAL_HUNTINGDESC_1_0_0")}
, 
[1] = {PAGetString(Defines.StringSheet_GAME, "LUA_LIFETUTORIAL_HUNTINGDESC_1_1_1"); [0] = PAGetString(Defines.StringSheet_GAME, "LUA_LIFETUTORIAL_HUNTINGDESC_1_1_0")}
, 
[2] = {PAGetString(Defines.StringSheet_GAME, "LUA_LIFETUTORIAL_HUNTINGDESC_1_2_1"); [0] = PAGetString(Defines.StringSheet_GAME, "LUA_LIFETUTORIAL_HUNTINGDESC_1_2_0")}
}
, 
[2] = {
[0] = {PAGetString(Defines.StringSheet_GAME, "LUA_LIFETUTORIAL_HUNTINGDESC_2_0_1"); [0] = PAGetString(Defines.StringSheet_GAME, "LUA_LIFETUTORIAL_HUNTINGDESC_2_0_0")}
}
}
local lifeTutorial_CompleteMsg = {
[0] = {PAGetString(Defines.StringSheet_GAME, "LUA_LIFETUTORIAL_COMPLETEMSG_0_1"); [0] = PAGetString(Defines.StringSheet_GAME, "LUA_LIFETUTORIAL_COMPLETEMSG_0_0")}
, 
[1] = {PAGetString(Defines.StringSheet_GAME, "LUA_LIFETUTORIAL_COMPLETEMSG_1_1"); [0] = PAGetString(Defines.StringSheet_GAME, "LUA_LIFETUTORIAL_COMPLETEMSG_1_0")}
, 
[2] = {PAGetString(Defines.StringSheet_GAME, "LUA_LIFETUTORIAL_COMPLETEMSG_2_1"); [0] = PAGetString(Defines.StringSheet_GAME, "LUA_LIFETUTORIAL_COMPLETEMSG_2_0")}
}
local lifeTutorial_Texture = {[0] = "UI_Artwork/IC_00033.dds", [1] = "UI_Artwork/IC_00308.dds", [2] = "UI_Artwork/IC_00308.dds"}
local isOpen = false
local descCount = 0
local basePosX = Panel_SelfPlayerExpGage:GetPosX() + Panel_SelfPlayerExpGage:GetSizeX() + 150
local basePosY = Panel_SelfPlayerExpGage:GetPosY() + Panel_SelfPlayerExpGage:GetSizeY() + 50
local updateDeltaTime_Hunting = function(deltaTime, index)
  -- function num : 0_10 , upvalues : ui, lifeTutorial_CompleteMsg, _updateTime, isOpen, lifeTutorial_HuntingDesc, descCount, lifeTutorial_Texture, basePosX, basePosY
  if TutorialQuest_ConditionSatisfyCheck(index) then
    (ui._obsidian_Text):SetText((lifeTutorial_CompleteMsg[index])[0])
    ;
    (ui._obsidian_Text_2):SetText((lifeTutorial_CompleteMsg[index])[1])
    ;
    (UIAni.AlphaAnimation)(1, ui._obsidian, 0, 0.1)
    ;
    (UIAni.AlphaAnimation)(1, ui._obsidian_B, 0, 0.1)
    ;
    (UIAni.AlphaAnimation)(1, ui._obsidian_Text, 0, 0.1)
    ;
    (UIAni.AlphaAnimation)(1, ui._obsidian_Text_2, 0, 0.1)
  else
    _updateTime = _updateTime + deltaTime
    local setDesc = function()
    -- function num : 0_10_0 , upvalues : isOpen, ui, lifeTutorial_HuntingDesc, index, descCount
    if not isOpen then
      (ui._obsidian_Text):SetText(((lifeTutorial_HuntingDesc[index])[descCount])[0])
      ;
      (ui._obsidian_Text_2):SetText(((lifeTutorial_HuntingDesc[index])[descCount])[1])
      ;
      (UIAni.AlphaAnimation)(1, ui._obsidian, 0, 0.1)
      ;
      (UIAni.AlphaAnimation)(1, ui._obsidian_B, 0, 0.1)
      ;
      (UIAni.AlphaAnimation)(1, ui._obsidian_Text, 0, 0.1)
      ;
      (UIAni.AlphaAnimation)(1, ui._obsidian_Text_2, 0, 0.1)
    end
  end

    local descHide = function()
    -- function num : 0_10_1 , upvalues : isOpen, ui
    if isOpen then
      (UIAni.AlphaAnimation)(0, ui._obsidian, 0, 0.3)
      ;
      (UIAni.AlphaAnimation)(0, ui._obsidian_B, 0, 0.3)
      ;
      (UIAni.AlphaAnimation)(0, ui._obsidian_Text, 0, 0.3)
      ;
      (UIAni.AlphaAnimation)(0, ui._obsidian_Text_2, 0, 0.3)
    end
  end

    if _updateTime < 7 then
      setDesc()
      isOpen = true
    else
      if _updateTime >= 10 then
        _updateTime = 0
        descCount = (descCount + 1) % (#lifeTutorial_HuntingDesc[index] + 1)
        isOpen = false
      else
        descHide()
        isOpen = false
      end
    end
  end
  do
    ;
    (ui._obsidian):ChangeTextureInfoName(lifeTutorial_Texture[index])
    ;
    (ui._obsidian):SetPosX(basePosX - (ui._obsidian):GetSizeX())
    ;
    (ui._obsidian):SetPosY(basePosY - (ui._obsidian):GetSizeY() + 60)
    ;
    (ui._obsidian_B):SetPosX(basePosX)
    ;
    (ui._obsidian_B):SetPosY(basePosY)
    ;
    (ui._obsidian_Text):SetPosX(basePosX + 3)
    ;
    (ui._obsidian_Text):SetPosY(basePosY + 25)
    ;
    (ui._obsidian_Text_2):SetPosX(basePosX + 3)
    ;
    (ui._obsidian_Text_2):SetPosY((ui._obsidian_Text):GetPosY() + (ui._obsidian_Text):GetTextSizeY() + 5)
    ;
    (ui._obsidian_B):SetSize((math.max)((ui._obsidian_Text):GetTextSizeX(), (ui._obsidian_Text_2):GetTextSizeX()) + 20, (ui._obsidian_Text):GetTextSizeY() + (ui._obsidian_Text_2):GetTextSizeY() + 45)
  end
end

Panel_LifeTutorial_doStep = function(deltaTime)
  -- function num : 0_11 , upvalues : actionKey_Change, bubbleKey_Change, _stepNo, updateDeltaTime_Hunting
  actionKey_Change()
  bubbleKey_Change()
  if _stepNo == 1 then
    updateDeltaTime_Hunting(deltaTime, 0)
  else
    if _stepNo == 2 then
      updateDeltaTime_Hunting(deltaTime, 1)
    else
      if _stepNo == 3 then
        updateDeltaTime_Hunting(deltaTime, 2)
      end
    end
  end
end

TutorialQuest_ConditionSatisfyCheck = function(index)
  -- function num : 0_12 , upvalues : lifeTutorialQuestInfo
  local uiQuestInfo = ToClient_GetQuestInfo((lifeTutorialQuestInfo[index]).questGroup, (lifeTutorialQuestInfo[index]).questId)
  if uiQuestInfo ~= nil and uiQuestInfo:isSatisfied() then
    return true
  end
  return false
end

FGlobal_HuntingTutorial = function(index)
  -- function num : 0_13 , upvalues : _stepNo, _updateTime, descCount, ui
  _stepNo = index
  _updateTime = 0
  descCount = 0
  Panel_LifeTutorial:SetShow(true)
  ;
  (ui._obsidian):SetShow(true)
  ;
  (ui._obsidian_B):SetShow(true)
  ;
  (ui._obsidian_Text):SetShow(true)
  ;
  (ui._obsidian_Text_2):SetShow(true)
end

FGlobal_HuntingTutorialEnd = function()
  -- function num : 0_14 , upvalues : _stepNo, ui_Show, ui
  _stepNo = 0
  ui_Show(false)
  Panel_LifeTutorial:SetShow(false)
  ;
  (ui._obsidian):SetShow(false)
  ;
  (ui._obsidian_B):SetShow(false)
  ;
  (ui._obsidian_Text):SetShow(false)
  ;
  (ui._obsidian_Text_2):SetShow(false)
end

FGlobal_LifeTutorial_Check = function()
  -- function num : 0_15 , upvalues : lifeTutorialQuestInfo
  local progressQuest = false
  for index = 0, #lifeTutorialQuestInfo do
    if questList_hasProgressQuest((lifeTutorialQuestInfo[index]).questGroup, (lifeTutorialQuestInfo[index]).questId) then
      FGlobal_HuntingTutorial(index + 1)
      progressQuest = true
    end
  end
  if not progressQuest then
    FGlobal_HuntingTutorialEnd()
  end
end

FGlobal_LifeTutorial_Check()
registerEvent("onScreenResize", "LifeTutorial_ScreenRePosition")
Panel_LifeTutorial:RegisterUpdateFunc("Panel_LifeTutorial_doStep")

