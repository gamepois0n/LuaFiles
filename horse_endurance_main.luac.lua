-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\widget\enduarance\horse_endurance_main.luac 

-- params : ...
-- function num : 0
PaGlobalHorseEnduranceList = {panel = Panel_HorseEndurance, enduranceTypeCount = 5, 
enduranceInfo = {}
, effectBG = (UI.getChildControl)(Panel_HorseEndurance, "Static_HorseEffect"), noticeEndurance = (UI.getChildControl)(Panel_HorseEndurance, "StaticText_NoticeEndurance"), repair_AutoNavi = (UI.getChildControl)(Panel_HorseEndurance, "CheckButton_Repair_AutoNavi"), repair_Navi = (UI.getChildControl)(Panel_HorseEndurance, "Checkbox_Repair_Navi"), radarSizeX = 0}
-- DECOMPILER ERROR at PC34: Confused about usage of register: R0 in 'UnsetPending'

PaGlobalHorseEnduranceList.initialize = function(self)
  -- function num : 0_0
  for index = 0, self.enduranceTypeCount - 1 do
    -- DECOMPILER ERROR at PC7: Confused about usage of register: R5 in 'UnsetPending'

    (self.enduranceInfo)[index] = {}
    -- DECOMPILER ERROR at PC17: Confused about usage of register: R5 in 'UnsetPending'

    if index == 0 then
      ((self.enduranceInfo)[index]).control = (UI.getChildControl)(self.panel, "Static_Horse_Head")
    else
      -- DECOMPILER ERROR at PC28: Confused about usage of register: R5 in 'UnsetPending'

      if index == 1 then
        ((self.enduranceInfo)[index]).control = (UI.getChildControl)(self.panel, "Static_Horse_Body")
      else
        -- DECOMPILER ERROR at PC39: Confused about usage of register: R5 in 'UnsetPending'

        if index == 2 then
          ((self.enduranceInfo)[index]).control = (UI.getChildControl)(self.panel, "Static_Horse_RiderFoot")
        else
          -- DECOMPILER ERROR at PC50: Confused about usage of register: R5 in 'UnsetPending'

          if index == 3 then
            ((self.enduranceInfo)[index]).control = (UI.getChildControl)(self.panel, "Static_Horse_Saddle")
          else
            -- DECOMPILER ERROR at PC61: Confused about usage of register: R5 in 'UnsetPending'

            if index == 4 then
              ((self.enduranceInfo)[index]).control = (UI.getChildControl)(self.panel, "Static_Horse_HorseFoot")
            end
          end
        end
      end
    end
    ;
    (((self.enduranceInfo)[index]).control):SetShow(false)
    -- DECOMPILER ERROR at PC73: Confused about usage of register: R5 in 'UnsetPending'

    ;
    ((self.enduranceInfo)[index]).color = (Defines.Color).C_FF000000
    -- DECOMPILER ERROR at PC76: Confused about usage of register: R5 in 'UnsetPending'

    ;
    ((self.enduranceInfo)[index]).itemEquiped = false
    -- DECOMPILER ERROR at PC79: Confused about usage of register: R5 in 'UnsetPending'

    ;
    ((self.enduranceInfo)[index]).isBroken = false
  end
  ;
  (self.noticeEndurance):SetShow(false)
  ;
  (self.repair_AutoNavi):SetShow(false)
  ;
  (self.repair_Navi):SetShow(false)
  ;
  (self.panel):SetShow(true)
  if not (self.repair_Navi):GetShow() then
    (self.effectBG):EraseAllEffect()
  end
  ;
  (self.effectBG):addInputEvent("Mouse_On", "HandleMEnduranceNotice(CppEnums.EnduranceType.eEnduranceType_Horse, true)")
  ;
  (self.effectBG):addInputEvent("Mouse_Out", "HandleMEnduranceNotice(CppEnums.EnduranceType.eEnduranceType_Horse, false)")
  ;
  (self.repair_AutoNavi):addInputEvent("Mouse_LUp", "HandleMLUpRepairNavi(CppEnums.EnduranceType.eEnduranceType_Horse, true)")
  ;
  (self.repair_Navi):addInputEvent("Mouse_LUp", "HandleMLUpRepairNavi(CppEnums.EnduranceType.eEnduranceType_Horse, false)")
  self.radarSizeX = FGlobal_Panel_Radar_GetSizeX()
  Panel_HorseEndurance_Position()
end

Panel_HorseEndurance_Position = function()
  -- function num : 0_1
  local self = PaGlobalHorseEnduranceList
  if FGlobal_Panel_Radar_GetShow() then
    (self.panel):SetPosX(getScreenSizeX() - self.radarSizeX - (self.panel):GetSizeX() * 1.7)
    ;
    (self.panel):SetPosY(FGlobal_Panel_Radar_GetPosY() - FGlobal_Panel_Radar_GetSizeY() / 1.5)
  else
    ;
    (self.panel):SetPosX(getScreenSizeX() - (self.panel):GetSizeX())
    ;
    (self.panel):SetPosY(30)
  end
  if Panel_Widget_TownNpcNavi:GetShow() then
    (self.panel):SetPosY(Panel_Widget_TownNpcNavi:GetSizeY() + Panel_Widget_TownNpcNavi:GetPosY() + 10)
  end
end

renderModeChange_Panel_HorseEndurance_Position = function(prevRenderModeList, nextRenderModeList)
  -- function num : 0_2
  if CheckRenderModebyGameMode(nextRenderModeList) == false then
    return 
  end
  Panel_HorseEndurance_Position()
end

PaGlobalHorseEnduranceList:initialize()
registerEvent("FromClient_RenderModeChangeState", "renderModeChange_Panel_HorseEndurance_Position")
registerEvent("onScreenResize", "Panel_HorseEndurance_Position")

