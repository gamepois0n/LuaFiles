-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\widget\righttopicons\panel_personalicon.luac 

-- params : ...
-- function num : 0
Panel_PersonalIcon:SetShow(false)
local personalIcon = {_btn_NpcNavi = (UI.getChildControl)(Panel_PersonalIcon, "Button_FindNavi"), _btn_NpcNaviTW = (UI.getChildControl)(Panel_PersonalIcon, "Button_FindNaviTW"), _btn_MovieGuide = (UI.getChildControl)(Panel_PersonalIcon, "Button_MovieTooltip"), _btn_VoiceChat = (UI.getChildControl)(Panel_PersonalIcon, "Button_SetState"), _btn_Hunting = (UI.getChildControl)(Panel_PersonalIcon, "Button_HuntingAlert"), _btn_SiegeArea = (UI.getChildControl)(Panel_PersonalIcon, "Button_VillageSiegeArea"), _btn_AutoTraining = (UI.getChildControl)(Panel_PersonalIcon, "Button_AutoTraining"), _btn_SummonElephant = (UI.getChildControl)(Panel_PersonalIcon, "Button_SummonElephant"), _btn_BusterCall = (UI.getChildControl)(Panel_PersonalIcon, "Button_BusterCall"), _btn_WarCall = (UI.getChildControl)(Panel_PersonalIcon, "Button_WarCall"), _btn_ReturnStone = (UI.getChildControl)(Panel_PersonalIcon, "Button_ReturnStone"), _btn_SummonParty = (UI.getChildControl)(Panel_PersonalIcon, "Button_SummonParty"), _plus_MovieGuide = (UI.getChildControl)(Panel_PersonalIcon, "StaticText_MoviePlus"), _plus_Hunting = (UI.getChildControl)(Panel_PersonalIcon, "StaticText_HuntingPlus"), _text_AutoTraining = (UI.getChildControl)(Panel_PersonalIcon, "StaticText_Training")}
PersonalIcon_Initalize = function()
  -- function num : 0_0 , upvalues : personalIcon
  local self = personalIcon
  for _,v in pairs(self) do
    v:SetShow(false)
  end
  PersonalIcon_Tooltip()
end

FGlobal_PersonalIcon_ButtonPosUpdate = function()
  -- function num : 0_1 , upvalues : personalIcon
  local self = personalIcon
  local showIconCount = 0
  local controlGapX = 5
  local sizeX = (self._btn_NpcNavi):GetSizeX()
  local RadarPosX = FGlobal_Panel_Radar_GetPosX() - Panel_PersonalIcon:GetPosX()
  local RadarPosY = FGlobal_Panel_Radar_GetPosY()
  local RadarSpanSizeY = FGlobal_Panel_Radar_GetSpanSizeY()
  local playerLV = ((getSelfPlayer()):get()):getLevel()
  if getContentsServiceType() == (CppEnums.ContentsServiceType).eContentsServiceType_CBT then
    if isGameTypeEnglish() then
      (self._btn_MovieGuide):SetShow(true)
    else
      ;
      (self._btn_MovieGuide):SetShow(false)
    end
  else
    ;
    (self._btn_MovieGuide):SetShow(not isRecordMode)
  end
  if playerLV > 51 then
    (self._btn_NpcNavi):SetShow(true)
    ;
    (self._btn_NpcNaviTW):SetShow(false)
  else
    ;
    (self._btn_NpcNavi):SetShow(false)
    ;
    (self._btn_NpcNaviTW):SetShow(true)
  end
  if (self._btn_NpcNavi):GetShow() or (self._btn_NpcNaviTW):GetShow() then
    showIconCount = showIconCount + 1
    ;
    (self._btn_NpcNavi):SetPosX(RadarPosX - (sizeX + controlGapX) * (showIconCount) - 5)
    ;
    (self._btn_NpcNavi):SetPosY(10)
    ;
    (self._btn_NpcNaviTW):SetPosX(RadarPosX - (sizeX + controlGapX) * (showIconCount) - 5)
    ;
    (self._btn_NpcNaviTW):SetPosY(10)
  end
  if (self._btn_MovieGuide):GetShow() then
    showIconCount = showIconCount + 1
    ;
    (self._btn_MovieGuide):SetPosX(RadarPosX - (sizeX + controlGapX) * (showIconCount) - 5)
    ;
    (self._btn_MovieGuide):SetPosY(10)
  end
  if ToClient_IsContentsGroupOpen("75") then
    showIconCount = showIconCount + 1
    ;
    (self._btn_VoiceChat):SetShow(not isRecordMode)
    ;
    (self._btn_VoiceChat):SetPosX(RadarPosX - (sizeX + controlGapX) * (showIconCount) - 5)
    ;
    (self._btn_VoiceChat):SetPosY(10)
  else
    ;
    (self._btn_VoiceChat):SetShow(false)
  end
  if ToClient_IsContentsGroupOpen("28") then
    (self._btn_Hunting):SetShow(not isRecordMode)
    showIconCount = showIconCount + 1
    ;
    (self._btn_Hunting):SetPosX(RadarPosX - (sizeX + controlGapX) * (showIconCount) - 5)
    ;
    (self._btn_Hunting):SetPosY(10)
  else
    ;
    (self._btn_Hunting):SetShow(false)
  end
  ;
  (self._btn_SiegeArea):SetShow(not isRecordMode)
  showIconCount = showIconCount + 1
  ;
  (self._btn_SiegeArea):SetPosX(RadarPosX - (sizeX + controlGapX) * (showIconCount) - 5)
  ;
  (self._btn_SiegeArea):SetPosY(10)
  if (self._btn_SummonElephant):GetShow() then
    showIconCount = showIconCount + 1
    ;
    (self._btn_SummonElephant):SetPosX(RadarPosX - (sizeX + controlGapX) * (showIconCount) - 5)
    ;
    (self._btn_SummonElephant):SetPosY(10)
  end
  local trainableMinLev = 50
  if ToClient_IsContentsGroupOpen("57") and trainableMinLev <= playerLV then
    (self._btn_AutoTraining):SetShow(not isRecordMode)
    showIconCount = showIconCount + 1
    ;
    (self._btn_AutoTraining):SetPosX(RadarPosX - (sizeX + controlGapX) * (showIconCount) - 5)
    ;
    (self._btn_AutoTraining):SetPosY(10)
  else
    ;
    (self._btn_AutoTraining):SetShow(false)
  end
  if (self._btn_BusterCall):GetShow() then
    showIconCount = showIconCount + 1
    ;
    (self._btn_BusterCall):SetPosX(RadarPosX - (sizeX + controlGapX) * (showIconCount) - 5)
    ;
    (self._btn_BusterCall):SetPosY(10)
  end
  if (self._btn_ReturnStone):GetShow() then
    showIconCount = showIconCount + 1
    ;
    (self._btn_ReturnStone):SetPosX(RadarPosX - (sizeX + controlGapX) * (showIconCount) - 5)
    ;
    (self._btn_ReturnStone):SetPosY(10)
  end
  if (self._btn_SummonParty):GetShow() then
    showIconCount = showIconCount + 1
    ;
    (self._btn_SummonParty):SetPosX(RadarPosX - (sizeX + controlGapX) * (showIconCount) - 5)
    ;
    (self._btn_SummonParty):SetPosY(10)
  end
  if (self._btn_WarCall):GetShow() then
    showIconCount = showIconCount + 1
    ;
    (self._btn_WarCall):SetPosX(RadarPosX - (sizeX + controlGapX) * (showIconCount) - 5)
    ;
    (self._btn_WarCall):SetPosY(10)
  end
  ;
  (self._plus_MovieGuide):SetPosX((self._btn_MovieGuide):GetPosX() + 25)
  ;
  (self._plus_MovieGuide):SetPosY((self._btn_MovieGuide):GetPosY() + 25)
  ;
  (self._plus_Hunting):SetPosX((self._btn_Hunting):GetPosX() + 25)
  ;
  (self._plus_Hunting):SetPosY((self._btn_Hunting):GetPosY() + 25)
  ;
  (self._text_AutoTraining):SetPosX((self._btn_AutoTraining):GetPosX() + 12)
  ;
  (self._text_AutoTraining):SetPosY((self._btn_AutoTraining):GetPosY() + 25)
  Panel_PersonalIcon:SetShow(true)
end

FGlobal_GetPersonalIconControl = function(index)
  -- function num : 0_2 , upvalues : personalIcon
  local self = personalIcon
  if index == 0 then
    local playerLV = ((getSelfPlayer()):get()):getLevel()
    if playerLV > 51 then
      return self._btn_NpcNavi
    else
      return self._btn_NpcNaviTW
    end
  else
    do
      if index == 1 then
        return self._btn_MovieGuide
      else
        if index == 2 then
          return self._btn_VoiceChat
        else
          if index == 3 then
            return self._btn_Hunting
          else
            if index == 4 then
              return self._btn_SiegeArea
            else
              if index == 5 then
                return self._btn_AutoTraining
              else
                if index == 6 then
                  return self._btn_BusterCall
                else
                  if index == 7 then
                    return self._btn_ReturnStone
                  else
                    if index == 8 then
                      return self._btn_SummonElephant
                    else
                      if index == 9 then
                        return self._btn_SummonParty
                      else
                        if index == 10 then
                          return self._btn_WarCall
                        else
                          return nil
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end
end

FGlobal_GetPersonalText = function(index)
  -- function num : 0_3 , upvalues : personalIcon
  local self = personalIcon
  if index == 1 then
    return self._plus_MovieGuide
  else
    if index == 3 then
      return self._plus_Hunting
    else
      if index == 5 then
        return self._text_AutoTraining
      else
        return nil
      end
    end
  end
end

FGlobal_GetPersonalIconPosX = function(index)
  -- function num : 0_4 , upvalues : personalIcon
  local self = personalIcon
  local posX = Panel_PersonalIcon:GetPosX()
  if index == 0 then
    return (self._btn_NpcNavi):GetPosX() + posX
  else
    if index == 1 then
      return (self._btn_MovieGuide):GetPosX() + posX
    else
      if index == 2 then
        return (self._btn_VoiceChat):GetPosX() + posX
      else
        if index == 3 then
          return (self._btn_Hunting):GetPosX() + posX
        else
          if index == 4 then
            return (self._btn_SiegeArea):GetPosX() + posX
          else
            if index == 5 then
              return (self._btn_AutoTraining):GetPosX() + posX
            else
              if index == 6 then
                return (self._btn_BusterCall):GetPosX() + posX
              else
                if index == 7 then
                  return (self._btn_ReturnStone):GetPosX() + posX
                else
                  if index == 8 then
                    return (self._btn_SummonElephant):GetPosX() + posX
                  else
                    if index == 9 then
                      return (self._btn_SummonParty):GetPosX() + posX
                    else
                      if index == 10 then
                        return (self._btn_WarCall):GetPosX() + posX
                      else
                        return nil
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end
end

FGlobal_GetPersonalIconPosY = function(index)
  -- function num : 0_5 , upvalues : personalIcon
  local self = personalIcon
  local posY = Panel_PersonalIcon:GetPosY()
  if index == 0 then
    return (self._btn_NpcNavi):GetPosY() + posY
  else
    if index == 1 then
      return (self._btn_MovieGuide):GetPosY() + posY
    else
      if index == 2 then
        return (self._btn_VoiceChat):GetPosY() + posY
      else
        if index == 3 then
          return (self._btn_Hunting):GetPosY() + posY
        else
          if index == 4 then
            return (self._btn_SiegeArea):GetPosY() + posY
          else
            if index == 5 then
              return (self._btn_AutoTraining):GetPosY() + posY
            else
              if index == 6 then
                return (self._btn_BusterCall):GetPosY() + posY
              else
                if index == 7 then
                  return (self._btn_ReturnStone):GetPosY() + posY
                else
                  if index == 8 then
                    return (self._btn_SummonElephant):GetPosY() + posY
                  else
                    if index == 9 then
                      return (self._btn_SummonParty):GetPosY() + posY
                    else
                      if index == 10 then
                        return (self._btn_WarCall):GetPosY() + posY
                      else
                        return nil
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end
end

FGlobal_GetPersonalIconSizeX = function()
  -- function num : 0_6 , upvalues : personalIcon
  local self = personalIcon
  local sizeX = (self._btn_NpcNavi):GetSizeX()
  return sizeX
end

FGlobal_GetPersonalIconSizeY = function()
  -- function num : 0_7 , upvalues : personalIcon
  local self = personalIcon
  local sizeY = (self._btn_NpcNavi):GetSizeY()
  return sizeY
end

PersonalIcon_Tooltip = function()
  -- function num : 0_8 , upvalues : personalIcon
  local self = personalIcon
  ;
  (self._btn_NpcNavi):addInputEvent("Mouse_LUp", "NpcNavi_ShowToggle()")
  ;
  (self._btn_NpcNaviTW):addInputEvent("Mouse_LUp", "NpcNavi_ShowToggle()")
  ;
  (self._btn_MovieGuide):addInputEvent("Mouse_LUp", "Panel_MovieGuide_ShowToggle()")
  ;
  (self._btn_VoiceChat):addInputEvent("Mouse_On", "HandleOnOut_SetVoiceChat_Tooltip(true)")
  ;
  (self._btn_VoiceChat):addInputEvent("Mouse_Out", "HandleOnOut_SetVoiceChat_Tooltip(false)")
  ;
  (self._btn_VoiceChat):addInputEvent("Mouse_LUp", "FGlobal_SetVoiceChat_Toggle()")
  ;
  (self._btn_VoiceChat):setTooltipEventRegistFunc("HandleOnOut_SetVoiceChat_Tooltip( true )")
  ;
  (self._btn_Hunting):addInputEvent("Mouse_On", "Hunting_ToolTip_ShowToggle(true)")
  ;
  (self._btn_Hunting):addInputEvent("Mouse_Out", "Hunting_ToolTip_ShowToggle(false)")
  ;
  (self._btn_SiegeArea):addInputEvent("Mouse_On", "VillageSiegeArea_Tooltip_ShowToggle(true)")
  ;
  (self._btn_SiegeArea):addInputEvent("Mouse_Out", "VillageSiegeArea_Tooltip_ShowToggle(false)")
  ;
  (self._btn_SiegeArea):addInputEvent("Mouse_LUp", "ToggleVillageSiegeArea(false)")
  ;
  (self._btn_AutoTraining):addInputEvent("Mouse_On", "AutoTraining_ToolTip(true)")
  ;
  (self._btn_AutoTraining):addInputEvent("Mouse_Out", "AutoTraining_ToolTip(false)")
  ;
  (self._btn_AutoTraining):addInputEvent("Mouse_LUp", "AutoTraining_Set()")
  ;
  (self._btn_SummonElephant):addInputEvent("Mouse_On", "SummonElephant_Tooltip_ShowToggle(true)")
  ;
  (self._btn_SummonElephant):addInputEvent("Mouse_Out", "SummonElephant_Tooltip_ShowToggle(false)")
  ;
  (self._btn_SummonElephant):addInputEvent("Mouse_LUp", "SummonElephant()")
  ;
  (self._btn_BusterCall):addInputEvent("Mouse_On", "BusterCall_ToolTip(true)")
  ;
  (self._btn_BusterCall):addInputEvent("Mouse_Out", "BusterCall_ToolTip(false)")
  ;
  (self._btn_BusterCall):addInputEvent("Mouse_LUp", "Click_BusterCall()")
  ;
  (self._btn_WarCall):addInputEvent("Mouse_On", "WarCall_ToolTip(true)")
  ;
  (self._btn_WarCall):addInputEvent("Mouse_Out", "WarCall_ToolTip(false)")
  ;
  (self._btn_WarCall):addInputEvent("Mouse_LUp", "Click_WarCall()")
  ;
  (self._btn_ReturnStone):addInputEvent("Mouse_On", "ReturnStone_ToolTip(true)")
  ;
  (self._btn_ReturnStone):addInputEvent("Mouse_Out", "ReturnStone_ToolTip(false)")
  ;
  (self._btn_ReturnStone):addInputEvent("Mouse_LUp", "Click_ReturnStone()")
  ;
  (self._btn_SummonParty):addInputEvent("Mouse_On", "SummonParty_ToolTip(true)")
  ;
  (self._btn_SummonParty):addInputEvent("Mouse_Out", "SummonParty_ToolTip(false)")
  ;
  (self._btn_SummonParty):addInputEvent("Mouse_LUp", "Click_SummonParty()")
end

PersonalIcon_Initalize()
FGlobal_PersonalIcon_ButtonPosUpdate()

