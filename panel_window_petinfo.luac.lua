-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\petinfo\panel_window_petinfo.luac 

-- params : ...
-- function num : 0
Panel_Window_PetInfoNew:SetShow(false)
local PetInfo = {BTN_Close = (UI.getChildControl)(Panel_Window_PetInfoNew, "Button_Win_Close"), petInfoBg = (UI.getChildControl)(Panel_Window_PetInfoNew, "Static_BG"), iconPet = (UI.getChildControl)(Panel_Window_PetInfoNew, "Static_IconPet"), petName = (UI.getChildControl)(Panel_Window_PetInfoNew, "StaticText_PetName"), progress_EXP = (UI.getChildControl)(Panel_Window_PetInfoNew, "Static_Progress_EXP"), level_Title = (UI.getChildControl)(Panel_Window_PetInfoNew, "StaticText_Level_Title"), level_Value = (UI.getChildControl)(Panel_Window_PetInfoNew, "StaticText_Level_Value"), progress_Hungry = (UI.getChildControl)(Panel_Window_PetInfoNew, "Static_Progress_Hungry"), icon_Lovely = (UI.getChildControl)(Panel_Window_PetInfoNew, "Static_LovelyIcon"), bg_Lovely = (UI.getChildControl)(Panel_Window_PetInfoNew, "Static_Progress_Lovely_BG"), progress_Lovely = (UI.getChildControl)(Panel_Window_PetInfoNew, "Static_Progress_Lovely"), 
action = {(UI.getChildControl)(Panel_Window_PetInfoNew, "Static_Specificity_2"), (UI.getChildControl)(Panel_Window_PetInfoNew, "Static_Specificity_3"), (UI.getChildControl)(Panel_Window_PetInfoNew, "Static_Specificity_4"), (UI.getChildControl)(Panel_Window_PetInfoNew, "Static_Specificity_5"), (UI.getChildControl)(Panel_Window_PetInfoNew, "Static_Specificity_6"), (UI.getChildControl)(Panel_Window_PetInfoNew, "Static_Specificity_7"), (UI.getChildControl)(Panel_Window_PetInfoNew, "Static_Specificity_8"), (UI.getChildControl)(Panel_Window_PetInfoNew, "Static_Specificity_9"), (UI.getChildControl)(Panel_Window_PetInfoNew, "Static_Specificity_10"); [0] = (UI.getChildControl)(Panel_Window_PetInfoNew, "Static_Specificity_1")}
, 
actionSlot = {(UI.getChildControl)(Panel_Window_PetInfoNew, "Static_2"), (UI.getChildControl)(Panel_Window_PetInfoNew, "Static_3"), (UI.getChildControl)(Panel_Window_PetInfoNew, "Static_4"), (UI.getChildControl)(Panel_Window_PetInfoNew, "Static_5"), (UI.getChildControl)(Panel_Window_PetInfoNew, "Static_6"), (UI.getChildControl)(Panel_Window_PetInfoNew, "Static_7"), (UI.getChildControl)(Panel_Window_PetInfoNew, "Static_8"), (UI.getChildControl)(Panel_Window_PetInfoNew, "Static_9"), (UI.getChildControl)(Panel_Window_PetInfoNew, "Static_10"); [0] = (UI.getChildControl)(Panel_Window_PetInfoNew, "Static_1")}
, skillBg = (UI.getChildControl)(Panel_Window_PetInfoNew, "Static_SkillBg"), 
skillSlotBg = {(UI.getChildControl)(Panel_Window_PetInfoNew, "Static_SkillBg_2"), (UI.getChildControl)(Panel_Window_PetInfoNew, "Static_SkillBg_3"), (UI.getChildControl)(Panel_Window_PetInfoNew, "Static_SkillBg_4"), (UI.getChildControl)(Panel_Window_PetInfoNew, "Static_SkillBg_5"); [0] = (UI.getChildControl)(Panel_Window_PetInfoNew, "Static_SkillBg_1")}
, 
skillSlot = {(UI.getChildControl)(Panel_Window_PetInfoNew, "Static_SkillSlot_2"), (UI.getChildControl)(Panel_Window_PetInfoNew, "Static_SkillSlot_3"), (UI.getChildControl)(Panel_Window_PetInfoNew, "Static_SkillSlot_4"), (UI.getChildControl)(Panel_Window_PetInfoNew, "Static_SkillSlot_5"); [0] = (UI.getChildControl)(Panel_Window_PetInfoNew, "Static_SkillSlot_1")}
, baseSkill_1 = (UI.getChildControl)(Panel_Window_PetInfoNew, "StaticText_Skill_1"), baseSkill_2 = (UI.getChildControl)(Panel_Window_PetInfoNew, "StaticText_Skill_2"), PetNo = 0, 
currentPetLv = {}
}
local _buttonQuestion = (UI.getChildControl)(Panel_Window_PetInfoNew, "Button_Question")
_buttonQuestion:addInputEvent("Mouse_LUp", "Panel_WebHelper_ShowToggle( \"Pet\" )")
_buttonQuestion:addInputEvent("Mouse_On", "HelpMessageQuestion_Show( \"Pet\", \"true\")")
_buttonQuestion:addInputEvent("Mouse_Out", "HelpMessageQuestion_Show( \"Pet\", \"false\")")
local petIcon = false
PetInfo.Update = function(self, isSealed)
  -- function num : 0_0
  local petSkillType = function(PcPetData, param)
    -- function num : 0_0_0 , upvalues : self
    local skillParam = PcPetData:getSkillParam(param)
    local paramText = ""
    if skillParam._type == 1 then
      local petLootingType = PcPetData:getPetLootingType()
      local variableCount = 1
      if petLootingType == 0 then
        variableCount = 1.1
      else
        if petLootingType == 2 then
          variableCount = 0.9
        end
      end
      paramText = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_PETINFO_PETSKILLTYPE_ITEMGETTIME", "itemGetTime", (string.format)("%.1f", skillParam:getParam(0) * variableCount / 1000))
    else
      do
        if skillParam._type == 2 then
          paramText = PAGetString(Defines.StringSheet_GAME, "LUA_PETINFO_PETSKILLTYPE_FINDGATHER")
        else
          if skillParam._type == 3 then
            paramText = PAGetString(Defines.StringSheet_GAME, "LUA_PETINFO_PETSKILLTYPE_FINDPK")
          else
            if skillParam._type == 4 then
              paramText = PAGetString(Defines.StringSheet_GAME, "LUA_PETINFO_PETSKILLTYPE_FINDPLACE")
            else
              if skillParam._type == 5 then
                paramText = PAGetString(Defines.StringSheet_GAME, "LUA_PETINFO_PETSKILLTYPE_MOBAGGRO")
              else
                if skillParam._type == 6 then
                  paramText = PAGetString(Defines.StringSheet_GAME, "LUA_PETINFO_PETSKILLTYPE_FINDRAREMONSTER")
                else
                  if skillParam._type == 7 then
                    paramText = PAGetString(Defines.StringSheet_GAME, "LUA_PETINFO_PETSKILLTYPE_REDUCEAUTOFISHINGTIME")
                  else
                    if skillParam._type == 8 then
                      paramText = PAGetString(Defines.StringSheet_GAME, "LUA_PETINFO_PETSKILLTYPE_REGISTILL")
                    else
                      if skillParam._type == 9 then
                        paramText = PAGetString(Defines.StringSheet_GAME, "LUA_PETINFO_PETSKILLTYPE_AUTOGETHERING")
                      else
                        if skillParam._type == 10 then
                          paramText = PAGetString(Defines.StringSheet_GAME, "LUA_PETINFO_PETSKILLTYPE_GETHERINGINCREASE")
                        else
                          if param == 0 then
                            (self.baseSkill_1):SetShow(false)
                          else
                            if param == 1 then
                              (self.baseSkill_2):SetShow(false)
                            end
                          end
                          return 
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
        if param == 0 then
          (self.baseSkill_1):SetShow(true)
          ;
          (self.baseSkill_1):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_PETINFO_BASESKILL", "paramText", paramText))
        else
          if param == 1 then
            (self.baseSkill_2):SetShow(true)
            ;
            (self.baseSkill_2):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_PETINFO_SPECIALSKILL", "paramText", paramText))
          end
        end
      end
    end
  end

  if isSealed then
    local petNo = self.PetNo
    local petCount = ToClient_getPetSealedList()
    if petCount == 0 then
      return 
    end
    for index = 0, petCount - 1 do
      local PetSealData = ToClient_getPetSealedDataByIndex(index)
      if PetSealData == nil then
        return 
      end
      if petNo == PetSealData._petNo then
        local petStaticStatus = PetSealData:getPetStaticStatus()
        local patName = PetSealData:getName()
        local petNum_s64 = PetSealData._petNo
        local petNum_S32 = Int64toInt32(petNum_s64)
        local petLevel = PetSealData._level
        local petLovely = PetSealData._lovely
        local petMaxLovely = 100
        local petLovelyPercent = petLovely / petMaxLovely * 100
        local petHungry = PetSealData._hungry
        local petMaxHungry = petStaticStatus._maxHungry
        local petHungryPercent = petHungry / petMaxHungry * 100
        local iconPath = PetSealData:getIconPath()
        local petTier = petStaticStatus:getPetTier() + 1
        petSkillType(PetSealData, 0)
        petSkillType(PetSealData, 1)
        local actionMaxCount = ToClient_getPetActionMax()
        local uiIdx = 0
        for action_idx = 0, actionMaxCount - 1 do
          ((self.actionSlot)[action_idx]):SetShow(false)
          local actionStaticStatus = ToClient_getPetActionStaticStatus(action_idx)
          local isLearn = PetSealData:isPetActionLearned(action_idx)
          if isLearn == true then
            ((self.actionSlot)[uiIdx]):SetShow(true)
            ;
            ((self.actionSlot)[uiIdx]):ChangeTextureInfoName("Icon/" .. actionStaticStatus:getIconPath())
            ;
            ((self.actionSlot)[uiIdx]):addInputEvent("Mouse_On", "_PetInfo_ShowActionToolTip( " .. action_idx .. ", " .. uiIdx .. " )")
            ;
            ((self.actionSlot)[uiIdx]):addInputEvent("Mouse_Out", "_PetInfo_HideActionToolTip( " .. action_idx .. " )")
            uiIdx = uiIdx + 1
          end
        end
        local skillMaxCount = ToClient_getPetEquipSkillMax()
        PetInfo_SkillSlot_Show(true)
        for i = 0, 4 do
          ((self.skillSlot)[i]):SetShow(false)
          ;
          ((self.skillSlot)[i]):SetIgnore(true)
          ;
          ((self.skillSlot)[i]):ChangeTextureInfoName("")
        end
        uiIdx = 0
        if uiIdx > 0 then
          Panel_Window_PetInfoNew:SetSize(Panel_Window_PetInfoNew:GetSizeX(), 410)
          ;
          (self.petInfoBg):SetSize((self.petInfoBg):GetSizeX(), 355)
        else
          Panel_Window_PetInfoNew:SetSize(Panel_Window_PetInfoNew:GetSizeX(), 335)
          ;
          (self.petInfoBg):SetSize((self.petInfoBg):GetSizeX(), 280)
          PetInfo_SkillSlot_Show(false)
        end
        -- DECOMPILER ERROR at PC173: Confused about usage of register: R26 in 'UnsetPending'

        if (self.currentPetLv)[petNum_S32] == nil then
          (self.currentPetLv)[petNum_S32] = petLevel
        end
        if (self.currentPetLv)[petNum_S32] ~= petLevel and (self.currentPetLv)[petNum_S32] ~= nil then
          if petLevel ~= 0 and petLevel ~= 1 and (self.currentPetLv)[petNum_S32] ~= 0 and (self.currentPetLv)[petNum_S32] ~= 1 then
            Proc_ShowMessage_Ack(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_PETINFO_PETLEVELUP_ACK", "patName", patName))
          end
          -- DECOMPILER ERROR at PC204: Confused about usage of register: R26 in 'UnsetPending'

          ;
          (self.currentPetLv)[petNum_S32] = petLevel
        end
        ;
        (self.iconPet):ChangeTextureInfoName(iconPath)
        ;
        (self.petName):SetText(patName .. " (" .. PAGetStringParam1(Defines.StringSheet_GAME, "LUA_SERVANT_TIER", "tier", petTier) .. ")")
        ;
        (self.level_Title):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_LV") .. "." .. petLevel)
        ;
        (self.progress_Hungry):SetProgressRate(petHungryPercent)
        ;
        (self.progress_Lovely):SetProgressRate(petLovelyPercent)
        ;
        (self.icon_Lovely):SetShow(false)
        ;
        (self.bg_Lovely):SetShow(false)
        ;
        (self.progress_Lovely):SetShow(false)
      end
    end
  else
    do
      local petNo = self.PetNo
      local petCount = ToClient_getPetUnsealedList()
      if petCount == 0 then
        return 
      end
      for index = 0, petCount - 1 do
        local PcPetData = ToClient_getPetUnsealedDataByIndex(index)
        if PcPetData == nil then
          return 
        end
        if petNo == PcPetData:getPcPetNo() then
          local petStaticStatus = PcPetData:getPetStaticStatus()
          local patName = PcPetData:getName()
          local petNum_s64 = PcPetData:getPcPetNo()
          local petNum_S32 = Int64toInt32(petNum_s64)
          local petLevel = PcPetData:getLevel()
          local petExp_s64 = PcPetData:getExperience()
          local petExp_s32 = Int64toInt32(petExp_s64)
          local petMaxExp_s64 = PcPetData:getMaxExperience()
          local petMaxExp_s32 = Int64toInt32(petMaxExp_s64)
          local petExpPercent = petExp_s32 / petMaxExp_s32 * 100
          local petLovely = PcPetData:getLovely()
          local petMaxLovely = 100
          local petLovelyPercent = petLovely / petMaxLovely * 100
          local petHungry = PcPetData:getHungry()
          local petMaxHungry = petStaticStatus._maxHungry
          local petHungryPercent = petHungry / petMaxHungry * 100
          local iconPath = PcPetData:getIconPath()
          local petTier = petStaticStatus:getPetTier() + 1
          petSkillType(PcPetData, 0)
          petSkillType(PcPetData, 1)
          local actionMaxCount = ToClient_getPetActionMax()
          local uiIdx = 0
          for action_idx = 0, actionMaxCount - 1 do
            ((self.actionSlot)[action_idx]):SetShow(false)
            local actionStaticStatus = ToClient_getPetActionStaticStatus(action_idx)
            local isLearn = PcPetData:isPetActionLearned(action_idx)
            if isLearn == true then
              ((self.actionSlot)[uiIdx]):SetShow(true)
              ;
              ((self.actionSlot)[uiIdx]):ChangeTextureInfoName("Icon/" .. actionStaticStatus:getIconPath())
              ;
              ((self.actionSlot)[uiIdx]):addInputEvent("Mouse_On", "_PetInfo_ShowActionToolTip( " .. action_idx .. ", " .. uiIdx .. " )")
              ;
              ((self.actionSlot)[uiIdx]):addInputEvent("Mouse_Out", "_PetInfo_HideActionToolTip( " .. action_idx .. " )")
              uiIdx = uiIdx + 1
            end
          end
          local skillMaxCount = ToClient_getPetEquipSkillMax()
          PetInfo_SkillSlot_Show(true)
          for i = 0, 4 do
            ((self.skillSlot)[i]):SetShow(false)
            ;
            ((self.skillSlot)[i]):SetIgnore(true)
            ;
            ((self.skillSlot)[i]):ChangeTextureInfoName("")
          end
          uiIdx = 0
          local baseskillindex = PcPetData:getPetBaseSkillIndex()
          local skillStaticStatus = ToClient_getPetBaseSkillStaticStatus(baseskillindex)
          if skillStaticStatus ~= nil then
            local skillTypeStaticWrapper = skillStaticStatus:getSkillTypeStaticStatusWrapper()
            if skillTypeStaticWrapper ~= nil then
              local skillNo = skillStaticStatus:getSkillNo()
              ;
              ((self.skillSlot)[uiIdx]):SetShow(true)
              ;
              ((self.skillSlot)[uiIdx]):SetIgnore(false)
              ;
              ((self.skillSlot)[uiIdx]):ChangeTextureInfoName("Icon/" .. skillTypeStaticWrapper:getIconPath())
              ;
              ((self.skillSlot)[uiIdx]):addInputEvent("Mouse_On", "PetInfo_BaseSkill_ShowTooltip( " .. baseskillindex .. ", " .. uiIdx .. " )")
              ;
              ((self.skillSlot)[uiIdx]):addInputEvent("Mouse_Out", "PetInfo_BaseSkill_HideTooltip()")
              Panel_SkillTooltip_SetPosition(skillNo, (self.skillSlot)[uiIdx], "PetSkill")
            end
          end
          do
            do
              uiIdx = uiIdx + 1
              for skill_idx = 0, skillMaxCount - 1 do
                local skillStaticStatus = ToClient_getPetEquipSkillStaticStatus(skill_idx)
                local isLearn = PcPetData:isPetEquipSkillLearned(skill_idx)
                if isLearn == true and skillStaticStatus ~= nil then
                  local skillTypeStaticWrapper = skillStaticStatus:getSkillTypeStaticStatusWrapper()
                  do
                    do
                      if skillTypeStaticWrapper ~= nil then
                        local skillNo = skillStaticStatus:getSkillNo()
                        ;
                        ((self.skillSlot)[uiIdx]):SetShow(true)
                        ;
                        ((self.skillSlot)[uiIdx]):SetIgnore(false)
                        ;
                        ((self.skillSlot)[uiIdx]):ChangeTextureInfoName("Icon/" .. skillTypeStaticWrapper:getIconPath())
                        ;
                        ((self.skillSlot)[uiIdx]):addInputEvent("Mouse_On", "PetInfo_ShowSkillToolTip( " .. skill_idx .. ", " .. uiIdx .. " )")
                        ;
                        ((self.skillSlot)[uiIdx]):addInputEvent("Mouse_Out", "PetInfo_HideSkillToolTip()")
                        Panel_SkillTooltip_SetPosition(skillNo, (self.skillSlot)[uiIdx], "PetSkill")
                      end
                      uiIdx = uiIdx + 1
                      -- DECOMPILER ERROR at PC520: LeaveBlock: unexpected jumping out DO_STMT

                      -- DECOMPILER ERROR at PC520: LeaveBlock: unexpected jumping out IF_THEN_STMT

                      -- DECOMPILER ERROR at PC520: LeaveBlock: unexpected jumping out IF_STMT

                    end
                  end
                end
              end
              if uiIdx > 0 then
                Panel_Window_PetInfoNew:SetSize(Panel_Window_PetInfoNew:GetSizeX(), 410)
                ;
                (self.petInfoBg):SetSize((self.petInfoBg):GetSizeX(), 355)
              else
                Panel_Window_PetInfoNew:SetSize(Panel_Window_PetInfoNew:GetSizeX(), 335)
                ;
                (self.petInfoBg):SetSize((self.petInfoBg):GetSizeX(), 280)
                PetInfo_SkillSlot_Show(false)
              end
              -- DECOMPILER ERROR at PC560: Confused about usage of register: R33 in 'UnsetPending'

              if (self.currentPetLv)[petNum_S32] == nil then
                (self.currentPetLv)[petNum_S32] = petLevel
              end
              if (self.currentPetLv)[petNum_S32] ~= petLevel and (self.currentPetLv)[petNum_S32] ~= nil then
                if petLevel ~= 0 and petLevel ~= 1 and (self.currentPetLv)[petNum_S32] ~= 0 and (self.currentPetLv)[petNum_S32] ~= 1 then
                  Proc_ShowMessage_Ack(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_PETINFO_PETLEVELUP_ACK", "patName", patName))
                end
                -- DECOMPILER ERROR at PC591: Confused about usage of register: R33 in 'UnsetPending'

                ;
                (self.currentPetLv)[petNum_S32] = petLevel
              end
              ;
              (self.iconPet):ChangeTextureInfoName(iconPath)
              ;
              (self.petName):SetText(patName .. " (" .. PAGetStringParam1(Defines.StringSheet_GAME, "LUA_SERVANT_TIER", "tier", petTier) .. ")")
              ;
              (self.progress_EXP):SetProgressRate(petExpPercent)
              ;
              (self.level_Title):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_LV") .. "." .. petLevel)
              ;
              (self.level_Value):SetText((string.format)("%.1f", petExpPercent) .. "%")
              ;
              (self.progress_Hungry):SetProgressRate(petHungryPercent)
              ;
              (self.progress_Lovely):SetProgressRate(petLovelyPercent)
              ;
              (self.icon_Lovely):SetShow(false)
              ;
              (self.bg_Lovely):SetShow(false)
              ;
              (self.progress_Lovely):SetShow(false)
              -- DECOMPILER ERROR at PC655: LeaveBlock: unexpected jumping out DO_STMT

              -- DECOMPILER ERROR at PC655: LeaveBlock: unexpected jumping out IF_THEN_STMT

              -- DECOMPILER ERROR at PC655: LeaveBlock: unexpected jumping out IF_STMT

            end
          end
        end
      end
    end
  end
end

PetInfo_SkillSlot_Show = function(isShow)
  -- function num : 0_1 , upvalues : PetInfo
  local self = PetInfo
  ;
  (self.skillBg):SetShow(isShow)
  for v,control in pairs(self.skillSlotBg) do
    control:SetShow(isShow)
  end
  for v,control in pairs(self.skillSlot) do
    control:SetShow(isShow)
  end
end

PetInfo.SetPosition = function(self)
  -- function num : 0_2
  local scrSizeX = getScreenSizeX()
  local scrSizeY = getScreenSizeY()
  local panelSizeX = Panel_Window_PetInfoNew:GetSizeX()
  local panelSizeY = Panel_Window_PetInfoNew:GetSizeY()
  Panel_Window_PetInfoNew:SetPosX(scrSizeX / 2 - panelSizeX / 2)
  Panel_Window_PetInfoNew:SetPosY(scrSizeY / 2 - panelSizeY / 2)
end

_PetInfo_ShowActionToolTip = function(action_idx, uiIdx)
  -- function num : 0_3 , upvalues : PetInfo
  local self = PetInfo
  local actionStaticStatus = ToClient_getPetActionStaticStatus(action_idx)
  if actionStaticStatus == nil then
    return 
  end
  local actionIconPath = actionStaticStatus:getIconPath()
  local actionName = actionStaticStatus:getName()
  local actionDesc = actionStaticStatus:getDescription()
  local uiBase = (self.actionSlot)[uiIdx]
  if actionDesc == "" then
    actionDesc = nil
  end
  TooltipSimple_Show(uiBase, actionName, actionDesc)
end

_PetInfo_HideActionToolTip = function(action_idx)
  -- function num : 0_4
  TooltipSimple_Hide()
end

PetInfo_BaseSkill_ShowTooltip = function(baseskillindex, uiIx)
  -- function num : 0_5 , upvalues : PetInfo
  local skillStaticStatus = ToClient_getPetBaseSkillStaticStatus(baseskillindex)
  local skillTypeStaticWrapper = skillStaticStatus:getSkillTypeStaticStatusWrapper()
  local petSkillNo = skillStaticStatus:getSkillNo()
  local uiBase = (PetInfo.skillSlot)[uiIdx]
  Panel_SkillTooltip_Show(petSkillNo, false, "PetSkill")
end

PetInfo_BaseSkill_HideTooltip = function()
  -- function num : 0_6
  Panel_SkillTooltip_Hide()
end

PetInfo_ShowSkillToolTip = function(skill_idx, uiIdx)
  -- function num : 0_7 , upvalues : PetInfo
  local skillStaticStatus = ToClient_getPetEquipSkillStaticStatus(skill_idx)
  local skillTypeStaticWrapper = skillStaticStatus:getSkillTypeStaticStatusWrapper()
  local petSkillNo = skillStaticStatus:getSkillNo()
  local uiBase = (PetInfo.skillSlot)[uiIdx]
  Panel_SkillTooltip_Show(petSkillNo, false, "PetSkill")
end

PetInfo_HideSkillToolTip = function()
  -- function num : 0_8
  Panel_SkillTooltip_Hide()
end

FGlobal_PetInfoNew_Open = function(petNo, isShow, isSealed)
  -- function num : 0_9 , upvalues : PetInfo, petIcon
  local self = PetInfo
  local petNo_s32 = petNo
  self.PetNo = petNo_s32
  petIcon = isShow
  self:SetPosition()
  self:Update(isSealed)
  Panel_Window_PetInfoNew:SetShow(true)
end

FGlobal_PetInfoNew_Close = function()
  -- function num : 0_10 , upvalues : petIcon
  Panel_Window_PetInfoNew:SetShow(false)
  if petIcon ~= true then
    FGlobal_PetListNew_Open()
    petIcon = false
  end
end

PetInfo_Update = function()
  -- function num : 0_11 , upvalues : PetInfo
  PetInfo:Update()
end

PetInfo.registEventHandler = function(self)
  -- function num : 0_12
  (self.BTN_Close):addInputEvent("Mouse_LUp", "FGlobal_PetInfoNew_Close()")
  registerEvent("FromClient_PetInfoChanged", "PetInfo_Update")
end

PetInfo:registEventHandler()

