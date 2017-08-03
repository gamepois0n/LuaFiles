-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\widget\enduarance\endurance_main.luac 

-- params : ...
-- function num : 0
PaGlobalPlayerEnduranceList = {panel = Panel_Endurance, enduranceTypeCount = 13, 
enduranceInfo = {}
, effectBG = (UI.getChildControl)(Panel_Endurance, "Static_Effect"), noticeEndurance = (UI.getChildControl)(Panel_Endurance, "StaticText_NoticeEndurance"), isEffectSound = false, repair_AutoNavi = (UI.getChildControl)(Panel_Endurance, "CheckButton_Repair_AutoNavi"), repair_Navi = (UI.getChildControl)(Panel_Endurance, "Checkbox_Repair_Navi"), radarSizeX = 0}
-- DECOMPILER ERROR at PC35: Confused about usage of register: R0 in 'UnsetPending'

PaGlobalPlayerEnduranceList.initialize = function(self)
  -- function num : 0_0
  for index = 0, self.enduranceTypeCount - 1 do
    -- DECOMPILER ERROR at PC7: Confused about usage of register: R5 in 'UnsetPending'

    (self.enduranceInfo)[index] = {}
    -- DECOMPILER ERROR at PC17: Confused about usage of register: R5 in 'UnsetPending'

    if index == 0 then
      ((self.enduranceInfo)[index]).control = (UI.getChildControl)(self.panel, "Static_Armor")
    else
      -- DECOMPILER ERROR at PC28: Confused about usage of register: R5 in 'UnsetPending'

      if index == 1 then
        ((self.enduranceInfo)[index]).control = (UI.getChildControl)(self.panel, "Static_Helm")
      else
        -- DECOMPILER ERROR at PC39: Confused about usage of register: R5 in 'UnsetPending'

        if index == 2 then
          ((self.enduranceInfo)[index]).control = (UI.getChildControl)(self.panel, "Static_Glove")
        else
          -- DECOMPILER ERROR at PC50: Confused about usage of register: R5 in 'UnsetPending'

          if index == 3 then
            ((self.enduranceInfo)[index]).control = (UI.getChildControl)(self.panel, "Static_Boots")
          else
            -- DECOMPILER ERROR at PC61: Confused about usage of register: R5 in 'UnsetPending'

            if index == 4 then
              ((self.enduranceInfo)[index]).control = (UI.getChildControl)(self.panel, "Static_WeaponR")
            else
              -- DECOMPILER ERROR at PC72: Confused about usage of register: R5 in 'UnsetPending'

              if index == 5 then
                ((self.enduranceInfo)[index]).control = (UI.getChildControl)(self.panel, "Static_WeaponL")
              else
                -- DECOMPILER ERROR at PC83: Confused about usage of register: R5 in 'UnsetPending'

                if index == 6 then
                  ((self.enduranceInfo)[index]).control = (UI.getChildControl)(self.panel, "Static_Earing1")
                else
                  -- DECOMPILER ERROR at PC94: Confused about usage of register: R5 in 'UnsetPending'

                  if index == 7 then
                    ((self.enduranceInfo)[index]).control = (UI.getChildControl)(self.panel, "Static_Earing2")
                  else
                    -- DECOMPILER ERROR at PC105: Confused about usage of register: R5 in 'UnsetPending'

                    if index == 8 then
                      ((self.enduranceInfo)[index]).control = (UI.getChildControl)(self.panel, "Static_Belt")
                    else
                      -- DECOMPILER ERROR at PC116: Confused about usage of register: R5 in 'UnsetPending'

                      if index == 9 then
                        ((self.enduranceInfo)[index]).control = (UI.getChildControl)(self.panel, "Static_Necklace")
                      else
                        -- DECOMPILER ERROR at PC127: Confused about usage of register: R5 in 'UnsetPending'

                        if index == 10 then
                          ((self.enduranceInfo)[index]).control = (UI.getChildControl)(self.panel, "Static_Ring1")
                        else
                          -- DECOMPILER ERROR at PC138: Confused about usage of register: R5 in 'UnsetPending'

                          if index == 11 then
                            ((self.enduranceInfo)[index]).control = (UI.getChildControl)(self.panel, "Static_Ring2")
                          else
                            -- DECOMPILER ERROR at PC149: Confused about usage of register: R5 in 'UnsetPending'

                            if index == 12 then
                              ((self.enduranceInfo)[index]).control = (UI.getChildControl)(self.panel, "Static_AwakenWeapon")
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
    ;
    (((self.enduranceInfo)[index]).control):SetShow(false)
    -- DECOMPILER ERROR at PC161: Confused about usage of register: R5 in 'UnsetPending'

    ;
    ((self.enduranceInfo)[index]).color = (Defines.Color).C_FF000000
    -- DECOMPILER ERROR at PC164: Confused about usage of register: R5 in 'UnsetPending'

    ;
    ((self.enduranceInfo)[index]).itemEquiped = false
    -- DECOMPILER ERROR at PC167: Confused about usage of register: R5 in 'UnsetPending'

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
  (self.effectBG):addInputEvent("Mouse_On", "HandleMEnduranceNotice(CppEnums.EnduranceType.eEnduranceType_Player, true)")
  ;
  (self.effectBG):addInputEvent("Mouse_Out", "HandleMEnduranceNotice(CppEnums.EnduranceType.eEnduranceType_Player, false)")
  ;
  (self.repair_AutoNavi):addInputEvent("Mouse_LUp", "HandleMLUpRepairNavi(CppEnums.EnduranceType.eEnduranceType_Player, true)")
  ;
  (self.repair_Navi):addInputEvent("Mouse_LUp", "HandleMLUpRepairNavi(CppEnums.EnduranceType.eEnduranceType_Player, false)")
  self.radarSizeX = FGlobal_Panel_Radar_GetSizeX()
end

HandleMEnduranceNotice = function(enduranceType, isShow)
  -- function num : 0_1
  local self = PaGlobalPlayerEnduranceList
  if enduranceType == (CppEnums.EnduranceType).eEnduranceType_Player then
    self = PaGlobalPlayerEnduranceList
  else
    if enduranceType == (CppEnums.EnduranceType).eEnduranceType_Horse then
      self = PaGlobalHorseEnduranceList
    else
      if enduranceType == (CppEnums.EnduranceType).eEnduranceType_Carriage then
        self = PaGlobalCarriageEnduranceList
      else
        if enduranceType == (CppEnums.EnduranceType).eEnduranceType_Ship then
          self = PaGlobalShipEnduranceList
        end
      end
    end
  end
  ;
  (self.noticeEndurance):SetShow(isShow)
end

HandleMLUpRepairNavi = function(enduranceType, isAuto)
  -- function num : 0_2
  local self = PaGlobalPlayerEnduranceList
  if enduranceType == (CppEnums.EnduranceType).eEnduranceType_Player then
    self = PaGlobalPlayerEnduranceList
  else
    if enduranceType == (CppEnums.EnduranceType).eEnduranceType_Horse then
      self = PaGlobalHorseEnduranceList
    else
      if enduranceType == (CppEnums.EnduranceType).eEnduranceType_Carriage then
        self = PaGlobalCarriageEnduranceList
      else
        if enduranceType == (CppEnums.EnduranceType).eEnduranceType_Ship then
          self = PaGlobalShipEnduranceList
        end
      end
    end
  end
  local player = getSelfPlayer()
  if player == nil then
    return 
  end
  ToClient_DeleteNaviGuideByGroup(0)
  if ToClient_IsShowNaviGuideGroup(0) then
    if isAuto == true and (self.repair_AutoNavi):IsCheck() == true then
      (self.repair_Navi):SetCheck(true)
      ;
      (self.repair_AutoNavi):SetCheck(true)
    else
      ;
      (self.repair_Navi):SetCheck(false)
      ;
      (self.repair_AutoNavi):SetCheck(false)
      audioPostEvent_SystemUi(0, 15)
      return 
    end
  else
    if isAuto == true then
      (self.repair_Navi):SetCheck(true)
      ;
      (self.repair_AutoNavi):SetCheck(true)
    else
      ;
      (self.repair_Navi):SetCheck(true)
      ;
      (self.repair_AutoNavi):SetCheck(false)
    end
  end
  local position = player:get3DPos()
  local spawnType = (CppEnums.SpawnType).eSpawnType_ItemRepairer
  local nearNpcInfo = getNearNpcInfoByType(spawnType, position)
  if nearNpcInfo ~= nil then
    local pos = nearNpcInfo:getPosition()
    local repairNaviKey = ToClient_WorldMapNaviStart(pos, NavigationGuideParam(), isAuto, true)
    audioPostEvent_SystemUi(0, 14)
    local selfPlayer = (getSelfPlayer()):get()
    selfPlayer:setNavigationMovePath(repairNaviKey)
    selfPlayer:checkNaviPathUI(repairNaviKey)
  end
end

Panel_PlayerEndurance_Position = function()
  -- function num : 0_3
  local self = PaGlobalPlayerEnduranceList
  if FGlobal_Panel_Radar_GetShow() then
    (self.panel):SetPosX(getScreenSizeX() - self.radarSizeX - (self.panel):GetSizeX())
    ;
    (self.panel):SetPosY(FGlobal_Panel_Radar_GetPosY())
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

renderModeChange_Panel_PlayerEndurance_Position = function(prevRenderModeList, nextRenderModeList)
  -- function num : 0_4
  if CheckRenderModebyGameMode(nextRenderModeList) == false then
    return 
  end
  Panel_PlayerEndurance_Position()
end

PaGlobalPlayerEnduranceList:initialize()
registerEvent("FromClient_RenderModeChangeState", "renderModeChange_Panel_PlayerEndurance_Position")
registerEvent("onScreenResize", "Panel_PlayerEndurance_Position")

