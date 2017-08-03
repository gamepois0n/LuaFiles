-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\widget\scroll\panel_scroll.luac 

-- params : ...
-- function num : 0
Panel_Scroll:SetShow(false, false)
local UI_PUCT = CppEnums.PA_UI_CONTROL_TYPE
UIScrollButton = {static_upAni = (UI.getChildControl)(Panel_Scroll, "Static_Up_Ani"), button_up = (UI.getChildControl)(Panel_Scroll, "Button_Up"), static_downAni = (UI.getChildControl)(Panel_Scroll, "Static_Down_Ani"), button_down = (UI.getChildControl)(Panel_Scroll, "Button_Down"), currentPanel = nil}
local staticUpAni = {}
local buttonUp = {}
local staticDownAni = {}
local buttonDown = {}
-- DECOMPILER ERROR at PC45: Confused about usage of register: R5 in 'UnsetPending'

UIScrollButton.CreateScrollButton = function(parentPanel)
  -- function num : 0_0 , upvalues : staticUpAni, UI_PUCT, buttonUp, staticDownAni, buttonDown
  local panelName = tostring(parentPanel:GetID())
  -- DECOMPILER ERROR at PC18: Confused about usage of register: R2 in 'UnsetPending'

  if staticUpAni[panelName] == nil then
    staticUpAni[panelName] = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATIC, parentPanel, "Static_Up_Ani_" .. panelName)
    CopyBaseProperty(UIScrollButton.static_upAni, staticUpAni[panelName])
    ;
    (staticUpAni[panelName]):SetNotAbleMasking(true)
  end
  -- DECOMPILER ERROR at PC44: Confused about usage of register: R2 in 'UnsetPending'

  if buttonUp[panelName] == nil then
    buttonUp[panelName] = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_BUTTON, parentPanel, "Button_Up_" .. panelName)
    CopyBaseProperty(UIScrollButton.button_up, buttonUp[panelName])
    ;
    (buttonUp[panelName]):addInputEvent("Mouse_LUp", "UIScrollButton.ScrollMoveEvent(" .. panelName .. ",\'up\')")
    ;
    (buttonUp[panelName]):SetNotAbleMasking(true)
  end
  -- DECOMPILER ERROR at PC79: Confused about usage of register: R2 in 'UnsetPending'

  if staticDownAni[panelName] == nil then
    staticDownAni[panelName] = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATIC, parentPanel, "Static_Down_Ani_" .. panelName)
    CopyBaseProperty(UIScrollButton.static_downAni, staticDownAni[panelName])
    ;
    (staticDownAni[panelName]):SetNotAbleMasking(true)
  end
  -- DECOMPILER ERROR at PC105: Confused about usage of register: R2 in 'UnsetPending'

  if buttonDown[panelName] == nil then
    buttonDown[panelName] = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_BUTTON, parentPanel, "Button_Down_" .. panelName)
    CopyBaseProperty(UIScrollButton.button_down, buttonDown[panelName])
    ;
    (buttonDown[panelName]):addInputEvent("Mouse_LUp", "UIScrollButton.ScrollMoveEvent(" .. panelName .. ",\'down\')")
    ;
    (buttonDown[panelName]):SetNotAbleMasking(true)
  end
end

-- DECOMPILER ERROR at PC52: Confused about usage of register: R5 in 'UnsetPending'

UIScrollButton.ScrollButtonEvent = function(isShow, parentPanel, targetUI, targetScroll)
  -- function num : 0_1 , upvalues : staticUpAni, buttonUp, staticDownAni, buttonDown
  local panelName = tostring(parentPanel:GetID())
  ;
  (UIScrollButton.CreateScrollButton)(parentPanel)
  if isShow and targetScroll:GetShow() then
    (staticUpAni[panelName]):SetPosX(targetUI:GetSizeX() / 2 - (staticUpAni[panelName]):GetSizeX() / 2)
    ;
    (staticUpAni[panelName]):SetPosY(targetUI:GetPosY() - 8)
    ;
    (buttonUp[panelName]):SetPosX(targetUI:GetSizeX() / 2 - (buttonUp[panelName]):GetSizeX() / 2)
    ;
    (buttonUp[panelName]):SetPosY(targetUI:GetPosY() - 6)
    ;
    (staticDownAni[panelName]):SetPosX(targetUI:GetSizeX() / 2 - (staticDownAni[panelName]):GetSizeX() / 2)
    ;
    (staticDownAni[panelName]):SetPosY(targetUI:GetPosY() + targetUI:GetSizeY() - 6)
    ;
    (buttonDown[panelName]):SetPosX(targetUI:GetSizeX() / 2 - (buttonDown[panelName]):GetSizeX() / 2)
    ;
    (buttonDown[panelName]):SetPosY(targetUI:GetPosY() + targetUI:GetSizeY())
    if targetScroll:GetControlPos() == 0 then
      (staticUpAni[panelName]):SetShow(false)
      ;
      (buttonUp[panelName]):SetShow(false)
    else
      ;
      (staticUpAni[panelName]):SetShow(true)
      ;
      (buttonUp[panelName]):SetShow(true)
      ;
      (staticUpAni[panelName]):ResetVertexAni()
      ;
      (staticUpAni[panelName]):SetVertexAniRun("Ani_Color_Up", true)
    end
    if targetScroll:GetControlPos() == 1 then
      (staticDownAni[panelName]):SetShow(false)
      ;
      (buttonDown[panelName]):SetShow(false)
    else
      ;
      (staticDownAni[panelName]):SetShow(true)
      ;
      (buttonDown[panelName]):SetShow(true)
      ;
      (staticDownAni[panelName]):ResetVertexAni()
      ;
      (staticDownAni[panelName]):SetVertexAniRun("Ani_Color_Down", true)
    end
  else
    ;
    (staticUpAni[panelName]):SetShow(false)
    ;
    (buttonUp[panelName]):SetShow(false)
    ;
    (staticDownAni[panelName]):SetShow(false)
    ;
    (buttonDown[panelName]):SetShow(false)
  end
  if Panel_CheckedQuest == parentPanel then
    if targetScroll:GetShow() then
      if targetScroll:GetControlPos() == 0 then
        parentPanel:ChangeSpecialTextureInfoName("new_ui_common_forlua/widget/questlist/mask_down.dds")
      else
        if targetScroll:GetControlPos() == 1 then
          parentPanel:ChangeSpecialTextureInfoName("new_ui_common_forlua/widget/questlist/mask_up.dds")
        else
          parentPanel:ChangeSpecialTextureInfoName("new_ui_common_forlua/widget/questlist/mask_all.dds")
        end
      end
    else
      parentPanel:ChangeSpecialTextureInfoName("")
    end
  end
  -- DECOMPILER ERROR at PC221: Confused about usage of register: R5 in 'UnsetPending'

  UIScrollButton.currentPanel = parentPanel
end

-- DECOMPILER ERROR at PC55: Confused about usage of register: R5 in 'UnsetPending'

UIScrollButton.ScrollMoveEvent = function(parentPanel, moveDirection)
  -- function num : 0_2
  if Panel_CheckedQuest == parentPanel then
    QuestList_ScrollMove(moveDirection)
  else
    if Panel_Window_Quest_History == parentPanel then
      QuestHistory_ScrollMove(moveDirection)
    else
      if Panel_Window_Skill == parentPanel then
        PaGlobal_Skill:Skill_ScrollMove(moveDirection)
      end
    end
  end
end


