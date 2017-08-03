-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\petinfo\panel_window_petlist.luac 

-- params : ...
-- function num : 0
local UI_TM = CppEnums.TextMode
local UI_PUCT = CppEnums.PA_UI_CONTROL_TYPE
local UI_color = Defines.Color
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
local IM = CppEnums.EProcessorInputMode
Panel_Window_PetListNew:SetShow(false)
Panel_Window_PetListNew:setGlassBackground(true)
Panel_Window_PetListNew:ActiveMouseEventEffect(true)
Panel_Window_PetCompose:SetShow(false)
Panel_Window_PetCompose:setGlassBackground(true)
Panel_Window_PetCompose:ActiveMouseEventEffect(true)
Panel_Window_PetListNew:RegisterShowEventFunc(true, "PetNewListShowAni()")
Panel_Window_PetListNew:RegisterShowEventFunc(false, "PetNewListHideAni()")
PetNewListShowAni = function()
  -- function num : 0_0
end

PetNewListHideAni = function()
  -- function num : 0_1
end

local isPlayOpen = ToClient_IsContentsGroupOpen("256")
local marketTest = false
local petSkillPlus = true
local petComposeChange = true
local maxUnsealCount = ToClient_getPetUseMaxCount()
local temporaryPCRoomWrapper = getTemporaryInformationWrapper()
local isPremiumPcRoom = temporaryPCRoomWrapper:isPremiumPcRoom()
if isPremiumPcRoom then
  maxUnsealCount = maxUnsealCount + ToClient_getPetUseMaxCountPcRoom()
end
local petRaceCount = {[1] = "고양�\180", [2] = "�\156", [3] = "�\164", [4] = "펭귄", [5] = "사막여우", [6] = "고슴도치", [7] = "눈사�\140", [8] = "고슴도치", [9] = "오목눈이", [10] = "렛서팬더", [11] = "앵무�\136", [12] = "북극�\176", [13] = "돌맨�\140", [14] = "이벤트할로윈1", [15] = "이벤트할로윈2", [16] = "이벤트할로윈3", [17] = "이벤트할로윈4", [18] = "이벤트할로윈5", [19] = "이벤트할로윈6", [99] = "합성�\169 �\171"}
local isPetFlyPet = {[1] = 3, [2] = 9, [3] = 11, [4] = 15}
local checkUnSealList = {}
local PetList = {BTN_Close = (UI.getChildControl)(Panel_Window_PetListNew, "Button_Win_Close"), BTN_Compose = (UI.getChildControl)(Panel_Window_PetListNew, "Button_Compose"), BTN_AllUnSeal = (UI.getChildControl)(Panel_Window_PetListNew, "Button_AllUnSeal"), BTN_AllSeal = (UI.getChildControl)(Panel_Window_PetListNew, "Button_AllSeal"), BTN_Market = (UI.getChildControl)(Panel_Window_PetListNew, "Button_Market"), list2_PetList = (UI.getChildControl)(Panel_Window_PetListNew, "List2_PetList"), listMaxCount = 5, 
listUIPool = {}
, SealDATACount = 0, UnSealDataCount = 0, 
orderList = {
_follow = {}
, 
_find = {}
, 
_getItem = {}
}
}
;
(PetList.BTN_AllSeal):addInputEvent("Mouse_On", "PetListNew_SimpleTooltip( true )")
;
(PetList.BTN_AllSeal):addInputEvent("Mouse_Out", "PetListNew_SimpleTooltip( false )")
;
(PetList.BTN_AllSeal):setTooltipEventRegistFunc("PetListNew_SimpleTooltip( true )")
;
(PetList.BTN_AllUnSeal):SetShow(not marketTest)
;
(PetList.BTN_Market):SetShow(marketTest)
local _buttonQuestion = (UI.getChildControl)(Panel_Window_PetListNew, "Button_Question")
_buttonQuestion:addInputEvent("Mouse_LUp", "Panel_WebHelper_ShowToggle( \"Pet\" )")
_buttonQuestion:addInputEvent("Mouse_On", "HelpMessageQuestion_Show( \"Pet\", \"true\")")
_buttonQuestion:addInputEvent("Mouse_Out", "HelpMessageQuestion_Show( \"Pet\", \"false\")")
local maxskillTypeCount = 15
local skillTypeString = {[0] = PAGetString(Defines.StringSheet_GAME, "LUA_PETSKILLTYPE_0"), [1] = PAGetString(Defines.StringSheet_GAME, "LUA_PETSKILLTYPE_1"), [2] = PAGetString(Defines.StringSheet_GAME, "LUA_PETSKILLTYPE_2"), [3] = PAGetString(Defines.StringSheet_GAME, "LUA_PETSKILLTYPE_3"), [4] = PAGetString(Defines.StringSheet_GAME, "LUA_PETSKILLTYPE_4"), [5] = PAGetString(Defines.StringSheet_GAME, "LUA_PETSKILLTYPE_5"), [6] = PAGetString(Defines.StringSheet_GAME, "LUA_PETSKILLTYPE_6"), [7] = PAGetString(Defines.StringSheet_GAME, "LUA_PETSKILLTYPE_7"), [8] = PAGetString(Defines.StringSheet_GAME, "LUA_PETSKILLTYPE_8"), [9] = PAGetString(Defines.StringSheet_GAME, "LUA_PETSKILLTYPE_9"), [10] = PAGetString(Defines.StringSheet_GAME, "LUA_PETSKILLTYPE_10"), [11] = PAGetString(Defines.StringSheet_GAME, "LUA_PETSKILLTYPE_11"), [12] = PAGetString(Defines.StringSheet_GAME, "LUA_PETSKILLTYPE_12"), [13] = PAGetString(Defines.StringSheet_GAME, "LUA_PETSKILLTYPE_13"), [14] = PAGetString(Defines.StringSheet_GAME, "LUA_PETSKILLTYPE_14")}
local plusPoint = {[0] = 7, [1] = 5, [2] = 3, [4] = 4}
local skillInfo = {
plusCount = {}
, 
skillTypeCount = {}
}
local petSkillList = {window = (UI.getChildControl)(Panel_Window_PetListNew, "Static_SkillListWindow"), title = (UI.getChildControl)(Panel_Window_PetListNew, "StaticText_SkillListTitle"), baseSkillTitle = (UI.getChildControl)(Panel_Window_PetListNew, "StaticText_BaseSkillListTitle"), baseSkillBg = (UI.getChildControl)(Panel_Window_PetListNew, "Static_BaseSkillListBG"), baseSkillText = (UI.getChildControl)(Panel_Window_PetListNew, "StaticText_BaseSkillList"), subTitle = (UI.getChildControl)(Panel_Window_PetListNew, "StaticText_SkillList_Title"), bg1 = (UI.getChildControl)(Panel_Window_PetListNew, "Static_SkillListBG"), textList = (UI.getChildControl)(Panel_Window_PetListNew, "StaticText_SkillList"), bg2 = (UI.getChildControl)(Panel_Window_PetListNew, "Static_SkillListBG2"), desc = (UI.getChildControl)(Panel_Window_PetListNew, "StaticText_SkillListDesc")}
petSkillList_Show = function()
  -- function num : 0_2 , upvalues : petSkillPlus, petSkillList
  if not petSkillPlus then
    return 
  end
  for key,control in pairs(petSkillList) do
    control:SetShow(true)
  end
end

petSkillList_Close = function()
  -- function num : 0_3 , upvalues : petSkillList
  for key,control in pairs(petSkillList) do
    control:SetShow(false)
  end
end

local baseSkillTypeString = {[1] = PAGetString(Defines.StringSheet_GAME, "LUA_PETLIST_BASESKILLTYPE1"), [2] = PAGetString(Defines.StringSheet_GAME, "LUA_PETLIST_BASESKILLTYPE2"), [3] = PAGetString(Defines.StringSheet_GAME, "LUA_PETLIST_BASESKILLTYPE3"), [4] = PAGetString(Defines.StringSheet_GAME, "LUA_PETLIST_BASESKILLTYPE4"), [5] = PAGetString(Defines.StringSheet_GAME, "LUA_PETLIST_BASESKILLTYPE5"), [6] = PAGetString(Defines.StringSheet_GAME, "LUA_PETLIST_BASESKILLTYPE6"), [7] = PAGetString(Defines.StringSheet_GAME, "LUA_PETLIST_BASESKILLTYPE7"), [8] = PAGetString(Defines.StringSheet_GAME, "LUA_PETLIST_BASESKILLTYPE8"), [9] = PAGetString(Defines.StringSheet_GAME, "LUA_PETLIST_BASESKILLTYPE9"), [10] = PAGetString(Defines.StringSheet_GAME, "LUA_PETLIST_BASESKILLTYPE10"), [11] = PAGetString(Defines.StringSheet_GAME, "LUA_PETLIST_BASESKILLTYPE11"), [12] = PAGetString(Defines.StringSheet_GAME, "LUA_PETLIST_BASESKILLTYPE12")}
local baseSkillTypeUnit = {[1] = "", [2] = "", [3] = "%", [4] = "%", [5] = "%", [6] = "%", [7] = "%", [8] = "%", [9] = "%", [10] = "%", [11] = PAGetString(Defines.StringSheet_GAME, "LUA_PETLIST_BASESKILLTYPEUNIT_SECOND"), [12] = "LT"}
local baseSkillMultiplePoint = {[1] = 10, [2] = 10, [3] = 1, [4] = 1, [5] = 1, [6] = 1, [7] = 1, [8] = 1, [9] = 5, [10] = 1, [11] = 5, [12] = 10}
AmountPetSkill_Attribute = function(count)
  -- function num : 0_4 , upvalues : petSkillList, baseSkillTypeString, baseSkillMultiplePoint, baseSkillTypeUnit, maxskillTypeCount, skillInfo, skillTypeString
  if count == 0 then
    petSkillList_Close()
    return 
  end
  petSkillList_Show()
  local self = petSkillList
  local baseSkillPoint = {}
  for initIndex = 1, #baseSkillTypeString do
    baseSkillPoint[initIndex] = 0
  end
  for index = 0, count - 1 do
    local PcPetData = ToClient_getPetUnsealedDataByIndex(index)
    if PcPetData == nil then
      return 
    end
    local baseSkillIndex = PcPetData:getPetBaseSkillIndex()
    local unsealPetSkillStaticStatus = ToClient_getPetBaseSkillStaticStatus(baseSkillIndex)
    local groupNo = ToClient_getBaseSkillGroupNo(baseSkillIndex)
    local petTier = baseSkillIndex % 5 + 1
    baseSkillPoint[groupNo] = baseSkillPoint[groupNo] + baseSkillMultiplePoint[groupNo] * petTier
    if groupNo == 9 then
      baseSkillPoint[groupNo + 1] = baseSkillPoint[groupNo + 1] + baseSkillMultiplePoint[groupNo + 1] * petTier
    else
      if groupNo == 12 then
        baseSkillPoint[groupNo] = baseSkillPoint[groupNo] + 10
      end
    end
  end
  local baseSkillString = ""
  for groupIndex = 1, #baseSkillTypeString do
    if baseSkillPoint[groupIndex] > 0 then
      if baseSkillString == "" then
        baseSkillString = "- " .. baseSkillTypeString[groupIndex] .. baseSkillPoint[groupIndex] .. baseSkillTypeUnit[groupIndex]
      else
        baseSkillString = baseSkillString .. "\n- " .. baseSkillTypeString[groupIndex] .. baseSkillPoint[groupIndex] .. baseSkillTypeUnit[groupIndex]
      end
    end
  end
  ;
  (self.baseSkillText):SetText(baseSkillString)
  local textSizeY = (self.baseSkillText):GetTextSizeY()
  ;
  (self.baseSkillBg):SetSize((self.baseSkillBg):GetSizeX(), textSizeY + 10)
  ;
  (self.bg2):SetPosY((self.baseSkillBg):GetPosY() + textSizeY + 15)
  ;
  (self.desc):SetPosY((self.bg2):GetPosY() + 15)
  ;
  (self.window):SetSize((self.window):GetSizeX(), (self.bg2):GetPosY() + 60)
  local skillMaxCount = ToClient_getPetEquipSkillMax()
  for index = 0, count - 1 do
    local PcPetData = ToClient_getPetUnsealedDataByIndex(index)
    if PcPetData == nil then
      return 
    end
    for skill_idx = 0, skillMaxCount - 1 do
      local skillStaticStatus = ToClient_getPetEquipSkillStaticStatus(skill_idx)
      local isLearn = PcPetData:isPetEquipSkillLearned(skill_idx)
      if isLearn == true and skillStaticStatus ~= nil then
        local skillTypeStaticWrapper = skillStaticStatus:getSkillTypeStaticStatusWrapper()
        if skillTypeStaticWrapper ~= nil then
          PetSkillTypeCheck1(skill_idx)
        end
      end
    end
  end
  local petSkillGrade = ""
  local petSkillGradeText = ""
  local hasSkill = false
  for skillTypeIndex = 0, maxskillTypeCount - 1 do
    if (skillInfo.plusCount)[skillTypeIndex] > 0 then
      if skillTypeIndex < 12 then
        petSkillGrade = "%"
      else
        petSkillGrade = PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_TEXT_POTENLEVEL")
      end
      if petSkillGradeText == "" then
        petSkillGradeText = skillTypeString[skillTypeIndex] .. (skillInfo.plusCount)[skillTypeIndex] .. petSkillGrade
      else
        petSkillGradeText = petSkillGradeText .. "\n" .. skillTypeString[skillTypeIndex] .. (skillInfo.plusCount)[skillTypeIndex] .. petSkillGrade
      end
      hasSkill = true
    end
  end
  if hasSkill then
    (self.textList):SetText(petSkillGradeText)
    local textSizeY = (self.textList):GetTextSizeY()
    ;
    (self.subTitle):SetPosY((self.baseSkillBg):GetPosY() + (self.baseSkillBg):GetSizeY() + 5)
    ;
    (self.bg1):SetSize((self.bg1):GetSizeX(), textSizeY + 10)
    ;
    (self.bg1):SetPosY((self.subTitle):GetPosY() + 25)
    ;
    (self.textList):SetPosY((self.bg1):GetPosY() + 5)
    ;
    (self.bg2):SetPosY((self.bg1):GetPosY() + textSizeY + 15)
    ;
    (self.desc):SetPosY((self.bg2):GetPosY() + 15)
    ;
    (self.window):SetSize((self.window):GetSizeX(), (self.bg2):GetPosY() + 60)
  else
    do
      ;
      (self.subTitle):SetShow(false)
      ;
      (self.bg1):SetShow(false)
      ;
      (self.textList):SetShow(false)
    end
  end
end

local maxPercentage = ToClient_MaxPetSkillRate() / 10000
local maxGrade = 5
PetSkillTypeCheck1 = function(skillIndex)
  -- function num : 0_5 , upvalues : skillInfo, plusPoint, maxPercentage, maxGrade
  local self = skillInfo
  local skillType = nil
  if skillIndex >= 0 and skillIndex < 3 then
    skillType = 0
    -- DECOMPILER ERROR at PC17: Confused about usage of register: R3 in 'UnsetPending'

    ;
    (self.plusCount)[skillType] = (math.min)((self.plusCount)[skillType] + plusPoint[skillIndex], maxPercentage)
  else
    if skillIndex >= 3 and skillIndex < 6 then
      skillType = 1
      -- DECOMPILER ERROR at PC35: Confused about usage of register: R3 in 'UnsetPending'

      ;
      (self.plusCount)[skillType] = (math.min)((self.plusCount)[skillType] + plusPoint[skillIndex % 3], maxPercentage)
    else
      if skillIndex >= 6 and skillIndex < 9 then
        skillType = 2
        -- DECOMPILER ERROR at PC53: Confused about usage of register: R3 in 'UnsetPending'

        ;
        (self.plusCount)[skillType] = (math.min)((self.plusCount)[skillType] + plusPoint[skillIndex % 3], maxPercentage)
      else
        if skillIndex == 12 then
          skillType = 3
          -- DECOMPILER ERROR at PC68: Confused about usage of register: R3 in 'UnsetPending'

          ;
          (self.plusCount)[skillType] = (math.min)((self.plusCount)[skillType] + plusPoint[0], maxPercentage)
        else
          if skillIndex == 13 then
            skillType = 3
            -- DECOMPILER ERROR at PC83: Confused about usage of register: R3 in 'UnsetPending'

            ;
            (self.plusCount)[skillType] = (math.min)((self.plusCount)[skillType] + plusPoint[4], maxPercentage)
          else
            if skillIndex >= 14 and skillIndex < 17 then
              skillType = 4
              -- DECOMPILER ERROR at PC102: Confused about usage of register: R3 in 'UnsetPending'

              ;
              (self.plusCount)[skillType] = (math.min)((self.plusCount)[skillType] + plusPoint[(skillIndex + 1) % 3], maxPercentage)
            else
              if skillIndex >= 17 and skillIndex < 20 then
                skillType = 5
                -- DECOMPILER ERROR at PC121: Confused about usage of register: R3 in 'UnsetPending'

                ;
                (self.plusCount)[skillType] = (math.min)((self.plusCount)[skillType] + plusPoint[(skillIndex + 1) % 3], maxPercentage)
              else
                if skillIndex >= 20 and skillIndex < 23 then
                  skillType = 6
                  -- DECOMPILER ERROR at PC140: Confused about usage of register: R3 in 'UnsetPending'

                  ;
                  (self.plusCount)[skillType] = (math.min)((self.plusCount)[skillType] + plusPoint[(skillIndex + 1) % 3], maxPercentage)
                else
                  if skillIndex >= 23 and skillIndex < 26 then
                    skillType = 7
                    -- DECOMPILER ERROR at PC159: Confused about usage of register: R3 in 'UnsetPending'

                    ;
                    (self.plusCount)[skillType] = (math.min)((self.plusCount)[skillType] + plusPoint[(skillIndex + 1) % 3], maxPercentage)
                  else
                    if skillIndex >= 26 and skillIndex < 29 then
                      skillType = 8
                      -- DECOMPILER ERROR at PC178: Confused about usage of register: R3 in 'UnsetPending'

                      ;
                      (self.plusCount)[skillType] = (math.min)((self.plusCount)[skillType] + plusPoint[(skillIndex + 1) % 3], maxPercentage)
                    else
                      if skillIndex >= 29 and skillIndex < 32 then
                        skillType = 9
                        -- DECOMPILER ERROR at PC197: Confused about usage of register: R3 in 'UnsetPending'

                        ;
                        (self.plusCount)[skillType] = (math.min)((self.plusCount)[skillType] + plusPoint[(skillIndex + 1) % 3], maxPercentage)
                      else
                        if skillIndex >= 32 and skillIndex < 35 then
                          skillType = 10
                          -- DECOMPILER ERROR at PC216: Confused about usage of register: R3 in 'UnsetPending'

                          ;
                          (self.plusCount)[skillType] = (math.min)((self.plusCount)[skillType] + plusPoint[(skillIndex + 1) % 3], maxPercentage)
                        else
                          if skillIndex >= 35 and skillIndex < 38 then
                            skillType = 11
                            -- DECOMPILER ERROR at PC235: Confused about usage of register: R3 in 'UnsetPending'

                            ;
                            (self.plusCount)[skillType] = (math.min)((self.plusCount)[skillType] + plusPoint[(skillIndex + 1) % 3], maxPercentage)
                          else
                            if skillIndex == 9 then
                              skillType = 12
                              -- DECOMPILER ERROR at PC248: Confused about usage of register: R3 in 'UnsetPending'

                              ;
                              (self.plusCount)[skillType] = (math.min)((self.plusCount)[skillType] + 1, maxGrade)
                            else
                              if skillIndex == 10 then
                                skillType = 13
                                -- DECOMPILER ERROR at PC261: Confused about usage of register: R3 in 'UnsetPending'

                                ;
                                (self.plusCount)[skillType] = (math.min)((self.plusCount)[skillType] + 1, maxGrade)
                              else
                                if skillIndex == 11 then
                                  skillType = 14
                                  -- DECOMPILER ERROR at PC274: Confused about usage of register: R3 in 'UnsetPending'

                                  ;
                                  (self.plusCount)[skillType] = (math.min)((self.plusCount)[skillType] + 1, maxGrade)
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
  end
  -- DECOMPILER ERROR at PC279: Confused about usage of register: R3 in 'UnsetPending'

  ;
  (self.skillTypeCount)[skillType] = (self.skillTypeCount)[skillType] + 1
  return skillType
end

skillTypeCount_Init = function()
  -- function num : 0_6 , upvalues : maxskillTypeCount, skillInfo, petSkillList
  for index = 0, maxskillTypeCount - 1 do
    -- DECOMPILER ERROR at PC7: Confused about usage of register: R4 in 'UnsetPending'

    (skillInfo.plusCount)[index] = 0
    -- DECOMPILER ERROR at PC10: Confused about usage of register: R4 in 'UnsetPending'

    ;
    (skillInfo.skillTypeCount)[index] = 0
  end
  ;
  (petSkillList.desc):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_PETCOMPOSE_SKILLINHERIT_DESC"))
  petSkillList_Close()
end

local composableCheck = false
local petComposeNo = {[0] = nil, [1] = nil}
local composePetTier = 0
local petCompose = {icon_1 = (UI.getChildControl)(Panel_Window_PetCompose, "Static_Icon_1"), icon_2 = (UI.getChildControl)(Panel_Window_PetCompose, "Static_Icon_2"), icon_3 = (UI.getChildControl)(Panel_Window_PetCompose, "Static_Icon_3"), icon_question = (UI.getChildControl)(Panel_Window_PetCompose, "StaticText_QuestionMark"), editName = (UI.getChildControl)(Panel_Window_PetCompose, "Edit_Naming"), desc = (UI.getChildControl)(Panel_Window_PetCompose, "StaticText_Desc"), descBg = (UI.getChildControl)(Panel_Window_PetCompose, "Static_DescBg"), btn_Yes = (UI.getChildControl)(Panel_Window_PetCompose, "Button_Yes"), btn_No = (UI.getChildControl)(Panel_Window_PetCompose, "Button_No"), btn_Question = (UI.getChildControl)(Panel_Window_PetCompose, "Button_Question"), radioBtn_PetSkill_1 = (UI.getChildControl)(Panel_Window_PetCompose, "RadioButton_Skill_1"), radioBtn_PetSkill_2 = (UI.getChildControl)(Panel_Window_PetCompose, "RadioButton_Skill_2"), radioBtn_PetSkill_3 = (UI.getChildControl)(Panel_Window_PetCompose, "RadioButton_Skill_3"), radioBtn_PetLook_1 = (UI.getChildControl)(Panel_Window_PetCompose, "RadioButton_Look_1"), radioBtn_PetLook_2 = (UI.getChildControl)(Panel_Window_PetCompose, "RadioButton_Look_2"), radioBtn_PetLook_3 = (UI.getChildControl)(Panel_Window_PetCompose, "RadioButton_Look_3"), 
skillSlotBg = {
[1] = {[1] = (UI.getChildControl)(Panel_Window_PetCompose, "Static_SkillSlotBg_1_1"), [2] = (UI.getChildControl)(Panel_Window_PetCompose, "Static_SkillSlotBg_1_2"), [3] = (UI.getChildControl)(Panel_Window_PetCompose, "Static_SkillSlotBg_1_3")}
, 
[2] = {[1] = (UI.getChildControl)(Panel_Window_PetCompose, "Static_SkillSlotBg_2_1"), [2] = (UI.getChildControl)(Panel_Window_PetCompose, "Static_SkillSlotBg_2_2"), [3] = (UI.getChildControl)(Panel_Window_PetCompose, "Static_SkillSlotBg_2_3")}
, 
[3] = {[1] = (UI.getChildControl)(Panel_Window_PetCompose, "Static_SkillSlotBg_3_1"), [2] = (UI.getChildControl)(Panel_Window_PetCompose, "Static_SkillSlotBg_3_2"), [3] = (UI.getChildControl)(Panel_Window_PetCompose, "Static_SkillSlotBg_3_3")}
}
, 
skillSlot = {
[1] = {[1] = (UI.getChildControl)(Panel_Window_PetCompose, "Static_SkillPetSlot_1_1"), [2] = (UI.getChildControl)(Panel_Window_PetCompose, "Static_SkillPetSlot_1_2"), [3] = (UI.getChildControl)(Panel_Window_PetCompose, "Static_SkillPetSlot_1_3")}
, 
[2] = {[1] = (UI.getChildControl)(Panel_Window_PetCompose, "Static_SkillPetSlot_2_1"), [2] = (UI.getChildControl)(Panel_Window_PetCompose, "Static_SkillPetSlot_2_2"), [3] = (UI.getChildControl)(Panel_Window_PetCompose, "Static_SkillPetSlot_2_3")}
, 
[3] = {[1] = (UI.getChildControl)(Panel_Window_PetCompose, "Static_SkillPetSlot_3_1"), [2] = (UI.getChildControl)(Panel_Window_PetCompose, "Static_SkillPetSlot_3_2"), [3] = (UI.getChildControl)(Panel_Window_PetCompose, "Static_SkillPetSlot_3_3")}
}
, 
skillNoList = {nil, nil, nil, nil, nil; [0] = nil}
, preserveSkillNo = nil, 
petComposeNo = {nil; [1] = nil}
, race = nil}
;
(petCompose.radioBtn_PetSkill_1):addInputEvent("Mouse_LUp", "PetCompose_UpdatePetSkillList()")
;
(petCompose.radioBtn_PetSkill_2):addInputEvent("Mouse_LUp", "PetCompose_UpdatePetSkillList()")
;
(petCompose.radioBtn_PetSkill_3):addInputEvent("Mouse_LUp", "PetCompose_UpdatePetSkillList()")
;
(petCompose.radioBtn_PetLook_1):addInputEvent("Mouse_LUp", "PetCompose_UpdatePetSkillList()")
;
(petCompose.radioBtn_PetLook_2):addInputEvent("Mouse_LUp", "PetCompose_UpdatePetSkillList()")
;
(petCompose.radioBtn_PetLook_3):addInputEvent("Mouse_LUp", "PetCompose_UpdatePetSkillList()")
;
(petCompose.btn_Question):addInputEvent("Mouse_LUp", "Panel_WebHelper_ShowToggle( \"Pet\" )")
;
(petCompose.btn_Question):addInputEvent("Mouse_On", "HelpMessageQuestion_Show( \"Pet\", \"true\")")
;
(petCompose.btn_Question):addInputEvent("Mouse_Out", "HelpMessageQuestion_Show( \"Pet\", \"false\")")
;
(petCompose.btn_Yes):addInputEvent("Mouse_LUp", "Confirm_PetCompose()")
;
(petCompose.btn_No):addInputEvent("Mouse_LUp", "Panel_Window_PetCompose_Close()")
;
(petCompose.editName):addInputEvent("Mouse_LUp", "HandleClicked_PetCompose_ClearEdit()")
local petComposeString = PAGetString(Defines.StringSheet_GAME, "PANEL_PETLIST_PETCOMPOSE_NAME")
local petComposeDesc = PAGetString(Defines.StringSheet_GAME, "PANEL_PETLIST_PETCOMPOSE_DESC")
;
(petCompose.desc):SetTextMode((CppEnums.TextMode).eTextMode_AutoWrap)
if petCompose.desc ~= nil then
  (petCompose.desc):SetText(petComposeDesc)
end
local panelSizeY = Panel_Window_PetCompose:GetSizeY()
local descBgSizeY = (petCompose.descBg):GetSizeY()
if (petCompose.desc):GetTextSizeY() > 120 then
  Panel_Window_PetCompose:SetSize(Panel_Window_PetCompose:GetSizeX(), panelSizeY + (petCompose.desc):GetTextSizeY() - 119)
  ;
  (petCompose.descBg):SetSize((petCompose.descBg):GetSizeX(), descBgSizeY + (petCompose.desc):GetTextSizeY() - 119)
end
;
(petCompose.btn_Yes):ComputePos()
;
(petCompose.btn_No):ComputePos()
PetList.Initialize = function(self)
  -- function num : 0_7 , upvalues : PetList
  local btnComposeSizeX = (PetList.BTN_Compose):GetSizeX() + 23
  local btnComposeTextPosX = btnComposeSizeX - btnComposeSizeX / 2 - (PetList.BTN_Compose):GetTextSizeX() / 2
  local btnAllUnSealSizeX = (PetList.BTN_AllUnSeal):GetSizeX() + 23
  local btnAllUnSealTextPosX = btnAllUnSealSizeX - btnAllUnSealSizeX / 2 - (PetList.BTN_AllUnSeal):GetTextSizeX() / 2
  local btnAllSealSizeX = (PetList.BTN_AllSeal):GetSizeX() + 23
  local btnAllSealTextPosX = btnAllSealSizeX - btnAllSealSizeX / 2 - (PetList.BTN_AllSeal):GetTextSizeX() / 2
  ;
  (PetList.BTN_Compose):SetTextSpan(btnComposeTextPosX, 5)
  ;
  (PetList.BTN_AllUnSeal):SetTextSpan(btnAllUnSealTextPosX, 5)
  ;
  (PetList.BTN_AllSeal):SetTextSpan(btnAllSealTextPosX, 5)
  ;
  (PetList.BTN_Compose):SetShow(true)
  ;
  (PetList.BTN_Compose):SetSpanSize(-120, 7)
  ;
  (PetList.BTN_AllUnSeal):SetSpanSize(0, 7)
  ;
  (PetList.BTN_AllSeal):SetSpanSize(120, 7)
end

PetList.SetPosition = function(self)
  -- function num : 0_8
  local scrSizeX = getScreenSizeX()
  local scrSizeY = getScreenSizeY()
  local panelSizeX = Panel_Window_PetListNew:GetSizeX()
  local panelSizeY = Panel_Window_PetListNew:GetSizeY()
  Panel_Window_PetListNew:SetPosX(scrSizeX / 2 - panelSizeX - 50)
  Panel_Window_PetListNew:SetPosY(scrSizeY / 2 - panelSizeY / 2 - 100)
end

PetList.Open = function(self)
  -- function num : 0_9 , upvalues : petComposeNo
  self:SetPosition()
  PetCompose_Init()
  Panel_Window_PetListNew:SetShow(true, true)
  -- DECOMPILER ERROR at PC10: Confused about usage of register: R1 in 'UnsetPending'

  petComposeNo[0] = nil
  -- DECOMPILER ERROR at PC12: Confused about usage of register: R1 in 'UnsetPending'

  petComposeNo[1] = nil
  if Panel_Window_PetCompose:GetShow() then
    Panel_Window_PetCompose_Close()
  end
  self:SetPetList()
end

PetList.SetPetList = function(self, noclearscroll)
  -- function num : 0_10
  if not Panel_Window_PetListNew:GetShow() then
    return 
  end
  local toIndex = 0
  local scrollvalue = 0
  local vscroll = (self.list2_PetList):GetVScroll()
  local hscroll = (self.list2_PetList):GetHScroll()
  if noclearscroll then
    toIndex = (self.list2_PetList):getCurrenttoIndex()
    if (self.list2_PetList):IsIgnoreVerticalScroll() == false then
      scrollvalue = vscroll:GetControlPos()
    else
      if (self.list2_PetList):IsIgnoreHorizontalScroll() == false then
        scrollvalue = hscroll:GetControlPos()
      end
    end
    if toIndex == (self.list2_PetList):getEndIndex() and self.UnSealDATACount == 0 and self.UnSealDATACount + self.SealDATACount > 4 then
      toIndex = toIndex - 1
    end
  end
  ;
  ((self.list2_PetList):getElementManager()):clearKey()
  self.UnSealDATACount = ToClient_getPetUnsealedList()
  self.SealDATACount = ToClient_getPetSealedList()
  skillTypeCount_Init()
  if not CheckCompose() then
    AmountPetSkill_Attribute(self.UnSealDATACount)
  end
  local petCount = self.UnSealDATACount + self.SealDATACount
  for index = 0, petCount do
    local petNo = nil
    if index == 0 and self.UnSealDATACount == 0 then
      petNo = toInt64(0, -1)
    else
      if index < self.UnSealDATACount then
        local petData = ToClient_getPetUnsealedDataByIndex(index)
        if petData ~= nil then
          petNo = petData:getPcPetNo()
        end
      else
        do
          index = index - self.UnSealDATACount
          if self.UnSealDATACount == 0 then
            index = index - 1
          end
          do
            do
              local petData = ToClient_getPetSealedDataByIndex(index)
              if petData ~= nil then
                petNo = petData._petNo
              end
              if petNo ~= nil then
                ((self.list2_PetList):getElementManager()):pushKey(petNo)
              end
              -- DECOMPILER ERROR at PC122: LeaveBlock: unexpected jumping out DO_STMT

              -- DECOMPILER ERROR at PC122: LeaveBlock: unexpected jumping out DO_STMT

              -- DECOMPILER ERROR at PC122: LeaveBlock: unexpected jumping out IF_ELSE_STMT

              -- DECOMPILER ERROR at PC122: LeaveBlock: unexpected jumping out IF_STMT

              -- DECOMPILER ERROR at PC122: LeaveBlock: unexpected jumping out IF_ELSE_STMT

              -- DECOMPILER ERROR at PC122: LeaveBlock: unexpected jumping out IF_STMT

            end
          end
        end
      end
    end
  end
  if noclearscroll then
    (self.list2_PetList):setCurrenttoIndex(toIndex)
    if (self.list2_PetList):IsIgnoreVerticalScroll() == false then
      vscroll:SetControlPos(scrollvalue)
    else
      if (self.list2_PetList):IsIgnoreHorizontalScroll() == false then
        hscroll:SetControlPos(scrollvalue)
      end
    end
  end
end

PetList.Close = function(self)
  -- function num : 0_11
  Panel_Window_PetListNew:SetShow(false, false)
end

petListNew_ShowInfo = function(petNoStr)
  -- function num : 0_12
  audioPostEvent_SystemUi(1, 40)
  FGlobal_PetInfoNew_Open(tonumber64(petNoStr))
end

sealPetListNew_ShowInfo = function(petNoStr)
  -- function num : 0_13
  audioPostEvent_SystemUi(1, 40)
  FGlobal_PetInfoNew_Open((tonumber64(petNoStr)), nil, true)
end

petListNew_Seal = function(petNoStr, index)
  -- function num : 0_14 , upvalues : PetList
  audioPostEvent_SystemUi(1, 40)
  local self = PetList
  local petNo_s64 = tonumber64(petNoStr)
  FGlobal_PetControl_SealPet(index)
  ToClient_requestPetSeal(petNo_s64)
  FGlobal_AllSealButtonPosition(self.UnSealDATACount, false)
end

FGlobal_petListNew_Seal = function(petNo, index)
  -- function num : 0_15
  petListNew_Seal(petNo, index)
end

petListNew_UnSeal = function(petNoStr)
  -- function num : 0_16 , upvalues : PetList, maxUnsealCount
  audioPostEvent_SystemUi(1, 40)
  local self = PetList
  local petNo_s64 = tonumber64(petNoStr)
  if maxUnsealCount <= self.UnSealDATACount then
    Proc_ShowMessage_Ack_WithOut_ChattingMessage(PAGetString(Defines.StringSheet_GAME, "LUA_UNABLE_SUMMON_PET"))
    return 
  end
  PetList_OrderList_Init(petNoStr)
  ToClient_requestPetUnseal(petNo_s64)
  FGlobal_PetContorl_HungryGaugeUpdate(petNo_s64)
  FGlobal_AllSealButtonPosition(self.UnSealDATACount, true)
end

petListNew_UnRegister = function(petNoStr)
  -- function num : 0_17 , upvalues : PetList
  audioPostEvent_SystemUi(1, 40)
  local self = PetList
  local petNo_s64 = tonumber64(petNoStr)
  ToClient_requestPetUnregister(petNo_s64)
end

PetListNew_Compose = function()
  -- function num : 0_18 , upvalues : composableCheck, PetList
  PetCompose_Open()
  composableCheck = true
  PetListNew_IgnoreAllSealButton(true)
  PetList:SetPetList()
end

local composePetNo = function(petNo)
  -- function num : 0_19
  for sealPetIndex = 0, ToClient_getPetSealedList() - 1 do
    local petData = ToClient_getPetSealedDataByIndex(sealPetIndex)
    local _petNo = petData._petNo
    if petNo == _petNo then
      local petSS = petData:getPetStaticStatus()
      local petTier = petSS:getPetTier() + 1
      return petTier
    end
  end
end

petListNew_Compose_Set = function(petNoStr, petRace, sealPetIndex)
  -- function num : 0_20 , upvalues : petComposeNo, petCompose, composePetTier, composePetNo, PetList
  -- DECOMPILER ERROR at PC8: Confused about usage of register: R3 in 'UnsetPending'

  if petComposeNo[0] == nil then
    petComposeNo[0] = tonumber64(petNoStr)
    petImgChange(petComposeNo[0], 0)
    -- DECOMPILER ERROR at PC15: Confused about usage of register: R3 in 'UnsetPending'

    petCompose._race = petRace
    PetCompose_UpdatePetSkillList()
    composePetTier = composePetNo(petComposeNo[0])
    PetCompose_SkillSet(sealPetIndex, 1)
  else
    -- DECOMPILER ERROR at PC36: Confused about usage of register: R3 in 'UnsetPending'

    if petComposeNo[1] == nil then
      petComposeNo[1] = tonumber64(petNoStr)
      petImgChange(petComposeNo[1], 1)
      PetCompose_UpdatePetSkillList()
      PetCompose_SkillSet(sealPetIndex, 2)
    end
  end
  PetList:SetPetList()
end

local petSkillCheck = nil
PetCompose_SkillSet = function(petIndex, uiIndex)
  -- function num : 0_21 , upvalues : petCompose, petSkillCheck
  local self = petCompose
  local petData = ToClient_getPetSealedDataByIndex(petIndex)
  if petData == nil then
    return 
  end
  local skillMaxCount = ToClient_getPetEquipSkillMax()
  -- DECOMPILER ERROR at PC11: Confused about usage of register: R5 in 'UnsetPending'

  ;
  (petCompose.skillNoList)[0] = nil
  skillLearnCount = 0
  petSkillCheck = {}
  for skill_idx = 0, skillMaxCount - 1 do
    local skillStaticStatus = ToClient_getPetEquipSkillStaticStatus(skill_idx)
    local isLearn = petData:isPetEquipSkillLearned(skill_idx)
    if isLearn == true and skillStaticStatus ~= nil and petSkillCheck[skill_idx] ~= true then
      skillLearnCount = skillLearnCount + 1
      -- DECOMPILER ERROR at PC38: Confused about usage of register: R11 in 'UnsetPending'

      petSkillCheck[skill_idx] = true
      local skillTypeStaticWrapper = skillStaticStatus:getSkillTypeStaticStatusWrapper()
      if skillTypeStaticWrapper ~= nil and skillLearnCount <= #petCompose.skillSlot then
        local skillNo = skillStaticStatus:getSkillNo()
        -- DECOMPILER ERROR at PC54: Confused about usage of register: R13 in 'UnsetPending'

        ;
        (petCompose.skillNoList)[skillLearnCount] = skill_idx
        ;
        (((petCompose.skillSlot)[uiIndex])[skillLearnCount]):SetShow(true)
        ;
        (((petCompose.skillSlot)[uiIndex])[skillLearnCount]):SetIgnore(false)
        ;
        (((petCompose.skillSlot)[uiIndex])[skillLearnCount]):ChangeTextureInfoName("Icon/" .. skillTypeStaticWrapper:getIconPath())
        ;
        (((petCompose.skillSlot)[uiIndex])[skillLearnCount]):addInputEvent("Mouse_On", "PetCompose_ShowSkillToolTip( " .. skill_idx .. ", " .. skillLearnCount .. " )")
        ;
        (((petCompose.skillSlot)[uiIndex])[skillLearnCount]):addInputEvent("Mouse_Out", "PetCompose_HideSkillToolTip()")
        Panel_SkillTooltip_SetPosition(skillNo, ((petCompose.skillSlot)[uiIndex])[skillLearnCount], "PetSkill")
      end
    end
  end
  if uiIndex == 2 and (petData:getPetStaticStatus()):getPetRace() == 99 then
    (petCompose.radioBtn_PetLook_2):SetShow(false)
    ;
    (petCompose.radioBtn_PetSkill_2):SetShow(false)
  else
    ;
    (petCompose.radioBtn_PetLook_2):SetShow(true)
    ;
    (petCompose.radioBtn_PetSkill_2):SetShow(true)
  end
end

petListNew_AllSealCheck = function(petNo_s32)
  -- function num : 0_22 , upvalues : checkUnSealList
  -- DECOMPILER ERROR at PC9: Confused about usage of register: R1 in 'UnsetPending'

  if checkUnSealList[petNo_s32] == nil or checkUnSealList[petNo_s32] == false then
    checkUnSealList[petNo_s32] = true
  else
    -- DECOMPILER ERROR at PC12: Confused about usage of register: R1 in 'UnsetPending'

    checkUnSealList[petNo_s32] = false
  end
  petListNew_Save()
end

petListNew_Save = function()
  -- function num : 0_23 , upvalues : maxUnsealCount, checkUnSealList
  local sealPetCount = ToClient_getPetSealedList()
  local maxCount = (math.min)(9, maxUnsealCount)
  local idx = 0
  for petIndex = 0, sealPetCount - 1 do
    local petData = ToClient_getPetSealedDataByIndex(petIndex)
    local petNo_s32 = Int64toInt32(petData._petNo)
    if checkUnSealList[petNo_s32] then
      (ToClient_getGameUIManagerWrapper()):setLuaCacheDataListNumber((CppEnums.GlobalUIOptionType)["PetAllSeal" .. tostring(idx)], petNo_s32)
      idx = idx + 1
      if idx >= 9 then
        return 
      end
    end
  end
  for index = idx, maxCount do
    (ToClient_getGameUIManagerWrapper()):setLuaCacheDataListNumber((CppEnums.GlobalUIOptionType)["PetAllSeal" .. index], 0)
  end
end

petListNew_Load = function()
  -- function num : 0_24 , upvalues : checkUnSealList
  checkUnSealList = {}
  local maxCount = 9
  for idx = 0, maxCount do
    local petNo_s32 = (ToClient_getGameUIManagerWrapper()):getLuaCacheDataListNumber((CppEnums.GlobalUIOptionType)["PetAllSeal" .. idx])
    -- DECOMPILER ERROR at PC20: Confused about usage of register: R6 in 'UnsetPending'

    if petNo_s32 ~= 0 then
      checkUnSealList[petNo_s32] = true
    end
  end
end

petListNew_CehckThis = function(petNo)
  -- function num : 0_25
  local checkValue = false
  for sealPetIndex = 0, ToClient_getPetSealedList() - 1 do
    local petData = ToClient_getPetSealedDataByIndex(sealPetIndex)
    local _petNo = petData._petNo
    if petNo == _petNo then
      checkValue = true
    else
      checkValue = false
    end
  end
  return checkValue
end

petImgChange = function(petNo, index)
  -- function num : 0_26 , upvalues : petCompose
  for sealPetIndex = 0, ToClient_getPetSealedList() - 1 do
    local petData = ToClient_getPetSealedDataByIndex(sealPetIndex)
    local _petNo = petData._petNo
    if petNo == _petNo then
      local petSS = petData:getPetStaticStatus()
      local iconPath = petData:getIconPath()
      if index == 0 then
        (petCompose.icon_1):ChangeTextureInfoName(iconPath)
        ;
        (petCompose.icon_1):SetShow(true)
      else
        if index == 1 then
          (petCompose.icon_2):ChangeTextureInfoName(iconPath)
          ;
          (petCompose.icon_2):SetShow(true)
        end
      end
    end
  end
end

HandleClicked_PetCompose_ClearEdit = function()
  -- function num : 0_27 , upvalues : IM, petCompose
  (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_ChattingInputMode)
  ;
  (petCompose.editName):SetMaxInput(getGameServiceTypePetNameLength())
  SetFocusEdit(petCompose.editName)
  ;
  (petCompose.editName):SetEditText("", true)
end

Confirm_PetCompose = function()
  -- function num : 0_28 , upvalues : petCompose, IM, petComposeString, petComposeNo, PetList
  ClearFocusEdit(petCompose.editName)
  ;
  (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_UiMode)
  local petName = (petCompose.editName):GetEditText()
  if petName == "" or petComposeString == petName then
    Proc_ShowMessage_Ack(petComposeString)
    return 
  end
  if petComposeNo[1] ~= nil then
    local confirm_compose = function()
    -- function num : 0_28_0 , upvalues : petCompose, petComposeNo, petName, PetList
    -- DECOMPILER ERROR at PC7: Confused about usage of register: R0 in 'UnsetPending'

    if petCompose.preserveSkillNo == nil then
      petCompose.preserveSkillNo = ToClient_getPetEquipSkillMax()
    end
    local isInherit = 0
    local isLookChange = 0
    local petNo_1 = petComposeNo[0]
    local petNo_2 = petComposeNo[1]
    if (petCompose.radioBtn_PetSkill_1):IsCheck() then
      isInherit = 2
    else
      if (petCompose.radioBtn_PetSkill_2):IsCheck() then
        isInherit = 1
      end
    end
    if (petCompose.radioBtn_PetLook_1):IsCheck() then
      isLookChange = 2
    else
      if (petCompose.radioBtn_PetLook_2):IsCheck() then
        isLookChange = 1
      end
    end
    ToClient_requestPetFusion(petName, petNo_1, petNo_2, isInherit, isLookChange)
    -- DECOMPILER ERROR at PC52: Confused about usage of register: R4 in 'UnsetPending'

    PetList.startIndex = 0
    Panel_Window_PetCompose_Close()
  end

    local messageBoxMemo = PAGetString(Defines.StringSheet_GAME, "PANEL_PETLIST_PETCOMPOSE_MSGCONTENT")
    local messageBoxData = {title = PAGetString(Defines.StringSheet_GAME, "PANEL_SERVANTMIX_TITLE"), content = messageBoxMemo, functionYes = confirm_compose, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
    ;
    (MessageBox.showMessageBox)(messageBoxData)
  else
    do
      Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "PANEL_PETLIST_PETCOMPOSE_REGIST"))
      do return  end
    end
  end
end

Panel_Window_PetCompose_Close = function()
  -- function num : 0_29 , upvalues : IM, PetList
  PetCompose_Init()
  ;
  (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_UiMode)
  Panel_Window_PetCompose:SetShow(false)
  PetListNew_IgnoreAllSealButton(false)
  PetList:SetPetList()
end

PetCompose_Init = function()
  -- function num : 0_30 , upvalues : petComposeNo, petCompose, composableCheck
  -- DECOMPILER ERROR at PC1: Confused about usage of register: R0 in 'UnsetPending'

  petComposeNo[0] = nil
  -- DECOMPILER ERROR at PC3: Confused about usage of register: R0 in 'UnsetPending'

  petComposeNo[1] = nil
  -- DECOMPILER ERROR at PC5: Confused about usage of register: R0 in 'UnsetPending'

  petCompose._race = nil
  ;
  (petCompose.icon_1):ChangeTextureInfoName("")
  ;
  (petCompose.icon_2):ChangeTextureInfoName("")
  ;
  (petCompose.icon_3):ChangeTextureInfoName("")
  ;
  (petCompose.icon_1):SetShow(false)
  ;
  (petCompose.icon_2):SetShow(false)
  ;
  (petCompose.icon_3):SetShow(false)
  composableCheck = false
  -- DECOMPILER ERROR at PC39: Confused about usage of register: R0 in 'UnsetPending'

  petCompose.preserveSkillNo = nil
  ClearFocusEdit(petCompose.editName)
  ;
  (petCompose.radioBtn_PetSkill_1):SetCheck(false)
  ;
  (petCompose.radioBtn_PetSkill_2):SetCheck(false)
  ;
  (petCompose.radioBtn_PetSkill_3):SetCheck(true)
  ;
  (petCompose.radioBtn_PetLook_1):SetCheck(false)
  ;
  (petCompose.radioBtn_PetLook_2):SetCheck(false)
  ;
  (petCompose.radioBtn_PetLook_3):SetCheck(true)
  ;
  (petCompose.radioBtn_PetLook_2):SetShow(true)
  ;
  (petCompose.radioBtn_PetSkill_2):SetShow(true)
  for index = 1, 3 do
    (((petCompose.skillSlotBg)[index])[1]):SetShow(true)
    ;
    (((petCompose.skillSlotBg)[index])[2]):SetShow(true)
    ;
    (((petCompose.skillSlotBg)[index])[3]):SetShow(true)
    ;
    (((petCompose.skillSlot)[index])[1]):SetShow(false)
    ;
    (((petCompose.skillSlot)[index])[2]):SetShow(false)
    ;
    (((petCompose.skillSlot)[index])[3]):SetShow(false)
  end
  PetCompose_UpdatePetSkillList()
end

CheckCompose = function()
  -- function num : 0_31 , upvalues : composableCheck
  return composableCheck
end

local petSkillCheck = nil
PetCompose_UpdatePetSkillList = function()
  -- function num : 0_32 , upvalues : petComposeNo, petCompose, petSkillCheck
  local petNo0 = petComposeNo[0]
  local petNo1 = petComposeNo[1]
  PetComposeSkill_Init()
  -- DECOMPILER ERROR at PC8: Confused about usage of register: R2 in 'UnsetPending'

  ;
  (petCompose.skillNoList)[0] = nil
  petSkillCheck = {}
  local havePetSkillCheck = function(petNo)
    -- function num : 0_32_0 , upvalues : petSkillCheck, petCompose
    if petNo ~= nil then
      local skillLearnCount = 0
      local skillMaxCount = ToClient_getPetEquipSkillMax()
      for sealPetIndex = 0, ToClient_getPetSealedList() - 1 do
        local petData = ToClient_getPetSealedDataByIndex(sealPetIndex)
        local _petNo = petData._petNo
        if _petNo ~= nil and petNo == _petNo then
          for skill_idx = 0, skillMaxCount - 1 do
            local skillStaticStatus = ToClient_getPetEquipSkillStaticStatus(skill_idx)
            local isLearn = petData:isPetEquipSkillLearned(skill_idx)
            if isLearn == true and skillStaticStatus ~= nil and petSkillCheck[skill_idx] ~= true then
              skillLearnCount = skillLearnCount + 1
              -- DECOMPILER ERROR at PC39: Confused about usage of register: R15 in 'UnsetPending'

              petSkillCheck[skill_idx] = true
              local skillTypeStaticWrapper = skillStaticStatus:getSkillTypeStaticStatusWrapper()
              if skillTypeStaticWrapper ~= nil and skillLearnCount <= #petCompose.skillSlot then
                local skillNo = skillStaticStatus:getSkillNo()
                -- DECOMPILER ERROR at PC53: Confused about usage of register: R17 in 'UnsetPending'

                ;
                (petCompose.skillNoList)[skillLearnCount] = skill_idx
                ;
                (((petCompose.skillSlot)[3])[skillLearnCount]):SetShow(true)
                ;
                (((petCompose.skillSlot)[3])[skillLearnCount]):SetIgnore(false)
                ;
                (((petCompose.skillSlot)[3])[skillLearnCount]):ChangeTextureInfoName("Icon/" .. skillTypeStaticWrapper:getIconPath())
                ;
                (((petCompose.skillSlot)[3])[skillLearnCount]):addInputEvent("Mouse_On", "PetCompose_ShowSkillToolTip( " .. skill_idx .. ", " .. skillLearnCount .. " )")
                ;
                (((petCompose.skillSlot)[3])[skillLearnCount]):addInputEvent("Mouse_Out", "PetCompose_HideSkillToolTip()")
                Panel_SkillTooltip_SetPosition(skillNo, ((petCompose.skillSlot)[3])[skillLearnCount], "PetSkill")
              end
            end
          end
        end
      end
    end
  end

  if (petCompose.radioBtn_PetSkill_1):IsCheck() and petNo0 ~= nil then
    havePetSkillCheck(petNo0)
  else
    if (petCompose.radioBtn_PetSkill_2):IsCheck() and petNo1 ~= nil then
      havePetSkillCheck(petNo1)
    end
  end
  local petIconChange = function(petNo)
    -- function num : 0_32_1 , upvalues : petCompose
    for sealPetIndex = 0, ToClient_getPetSealedList() - 1 do
      local petData = ToClient_getPetSealedDataByIndex(sealPetIndex)
      local _petNo = petData._petNo
      if _petNo == petNo then
        local iconPath = petData:getIconPath()
        ;
        (petCompose.icon_3):ChangeTextureInfoName(iconPath)
        ;
        (petCompose.icon_3):SetShow(true)
      end
    end
  end

  ;
  (petCompose.icon_question):SetShow(false)
  if (petCompose.radioBtn_PetLook_1):IsCheck() and petNo0 ~= nil then
    petIconChange(petNo0)
  else
    if (petCompose.radioBtn_PetLook_2):IsCheck() and petNo1 ~= nil then
      petIconChange(petNo1)
    else
      ;
      (petCompose.icon_3):SetShow(false)
      ;
      (petCompose.icon_question):SetShow(true)
    end
  end
end

PetComposeSkill_Init = function()
  -- function num : 0_33 , upvalues : petCompose
  for ii,aSkillSlot in pairs((petCompose.skillSlot)[3]) do
    aSkillSlot:SetShow(false)
    aSkillSlot:addInputEvent("Mouse_On", "")
    aSkillSlot:addInputEvent("Mouse_Out", "")
  end
end

PetCompose_ShowSkillToolTip = function(skill_idx, uiIdx)
  -- function num : 0_34 , upvalues : petCompose
  local skillStaticStatus = ToClient_getPetEquipSkillStaticStatus(skill_idx)
  local skillTypeStaticWrapper = skillStaticStatus:getSkillTypeStaticStatusWrapper()
  local petSkillNo = skillStaticStatus:getSkillNo()
  local uiBase = (petCompose.skillSlot)[uiIdx]
  Panel_SkillTooltip_Show(petSkillNo, false, "PetSkill")
end

PetCompose_HideSkillToolTip = function()
  -- function num : 0_35
  Panel_SkillTooltip_Hide()
end

PetListNew_SimpleTooltip = function(isShow)
  -- function num : 0_36 , upvalues : maxUnsealCount, PetList
  local name, desc, control = nil, nil, nil
  name = PAGetString(Defines.StringSheet_RESOURCE, "PANEL_WINDOW_PETLISTNEW_ALLSEAL")
  desc = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_PETLIST_ALLSEAL_MAX4_DESC", "count", maxUnsealCount)
  control = PetList.BTN_AllSeal
  registTooltipControl(control, Panel_Tooltip_SimpleText)
  if isShow == true then
    TooltipSimple_Show(control, name, desc)
  else
    TooltipSimple_Hide()
  end
end

PetListNew_NameSimpleTooltip = function(isShow, index, isSealed)
  -- function num : 0_37 , upvalues : PetList
  if not isShow then
    TooltipSimple_Hide()
    return 
  end
  local name, desc, control, pcPetData, key = nil, nil, nil, nil, nil
  if isSealed then
    pcPetData = ToClient_getPetUnsealedDataByIndex(index)
    key = pcPetData:getPcPetNo()
  else
    pcPetData = ToClient_getPetSealedDataByIndex(index)
    key = pcPetData._petNo
  end
  local petName = pcPetData:getName()
  local contents = (PetList.list2_PetList):GetContentByKey(key)
  local nameControl = (UI.getChildControl)(contents, "Template_StaticText_PetName")
  name = petName
  control = nameControl
  TooltipSimple_Show(control, name, desc)
end

FGlobal_CheckEditBox_PetCompose = function(uiEditBox)
  -- function num : 0_38 , upvalues : petCompose
  do return uiEditBox ~= nil and petCompose.editName ~= nil and uiEditBox:GetKey() == (petCompose.editName):GetKey() end
  -- DECOMPILER ERROR: 1 unprocessed JMP targets
end

FGlobal_EscapeEditBox_PetCompose = function(bool)
  -- function num : 0_39 , upvalues : IM, petCompose
  (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_UiMode)
  ClearFocusEdit(petCompose.editName)
end

PetCompose_Open = function()
  -- function num : 0_40 , upvalues : petCompose, petComposeString, composePetTier
  Panel_Window_PetCompose:SetShow(true)
  Panel_Window_PetCompose:SetPosX(Panel_Window_PetListNew:GetPosX() + Panel_Window_PetListNew:GetSizeX() + 10)
  Panel_Window_PetCompose:SetPosY(Panel_Window_PetListNew:GetPosY())
  PetCompose_Init()
  ;
  (petCompose.editName):SetEditText(petComposeString)
  petSkillList_Close()
  composePetTier = 0
end

FGlobal_PetListNew_Open = function()
  -- function num : 0_41 , upvalues : PetList
  PetList:Open()
end

FGlobal_PetListNew_Close = function()
  -- function num : 0_42 , upvalues : PetList
  PetList:Close()
  Panel_Window_PetCompose_Close()
  PetListNew_IgnoreAllSealButton(false)
end

PetListNew_IgnoreAllSealButton = function(isShow)
  -- function num : 0_43 , upvalues : PetList
  (PetList.BTN_AllSeal):SetIgnore(isShow)
  ;
  (PetList.BTN_AllSeal):SetMonoTone(isShow)
end

FGlobal_PetListNew_Toggle = function()
  -- function num : 0_44 , upvalues : PetList
  if Panel_Window_PetListNew:GetShow() then
    PetList:Close()
    Panel_Window_PetCompose_Close()
  else
    PetList:Open()
    audioPostEvent_SystemUi(1, 40)
    local regionInfoWrapper = getRegionInfoByPosition(((getSelfPlayer()):get()):getPosition())
    if regionInfoWrapper == nil then
      return 
    end
    local myAffiliatedTownRegionKey = regionInfoWrapper:getAffiliatedTownRegionKey()
    local mainTownRegionWrapper = getRegionInfoWrapper(myAffiliatedTownRegionKey)
    local wayPointKey = (mainTownRegionWrapper:getPlantKeyByWaypointKey()):getWaypointKey()
    warehouse_requestInfo(wayPointKey)
  end
  do
    PetListNew_IgnoreAllSealButton(false)
  end
end

FGlobal_HandleClicked_PetMarket_Show = function()
  -- function num : 0_45
  PetAuction_Open()
  requestPetList()
  if Panel_Window_PetListNew:GetShow() then
    FGlobal_PetListNew_Close()
  end
end

FGlobal_HandleClicked_petControl_AllSeal = function()
  -- function num : 0_46 , upvalues : maxUnsealCount, checkUnSealList
  local sealPetCount = ToClient_getPetSealedList()
  local unSealPetCount = ToClient_getPetUnsealedList()
  if maxUnsealCount <= unSealPetCount then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_UNABLE_SUMMON_PET"))
  end
  if sealPetCount == 0 then
    return 
  end
  for petIndex = 0, sealPetCount - 1 do
    local petData = ToClient_getPetSealedDataByIndex(petIndex)
    local petNo_s64 = petData._petNo
    if checkUnSealList[Int64toInt32(petNo_s64)] then
      petListNew_UnSeal(tostring(petNo_s64))
    end
  end
end

PetList_OrderList_Init = function(petNo)
  -- function num : 0_47 , upvalues : PetList
  -- DECOMPILER ERROR at PC6: Confused about usage of register: R1 in 'UnsetPending'

  ((PetList.orderList)._follow)[tostring(petNo)] = nil
  -- DECOMPILER ERROR at PC13: Confused about usage of register: R1 in 'UnsetPending'

  ;
  ((PetList.orderList)._find)[tostring(petNo)] = nil
  -- DECOMPILER ERROR at PC20: Confused about usage of register: R1 in 'UnsetPending'

  ;
  ((PetList.orderList)._getItem)[tostring(petNo)] = nil
end

FromClient_PetUpdate = function()
  -- function num : 0_48 , upvalues : PetList
  FGlobal_PetControl_CheckUnSealPet()
  if not Panel_Window_PetListNew:GetShow() then
    return 
  end
  if getGameServiceType() ~= 5 and getGameServiceType() ~= 6 then
    PetInfoInit_ByPetNo()
  end
  PetList:SetPetList(true)
end

FromClient_PetUpdate_ButtonShow = function(petNo)
  -- function num : 0_49 , upvalues : PetList
  if not Panel_Window_PetListNew:GetShow() then
    return 
  end
  PetInfoInit_ByPetNo()
  FGlobal_PetControl_CheckUnSealPet(petNo)
  PetList:SetPetList(true)
end

FGlobal_PetListNew_NoPet = function()
  -- function num : 0_50
  if isFlushedUI() then
    return 
  end
  if PaGlobal_TutorialManager:isDoingTutorial() == true then
    Panel_Window_PetIcon:SetShow(false)
    return 
  end
  local petCount = ToClient_getPetSealedList()
  local unSealPetCount = ToClient_getPetUnsealedList()
  local PcPetData = ToClient_getPetUnsealedDataByIndex(0)
  if unSealPetCount == 0 then
    FGlobal_PetHungryAlert(false)
  end
  if petCount == 0 and PcPetData == nil then
    Panel_Window_PetIcon:SetShow(false)
  else
    Panel_Window_PetIcon:SetShow(true)
    local iconCount = FGlobal_HouseIconCount() + FGlobal_ServantIconCount()
    local posX, posY = nil, nil
    if FGlobal_HouseIconCount() > 0 and Panel_MyHouseNavi:GetShow() then
      posX = Panel_MyHouseNavi:GetPosX() + 60 * FGlobal_HouseIconCount() - 3
      posY = Panel_MyHouseNavi:GetPosY() - 2
    else
      if FGlobal_ServantIconCount() > 0 and Panel_Window_Servant:GetShow() then
        posX = Panel_Window_Servant:GetPosX() + 60 * FGlobal_ServantIconCount() - 3
        posY = Panel_Window_Servant:GetPosY() - 2
      else
        posX = 10
        posY = Panel_SelfPlayerExpGage:GetPosY() + Panel_SelfPlayerExpGage:GetSizeY() + 15
      end
    end
    Panel_Window_PetIcon:SetPosX(posX)
    Panel_Window_PetIcon:SetPosY(posY)
  end
  do
    FGlobal_MaidIcon_SetPos()
  end
end

PetListControlCreate = function(control, key)
  -- function num : 0_51 , upvalues : isPlayOpen, PetList, UI_TM, checkUnSealList, composePetTier, petComposeNo, petCompose, petRaceCount
  local bg = (UI.getChildControl)(control, "Template_Static_ListContentBG")
  local iconBg = (UI.getChildControl)(control, "Template_Static_IconPetBG")
  local icon = (UI.getChildControl)(control, "Template_Static_IconPet")
  local name = (UI.getChildControl)(control, "Template_StaticText_PetName")
  local level = (UI.getChildControl)(control, "Template_StaticText_Level")
  local tier = (UI.getChildControl)(control, "Template_StaticText_Tier")
  local hungryIcon = (UI.getChildControl)(control, "Template_Static_HungryIcon")
  local hungryBg = (UI.getChildControl)(control, "Template_Static_Progress_Hungry_BG")
  local hungryProgress = (UI.getChildControl)(control, "Template_Static_Progress_Hungry")
  local hungryPercentText = (UI.getChildControl)(control, "StaticText_HungryPercent")
  local btnInfo = (UI.getChildControl)(control, "Template_Button_Info")
  local btnRegist = (UI.getChildControl)(control, "Template_Button_Regist")
  local btnUnsealAll = (UI.getChildControl)(control, "Template_Button_UnsealAll")
  local btnUnseal = (UI.getChildControl)(control, "Template_Button_Unseal")
  local btnSeal = (UI.getChildControl)(control, "Template_Button_Seal")
  local btnFusion = (UI.getChildControl)(control, "Template_Button_Fusion")
  local checkBtn = (UI.getChildControl)(control, "Template_CheckButton_AllSeal")
  local property = (UI.getChildControl)(control, "StaticText_Property")
  local orderFollow = (UI.getChildControl)(control, "CheckButton_Follow")
  local orderWait = (UI.getChildControl)(control, "CheckButton_Wait")
  local orderFind = (UI.getChildControl)(control, "CheckButton_Find")
  local orderGetItem = (UI.getChildControl)(control, "CheckButton_GetItem")
  local orderPlay = (UI.getChildControl)(control, "CheckButton_Play")
  local noUnsealpet = (UI.getChildControl)(control, "StaticText_NoneUnsealPet")
  local sealPetCount = ToClient_getPetSealedList()
  local unsealPetCount = ToClient_getPetUnsealedList()
  local isUnsealPet = function(petNo_s64)
    -- function num : 0_51_0 , upvalues : unsealPetCount
    if unsealPetCount > 0 then
      for index = 0, unsealPetCount - 1 do
        local pcPetData = ToClient_getPetUnsealedDataByIndex(index)
        if petNo_s64 == pcPetData:getPcPetNo() then
          return true
        end
      end
    end
    do
      return false
    end
  end

  local isShow = nil
  if toInt64(0, -1) == key then
    isShow = false
  else
    isShow = true
  end
  iconBg:SetShow(isShow)
  icon:SetShow(isShow)
  name:SetShow(isShow)
  name:SetIgnore(false)
  level:SetShow(isShow)
  tier:SetShow(isShow)
  hungryIcon:SetShow(isShow)
  hungryBg:SetShow(isShow)
  hungryProgress:SetShow(isShow)
  hungryPercentText:SetShow(isShow)
  btnInfo:SetShow(isShow)
  btnRegist:SetShow(false)
  btnUnsealAll:SetShow(isShow)
  btnUnseal:SetShow(isShow)
  btnSeal:SetShow(isShow)
  btnFusion:SetShow(isShow)
  checkBtn:SetShow(isShow)
  property:SetShow(isShow)
  orderFollow:SetShow(isShow)
  orderWait:SetShow(false)
  orderFind:SetShow(isShow)
  orderGetItem:SetShow(isShow)
  orderPlay:SetShow(not isShow or isPlayOpen)
  noUnsealpet:SetShow(not isShow)
  if not isShow then
    return 
  end
  local petStaticStatus, iconPath, petNo_s64, petName, petLevel, petLovely, pethungry, petMaxLevel, petMaxHungry, petRace, petTier, petState, skillType, isPassive, tempIndex = nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil
  if isUnsealPet(key) then
    for index = 0, unsealPetCount - 1 do
      local pcPetData = ToClient_getPetUnsealedDataByIndex(index)
      if pcPetData ~= nil and key == pcPetData:getPcPetNo() then
        petStaticStatus = pcPetData:getPetStaticStatus()
        iconPath = pcPetData:getIconPath()
        petNo_s64 = pcPetData:getPcPetNo()
        petName = pcPetData:getName()
        petLevel = pcPetData:getLevel()
        petLovely = pcPetData:getLovely()
        pethungry = pcPetData:getHungry()
        petState = pcPetData:getPetState()
        petMaxLevel = petStaticStatus._maxLevel
        petMaxHungry = petStaticStatus._maxHungry
        petRace = petStaticStatus:getPetRace()
        petTier = petStaticStatus:getPetTier() + 1
        if pcPetData:getSkillParam(1) ~= nil then
          skillType = (pcPetData:getSkillParam(1))._type
          isPassive = (pcPetData:getSkillParam(1)):isPassiveSkill()
        end
        local hungryPercent = pethungry / petMaxHungry * 100
        hungryProgress:SetProgressRate(hungryPercent)
        hungryPercentText:SetText((string.format)("%.1f", hungryPercent) .. "%")
        checkBtn:SetShow(false)
        orderFollow:addInputEvent("Mouse_LUp", "petListNew_SetOrder(" .. 0 .. "," .. index .. ")")
        orderWait:addInputEvent("Mouse_LUp", "petListNew_SetOrder(" .. 0 .. "," .. index .. ")")
        orderFind:addInputEvent("Mouse_LUp", "petListNew_SetOrder(" .. 1 .. "," .. index .. ")")
        orderGetItem:addInputEvent("Mouse_LUp", "petListNew_SetOrder(" .. 2 .. "," .. index .. ")")
        orderPlay:addInputEvent("Mouse_LUp", "petListNew_SetPlay(" .. index .. ")")
        orderFollow:addInputEvent("Mouse_On", "petListNew_OrderTooltip(" .. 0 .. ", " .. index .. ")")
        orderWait:addInputEvent("Mouse_On", "petListNew_OrderTooltip(" .. 1 .. ", " .. index .. ")")
        orderFind:addInputEvent("Mouse_On", "petListNew_OrderTooltip(" .. 2 .. ", " .. index .. ")")
        orderGetItem:addInputEvent("Mouse_On", "petListNew_OrderTooltip(" .. 3 .. ", " .. index .. ")")
        orderPlay:addInputEvent("Mouse_On", "petListNew_OrderTooltip(" .. 4 .. ", " .. index .. ")")
        orderFollow:addInputEvent("Mouse_Out", "petListNew_OrderTooltip()")
        orderWait:addInputEvent("Mouse_Out", "petListNew_OrderTooltip()")
        orderFind:addInputEvent("Mouse_Out", "petListNew_OrderTooltip()")
        orderGetItem:addInputEvent("Mouse_Out", "petListNew_OrderTooltip()")
        orderPlay:addInputEvent("Mouse_Out", "petListNew_OrderTooltip()")
        -- DECOMPILER ERROR at PC410: Confused about usage of register: R51 in 'UnsetPending'

        PetList.orderList = PetControl_UnsealPetOrderInfo(tostring(petNo_s64))
        -- DECOMPILER ERROR at PC419: Confused about usage of register: R51 in 'UnsetPending'

        if isPassive then
          ((PetList.orderList)._find)[tostring(petNo_s64)] = true
          orderFind:addInputEvent("Mouse_LUp", "")
        end
        if ((PetList.orderList)._follow)[tostring(petNo_s64)] then
          orderFollow:SetShow(true)
          orderWait:SetShow(false)
        else
          orderFollow:SetShow(false)
          orderWait:SetShow(true)
        end
        if ((PetList.orderList)._find)[tostring(petNo_s64)] then
          orderFind:SetMonoTone(false)
        else
          orderFind:SetMonoTone(true)
        end
        if ((PetList.orderList)._getItem)[tostring(petNo_s64)] then
          orderGetItem:SetMonoTone(false)
        else
          orderGetItem:SetMonoTone(true)
        end
        local petLootingType = pcPetData:getPetLootingType()
        orderPlay:ChangeTextureInfoName("new_ui_common_forlua/window/servant/pet_00.dds")
        local x1, y1, x2, y2 = nil, nil, nil, nil
        if petLootingType == 0 then
          x1 = setTextureUV_Func(orderPlay, 140, 280, 172, 312)
        else
          -- DECOMPILER ERROR at PC507: Overwrote pending register: R55 in 'AssignReg'

          -- DECOMPILER ERROR at PC508: Overwrote pending register: R54 in 'AssignReg'

          -- DECOMPILER ERROR at PC509: Overwrote pending register: R53 in 'AssignReg'

          if petLootingType == 1 then
            x1 = setTextureUV_Func(orderPlay, 104, 280, 136, 312)
          else
            -- DECOMPILER ERROR at PC521: Overwrote pending register: R55 in 'AssignReg'

            -- DECOMPILER ERROR at PC522: Overwrote pending register: R54 in 'AssignReg'

            -- DECOMPILER ERROR at PC523: Overwrote pending register: R53 in 'AssignReg'

            if petLootingType == 2 then
              x1 = setTextureUV_Func(orderPlay, 176, 280, 208, 312)
            end
          end
        end
        ;
        (orderPlay:getBaseTexture()):setUV(x1, y1, x2, y2)
        orderPlay:setRenderTexture(orderPlay:getBaseTexture())
        name:SetTextMode(UI_TM.eTextMode_LimitText)
        name:SetText(petName)
        if name:IsLimitText() then
          name:addInputEvent("Mouse_On", "PetListNew_NameSimpleTooltip( true,\t" .. index .. ", " .. tostring(true) .. ", " .. tostring(key) .. ")")
          name:addInputEvent("Mouse_Out", "PetListNew_NameSimpleTooltip( false,\t" .. index .. ", " .. tostring(true) .. ", " .. tostring(key) .. ")")
        else
          name:addInputEvent("Mouse_On", "")
          name:addInputEvent("Mouse_Out", "")
        end
      end
    end
    btnInfo:SetShow(true)
    btnUnseal:SetShow(false)
    btnSeal:SetShow(true)
    btnFusion:SetShow(false)
    btnUnsealAll:SetShow(false)
    btnInfo:addInputEvent("Mouse_LUp", "petListNew_ShowInfo( \"" .. tostring(petNo_s64) .. "\" )")
    local uiIndex = 0
    -- DECOMPILER ERROR at PC621: Overwrote pending register: R53 in 'AssignReg'

    btnSeal:addInputEvent("Mouse_LUp", "petListNew_Seal( \"" .. tostring(petNo_s64) .. "\" ," .. uiIndex .. y1)
  else
    do
      local unsealPetIndex = -1
      for index = 0, sealPetCount - 1 do
        local pcPetData = ToClient_getPetSealedDataByIndex(index)
        if pcPetData ~= nil and key == pcPetData._petNo then
          petStaticStatus = pcPetData:getPetStaticStatus()
          iconPath = pcPetData:getIconPath()
          petNo_s64 = pcPetData._petNo
          petName = pcPetData:getName()
          petLevel = pcPetData._level
          petLovely = pcPetData._lovely
          pethungry = pcPetData._hungry
          petState = pcPetData._petState
          petMaxLevel = petStaticStatus._maxLevel
          petMaxHungry = petStaticStatus._maxHungry
          petRace = petStaticStatus:getPetRace()
          petTier = petStaticStatus:getPetTier() + 1
          if pcPetData:getSkillParam(1) ~= nil then
            skillType = (pcPetData:getSkillParam(1))._type
            isPassive = (pcPetData:getSkillParam(1)):isPassiveSkill()
          end
          local hungryPercent = pethungry / petMaxHungry * 100
          -- DECOMPILER ERROR at PC678: Overwrote pending register: R54 in 'AssignReg'

          hungryProgress:SetProgressRate(x2)
          -- DECOMPILER ERROR at PC683: Overwrote pending register: R55 in 'AssignReg'

          hungryPercentText:SetText((string.format)(y2, hungryPercent) .. "%")
          local isCheck = checkUnSealList[Int64toInt32(petNo_s64)]
          if isCheck == nil then
            isCheck = false
          end
          checkBtn:SetCheck(isCheck)
          checkBtn:addInputEvent("Mouse_LUp", "petListNew_AllSealCheck(" .. Int64toInt32(petNo_s64) .. ")")
          checkBtn:SetShow(true)
          -- DECOMPILER ERROR at PC715: Confused about usage of register: R53 in 'UnsetPending'

          ;
          ((PetList.orderList)._follow)[petNo_s64] = true
          -- DECOMPILER ERROR at PC719: Confused about usage of register: R53 in 'UnsetPending'

          ;
          ((PetList.orderList)._find)[petNo_s64] = isPassive
          -- DECOMPILER ERROR at PC723: Confused about usage of register: R53 in 'UnsetPending'

          ;
          ((PetList.orderList)._getItem)[petNo_s64] = true
          name:SetTextMode(UI_TM.eTextMode_LimitText)
          name:SetText(petName)
          if name:IsLimitText() then
            name:addInputEvent("Mouse_On", "PetListNew_NameSimpleTooltip( true,\t" .. index .. ", " .. tostring(false) .. ", " .. tostring(key) .. ")")
            name:addInputEvent("Mouse_Out", "PetListNew_NameSimpleTooltip( false,\t" .. index .. ", " .. tostring(false) .. ", " .. tostring(key) .. ")")
          else
            name:addInputEvent("Mouse_On", "")
            name:addInputEvent("Mouse_Out", "")
          end
          unsealPetIndex = index
        end
      end
      btnInfo:SetShow(false)
      btnUnseal:SetShow(true)
      btnSeal:SetShow(false)
      btnUnsealAll:SetShow(false)
      btnFusion:SetShow(false)
      orderFollow:SetShow(false)
      orderWait:SetShow(false)
      orderFind:SetShow(false)
      orderGetItem:SetShow(false)
      orderPlay:SetShow(false)
      do
        do
          local petComposable = (math.abs)(petTier - composePetTier) >= 2 and ((petRace == 99 and petTier))
          if petComposeNo[1] ~= nil then
            btnFusion:SetShow(false)
          elseif petNo_s64 ~= petComposeNo[0] and petComposeNo[0] ~= nil and (petCompose._race == petRace or petRace == 99) and petComposable then
            btnFusion:SetShow(true)
          elseif petComposeNo[0] == nil and CheckCompose() == true and petRace <= #petRaceCount and petRace ~= 99 then
            btnFusion:SetShow(true)
          end
          btnInfo:addInputEvent("Mouse_LUp", "sealPetListNew_ShowInfo( \"" .. tostring(petNo_s64) .. "\" )")
          btnUnseal:addInputEvent("Mouse_LUp", "petListNew_UnSeal( \"" .. tostring(petNo_s64) .. "\" )")
          btnFusion:addInputEvent("Mouse_LUp", "petListNew_Compose_Set( \"" .. tostring(petNo_s64) .. "\" ," .. petRace .. ", " .. unsealPetIndex .. " )")
          btnSeal:setNotImpactScrollEvent(true)
          btnUnseal:setNotImpactScrollEvent(true)
          tier:SetPosX(btnFusion:GetPosX() - btnFusion:GetSizeX() - 5)
          icon:ChangeTextureInfoName(iconPath)
          level:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_LV") .. "." .. tostring(petLevel))
          tier:SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_SERVANT_TIER", "tier", petTier))
          property:SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_PETINFO_SPECIALSKILL", "paramText", PetList_SkillTypeString(skillType)))
          -- DECOMPILER ERROR: 8 unprocessed JMP targets
        end
      end
    end
  end
end

petListNew_SetOrder = function(orderType, index)
  -- function num : 0_52
  local pcPetData = ToClient_getPetUnsealedDataByIndex(index)
  if pcPetData ~= nil then
    local petNo = pcPetData:getPcPetNo()
    FGlobal_PetControl_OrderList(orderType, index)
  end
end

petListNew_SetPlay = function(index)
  -- function num : 0_53 , upvalues : isPetFlyPet
  local pcPetData = ToClient_getPetUnsealedDataByIndex(index)
  if pcPetData ~= nil then
    local petNo = pcPetData:getPcPetNo()
    local petLootingType = (pcPetData:getPetLootingType() + 1) % 3
    ToClient_requestChangePetLootingType(petNo, petLootingType)
    local playAction_Fly = false
    local petRace = (pcPetData:getPetStaticStatus()):getPetRace()
    for index = 1, #isPetFlyPet do
      if petRace == isPetFlyPet[index] then
        playAction_Fly = true
      end
    end
  end
end

FGlobal_PetList_PetOrder = function(index)
  -- function num : 0_54 , upvalues : PetList
  local pcPetData = ToClient_getPetUnsealedDataByIndex(index)
  if pcPetData ~= nil then
    local petNo = pcPetData:getPcPetNo()
    ;
    (PetList.list2_PetList):requestUpdateByKey(petNo)
  end
end

petListNew_OrderTooltip = function(orderType, index)
  -- function num : 0_55 , upvalues : PetList
  if orderType == nil then
    TooltipSimple_Hide()
    return 
  end
  local pcPetData = ToClient_getPetUnsealedDataByIndex(index)
  if pcPetData == nil then
    return 
  end
  local key = pcPetData:getPcPetNo()
  local control = PetList.list2_PetList
  local contents = control:GetContentByKey(key)
  local orderFollow = (UI.getChildControl)(contents, "CheckButton_Follow")
  local orderWait = (UI.getChildControl)(contents, "CheckButton_Wait")
  local orderFind = (UI.getChildControl)(contents, "CheckButton_Find")
  local orderGetItem = (UI.getChildControl)(contents, "CheckButton_GetItem")
  local orderPlay = ((UI.getChildControl)(contents, "CheckButton_Play"))
  local uiControl, name, desc = nil, nil, nil
  if orderType == 0 then
    uiControl = orderFollow
    name = PAGetString(Defines.StringSheet_GAME, "LUA_PETCONTROL_TOOLTIP_FOLLOW_NAME")
    desc = PAGetString(Defines.StringSheet_GAME, "LUA_PETCONTROL_TOOLTIP_FOLLOW_DESC")
  else
    if orderType == 1 then
      uiControl = orderWait
      name = PAGetString(Defines.StringSheet_GAME, "LUA_PETCONTROL_TOOLTIP_WAIT_NAME")
      desc = PAGetString(Defines.StringSheet_GAME, "LUA_PETCONTROL_TOOLTIP_WAIT_DESC")
    else
      if orderType == 2 then
        uiControl = orderGetItem
        name = PAGetString(Defines.StringSheet_GAME, "LUA_PETCONTROL_TOOLTIP_FIND_NAME")
        desc = PAGetString(Defines.StringSheet_GAME, "LUA_PETCONTROL_TOOLTIP_FIND_DESC")
      else
        if orderType == 3 then
          uiControl = orderFind
          name = PAGetString(Defines.StringSheet_GAME, "LUA_PETCONTROL_TOOLTIP_GETITEM_NAME")
          desc = PAGetString(Defines.StringSheet_GAME, "LUA_PETCONTROL_TOOLTIP_GETITEM_DESC")
        else
          if orderType == 4 then
            local petLootingType = pcPetData:getPetLootingType()
            local lootingTypeString = ""
            if petLootingType == 0 then
              lootingTypeString = PAGetString(Defines.StringSheet_GAME, "LUA_IPETCONTROL_TOOLTIP_LOOTINGTYPE_0")
            else
              if petLootingType == 1 then
                lootingTypeString = PAGetString(Defines.StringSheet_GAME, "LUA_IPETCONTROL_TOOLTIP_LOOTINGTYPE_1")
              else
                if petLootingType == 2 then
                  lootingTypeString = PAGetString(Defines.StringSheet_GAME, "LUA_IPETCONTROL_TOOLTIP_LOOTINGTYPE_2")
                end
              end
            end
            uiControl = orderPlay
            name = PAGetString(Defines.StringSheet_GAME, "LUA_PETCONTROL_TOOLTIP_PLAY_NAME") .. lootingTypeString
            desc = PAGetString(Defines.StringSheet_GAME, "LUA_PETCONTROL_TOOLTIP_PLAY_DESC")
          end
        end
      end
    end
  end
  do
    TooltipSimple_Show(uiControl, name, desc)
  end
end

PetList_SkillTypeString = function(skillType)
  -- function num : 0_56
  local paramText = ""
  if skillType == 1 then
    paramText = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_PETINFO_PETSKILLTYPE_ITEMGETTIME", "itemGetTime", (string.format)("%.1f", skillParam:getParam(0) / 1000))
  else
    if skillType == 2 then
      paramText = PAGetString(Defines.StringSheet_GAME, "LUA_PETINFO_PETSKILLTYPE_FINDGATHER")
    else
      if skillType == 3 then
        paramText = PAGetString(Defines.StringSheet_GAME, "LUA_PETINFO_PETSKILLTYPE_FINDPK")
      else
        if skillType == 4 then
          paramText = PAGetString(Defines.StringSheet_GAME, "LUA_PETINFO_PETSKILLTYPE_FINDPLACE")
        else
          if skillType == 5 then
            paramText = PAGetString(Defines.StringSheet_GAME, "LUA_PETINFO_PETSKILLTYPE_MOBAGGRO")
          else
            if skillType == 6 then
              paramText = PAGetString(Defines.StringSheet_GAME, "LUA_PETINFO_PETSKILLTYPE_FINDRAREMONSTER")
            else
              if skillType == 7 then
                paramText = PAGetString(Defines.StringSheet_GAME, "LUA_PETINFO_PETSKILLTYPE_REDUCEAUTOFISHINGTIME")
              else
                if skillType == 8 then
                  paramText = PAGetString(Defines.StringSheet_GAME, "LUA_PETINFO_PETSKILLTYPE_REGISTILL")
                else
                  if skillType == 9 then
                    paramText = PAGetString(Defines.StringSheet_GAME, "LUA_PETINFO_PETSKILLTYPE_AUTOGETHERING")
                  else
                    if skillType == 10 then
                      paramText = PAGetString(Defines.StringSheet_GAME, "LUA_PETINFO_PETSKILLTYPE_GETHERINGINCREASE")
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
  return paramText
end

PetList.registEventHandler = function(self)
  -- function num : 0_57
  (self.BTN_Close):addInputEvent("Mouse_LUp", "FGlobal_PetListNew_Close()")
  ;
  (self.BTN_Compose):addInputEvent("Mouse_LUp", "PetListNew_Compose()")
  ;
  (self.BTN_AllUnSeal):addInputEvent("Mouse_LUp", "FGlobal_HandleClicked_petControl_AllUnSeal()")
  ;
  (self.BTN_AllSeal):addInputEvent("Mouse_LUp", "FGlobal_HandleClicked_petControl_AllSeal()")
  ;
  (self.list2_PetList):registEvent((CppEnums.PAUIList2EventType).luaChangeContent, "PetListControlCreate")
  ;
  (self.list2_PetList):createChildContent((CppEnums.PAUIList2ElementManagerType).list)
end

FromClient_PetPromotion = function(fromWhereType, fromSlotNo)
  -- function num : 0_58
end

PetList.registMessageHandler = function(self)
  -- function num : 0_59
  registerEvent("FromClient_PetAddSealedList", "FromClient_PetUpdate")
  registerEvent("FromClient_PetDelSealedList", "FromClient_PetUpdate_ButtonShow")
  registerEvent("FromClient_PetDelList", "FromClient_PetUpdate")
  registerEvent("FromClient_InputPetName", "FromClient_PetUpdate")
  registerEvent("FromClient_PetAddSealedList", "FGlobal_PetListNew_NoPet")
  registerEvent("FromClient_PetInfoChanged", "FGlobal_PetListNew_NoPet")
  registerEvent("FromClient_PetInfoChanged", "FromClient_PetUpdate")
  registerEvent("FromClient_PetAddList", "FGlobal_PetListNew_NoPet")
  registerEvent("FromClient_PetPromotion", "FromClient_PetPromotion")
  ToClient_getPetInitLuaInfo()
end

registerEvent("FromClient_luaLoadComplete", "FromClient_luaLoadComplete_PetList")
FromClient_luaLoadComplete_PetList = function()
  -- function num : 0_60 , upvalues : PetList
  PetList:Initialize()
  petListNew_Load()
  petSkillList_Close()
  FGlobal_PetListNew_NoPet()
  Panel_MyHouseNavi_Update(true)
  PetList:registEventHandler()
  PetList:registMessageHandler()
end


