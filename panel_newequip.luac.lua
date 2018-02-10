-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\widget\newequip\panel_newequip.luac 

-- params : ...
-- function num : 0
Panel_NewEquip:setMaskingChild(true)
Panel_NewEquip:ActiveMouseEventEffect(true)
Panel_NewEquip:setGlassBackground(true)
Panel_NewEquip:RegisterShowEventFunc(true, "Panel_NewEquip_ShowAni()")
Panel_NewEquip:RegisterShowEventFunc(false, "Panel_NewEquip_HideAni()")
Panel_NewEquip:SetDragAll(false)
Panel_NewEquip:SetIgnore(false)
Panel_NewEquip_ShowAni = function()
  -- function num : 0_0
  Panel_NewEquip:SetShow(true)
end

Panel_NewEquip_HideAni = function()
  -- function num : 0_1
  Panel_NewEquip:SetShow(false)
end

Panel_NewEquip:SetShow(false)
local widgetTitle = (UI.getChildControl)(Panel_NewEquip, "StaticText_Title")
local NewEquipWidget = {_buttonWeapon = (UI.getChildControl)(Panel_NewEquip, "Static_Sword"), _buttonSubWeapon = (UI.getChildControl)(Panel_NewEquip, "Static_Shield"), _buttonHelm = (UI.getChildControl)(Panel_NewEquip, "Static_Helm"), _buttonUpper = (UI.getChildControl)(Panel_NewEquip, "Static_Armor"), _buttonHand = (UI.getChildControl)(Panel_NewEquip, "Static_Glove"), _buttonFoot = (UI.getChildControl)(Panel_NewEquip, "Static_Boots")}
local equipData = {_buttonWeapon = false, _buttonSubWeapon = false, _buttonHelm = false, _buttonUpper = false, _buttonHand = false, _buttonFoot = false}
local UI_color = Defines.Color
local partsTooltipBase = (UI.getChildControl)(Panel_CheckedQuest, "StaticText_Notice_1")
local partsTooltip = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATICTEXT, Panel_NewEquip, "newEquip_Tooltip")
CopyBaseProperty(partsTooltipBase, partsTooltip)
partsTooltip:SetColor(UI_color.C_FFFFFFFF)
partsTooltip:SetAlpha(1)
partsTooltip:SetFontColor(UI_color.C_FFC4BEBE)
partsTooltip:SetShow(false)
partsTooltip:SetIgnore(true)
Panel_NewEquip_ScreenResize = function()
  -- function num : 0_2
  Panel_NewEquip:ComputePos()
  local posX, posY = nil, nil
  posY = FGlobal_GetPersonalIconPosY(4) + FGlobal_GetPersonalIconSizeY()
  posX = FGlobal_GetPersonalIconPosX(4)
  if CppDefine.ChangeUIAndResolution == true then
    if Panel_NewEquip:GetRelativePosX() == -1 and Panel_NewEquip:GetRelativePosY() == -1 then
      Panel_NewEquip:SetPosX(posX)
      Panel_NewEquip:SetPosY(posY)
      changePositionBySever(Panel_NewEquip, (CppEnums.PAGameUIType).PAGameUIPanel_NewEquipment, false, true, false)
      FGlobal_InitPanelRelativePos(Panel_NewEquip, initPosX, initPosY)
    else
      if Panel_NewEquip:GetRelativePosX() == 0 and Panel_NewEquip:GetRelativePosY() == 0 then
        Panel_NewEquip:SetPosX(posX)
        Panel_NewEquip:SetPosY(posY)
      else
        Panel_NewEquip:SetPosX(getScreenSizeX() * Panel_NewEquip:GetRelativePosX() - Panel_NewEquip:GetSizeX() / 2)
        Panel_NewEquip:SetPosY(getScreenSizeY() * Panel_NewEquip:GetRelativePosY() - Panel_NewEquip:GetSizeY() / 2)
      end
    end
  else
    Panel_NewEquip:SetPosX(posX)
    Panel_NewEquip:SetPosY(posY)
    changePositionBySever(Panel_NewEquip, (CppEnums.PAGameUIType).PAGameUIPanel_NewEquipment, false, true, false)
  end
  FGlobal_PanelRepostionbyScreenOut(Panel_NewEquip)
end

local initialize = function()
  -- function num : 0_3 , upvalues : NewEquipWidget, widgetTitle, UI_color
  Panel_NewEquip_ScreenResize()
  local self = NewEquipWidget
  ;
  (self._buttonWeapon):addInputEvent("Mouse_LUp", "Panel_NewEquip_ClickEvent()")
  ;
  (self._buttonWeapon):addInputEvent("Mouse_On", "partsTooltip_Show( true, " .. 0 .. ", " .. (self._buttonWeapon):GetPosX() .. ", " .. (self._buttonWeapon):GetPosY() .. ")")
  ;
  (self._buttonWeapon):addInputEvent("Mouse_Out", "partsTooltip_Show( false )")
  ;
  (self._buttonWeapon):SetShow(false)
  ;
  (self._buttonSubWeapon):addInputEvent("Mouse_LUp", "Panel_NewEquip_ClickEvent()")
  ;
  (self._buttonSubWeapon):addInputEvent("Mouse_On", "partsTooltip_Show( true, " .. 1 .. ", " .. (self._buttonSubWeapon):GetPosX() .. ", " .. (self._buttonSubWeapon):GetPosY() .. ")")
  ;
  (self._buttonSubWeapon):addInputEvent("Mouse_Out", "partsTooltip_Show( false )")
  ;
  (self._buttonSubWeapon):SetShow(false)
  ;
  (self._buttonHelm):addInputEvent("Mouse_LUp", "Panel_NewEquip_ClickEvent()")
  ;
  (self._buttonHelm):addInputEvent("Mouse_On", "partsTooltip_Show( true, " .. 6 .. ", " .. (self._buttonHelm):GetPosX() .. ", " .. (self._buttonHelm):GetPosY() .. ")")
  ;
  (self._buttonHelm):addInputEvent("Mouse_Out", "partsTooltip_Show( false )")
  ;
  (self._buttonHelm):SetShow(false)
  ;
  (self._buttonUpper):addInputEvent("Mouse_LUp", "Panel_NewEquip_ClickEvent()")
  ;
  (self._buttonUpper):addInputEvent("Mouse_On", "partsTooltip_Show( true, " .. 3 .. ", " .. (self._buttonUpper):GetPosX() .. ", " .. (self._buttonUpper):GetPosY() .. ")")
  ;
  (self._buttonUpper):addInputEvent("Mouse_Out", "partsTooltip_Show( false )")
  ;
  (self._buttonUpper):SetShow(false)
  ;
  (self._buttonHand):addInputEvent("Mouse_LUp", "Panel_NewEquip_ClickEvent()")
  ;
  (self._buttonHand):addInputEvent("Mouse_On", "partsTooltip_Show( true, " .. 4 .. ", " .. (self._buttonHand):GetPosX() .. ", " .. (self._buttonHand):GetPosY() .. ")")
  ;
  (self._buttonHand):addInputEvent("Mouse_Out", "partsTooltip_Show( false )")
  ;
  (self._buttonHand):SetShow(false)
  ;
  (self._buttonFoot):addInputEvent("Mouse_LUp", "Panel_NewEquip_ClickEvent()")
  ;
  (self._buttonFoot):addInputEvent("Mouse_On", "partsTooltip_Show( true, " .. 5 .. ", " .. (self._buttonFoot):GetPosX() .. ", " .. (self._buttonFoot):GetPosY() .. ")")
  ;
  (self._buttonFoot):addInputEvent("Mouse_Out", "partsTooltip_Show( false )")
  ;
  (self._buttonFoot):SetShow(false)
  widgetTitle:SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_NEWEQUIP_TITLE"))
  widgetTitle:SetFontColor(UI_color.C_FFEFEFEF)
  widgetTitle:useGlowFont(true, "BaseFont_10_Glow", 4282439677)
end

NewEquipWidget_Show = function(equipPos)
  -- function num : 0_4 , upvalues : NewEquipWidget
  if (Defines.UIMode).eUIMode_Default ~= GetUIMode() then
    return 
  end
  local self = NewEquipWidget
  Panel_NewEquip:SetShow(true)
  if equipPos == 0 then
    if not (self._buttonWeapon):GetShow() then
      (self._buttonWeapon):AddEffect("fUI_ItemBatter01", true, 0, 0)
    end
    ;
    (self._buttonWeapon):SetShow(true)
  else
    if equipPos == 1 then
      if not (self._buttonSubWeapon):GetShow() then
        (self._buttonSubWeapon):AddEffect("fUI_ItemBatter01", true, 0, 0)
      end
      ;
      (self._buttonSubWeapon):SetShow(true)
    else
      if equipPos == 6 then
        if not (self._buttonHelm):GetShow() then
          (self._buttonHelm):AddEffect("fUI_ItemBatter01", true, 0, 0)
        end
        ;
        (self._buttonHelm):SetShow(true)
      else
        if equipPos == 3 then
          if not (self._buttonUpper):GetShow() then
            (self._buttonUpper):AddEffect("fUI_ItemBatter01", true, 0, 0)
          end
          ;
          (self._buttonUpper):SetShow(true)
        else
          if equipPos == 4 then
            if not (self._buttonHand):GetShow() then
              (self._buttonHand):AddEffect("fUI_ItemBatter01", true, 0, 0)
            end
            ;
            (self._buttonHand):SetShow(true)
          else
            if equipPos == 5 then
              if not (self._buttonFoot):GetShow() then
                (self._buttonFoot):AddEffect("fUI_ItemBatter01", true, 0, 0)
              end
              ;
              (self._buttonFoot):SetShow(true)
            end
          end
        end
      end
    end
  end
end

partsTooltip_Show = function(show, parts, x, y)
  -- function num : 0_5 , upvalues : partsTooltip
  if show == true then
    partsTooltip:SetAutoResize(true)
    partsTooltip:SetTextHorizonCenter()
    if parts == 0 then
      partsTooltip:SetText(PAGetString(Defines.StringSheet_GAME, "Lua_EquipSlotNo_String_RightHand"))
    else
      if parts == 1 then
        partsTooltip:SetText(PAGetString(Defines.StringSheet_GAME, "Lua_EquipSlotNo_String_LeftHand"))
      else
        if parts == 6 then
          partsTooltip:SetText(PAGetString(Defines.StringSheet_GAME, "Lua_EquipSlotNo_String_Helm"))
        else
          if parts == 3 then
            partsTooltip:SetText(PAGetString(Defines.StringSheet_GAME, "Lua_EquipSlotNo_String_Chest"))
          else
            if parts == 4 then
              partsTooltip:SetText(PAGetString(Defines.StringSheet_GAME, "Lua_EquipSlotNo_String_Glove"))
            else
              if parts == 5 then
                partsTooltip:SetText(PAGetString(Defines.StringSheet_GAME, "Lua_EquipSlotNo_String_Boots"))
              end
            end
          end
        end
      end
    end
    partsTooltip:SetSize(partsTooltip:GetTextSizeX() + 20, partsTooltip:GetSizeY())
    partsTooltip:SetPosX(x - partsTooltip:GetSizeX() + 10)
    partsTooltip:SetPosY(y - 30)
    partsTooltip:SetShow(true)
  else
    partsTooltip:SetShow(false)
  end
end

Panel_NewEquip_ClickEvent = function()
  -- function num : 0_6
  if not Panel_Window_Inventory:GetShow() then
    InventoryWindow_Show()
  end
end

Panel_NewEquip_EffectClear = function()
  -- function num : 0_7 , upvalues : equipData
  for key,value in pairs(equipData) do
    -- DECOMPILER ERROR at PC5: Confused about usage of register: R5 in 'UnsetPending'

    equipData[key] = false
  end
end

Panel_NewEquip_EffectLastUpdate = function()
  -- function num : 0_8 , upvalues : equipData, NewEquipWidget
  if (Defines.UIMode).eUIMode_Default ~= GetUIMode() then
    return 
  end
  local isPanelShow = false
  for key,value in pairs(equipData) do
    local control = NewEquipWidget[key]
    if value == false and control:GetShow() then
      control:SetShow(false)
      control:EraseAllEffect()
    else
      if value and control:GetShow() == false then
        control:SetShow(true)
        control:AddEffect("fUI_ItemBatter01", true, 0, 0)
      end
    end
    if value then
      isPanelShow = true
    end
  end
  Panel_NewEquip:SetShow(isPanelShow)
  PaGlobal_TutorialMenu:setShow(PaGlobal_TutorialMenu:checkShowCondition(), true)
  FromClient_questWidget_ResetPosition()
end

Panel_NewEquip_Update = function(equipPos)
  -- function num : 0_9 , upvalues : NewEquipWidget, equipData
  local self = NewEquipWidget
  local isShowButton = false
  if equipPos ~= nil then
    isShowButton = true
  else
    isShowButton = false
  end
  -- DECOMPILER ERROR at PC12: Confused about usage of register: R3 in 'UnsetPending'

  if equipPos == 0 or equipPos == 29 then
    equipData._buttonWeapon = true
  else
    -- DECOMPILER ERROR at PC17: Confused about usage of register: R3 in 'UnsetPending'

    if equipPos == 1 then
      equipData._buttonSubWeapon = true
    else
      -- DECOMPILER ERROR at PC22: Confused about usage of register: R3 in 'UnsetPending'

      if equipPos == 6 then
        equipData._buttonHelm = true
      else
        -- DECOMPILER ERROR at PC27: Confused about usage of register: R3 in 'UnsetPending'

        if equipPos == 3 then
          equipData._buttonUpper = true
        else
          -- DECOMPILER ERROR at PC32: Confused about usage of register: R3 in 'UnsetPending'

          if equipPos == 4 then
            equipData._buttonHand = true
          else
            -- DECOMPILER ERROR at PC37: Confused about usage of register: R3 in 'UnsetPending'

            if equipPos == 5 then
              equipData._buttonFoot = true
            end
          end
        end
      end
    end
  end
end

Panel_NewEquip_UpdatePos = function()
  -- function num : 0_10 , upvalues : NewEquipWidget
  local startPosX = 4
  local updatePosX = 0
  local self = NewEquipWidget
  if (self._buttonWeapon):GetShow() then
    (self._buttonWeapon):SetSpanSize(startPosX + updatePosX, 0)
    updatePosX = updatePosX + 42
  end
  if (self._buttonSubWeapon):GetShow() then
    (self._buttonSubWeapon):SetSpanSize(startPosX + (updatePosX), 0)
    updatePosX = updatePosX + 42
  end
  if (self._buttonHelm):GetShow() then
    (self._buttonHelm):SetSpanSize(startPosX + (updatePosX), 0)
    updatePosX = updatePosX + 42
  end
  if (self._buttonUpper):GetShow() then
    (self._buttonUpper):SetSpanSize(startPosX + (updatePosX), 0)
    updatePosX = updatePosX + 42
  end
  if (self._buttonHand):GetShow() then
    (self._buttonHand):SetSpanSize(startPosX + (updatePosX), 0)
    updatePosX = updatePosX + 42
  end
  if (self._buttonFoot):GetShow() then
    (self._buttonFoot):SetSpanSize(startPosX + (updatePosX), 0)
    updatePosX = updatePosX + 42
  end
end

renderModeChange_Panel_NewEquip_ScreenResize = function(prevRenderModeList, nextRenderModeList)
  -- function num : 0_11
  if CheckRenderModebyGameMode(nextRenderModeList) == false then
    return 
  end
  Panel_NewEquip_ScreenResize()
end

initialize()
registerEvent("FromClient_RenderModeChangeState", "renderModeChange_Panel_NewEquip_ScreenResize")
changePositionBySever(Panel_NewEquip, (CppEnums.PAGameUIType).PAGameUIPanel_NewEquipment, false, true, false)
registerEvent("onScreenResize", "Panel_NewEquip_ScreenResize")

