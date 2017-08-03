-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\widget\enduarance\endurance_control.luac 

-- params : ...
-- function num : 0
local CT = CppEnums.ClassType
local awakenWeapon = {[CT.ClassType_Warrior] = ToClient_IsContentsGroupOpen("901"), [CT.ClassType_Ranger] = ToClient_IsContentsGroupOpen("902"), [CT.ClassType_Sorcerer] = ToClient_IsContentsGroupOpen("903"), [CT.ClassType_Giant] = ToClient_IsContentsGroupOpen("904"), [CT.ClassType_Tamer] = ToClient_IsContentsGroupOpen("905"), [CT.ClassType_BladeMaster] = ToClient_IsContentsGroupOpen("906"), [CT.ClassType_BladeMasterWomen] = ToClient_IsContentsGroupOpen("907"), [CT.ClassType_Valkyrie] = ToClient_IsContentsGroupOpen("908"), [CT.ClassType_Wizard] = ToClient_IsContentsGroupOpen("909"), [CT.ClassType_WizardWomen] = ToClient_IsContentsGroupOpen("910"), [CT.ClassType_NinjaMan] = ToClient_IsContentsGroupOpen("911"), [CT.ClassType_NinjaWomen] = ToClient_IsContentsGroupOpen("912"), [CT.ClassType_DarkElf] = ToClient_IsContentsGroupOpen("913"), [CT.ClassType_Combattant] = ToClient_IsContentsGroupOpen("914")}
local classType = (getSelfPlayer()):getClassType()
FromClient_EnduranceUpdate = function(enduranceType)
  -- function num : 0_0 , upvalues : awakenWeapon, classType
  if Panel_Window_StableList:GetShow() or Panel_Window_WharfList:GetShow() or Panel_Window_Repair:GetShow() then
    return 
  end
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
  local isShow = false
  local isCantRepair = false
  local enduranceCheck = 0
  for index = 0, self.enduranceTypeCount - 1 do
    local enduranceLevel = -1
    if enduranceType == (CppEnums.EnduranceType).eEnduranceType_Player then
      enduranceLevel = ToClient_GetPlayerEquipmentEnduranceLevel(index)
      if isCantRepair == false then
        isCantRepair = ToClient_IsCantRepairPlayerEquipment(index)
      end
    else
      if enduranceType == (CppEnums.EnduranceType).eEnduranceType_Horse then
        enduranceLevel = ToClient_GetHorseEquipmentEnduranceLevel(index)
      else
        if enduranceType == (CppEnums.EnduranceType).eEnduranceType_Carriage then
          enduranceLevel = ToClient_GetCarriageEquipmentEnduranceLevel(index)
        else
          if enduranceType == (CppEnums.EnduranceType).eEnduranceType_Ship then
            enduranceLevel = ToClient_GetShipEquipmentEnduranceLevel(index)
          end
        end
      end
    end
    ;
    (((self.enduranceInfo)[index]).control):ResetVertexAni()
    -- DECOMPILER ERROR at PC107: Confused about usage of register: R10 in 'UnsetPending'

    if enduranceLevel < 0 then
      ((self.enduranceInfo)[index]).itemEquiped = false
      -- DECOMPILER ERROR at PC113: Confused about usage of register: R10 in 'UnsetPending'

      ;
      ((self.enduranceInfo)[index]).color = (Defines.Color).C_FF000000
      -- DECOMPILER ERROR at PC116: Confused about usage of register: R10 in 'UnsetPending'

      ;
      ((self.enduranceInfo)[index]).isBroken = false
    else
      -- DECOMPILER ERROR at PC120: Confused about usage of register: R10 in 'UnsetPending'

      ;
      ((self.enduranceInfo)[index]).itemEquiped = true
      -- DECOMPILER ERROR at PC128: Confused about usage of register: R10 in 'UnsetPending'

      if enduranceLevel > 1 then
        ((self.enduranceInfo)[index]).color = (Defines.Color).C_FF444444
        -- DECOMPILER ERROR at PC131: Confused about usage of register: R10 in 'UnsetPending'

        ;
        ((self.enduranceInfo)[index]).isBroken = false
      else
        if enduranceType == (CppEnums.EnduranceType).eEnduranceType_Player then
          if enduranceLevel == 0 then
            if index == 0 then
              (((self.enduranceInfo)[index]).control):SetVertexAniRun("Ani_Color_Armor_Red", true)
            else
              if index == 1 then
                (((self.enduranceInfo)[index]).control):SetVertexAniRun("Ani_Color_Helm_Red", true)
              else
                if index == 2 then
                  (((self.enduranceInfo)[index]).control):SetVertexAniRun("Ani_Color_Glove_Red", true)
                else
                  if index == 3 then
                    (((self.enduranceInfo)[index]).control):SetVertexAniRun("Ani_Color_Boots_Red", true)
                  else
                    if index == 4 then
                      (((self.enduranceInfo)[index]).control):SetVertexAniRun("Ani_Color_WeaponR_Red", true)
                    else
                      if index == 5 then
                        (((self.enduranceInfo)[index]).control):SetVertexAniRun("Ani_Color_WeaponL_Red", true)
                      else
                        if index == 6 then
                          (((self.enduranceInfo)[index]).control):SetVertexAniRun("Ani_Color_Earing1_Red", true)
                        else
                          if index == 7 then
                            (((self.enduranceInfo)[index]).control):SetVertexAniRun("Ani_Color_Earing2_Red", true)
                          else
                            if index == 8 then
                              (((self.enduranceInfo)[index]).control):SetVertexAniRun("Ani_Color_Belt_Red", true)
                            else
                              if index == 9 then
                                (((self.enduranceInfo)[index]).control):SetVertexAniRun("Ani_Color_Necklace_Red", true)
                              else
                                if index == 10 then
                                  (((self.enduranceInfo)[index]).control):SetVertexAniRun("Ani_Color_Ring1_Red", true)
                                else
                                  if index == 11 then
                                    (((self.enduranceInfo)[index]).control):SetVertexAniRun("Ani_Color_Ring2_Red", true)
                                  else
                                    if index == 12 then
                                      (((self.enduranceInfo)[index]).control):SetVertexAniRun("Ani_Color_AwakenWeapon_Red", true)
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
          else
            if enduranceLevel == 1 then
              if index == 0 then
                (((self.enduranceInfo)[index]).control):SetVertexAniRun("Ani_Color_Armor_Orange", true)
              else
                if index == 1 then
                  (((self.enduranceInfo)[index]).control):SetVertexAniRun("Ani_Color_Helm_Orange", true)
                else
                  if index == 2 then
                    (((self.enduranceInfo)[index]).control):SetVertexAniRun("Ani_Color_Glove_Orange", true)
                  else
                    if index == 3 then
                      (((self.enduranceInfo)[index]).control):SetVertexAniRun("Ani_Color_Boots_Orange", true)
                    else
                      if index == 4 then
                        (((self.enduranceInfo)[index]).control):SetVertexAniRun("Ani_Color_WeaponR_Orange", true)
                      else
                        if index == 5 then
                          (((self.enduranceInfo)[index]).control):SetVertexAniRun("Ani_Color_WeaponL_Orange", true)
                        else
                          if index == 6 then
                            (((self.enduranceInfo)[index]).control):SetVertexAniRun("Ani_Color_Earing1_Orange", true)
                          else
                            if index == 7 then
                              (((self.enduranceInfo)[index]).control):SetVertexAniRun("Ani_Color_Earing2_Orange", true)
                            else
                              if index == 8 then
                                (((self.enduranceInfo)[index]).control):SetVertexAniRun("Ani_Color_Belt_Orange", true)
                              else
                                if index == 9 then
                                  (((self.enduranceInfo)[index]).control):SetVertexAniRun("Ani_Color_Necklace_Orange", true)
                                else
                                  if index == 10 then
                                    (((self.enduranceInfo)[index]).control):SetVertexAniRun("Ani_Color_Ring1_Orange", true)
                                  else
                                    if index == 11 then
                                      (((self.enduranceInfo)[index]).control):SetVertexAniRun("Ani_Color_Ring2_Orange", true)
                                    else
                                      if index == 12 then
                                        (((self.enduranceInfo)[index]).control):SetVertexAniRun("Ani_Color_AwakenWeapon_Orange", true)
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
            end
          end
        else
          if enduranceType == (CppEnums.EnduranceType).eEnduranceType_Horse then
            if enduranceLevel == 0 then
              if index == 0 then
                (((self.enduranceInfo)[index]).control):SetVertexAniRun("Ani_Color_Horse_Head_Red", true)
              else
                if index == 1 then
                  (((self.enduranceInfo)[index]).control):SetVertexAniRun("Ani_Color_Horse_Body_Red", true)
                else
                  if index == 2 then
                    (((self.enduranceInfo)[index]).control):SetVertexAniRun("Ani_Color_Horse_RiderFoot_Red", true)
                  else
                    if index == 3 then
                      (((self.enduranceInfo)[index]).control):SetVertexAniRun("Ani_Color_Horse_Saddle_Red", true)
                    else
                      if index == 4 then
                        (((self.enduranceInfo)[index]).control):SetVertexAniRun("Ani_Color_Horse_HorseFoot_Red", true)
                      end
                    end
                  end
                end
              end
            else
              if enduranceLevel == 1 then
                if index == 0 then
                  (((self.enduranceInfo)[index]).control):SetVertexAniRun("Ani_Color_Horse_Head_Orange", true)
                else
                  if index == 1 then
                    (((self.enduranceInfo)[index]).control):SetVertexAniRun("Ani_Color_Horse_Body_Orange", true)
                  else
                    if index == 2 then
                      (((self.enduranceInfo)[index]).control):SetVertexAniRun("Ani_Color_Horse_RiderFoot_Orange", true)
                    else
                      if index == 3 then
                        (((self.enduranceInfo)[index]).control):SetVertexAniRun("Ani_Color_Horse_Saddle_Orange", true)
                      else
                        if index == 4 then
                          (((self.enduranceInfo)[index]).control):SetVertexAniRun("Ani_Color_Horse_HorseFoot_Orange", true)
                        end
                      end
                    end
                  end
                end
              end
            end
          else
            if enduranceType == (CppEnums.EnduranceType).eEnduranceType_Carriage then
              if enduranceLevel == 0 then
                if index == 0 then
                  (((self.enduranceInfo)[index]).control):SetVertexAniRun("Ani_Color_Carriage_Flag_Red", true)
                else
                  if index == 1 then
                    (((self.enduranceInfo)[index]).control):SetVertexAniRun("Ani_Color_Carriage_Cover_Red", true)
                  else
                    if index == 2 then
                      (((self.enduranceInfo)[index]).control):SetVertexAniRun("Ani_Color_Carriage_Wheel_Red", true)
                    else
                      if index == 3 then
                        (((self.enduranceInfo)[index]).control):SetVertexAniRun("Ani_Color_Carriage_Curtain_Red", true)
                      else
                        if index == 4 then
                          (((self.enduranceInfo)[index]).control):SetVertexAniRun("Ani_Color_Carriage_Lamp_Red", true)
                        end
                      end
                    end
                  end
                end
              else
                if enduranceLevel == 1 then
                  if index == 0 then
                    (((self.enduranceInfo)[index]).control):SetVertexAniRun("Ani_Color_Carriage_Flag_Orange", true)
                  else
                    if index == 1 then
                      (((self.enduranceInfo)[index]).control):SetVertexAniRun("Ani_Color_Carriage_Cover_Orange", true)
                    else
                      if index == 2 then
                        (((self.enduranceInfo)[index]).control):SetVertexAniRun("Ani_Color_Carriage_Wheel_Orange", true)
                      else
                        if index == 3 then
                          (((self.enduranceInfo)[index]).control):SetVertexAniRun("Ani_Color_Carriage_Curtain_Orange", true)
                        else
                          if index == 4 then
                            (((self.enduranceInfo)[index]).control):SetVertexAniRun("Ani_Color_Carriage_Lamp_Orange", true)
                          end
                        end
                      end
                    end
                  end
                end
              end
            else
              if enduranceType == (CppEnums.EnduranceType).eEnduranceType_Ship then
                if enduranceLevel == 0 then
                  if index == 0 then
                    (((self.enduranceInfo)[index]).control):SetVertexAniRun("Ani_Color_Ship_Main_Red", true)
                  else
                    if index == 1 then
                      (((self.enduranceInfo)[index]).control):SetVertexAniRun("Ani_Color_Ship_Head_Red", true)
                    else
                      if index == 2 then
                        (((self.enduranceInfo)[index]).control):SetVertexAniRun("Ani_Color_Ship_Deco_Red", true)
                      else
                        if index == 3 then
                          (((self.enduranceInfo)[index]).control):SetVertexAniRun("Ani_Color_Ship_Goods_Red", true)
                        end
                      end
                    end
                  end
                else
                  if enduranceLevel == 1 then
                    if index == 0 then
                      (((self.enduranceInfo)[index]).control):SetVertexAniRun("Ani_Color_Ship_Main_Orange", true)
                    else
                      if index == 1 then
                        (((self.enduranceInfo)[index]).control):SetVertexAniRun("Ani_Color_Ship_Head_Orange", true)
                      else
                        if index == 2 then
                          (((self.enduranceInfo)[index]).control):SetVertexAniRun("Ani_Color_Ship_Deco_Orange", true)
                        else
                          if index == 3 then
                            (((self.enduranceInfo)[index]).control):SetVertexAniRun("Ani_Color_Ship_Goods_Orange", true)
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
        -- DECOMPILER ERROR at PC710: Confused about usage of register: R10 in 'UnsetPending'

        ;
        ((self.enduranceInfo)[index]).isBroken = true
        isShow = true
        enduranceCheck = enduranceCheck + 1
      end
    end
    ;
    (((self.enduranceInfo)[index]).control):SetColor(((self.enduranceInfo)[index]).color)
  end
  if isShow then
    for index = 0, self.enduranceTypeCount - 1 do
      (((self.enduranceInfo)[index]).control):SetShow(true)
    end
    if enduranceType == (CppEnums.EnduranceType).eEnduranceType_Player then
      (((self.enduranceInfo)[12]).control):SetShow(awakenWeapon[classType])
    end
    ;
    (self.effectBG):EraseAllEffect()
    if ((((enduranceType == (CppEnums.EnduranceType).eEnduranceType_Player and enduranceType ~= (CppEnums.EnduranceType).eEnduranceType_Horse) or enduranceType == (CppEnums.EnduranceType).eEnduranceType_Carriage) and enduranceType ~= (CppEnums.EnduranceType).eEnduranceType_Ship)) or self.isEffectSound == false then
      self.isEffectSound = true
      audioPostEvent_SystemUi(8, 6)
    end
    if (enduranceCheck == 4 or enduranceCheck == 1) and isCantRepair == true then
      (self.noticeEndurance):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_ENDURANCE_NOTICEENDURACNE1"))
    else
      if isCantRepair == true then
        (self.noticeEndurance):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_ENDURANCE_NOTICEENDURACNE2"))
      else
        ;
        (self.noticeEndurance):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_ENDURANCE_NOTICEENDURACNE3"))
      end
    end
    ;
    (self.panel):SetShow(true)
    ;
    (self.effectBG):SetEnable(true)
  else
    for index = 0, self.enduranceTypeCount - 1 do
      (((self.enduranceInfo)[index]).control):SetShow(false)
      ;
      (((self.enduranceInfo)[index]).control):ResetVertexAni()
    end
    self.isEffectSound = false
    ;
    (self.effectBG):EraseAllEffect()
    ;
    (self.noticeEndurance):SetShow(false)
    ;
    (self.effectBG):SetEnable(false)
  end
  if enduranceType == (CppEnums.EnduranceType).eEnduranceType_Player then
    (self.panel):SetShow(false)
    local enduranceList = {PaGlobalPlayerEnduranceList, PaGlobalHorseEnduranceList, PaGlobalCarriageEnduranceList, PaGlobalShipEnduranceList}
    local isRepairShow = false
    for key,value in pairs(enduranceList) do
      if (value.effectBG):IsEnable() and isRepairShow == false then
        (value.repair_AutoNavi):SetShow(true)
        ;
        (value.repair_Navi):SetShow(true)
        isRepairShow = true
      else
        ;
        (value.repair_AutoNavi):SetShow(false)
        ;
        (value.repair_Navi):SetShow(false)
      end
    end
    FGlobal_Inventory_WeightCheck()
  end
end

FromClient_PlayerEnduranceUpdate = function()
  -- function num : 0_1
  FromClient_EnduranceUpdate((CppEnums.EnduranceType).eEnduranceType_Player)
end

FromClient_ServantEnduranceUpdate = function()
  -- function num : 0_2
  FromClient_EnduranceUpdate((CppEnums.EnduranceType).eEnduranceType_Horse)
  FromClient_EnduranceUpdate((CppEnums.EnduranceType).eEnduranceType_Carriage)
  FromClient_EnduranceUpdate((CppEnums.EnduranceType).eEnduranceType_Ship)
end

Panel_Endurance_Update = function()
  -- function num : 0_3
  FromClient_PlayerEnduranceUpdate()
  FromClient_ServantEnduranceUpdate()
end

renderModeChange_Panel_Endurance_Update = function(prevRenderModeList, nextRenderModeList)
  -- function num : 0_4
  if CheckRenderModebyGameMode(nextRenderModeList) == false then
    return 
  end
  Panel_Endurance_Update()
end

Panel_Endurance_Update()
registerEvent("FromClient_RenderModeChangeState", "renderModeChange_Panel_Endurance_Update")
registerEvent("FromClient_EquipEnduranceChanged", "Panel_Endurance_Update")
registerEvent("EventEquipmentUpdate", "FromClient_PlayerEnduranceUpdate")
registerEvent("EventServantEquipItem", "FromClient_ServantEnduranceUpdate")
registerEvent("EventServantEquipmentUpdate", "FromClient_ServantEnduranceUpdate")

