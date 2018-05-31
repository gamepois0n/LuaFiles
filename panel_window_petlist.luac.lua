-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\window\petinfo\panel_window_petlist.luac 

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
local petRaceCount = {[1] = "고양�\180", [2] = "�\156", [3] = "�\164", [4] = "펭귄", [5] = "사막여우", [6] = "고슴도치", [7] = "눈사�\140", [8] = "고슴도치", [9] = "오목눈이", [10] = "렛서팬더", [11] = "앵무�\136", [12] = "북극�\176", [13] = "돌맨�\140", [14] = "이벤트할로윈1", [15] = "이벤트할로윈2", [16] = "이벤트할로윈3", [17] = "이벤트할로윈4", [18] = "이벤트할로윈5", [19] = "이벤트할로윈6", [20] = "어린 �\145", [22] = "까마�\128", [23] = "몬스터펫 임시", [24] = "마멋", [25] = "에어리스", [26] = "루돌�\132", [27] = "붉은오크", [28] = "골렘", [29] = "나무 정령", [30] = "키메�\188", [31] = "켄타우로�\164", [32] = "카마실비�\132 불곰", [33] = "아무거나11", [34] = "아무거나12", [35] = "아무거나13", [36] = "아무거나14", [37] = "아무거나15", [38] = "아무거나16", [39] = "아무거나17", [40] = "아무거나18", [41] = "아무거나19", [42] = "아무거나20", [43] = "아무거나21", [44] = "아무거나22", [45] = "아무거나23", [46] = "아무거나24", [47] = "아무거나25", [48] = "아무거나26", [49] = "아무거나27", [50] = "아무거나28", [51] = "아무거나29", [52] = "아무거나30", [53] = "아무거나31", [54] = "아무거나32", [55] = "아무거나33", [56] = "아무거나34", [57] = "아무거나35", [58] = "아무거나36", [59] = "아무거나37", [60] = "아무거나38", [61] = "아무거나39", [62] = "아무거나40", [63] = "아무거나41", [64] = "아무거나42", [65] = "아무거나43", [66] = "아무거나44", [67] = "아무거나45", [68] = "아무거나46", [69] = "아무거나47", [70] = "아무거나48", [71] = "아무거나49", [72] = "아무거나50", [73] = "아무거나51", [74] = "아무거나52", [75] = "아무거나53", [76] = "아무거나54", [77] = "아무거나55", [78] = "아무거나56", [79] = "아무거나57", [80] = "아무거나58", [81] = "아무거나59", [82] = "아무거나60", [83] = "아무거나61", [84] = "아무거나62", [85] = "아무거나63", [86] = "아무거나64", [87] = "아무거나65", [88] = "아무거나66", [89] = "아무거나67", [90] = "아무거나68", [91] = "아무거나69", [92] = "아무거나70", [93] = "아무거나71", [94] = "아무거나72", [95] = "아무거나73", [96] = "아무거나74", [97] = "아무거나75", [98] = "아무거나76", [99] = "합성�\169 �\171"}
local isPetFlyPet = {[1] = 3, [2] = 9, [3] = 11, [4] = 15}
checkUnSealGroupList = {
[1] = {}
, 
[2] = {}
, 
[3] = {}
}
local checkUnSealList = {}
local PetList = {BTN_Close = (UI.getChildControl)(Panel_Window_PetListNew, "Button_Win_Close"), BTN_Compose = (UI.getChildControl)(Panel_Window_PetListNew, "Button_Compose"), BTN_FeedAll = (UI.getChildControl)(Panel_Window_PetListNew, "Button_FeedingAll"), BTN_AllUnSeal = (UI.getChildControl)(Panel_Window_PetListNew, "Button_AllUnSeal"), BTN_GroupSeal1 = (UI.getChildControl)(Panel_Window_PetListNew, "Button_AllSeal_Group1"), BTN_GroupSeal2 = (UI.getChildControl)(Panel_Window_PetListNew, "Button_AllSeal_Group2"), BTN_GroupSeal3 = (UI.getChildControl)(Panel_Window_PetListNew, "Button_AllSeal_Group3"), BTN_ClearGroup = (UI.getChildControl)(Panel_Window_PetListNew, "Button_ClearGroup"), BTN_Market = (UI.getChildControl)(Panel_Window_PetListNew, "Button_Market"), list2_PetList = (UI.getChildControl)(Panel_Window_PetListNew, "List2_PetList"), feedUi = (UI.getChildControl)(Panel_Window_PetListNew, "Static_FeedingBg"), feedAllUi = Panel_PetRestoreAll, listMaxCount = 5, 
listUIPool = {}
, SealDATACount = 0, UnSealDataCount = 0, 
orderList = {
_follow = {}
, 
_find = {}
, 
_getItem = {}
}
, _nowSelectGroup = 0, feedingPetIndex = 0, feedStaticItemCount = ToClient_Pet_GetFeedStaticItemCount(), cachedUserFeedItemCount = 0, 
feedSlot = {}
, 
feedAllSlot = {}
, 
config = {createBorder = true, createCount = true}
, selectItemIndex = -1, selectSlotBg = nil, selectAllSlotBg = nil}
;
(PetList.BTN_GroupSeal1):addInputEvent("Mouse_On", "PetListNew_SimpleTooltip( true, 0 )")
;
(PetList.BTN_GroupSeal1):addInputEvent("Mouse_Out", "PetListNew_SimpleTooltip( false )")
;
(PetList.BTN_GroupSeal2):addInputEvent("Mouse_On", "PetListNew_SimpleTooltip( true, 1 )")
;
(PetList.BTN_GroupSeal2):addInputEvent("Mouse_Out", "PetListNew_SimpleTooltip( false )")
;
(PetList.BTN_GroupSeal3):addInputEvent("Mouse_On", "PetListNew_SimpleTooltip( true, 2 )")
;
(PetList.BTN_GroupSeal3):addInputEvent("Mouse_Out", "PetListNew_SimpleTooltip( false )")
;
(PetList.BTN_ClearGroup):addInputEvent("Mouse_On", "PetListNew_SimpleTooltip( true, 3 )")
;
(PetList.BTN_ClearGroup):addInputEvent("Mouse_Out", "PetListNew_SimpleTooltip( false )")
;
(PetList.BTN_AllUnSeal):SetShow(not marketTest)
;
(PetList.BTN_Market):SetShow(marketTest)
;
(PetList.BTN_ClearGroup):addInputEvent("Mouse_LUp", "HandleClicked_PetGroupClear()")
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
local baseSkillMultiplePoint = {[1] = 25, [2] = 10, [3] = 1, [4] = 1, [5] = 1, [6] = 1, [7] = 1, [8] = 1, [9] = 5, [10] = 1, [11] = 5, [12] = 10}
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
(petCompose.radioBtn_PetSkill_1):addInputEvent("Mouse_On", "PetCompose_Simpletooltips(true, 0)")
;
(petCompose.radioBtn_PetSkill_1):addInputEvent("Mouse_Out", "PetCompose_Simpletooltips(false)")
;
(petCompose.radioBtn_PetSkill_2):addInputEvent("Mouse_On", "PetCompose_Simpletooltips(true, 1)")
;
(petCompose.radioBtn_PetSkill_2):addInputEvent("Mouse_Out", "PetCompose_Simpletooltips(false)")
;
(petCompose.radioBtn_PetSkill_3):addInputEvent("Mouse_On", "PetCompose_Simpletooltips(true, 2)")
;
(petCompose.radioBtn_PetSkill_3):addInputEvent("Mouse_Out", "PetCompose_Simpletooltips(false)")
;
(petCompose.radioBtn_PetLook_1):addInputEvent("Mouse_LUp", "PetCompose_UpdatePetSkillList()")
;
(petCompose.radioBtn_PetLook_2):addInputEvent("Mouse_LUp", "PetCompose_UpdatePetSkillList()")
;
(petCompose.radioBtn_PetLook_3):addInputEvent("Mouse_LUp", "PetCompose_UpdatePetSkillList()")
;
(petCompose.radioBtn_PetLook_1):addInputEvent("Mouse_On", "PetCompose_Simpletooltips(true, 3)")
;
(petCompose.radioBtn_PetLook_1):addInputEvent("Mouse_Out", "PetCompose_Simpletooltips(false)")
;
(petCompose.radioBtn_PetLook_2):addInputEvent("Mouse_On", "PetCompose_Simpletooltips(true, 4)")
;
(petCompose.radioBtn_PetLook_2):addInputEvent("Mouse_Out", "PetCompose_Simpletooltips(false)")
;
(petCompose.radioBtn_PetLook_3):addInputEvent("Mouse_On", "PetCompose_Simpletooltips(true, 5)")
;
(petCompose.radioBtn_PetLook_3):addInputEvent("Mouse_Out", "PetCompose_Simpletooltips(false)")
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
if 120 < (petCompose.desc):GetTextSizeY() then
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
  local btnFeedAllTextPosX = btnComposeSizeX - btnComposeSizeX / 2 - (PetList.BTN_FeedAll):GetTextSizeX() / 2
  local btnAllUnSealSizeX = (PetList.BTN_AllUnSeal):GetSizeX() + 23
  local btnAllUnSealTextPosX = btnAllUnSealSizeX - btnAllUnSealSizeX / 2 - (PetList.BTN_AllUnSeal):GetTextSizeX() / 2
  local btnAllSealSizeX = (PetList.BTN_GroupSeal1):GetSizeX() + 23
  local btnAllSealTextPosX = btnAllSealSizeX - btnAllSealSizeX / 2 - (PetList.BTN_GroupSeal1):GetTextSizeX() / 2
  local btnClearGroupSizeX = (PetList.BTN_ClearGroup):GetSizeX() + 23
  local btnClearGroupTextPosX = btnClearGroupSizeX - btnClearGroupSizeX / 2 - (PetList.BTN_ClearGroup):GetTextSizeX() / 2
  ;
  (PetList.BTN_Compose):SetTextSpan(btnComposeTextPosX, 5)
  ;
  (PetList.BTN_FeedAll):SetTextSpan(btnFeedAllTextPosX, 5)
  ;
  (PetList.BTN_AllUnSeal):SetTextSpan(btnAllUnSealTextPosX, 5)
  ;
  (PetList.BTN_GroupSeal1):SetTextSpan(btnAllSealTextPosX, 5)
  ;
  (PetList.BTN_GroupSeal2):SetTextSpan(btnAllSealTextPosX, 5)
  ;
  (PetList.BTN_GroupSeal3):SetTextSpan(btnAllSealTextPosX, 5)
  ;
  (PetList.BTN_ClearGroup):SetTextSpan(btnClearGroupTextPosX, 5)
  ;
  (PetList.BTN_Compose):SetShow(true)
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
  -- function num : 0_9 , upvalues : petComposeNo, PetList
  self:SetPosition()
  PetCompose_Init()
  Panel_Window_PetListNew:SetShow(true, true)
  -- DECOMPILER ERROR at PC10: Confused about usage of register: R1 in 'UnsetPending'

  petComposeNo[0] = nil
  -- DECOMPILER ERROR at PC12: Confused about usage of register: R1 in 'UnsetPending'

  petComposeNo[1] = nil
  PetList:showFeedUi(-1)
  PetList:showFeedAllUi(false)
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
    if self.UnSealDATACount == 0 and toIndex == (self.list2_PetList):getEndIndex() - 1 then
      toIndex = toIndex + 1
    end
    ;
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
  -- function num : 0_11 , upvalues : PetList
  Panel_Window_PetListNew:SetShow(false, false)
  PetList:showFeedUi(-1)
  PetList:showFeedAllUi(false)
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
  FGlobal_PetList_FeedClose()
end

FGlobal_petListNew_Seal = function(petNo, index)
  -- function num : 0_15
  petListNew_Seal(petNo, index)
end

petListNew_UnSeal = function(petNoStr, isGroup)
  -- function num : 0_16 , upvalues : PetList, maxUnsealCount
  audioPostEvent_SystemUi(1, 40)
  local self = PetList
  local petNo_s64 = tonumber64(petNoStr)
  if maxUnsealCount <= self.UnSealDATACount and isGroup == false then
    Proc_ShowMessage_Ack_WithOut_ChattingMessage(PAGetString(Defines.StringSheet_GAME, "LUA_UNABLE_SUMMON_PET"))
    return 
  end
  PetList_OrderList_Init(petNoStr)
  ToClient_requestPetUnseal(petNo_s64)
  FGlobal_PetContorl_HungryGaugeUpdate(petNo_s64)
  FGlobal_AllSealButtonPosition(self.UnSealDATACount, true)
  FGlobal_PetList_FeedClose()
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
  PetList:SetPetList(true)
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

petListNew_AllSealCheck = function(petNo_s32, groupIndex)
  -- function num : 0_22 , upvalues : maxUnsealCount, PetList
  PaGlobal_PetList_CheckGroup()
  local groupCount = 0
  for key,value in pairs(checkUnSealGroupList[groupIndex]) do
    if value == true then
      groupCount = groupCount + 1
    end
  end
  do
    if (checkUnSealGroupList[groupIndex])[petNo_s32] == nil or (checkUnSealGroupList[groupIndex])[petNo_s32] == false then
      if maxUnsealCount <= groupCount then
        Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_PETLIST_UNABLE_CHECKGROUP"))
        PetList:SetPetList(true)
        return 
      end
      -- DECOMPILER ERROR at PC40: Confused about usage of register: R3 in 'UnsetPending'

      ;
      (checkUnSealGroupList[groupIndex])[petNo_s32] = true
    else
      -- DECOMPILER ERROR at PC44: Confused about usage of register: R3 in 'UnsetPending'

      ;
      (checkUnSealGroupList[groupIndex])[petNo_s32] = false
    end
    petGroupList_Save()
  end
end

petGroupList_Save = function()
  -- function num : 0_23
  ToClient_clearPetGroupList()
  for ii = 1, 3 do
    for key,value in pairs(checkUnSealGroupList[ii]) do
      if value == true then
        ToClient_savePetGroupList(ii, key)
      end
    end
  end
end

local isFirst = false
petGroupList_Load = function()
  -- function num : 0_24 , upvalues : isFirst
  if isFirst == true then
    return 
  end
  isFirst = true
  local size = ToClient_getSizePetGroupList()
  if size == 0 then
    return 
  end
  for ii = 0, size do
    local petNo = ToClient_getPetNoInPetGroupByIndex(ii)
    local groupIdx = ToClient_getPetGroupIndexInPetGroupByIndex(ii)
    -- DECOMPILER ERROR at PC26: Confused about usage of register: R7 in 'UnsetPending'

    ;
    (checkUnSealGroupList[groupIdx])[Int64toInt32(petNo)] = true
  end
end

petListNew_Save = function()
  -- function num : 0_25 , upvalues : maxUnsealCount, checkUnSealList
  local sealPetCount = ToClient_getPetSealedList()
  local maxCount = (math.min)(9, maxUnsealCount)
  local idx = 0
  for petIndex = 0, sealPetCount - 1 do
    local petData = ToClient_getPetSealedDataByIndex(petIndex)
    local petNo_s32 = Int64toInt32(petData._petNo)
    if checkUnSealList[petNo_s32] then
      (ToClient_getGameUIManagerWrapper()):setLuaCacheDataListNumber((CppEnums.GlobalUIOptionType)["PetAllSeal" .. tostring(idx)], petNo_s32, (CppEnums.VariableStorageType).eVariableStorageType_User)
      idx = idx + 1
      if idx >= 9 then
        return 
      end
    end
  end
  for index = idx, maxCount do
    (ToClient_getGameUIManagerWrapper()):setLuaCacheDataListNumber((CppEnums.GlobalUIOptionType)["PetAllSeal" .. index], 0, (CppEnums.VariableStorageType).eVariableStorageType_User)
  end
end

petListNew_Load = function()
  -- function num : 0_26 , upvalues : checkUnSealList
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
  -- function num : 0_27
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
  -- function num : 0_28 , upvalues : petCompose
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
  -- function num : 0_29 , upvalues : petCompose
  (petCompose.editName):SetMaxInput(getGameServiceTypePetNameLength())
  SetFocusEdit(petCompose.editName)
  ;
  (petCompose.editName):SetEditText("", true)
end

Confirm_PetCompose = function()
  -- function num : 0_30 , upvalues : petCompose, petComposeString, petComposeNo, PetList
  ClearFocusEdit(petCompose.editName)
  local petName = (petCompose.editName):GetEditText()
  if petName == "" or petComposeString == petName then
    Proc_ShowMessage_Ack(petComposeString)
    return 
  end
  if petComposeNo[1] ~= nil then
    local confirm_compose = function()
    -- function num : 0_30_0 , upvalues : petCompose, petComposeNo, petName, PetList
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
  -- function num : 0_31 , upvalues : PetList
  PetCompose_Init()
  Panel_Window_PetCompose:SetShow(false)
  PetListNew_IgnoreAllSealButton(false)
  PetList:SetPetList()
end

PetCompose_Init = function()
  -- function num : 0_32 , upvalues : petComposeNo, petCompose, composableCheck
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
  -- function num : 0_33 , upvalues : composableCheck
  return composableCheck
end

local petSkillCheck = nil
PetCompose_UpdatePetSkillList = function()
  -- function num : 0_34 , upvalues : petComposeNo, petCompose, petSkillCheck
  local petNo0 = petComposeNo[0]
  local petNo1 = petComposeNo[1]
  PetComposeSkill_Init()
  -- DECOMPILER ERROR at PC8: Confused about usage of register: R2 in 'UnsetPending'

  ;
  (petCompose.skillNoList)[0] = nil
  petSkillCheck = {}
  local havePetSkillCheck = function(petNo)
    -- function num : 0_34_0 , upvalues : petSkillCheck, petCompose
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
    -- function num : 0_34_1 , upvalues : petCompose
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
  -- function num : 0_35 , upvalues : petCompose
  for ii,aSkillSlot in pairs((petCompose.skillSlot)[3]) do
    aSkillSlot:SetShow(false)
    aSkillSlot:addInputEvent("Mouse_On", "")
    aSkillSlot:addInputEvent("Mouse_Out", "")
  end
end

PetCompose_ShowSkillToolTip = function(skill_idx, uiIdx)
  -- function num : 0_36 , upvalues : petCompose
  local skillStaticStatus = ToClient_getPetEquipSkillStaticStatus(skill_idx)
  local skillTypeStaticWrapper = skillStaticStatus:getSkillTypeStaticStatusWrapper()
  local petSkillNo = skillStaticStatus:getSkillNo()
  local uiBase = (petCompose.skillSlot)[uiIdx]
  Panel_SkillTooltip_Show(petSkillNo, false, "PetSkill")
end

PetCompose_HideSkillToolTip = function()
  -- function num : 0_37
  Panel_SkillTooltip_Hide()
end

PetListNew_SimpleTooltip = function(isShow, tipType)
  -- function num : 0_38 , upvalues : maxUnsealCount, PetList
  if not isShow then
    TooltipSimple_Hide()
    return 
  end
  local name, desc, control = nil, nil, nil
  if tipType == 0 then
    name = PAGetString(Defines.StringSheet_RESOURCE, "PANEL_WINDOW_PETLISTNEW_ALLSEAL")
    desc = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_PETLIST_ALLSEAL_MAX4_DESC", "count", maxUnsealCount)
    control = PetList.BTN_GroupSeal1
  else
    if tipType == 1 then
      name = PAGetString(Defines.StringSheet_RESOURCE, "PANEL_WINDOW_PETLISTNEW_ALLSEAL")
      desc = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_PETLIST_ALLSEAL_GROUP_SEAL2", "count", maxUnsealCount)
      control = PetList.BTN_GroupSeal2
    else
      if tipType == 2 then
        name = PAGetString(Defines.StringSheet_RESOURCE, "PANEL_WINDOW_PETLISTNEW_ALLSEAL")
        desc = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_PETLIST_ALLSEAL_GROUP_SEAL3", "count", maxUnsealCount)
        control = PetList.BTN_GroupSeal3
      else
        if tipType == 3 then
          name = PAGetString(Defines.StringSheet_RESOURCE, "PANEL_WINDOW_PETLISTNEW_ALLCLEARSET")
          desc = PAGetString(Defines.StringSheet_GAME, "LUA_PETLISTNEW_ALLCLEAR_UNSET")
          control = PetList.BTN_ClearGroup
        else
          if tipType == 4 then
            name = PAGetString(Defines.StringSheet_RESOURCE, "PANEL_WINDOW_PETLISTNEW_COMPOSE")
            desc = PAGetString(Defines.StringSheet_GAME, "LUA_PETLIST_TOOLTIP_BTN_FUSION_DESC")
            control = PetList.BTN_Compose
          else
            if tipType == 5 then
              name = PAGetString(Defines.StringSheet_RESOURCE, "PANEL_PETCONTROL_BTN_ALLSEAL")
              desc = PAGetString(Defines.StringSheet_GAME, "LUA_PETLIST_TOOLTIP_BTN_ALLSEAL_DESC")
              control = PetList.BTN_AllUnSeal
            end
          end
        end
      end
    end
  end
  TooltipSimple_Show(control, name, desc)
end

PetListNew_NameSimpleTooltip = function(isShow, index, isSealed)
  -- function num : 0_39 , upvalues : PetList
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
  -- function num : 0_40 , upvalues : petCompose
  do return uiEditBox ~= nil and petCompose.editName ~= nil and uiEditBox:GetKey() == (petCompose.editName):GetKey() end
  -- DECOMPILER ERROR: 1 unprocessed JMP targets
end

FGlobal_EscapeEditBox_PetCompose = function(bool)
  -- function num : 0_41 , upvalues : petCompose
  ClearFocusEdit(petCompose.editName)
end

PetCompose_Open = function()
  -- function num : 0_42 , upvalues : petCompose, petComposeString, composePetTier
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
  -- function num : 0_43 , upvalues : PetList
  PetList:Open()
end

FGlobal_PetListNew_Close = function()
  -- function num : 0_44 , upvalues : PetList
  audioPostEvent_SystemUi(1, 1)
  PetList:Close()
  PetList:showFeedUi(-1)
  PetList:showFeedAllUi(false)
  Panel_Window_PetCompose_Close()
  PetListNew_IgnoreAllSealButton(false)
end

PetListNew_IgnoreAllSealButton = function(isShow)
  -- function num : 0_45 , upvalues : PetList
  (PetList.BTN_GroupSeal1):SetIgnore(isShow)
  ;
  (PetList.BTN_GroupSeal1):SetMonoTone(isShow)
  ;
  (PetList.BTN_GroupSeal2):SetIgnore(isShow)
  ;
  (PetList.BTN_GroupSeal2):SetMonoTone(isShow)
  ;
  (PetList.BTN_GroupSeal3):SetIgnore(isShow)
  ;
  (PetList.BTN_GroupSeal3):SetMonoTone(isShow)
end

FGlobal_PetListNew_Toggle = function()
  -- function num : 0_46 , upvalues : PetList
  if Panel_Window_PetListNew:GetShow() then
    PetList:Close()
    Panel_Window_PetCompose_Close()
    audioPostEvent_SystemUi(1, 1)
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
  -- function num : 0_47
  PetAuction_Open()
  requestPetList()
  if Panel_Window_PetListNew:GetShow() then
    FGlobal_PetListNew_Close()
  end
end

FGlobal_HandleClicked_petControl_AllSeal = function(groupIndex)
  -- function num : 0_48 , upvalues : maxUnsealCount
  local sealPetCount = ToClient_getPetSealedList()
  local unSealPetCount = ToClient_getPetUnsealedList()
  FGlobal_HandleClicked_petControl_AllUnSeal(groupIndex)
  if sealPetCount == 0 then
    return 
  end
  for petIndex = 0, sealPetCount - 1 do
    local isDuplication = false
    local petData = ToClient_getPetSealedDataByIndex(petIndex)
    local petNo_s64 = petData._petNo
    if (checkUnSealGroupList[groupIndex])[Int64toInt32(petNo_s64)] then
      for index = 0, maxUnsealCount - 1 do
        local unSealPetInfo = ToClient_getPetUnsealedList()
        local PetUnSealData = ToClient_getPetUnsealedDataByIndex(index)
        if PetUnSealData ~= nil then
          local unsealPetNo_s64 = PetUnSealData:getPcPetNo()
          if petNo_s64 == unsealPetNo_s64 then
            isDuplication = true
          end
        end
      end
      if isDuplication == false then
        Proc_ShowMessage_Ack(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_PETLIST_GROUPPET_SEAL", "index", groupIndex))
        petListNew_UnSeal(tostring(petNo_s64), true)
      end
    end
  end
end

PetList_OrderList_Init = function(petNo)
  -- function num : 0_49 , upvalues : PetList
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
  -- function num : 0_50 , upvalues : PetList
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
  -- function num : 0_51 , upvalues : PetList
  if not Panel_Window_PetListNew:GetShow() then
    return 
  end
  PetInfoInit_ByPetNo()
  FGlobal_PetControl_CheckUnSealPet(petNo)
  PetList:SetPetList(true)
end

FGlobal_PetListNew_NoPet = function()
  -- function num : 0_52
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
    FGlobal_MaidIcon_SetPos(false)
    PaGlobal_Camp:setPos()
  end
end

PetListControlCreate = function(control, key)
  -- function num : 0_53 , upvalues : isPlayOpen, PetList, UI_TM, petComposeNo, composePetTier, petCompose, petRaceCount
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
  local groupIndexBtn1 = (UI.getChildControl)(control, "Template_Button_GroupIndex1")
  local groupIndexBtn2 = (UI.getChildControl)(control, "Template_Button_GroupIndex2")
  local groupIndexBtn3 = (UI.getChildControl)(control, "Template_Button_GroupIndex3")
  local property = (UI.getChildControl)(control, "StaticText_Property")
  local btnFeed = (UI.getChildControl)(control, "Button_Feeding")
  local orderFollow = (UI.getChildControl)(control, "CheckButton_Follow")
  local orderWait = (UI.getChildControl)(control, "CheckButton_Wait")
  local orderFind = (UI.getChildControl)(control, "CheckButton_Find")
  local orderGetItem = (UI.getChildControl)(control, "CheckButton_GetItem")
  local orderPlay = (UI.getChildControl)(control, "CheckButton_Play")
  local noUnsealpet = (UI.getChildControl)(control, "StaticText_NoneUnsealPet")
  local btnUp = (UI.getChildControl)(control, "Button_Up")
  local btnDown = (UI.getChildControl)(control, "Button_Down")
  btnUp:SetShow(false)
  btnDown:SetShow(false)
  local skillIcon = {[0] = (UI.getChildControl)(control, "Static_SkillIcon_0"), [1] = (UI.getChildControl)(control, "Static_SkillIcon_1"), [2] = (UI.getChildControl)(control, "Static_SkillIcon_2"), [3] = (UI.getChildControl)(control, "Static_SkillIcon_3")}
  local sealPetCount = ToClient_getPetSealedList()
  local unsealPetCount = ToClient_getPetUnsealedList()
  local isUnsealPet = function(petNo_s64)
    -- function num : 0_53_0 , upvalues : unsealPetCount
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
  btnFeed:SetShow(isShow)
  groupIndexBtn1:SetShow(isShow)
  groupIndexBtn2:SetShow(isShow)
  groupIndexBtn3:SetShow(isShow)
  property:SetShow(isShow)
  orderFollow:SetShow(isShow)
  orderWait:SetShow(false)
  orderFind:SetShow(isShow)
  orderGetItem:SetShow(isShow)
  orderPlay:SetShow(not isShow or isPlayOpen)
  noUnsealpet:SetShow(not isShow)
  ;
  (skillIcon[0]):SetShow(false)
  ;
  (skillIcon[1]):SetShow(false)
  ;
  (skillIcon[2]):SetShow(false)
  ;
  (skillIcon[3]):SetShow(false)
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
        groupIndexBtn1:SetShow(false)
        groupIndexBtn2:SetShow(false)
        groupIndexBtn3:SetShow(false)
        orderFollow:addInputEvent("Mouse_LUp", "petListNew_SetOrder(" .. 0 .. "," .. index .. ")")
        orderWait:addInputEvent("Mouse_LUp", "petListNew_SetOrder(" .. 0 .. "," .. index .. ")")
        orderFind:addInputEvent("Mouse_LUp", "petListNew_SetOrder(" .. 1 .. "," .. index .. ")")
        orderGetItem:addInputEvent("Mouse_LUp", "petListNew_SetOrder(" .. 2 .. "," .. index .. ")")
        orderPlay:addInputEvent("Mouse_LUp", "petListNew_SetPlay(" .. index .. ")")
        btnFeed:addInputEvent("Mouse_LUp", "HandleClicked_PetList_Feed(" .. index .. ")")
        orderFollow:addInputEvent("Mouse_RUp", "petListNew_SetOrderAll(" .. 0 .. "," .. index .. ")")
        orderWait:addInputEvent("Mouse_RUp", "petListNew_SetOrderAll(" .. 0 .. "," .. index .. ")")
        orderFind:addInputEvent("Mouse_RUp", "petListNew_SetOrderAll(" .. 1 .. "," .. index .. ")")
        orderGetItem:addInputEvent("Mouse_RUp", "petListNew_SetOrderAll(" .. 2 .. "," .. index .. ")")
        orderPlay:addInputEvent("Mouse_RUp", "petListNew_SetPlayAll(" .. index .. ")")
        btnFeed:addInputEvent("Mouse_RUp", "")
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
        -- DECOMPILER ERROR at PC551: Confused about usage of register: R57 in 'UnsetPending'

        PetList.orderList = PetControl_UnsealPetOrderInfo(tostring(petNo_s64))
        -- DECOMPILER ERROR at PC560: Confused about usage of register: R57 in 'UnsetPending'

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
        btnFeed:SetShow(true)
        local petLootingType = pcPetData:getPetLootingType()
        orderPlay:ChangeTextureInfoName("new_ui_common_forlua/window/servant/pet_00.dds")
        local x1, y1, x2, y2 = nil, nil, nil, nil
        if petLootingType == 0 then
          x1 = setTextureUV_Func(orderPlay, 140, 280, 172, 312)
        else
          -- DECOMPILER ERROR at PC651: Overwrote pending register: R61 in 'AssignReg'

          -- DECOMPILER ERROR at PC652: Overwrote pending register: R60 in 'AssignReg'

          -- DECOMPILER ERROR at PC653: Overwrote pending register: R59 in 'AssignReg'

          if petLootingType == 1 then
            x1 = setTextureUV_Func(orderPlay, 104, 280, 136, 312)
          else
            -- DECOMPILER ERROR at PC665: Overwrote pending register: R61 in 'AssignReg'

            -- DECOMPILER ERROR at PC666: Overwrote pending register: R60 in 'AssignReg'

            -- DECOMPILER ERROR at PC667: Overwrote pending register: R59 in 'AssignReg'

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
        hungryProgress:addInputEvent("Mouse_On", "petListNew_OrderTooltip(5, " .. index .. ")")
        hungryProgress:addInputEvent("Mouse_Out", "petListNew_OrderTooltip()")
        hungryPercentText:addInputEvent("Mouse_On", "petListNew_OrderTooltip(6, " .. index .. ")")
        hungryPercentText:addInputEvent("Mouse_Out", "petListNew_OrderTooltip()")
        hungryIcon:addInputEvent("Mouse_On", "petListNew_OrderTooltip(7, " .. index .. ")")
        hungryIcon:addInputEvent("Mouse_Out", "petListNew_OrderTooltip()")
        btnInfo:addInputEvent("Mouse_On", "petListNew_OrderTooltip(8, " .. index .. ")")
        btnInfo:addInputEvent("Mouse_Out", "petListNew_OrderTooltip()")
        btnSeal:addInputEvent("Mouse_On", "petListNew_OrderTooltip(9, " .. index .. ")")
        btnSeal:addInputEvent("Mouse_Out", "petListNew_OrderTooltip()")
        btnFusion:addInputEvent("Mouse_On", "petListNew_OrderTooltip(10, " .. index .. ")")
        btnFusion:addInputEvent("Mouse_Out", "petListNew_OrderTooltip()")
        local uiIndex = 0
        local baseskillindex = pcPetData:getPetBaseSkillIndex()
        local skillMaxCount = ToClient_getPetEquipSkillMax()
        local skillStaticStatus = ToClient_getPetBaseSkillStaticStatus(baseskillindex)
        if skillStaticStatus ~= nil then
          local skillTypeStaticWrapper = skillStaticStatus:getSkillTypeStaticStatusWrapper()
          if skillTypeStaticWrapper ~= nil then
            local skillNo = skillStaticStatus:getSkillNo()
            ;
            (skillIcon[uiIndex]):SetShow(true)
            ;
            (skillIcon[uiIndex]):ChangeTextureInfoName("Icon/" .. skillTypeStaticWrapper:getIconPath())
            ;
            (skillIcon[uiIndex]):addInputEvent("Mouse_On", "PetList_BaseSkill_ShowTooltip( " .. baseskillindex .. ", " .. uiIndex .. " )")
            ;
            (skillIcon[uiIndex]):addInputEvent("Mouse_Out", "PetList_BaseSkill_HideTooltip()")
            Panel_SkillTooltip_SetPosition(skillNo, skillIcon[uiIndex], "PetListSkill")
            uiIndex = uiIndex + 1
          end
        end
        do
          for skill_idx = 0, skillMaxCount - 1 do
            local skillStaticStatus = ToClient_getPetEquipSkillStaticStatus(skill_idx)
            local isLearn = pcPetData:isPetEquipSkillLearned(skill_idx)
            if isLearn == true and skillStaticStatus ~= nil then
              local skillTypeStaticWrapper = skillStaticStatus:getSkillTypeStaticStatusWrapper()
              if skillTypeStaticWrapper ~= nil then
                local skillNo = skillStaticStatus:getSkillNo()
                ;
                (skillIcon[uiIndex]):SetShow(true)
                ;
                (skillIcon[uiIndex]):ChangeTextureInfoName("Icon/" .. skillTypeStaticWrapper:getIconPath())
                ;
                (skillIcon[uiIndex]):addInputEvent("Mouse_On", "PetList_ShowSkillToolTip( " .. skill_idx .. ", " .. uiIndex .. " )")
                ;
                (skillIcon[uiIndex]):addInputEvent("Mouse_Out", "PetList_HideSkillToolTip()")
                Panel_SkillTooltip_SetPosition(skillNo, skillIcon[uiIndex], "PetListSkill")
                uiIndex = uiIndex + 1
              end
            end
          end
          do
            -- DECOMPILER ERROR at PC898: LeaveBlock: unexpected jumping out DO_STMT

            -- DECOMPILER ERROR at PC898: LeaveBlock: unexpected jumping out IF_THEN_STMT

            -- DECOMPILER ERROR at PC898: LeaveBlock: unexpected jumping out IF_STMT

          end
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
    -- DECOMPILER ERROR at PC932: Overwrote pending register: R59 in 'AssignReg'

    btnSeal:addInputEvent("Mouse_LUp", "petListNew_Seal( \"" .. tostring(petNo_s64) .. "\" ," .. uiIndex .. y1)
  else
    do
      do
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
              -- DECOMPILER ERROR at PC989: Overwrote pending register: R60 in 'AssignReg'

              hungryProgress:SetProgressRate(x2)
              -- DECOMPILER ERROR at PC994: Overwrote pending register: R61 in 'AssignReg'

              hungryPercentText:SetText((string.format)(y2, hungryPercent) .. "%")
              groupIndexBtn1:SetShow(true)
              groupIndexBtn2:SetShow(true)
              groupIndexBtn3:SetShow(true)
              groupIndexBtn1:addInputEvent("Mouse_LUp", "petListNew_AllSealCheck(" .. Int64toInt32(petNo_s64) .. ", 1 )")
              groupIndexBtn2:addInputEvent("Mouse_LUp", "petListNew_AllSealCheck(" .. Int64toInt32(petNo_s64) .. ", 2 )")
              groupIndexBtn3:addInputEvent("Mouse_LUp", "petListNew_AllSealCheck(" .. Int64toInt32(petNo_s64) .. ", 3 )")
              groupIndexBtn1:SetCheck(PetList:IsCheckGroupBtnByPetNo(petNo_s64, 1))
              groupIndexBtn2:SetCheck(PetList:IsCheckGroupBtnByPetNo(petNo_s64, 2))
              groupIndexBtn3:SetCheck(PetList:IsCheckGroupBtnByPetNo(petNo_s64, 3))
              -- DECOMPILER ERROR at PC1060: Confused about usage of register: R58 in 'UnsetPending'

              ;
              ((PetList.orderList)._follow)[petNo_s64] = true
              -- DECOMPILER ERROR at PC1064: Confused about usage of register: R58 in 'UnsetPending'

              ;
              ((PetList.orderList)._find)[petNo_s64] = isPassive
              -- DECOMPILER ERROR at PC1068: Confused about usage of register: R58 in 'UnsetPending'

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
              btnUp:addInputEvent("Mouse_LUp", "PetList_ChangePosition(true," .. index .. ")")
              btnDown:addInputEvent("Mouse_LUp", "PetList_ChangePosition(false," .. index .. ")")
              btnUp:SetShow(true)
              btnDown:SetShow(true)
              btnUnseal:addInputEvent("Mouse_On", "PetListNew_SimpleTooltipBTN(true, " .. index .. ", " .. 0 .. ")")
              btnUnseal:addInputEvent("Mouse_Out", "PetListNew_SimpleTooltipBTN(false)")
              hungryProgress:addInputEvent("Mouse_On", "PetListNew_SimpleTooltipBTN(true, " .. index .. ", " .. 1 .. ")")
              hungryProgress:addInputEvent("Mouse_Out", "PetListNew_SimpleTooltipBTN(false)")
              hungryPercentText:addInputEvent("Mouse_On", "PetListNew_SimpleTooltipBTN(true, " .. index .. ", " .. 2 .. ")")
              hungryPercentText:addInputEvent("Mouse_Out", "PetListNew_SimpleTooltipBTN(false)")
              hungryIcon:addInputEvent("Mouse_On", "PetListNew_SimpleTooltipBTN(true, " .. index .. ", " .. 3 .. ")")
              hungryIcon:addInputEvent("Mouse_Out", "PetListNew_SimpleTooltipBTN(false)")
              btnUp:addInputEvent("Mouse_On", "PetListNew_SimpleTooltipBTN(true, " .. index .. ", " .. 4 .. ")")
              btnUp:addInputEvent("Mouse_Out", "PetListNew_SimpleTooltipBTN(false)")
              btnDown:addInputEvent("Mouse_On", "PetListNew_SimpleTooltipBTN(true, " .. index .. ", " .. 5 .. ")")
              btnDown:addInputEvent("Mouse_Out", "PetListNew_SimpleTooltipBTN(false)")
              groupIndexBtn1:addInputEvent("Mouse_On", "PetListNew_SimpleTooltipBTN(true, " .. index .. ", " .. 6 .. ")")
              groupIndexBtn1:addInputEvent("Mouse_Out", "PetListNew_SimpleTooltipBTN(false)")
              groupIndexBtn2:addInputEvent("Mouse_On", "PetListNew_SimpleTooltipBTN(true, " .. index .. ", " .. 7 .. ")")
              groupIndexBtn2:addInputEvent("Mouse_Out", "PetListNew_SimpleTooltipBTN(false)")
              groupIndexBtn3:addInputEvent("Mouse_On", "PetListNew_SimpleTooltipBTN(true, " .. index .. ", " .. 8 .. ")")
              groupIndexBtn3:addInputEvent("Mouse_Out", "PetListNew_SimpleTooltipBTN(false)")
              btnFusion:addInputEvent("Mouse_On", "PetListNew_SimpleTooltipBTN(true, " .. index .. ", " .. 9 .. ")")
              btnFusion:addInputEvent("Mouse_Out", "PetListNew_SimpleTooltipBTN(false)")
            end
          end
          btnInfo:SetShow(false)
          btnUnseal:SetShow(true)
          btnSeal:SetShow(false)
          btnUnsealAll:SetShow(false)
          btnFusion:SetShow(false)
          btnFeed:SetShow(false)
          orderFollow:SetShow(false)
          orderWait:SetShow(false)
          orderFind:SetShow(false)
          orderGetItem:SetShow(false)
          orderPlay:SetShow(false)
          if ToClient_IsContentsGroupOpen("378") == true then
            if petComposeNo[1] ~= nil then
              btnFusion:SetShow(false)
            else
              if petNo_s64 ~= petComposeNo[0] and petComposeNo[0] ~= nil then
                btnFusion:SetShow(true)
              else
                if petComposeNo[0] == nil and CheckCompose() == true then
                  btnFusion:SetShow(true)
                end
              end
            end
          else
            local petComposable = (math.abs)(petTier - composePetTier) >= 2 and ((petRace == 99 and petTier))
            if petComposeNo[1] ~= nil then
              btnFusion:SetShow(false)
            elseif petNo_s64 ~= petComposeNo[0] and petComposeNo[0] ~= nil and (petCompose._race == petRace or petCompose._race == 39 or petRace == 99) and petComposable then
              btnFusion:SetShow(true)
            elseif petComposeNo[0] == nil and CheckCompose() == true and petRace <= #petRaceCount and petRace ~= 99 then
              btnFusion:SetShow(true)
            end
          end
          btnInfo:addInputEvent("Mouse_LUp", "sealPetListNew_ShowInfo( \"" .. tostring(petNo_s64) .. "\" )")
          btnUnseal:addInputEvent("Mouse_LUp", "petListNew_UnSeal( \"" .. tostring(petNo_s64) .. "\" , false )")
          btnFusion:addInputEvent("Mouse_LUp", "petListNew_Compose_Set( \"" .. tostring(petNo_s64) .. "\" ," .. petRace .. ", " .. unsealPetIndex .. " )")
          btnSeal:setNotImpactScrollEvent(true)
          btnUnseal:setNotImpactScrollEvent(true)
          btnFusion:setNotImpactScrollEvent(true)
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

PetList_BaseSkill_ShowTooltip = function(baseskillindex, uiIx)
  -- function num : 0_54
  local skillStaticStatus = ToClient_getPetBaseSkillStaticStatus(baseskillindex)
  local skillTypeStaticWrapper = skillStaticStatus:getSkillTypeStaticStatusWrapper()
  local petSkillNo = skillStaticStatus:getSkillNo()
  Panel_SkillTooltip_Show(petSkillNo, false, "PetListSkill")
end

PetList_BaseSkill_HideTooltip = function()
  -- function num : 0_55
  Panel_SkillTooltip_Hide()
end

PetList_ShowSkillToolTip = function(skill_idx, uiIdx)
  -- function num : 0_56
  local skillStaticStatus = ToClient_getPetEquipSkillStaticStatus(skill_idx)
  local skillTypeStaticWrapper = skillStaticStatus:getSkillTypeStaticStatusWrapper()
  local petSkillNo = skillStaticStatus:getSkillNo()
  Panel_SkillTooltip_Show(petSkillNo, false, "PetListSkill")
end

PetList_HideSkillToolTip = function()
  -- function num : 0_57
  Panel_SkillTooltip_Hide()
end

petListNew_SetOrder = function(orderType, index)
  -- function num : 0_58
  local pcPetData = ToClient_getPetUnsealedDataByIndex(index)
  if pcPetData ~= nil then
    FGlobal_PetControl_OrderList(orderType, index)
  end
end

petListNew_SetOrderAll = function(orderType, index)
  -- function num : 0_59 , upvalues : PetList
  local selectedPetData = ToClient_getPetUnsealedDataByIndex(index)
  if selectedPetData == nil then
    return 
  end
  local selectedPetNo_s64 = (selectedPetData:getPcPetNo())
  local currentState = nil
  if orderType == 0 then
    currentState = ((PetList.orderList)._follow)[tostring(selectedPetNo_s64)]
  else
    if orderType == 1 then
      currentState = ((PetList.orderList)._find)[tostring(selectedPetNo_s64)]
    else
      currentState = ((PetList.orderList)._getItem)[tostring(selectedPetNo_s64)]
    end
  end
  local unsealPetCount = ToClient_getPetUnsealedList()
  for pIndex = 0, unsealPetCount - 1 do
    local pcPetData = ToClient_getPetUnsealedDataByIndex(pIndex)
    if pcPetData ~= nil then
      local petNo_s64 = pcPetData:getPcPetNo()
      -- DECOMPILER ERROR at PC63: Unhandled construct in 'MakeBoolean' P1

      if orderType == 0 and currentState == ((PetList.orderList)._follow)[tostring(petNo_s64)] then
        petListNew_SetOrder(orderType, pIndex)
      end
    end
    -- DECOMPILER ERROR at PC79: Unhandled construct in 'MakeBoolean' P1

    if orderType == 1 and currentState == ((PetList.orderList)._find)[tostring(petNo_s64)] then
      petListNew_SetOrder(orderType, pIndex)
    end
    if orderType == 2 and currentState == ((PetList.orderList)._getItem)[tostring(petNo_s64)] then
      petListNew_SetOrder(orderType, pIndex)
    end
  end
end

petListNew_SetPlay = function(index)
  -- function num : 0_60 , upvalues : isPetFlyPet
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

petListNew_SetPlayAll = function(index)
  -- function num : 0_61
  local selectedPetData = ToClient_getPetUnsealedDataByIndex(index)
  if selectedPetData == nil then
    return 
  end
  local petLootingType = (selectedPetData:getPetLootingType() + 1) % 3
  local unsealPetCount = ToClient_getPetUnsealedList()
  for pIndex = 0, unsealPetCount - 1 do
    local pcPetData = ToClient_getPetUnsealedDataByIndex(pIndex)
    if pcPetData ~= nil then
      local petNo = pcPetData:getPcPetNo()
      ToClient_requestChangePetLootingType(petNo, petLootingType)
    end
  end
end

FGlobal_PetList_PetOrder = function(index)
  -- function num : 0_62 , upvalues : PetList
  local pcPetData = ToClient_getPetUnsealedDataByIndex(index)
  if pcPetData ~= nil then
    local petNo = pcPetData:getPcPetNo()
    ;
    (PetList.list2_PetList):requestUpdateByKey(petNo)
  end
end

petListNew_OrderTooltip = function(orderType, index)
  -- function num : 0_63 , upvalues : PetList
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
  local orderPlay = (UI.getChildControl)(contents, "CheckButton_Play")
  local hungryProgress = (UI.getChildControl)(contents, "Template_Static_Progress_Hungry")
  local hungryPercentText = (UI.getChildControl)(contents, "StaticText_HungryPercent")
  local hungryIcon = (UI.getChildControl)(contents, "Template_Static_HungryIcon")
  local btnInfo = (UI.getChildControl)(contents, "Template_Button_Info")
  local btnSeal = (UI.getChildControl)(contents, "Template_Button_Seal")
  local btnFusion = ((UI.getChildControl)(contents, "Template_Button_Fusion"))
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
          else
            do
              if orderType == 5 then
                name = PAGetString(Defines.StringSheet_GAME, "LUA_PETLIST_TOOLTIP_BTN_HUNGRY_NAME")
                desc = PAGetString(Defines.StringSheet_GAME, "LUA_PETLIST_TOOLTIP_BTN_HUNGRY_DESC")
                uiControl = hungryProgress
              else
                if orderType == 6 then
                  name = PAGetString(Defines.StringSheet_GAME, "LUA_PETLIST_TOOLTIP_BTN_HUNGRY_NAME")
                  desc = PAGetString(Defines.StringSheet_GAME, "LUA_PETLIST_TOOLTIP_BTN_HUNGRY_DESC")
                  uiControl = hungryPercentText
                else
                  if orderType == 7 then
                    name = PAGetString(Defines.StringSheet_GAME, "LUA_PETLIST_TOOLTIP_BTN_HUNGRY_NAME")
                    desc = PAGetString(Defines.StringSheet_GAME, "LUA_PETLIST_TOOLTIP_BTN_HUNGRY_DESC")
                    uiControl = hungryIcon
                  else
                    if orderType == 8 then
                      name = PAGetString(Defines.StringSheet_GAME, "LUA_PETLIST_TOOLTIP_BTN_INFO_NAME")
                      desc = PAGetString(Defines.StringSheet_GAME, "LUA_PETLIST_TOOLTIP_BTN_INFO_DESC")
                      uiControl = btnInfo
                    else
                      if orderType == 9 then
                        name = PAGetString(Defines.StringSheet_GAME, "LUA_PETLIST_TOOLTIP_BTN_SEAL_NAME")
                        desc = PAGetString(Defines.StringSheet_GAME, "LUA_PETLIST_TOOLTIP_BTN_SEAL_DESC")
                        uiControl = btnSeal
                      else
                        if orderType == 10 then
                          name = PAGetString(Defines.StringSheet_GAME, "LUA_PETLIST_TOOLTIP_BTN_FUSION_NAME")
                          desc = PAGetString(Defines.StringSheet_GAME, "LUA_PETLIST_TOOLTIP_BTN_FUSION_DESC")
                          uiControl = btnFusion
                        end
                      end
                    end
                  end
                end
              end
              TooltipSimple_Show(uiControl, name, desc)
            end
          end
        end
      end
    end
  end
end

PetListNew_SimpleTooltipBTN = function(isShow, index, tipType)
  -- function num : 0_64 , upvalues : PetList, maxUnsealCount
  if not isShow then
    TooltipSimple_Hide()
    return 
  end
  local name, desc, control = nil, nil, nil
  local pcPetData = ToClient_getPetSealedDataByIndex(index)
  if pcPetData == nil then
    return 
  end
  local key = pcPetData._petNo
  local contents = (PetList.list2_PetList):GetContentByKey(key)
  local btn_Unseal = (UI.getChildControl)(contents, "Template_Button_Unseal")
  local hungryProgress = (UI.getChildControl)(contents, "Template_Static_Progress_Hungry")
  local hungryPercentText = (UI.getChildControl)(contents, "StaticText_HungryPercent")
  local hungryIcon = (UI.getChildControl)(contents, "Template_Static_HungryIcon")
  local btnUp = (UI.getChildControl)(contents, "Button_Up")
  local btnDown = (UI.getChildControl)(contents, "Button_Down")
  local groupIndexBtn1 = (UI.getChildControl)(contents, "Template_Button_GroupIndex1")
  local groupIndexBtn2 = (UI.getChildControl)(contents, "Template_Button_GroupIndex2")
  local groupIndexBtn3 = (UI.getChildControl)(contents, "Template_Button_GroupIndex3")
  local btnFusion = (UI.getChildControl)(contents, "Template_Button_Fusion")
  if tipType == 0 then
    name = PAGetString(Defines.StringSheet_GAME, "LUA_PETLIST_TOOLTIP_BTN_UNSEAL_NAME")
    desc = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_PETLIST_TOOLTIP_BTN_UNSEAL_DESC", "count", maxUnsealCount)
    control = btn_Unseal
  else
    if tipType == 1 then
      name = PAGetString(Defines.StringSheet_GAME, "LUA_PETLIST_TOOLTIP_BTN_HUNGRY_NAME")
      desc = PAGetString(Defines.StringSheet_GAME, "LUA_PETLIST_TOOLTIP_BTN_HUNGRY_DESC")
      control = hungryProgress
    else
      if tipType == 2 then
        name = PAGetString(Defines.StringSheet_GAME, "LUA_PETLIST_TOOLTIP_BTN_HUNGRY_NAME")
        desc = PAGetString(Defines.StringSheet_GAME, "LUA_PETLIST_TOOLTIP_BTN_HUNGRY_DESC")
        control = hungryPercentText
      else
        if tipType == 3 then
          name = PAGetString(Defines.StringSheet_GAME, "LUA_PETLIST_TOOLTIP_BTN_HUNGRY_NAME")
          desc = PAGetString(Defines.StringSheet_GAME, "LUA_PETLIST_TOOLTIP_BTN_HUNGRY_DESC")
          control = hungryIcon
        else
          if tipType == 4 then
            name = PAGetString(Defines.StringSheet_GAME, "LUA_PETLIST_TOOLTIP_BTN_CHANGEORDER_UP_NAME")
            desc = PAGetString(Defines.StringSheet_GAME, "LUA_PETLIST_TOOLTIP_BTN_CHANGEORDER_UP_DESC")
            control = btnUp
          else
            if tipType == 5 then
              name = PAGetString(Defines.StringSheet_GAME, "LUA_PETLIST_TOOLTIP_BTN_CHANGEORDER_DOWN_NAME")
              desc = PAGetString(Defines.StringSheet_GAME, "LUA_PETLIST_TOOLTIP_BTN_CHANGEORDER_DOWN_DESC")
              control = btnDown
            else
              if tipType == 6 then
                name = PAGetString(Defines.StringSheet_GAME, "LUA_PETLIST_TOOLTIP_BTN_GROUP1_NAME")
                desc = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_PETLIST_TOOLTIP_BTN_GROUP1_DESC", "count", maxUnsealCount)
                control = groupIndexBtn1
              else
                if tipType == 7 then
                  name = PAGetString(Defines.StringSheet_GAME, "LUA_PETLIST_TOOLTIP_BTN_GROUP2_NAME")
                  desc = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_PETLIST_TOOLTIP_BTN_GROUP2_DESC", "count", maxUnsealCount)
                  control = groupIndexBtn2
                else
                  if tipType == 8 then
                    name = PAGetString(Defines.StringSheet_GAME, "LUA_PETLIST_TOOLTIP_BTN_GROUP3_NAME")
                    desc = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_PETLIST_TOOLTIP_BTN_GROUP3_DESC", "count", maxUnsealCount)
                    control = groupIndexBtn3
                  else
                    if tipType == 9 then
                      name = PAGetString(Defines.StringSheet_RESOURCE, "PANEL_WINDOW_PETLISTNEW_COMPOSE")
                      desc = PAGetString(Defines.StringSheet_GAME, "LUA_PETLIST_TOOLTIP_BTN_FUSION_DESC")
                      control = btnFusion
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
  TooltipSimple_Show(control, name, desc)
end

PetList_SkillTypeString = function(skillType)
  -- function num : 0_65
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
                    else
                      if skillType == 11 then
                        paramText = PAGetString(Defines.StringSheet_GAME, "LUA_PETINFO_PETSKILLTYPE_HPRECOVERY")
                      else
                        if skillType == 12 then
                          paramText = PAGetString(Defines.StringSheet_GAME, "LUA_PETINFO_PETSKILLTYPE_MPRECOVERY")
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
  return paramText
end

PetList.initializeFeedAllUi = function(self)
  -- function num : 0_66
  local closeButton = (UI.getChildControl)(self.feedAllUi, "Button_Close")
  closeButton:addInputEvent("Mouse_LUp", "HandleClicked_PetList_FeedAllClose()")
  local cancelButton = (UI.getChildControl)(self.feedAllUi, "Button_Cancel")
  cancelButton:addInputEvent("Mouse_LUp", "HandleClicked_PetList_FeedAllClose()")
  local adminButton = (UI.getChildControl)(self.feedAllUi, "Button_Restore")
  adminButton:addInputEvent("Mouse_LUp", "PetList_useFeedItemToAll()")
  self.selectAllSlotBg = (UI.getChildControl)(self.feedAllUi, "Static_Selected_Item_Icon")
  local originalSlot = (UI.getChildControl)(self.feedAllUi, "Static_Restore_Item_Icon")
  local slotGap = originalSlot:GetSizeX() + 5
  for i = 0, self.feedStaticItemCount - 1 do
    local slotBg = (UI.createAndCopyBasePropertyControl)(self.feedAllUi, "Static_Restore_Item_Icon", self.feedAllUi, "Static_Restore_Item_Icon" .. tostring(i))
    slotBg:SetPosX(originalSlot:GetPosX() + slotGap * i)
    slotBg:SetShow(false)
    -- DECOMPILER ERROR at PC68: Confused about usage of register: R11 in 'UnsetPending'

    ;
    (self.feedAllSlot)[i] = {}
    ;
    (SlotItem.new)((self.feedAllSlot)[i], "FeedAllItem_", i, slotBg, self.config)
    ;
    ((self.feedAllSlot)[i]):createChild()
    ;
    (((self.feedAllSlot)[i]).border):SetSize(33, 33)
    ;
    (((self.feedAllSlot)[i]).icon):SetSize(33, 33)
    ;
    (((self.feedAllSlot)[i]).count):ComputePos()
  end
end

PetList.initializeFeedUi = function(self)
  -- function num : 0_67
  local closeButton = (UI.getChildControl)(self.feedUi, "Button_Close")
  closeButton:addInputEvent("Mouse_LUp", "HandleClicked_PetList_FeedClose()")
  self.selectSlotBg = (UI.getChildControl)(self.feedUi, "Static_Selected_Item_Icon")
  local feedOneButton = (UI.getChildControl)(self.feedUi, "Button_FeedOne")
  feedOneButton:addInputEvent("Mouse_LUp", "PetList_useFeedOneItem()")
  local feedFullButton = (UI.getChildControl)(self.feedUi, "Button_FeedFull")
  feedFullButton:addInputEvent("Mouse_LUp", "PetList_useFeedFullItem()")
  local originalSlot = (UI.getChildControl)(self.feedUi, "Static_IconBg")
  originalSlot:SetShow(false)
  local slotGap = originalSlot:GetSizeX() + 5
  for i = 0, self.feedStaticItemCount - 1 do
    local additionalSlot = (UI.createAndCopyBasePropertyControl)(self.feedUi, "Static_IconBg", self.feedUi, "Static_IconBg" .. tostring(i))
    additionalSlot:SetPosX(originalSlot:GetPosX() + slotGap * i)
    additionalSlot:SetShow(false)
    -- DECOMPILER ERROR at PC71: Confused about usage of register: R11 in 'UnsetPending'

    ;
    (self.feedSlot)[i] = {}
    ;
    (SlotItem.new)((self.feedSlot)[i], "FeedItem_", i, additionalSlot, self.config)
    ;
    ((self.feedSlot)[i]):createChild()
    ;
    (((self.feedSlot)[i]).border):SetSize(32, 32)
    ;
    (((self.feedSlot)[i]).icon):SetSize(32, 32)
    ;
    (((self.feedSlot)[i]).count):ComputePos()
  end
end

FromClient_PetList_UpdateFeedUi = function()
  -- function num : 0_68 , upvalues : PetList
  if _ContentsGroup_InvenUpdateCheck == true and Panel_Window_PetListNew:GetShow() == false then
    return 
  end
  PetList:updateFeedUi()
  PetList:updateFeedAllUi()
end

PetList.updateUserFeedItemCount = function(self, count)
  -- function num : 0_69
  if self.cachedUserFeedItemCount ~= count then
    self:initSelection()
  end
  self.cachedUserFeedItemCount = count
end

PetList.initSelection = function(self)
  -- function num : 0_70
  self.selectItemIndex = -1
  ;
  (self.selectSlotBg):SetShow(false)
  ;
  (self.selectAllSlotBg):SetShow(false)
end

PetList.updateFeedAllUi = function(self)
  -- function num : 0_71
  if not (self.feedAllUi):GetShow() then
    return 
  end
  local userFeedItemCount = ToClient_Pet_GetFeedItemCount()
  self:updateUserFeedItemCount(userFeedItemCount)
  for i = 0, self.feedStaticItemCount - 1 do
    local targetSlot = (UI.getChildControl)(self.feedAllUi, "Static_Restore_Item_Icon" .. tostring(i))
    if i < userFeedItemCount then
      targetSlot:SetShow(true)
      local feedItem = ToClient_Pet_GetFeedItemByIndex(i)
      if not feedItem then
        return 
      end
      local feedItemKey = ((feedItem:get()):getKey()):getItemKey()
      local feedItemCount = (feedItem:get()):getCount_s64()
      ;
      ((self.feedAllSlot)[i]):setItem(feedItem)
      ;
      (((self.feedAllSlot)[i]).icon):addInputEvent("Mouse_LUp", "HandleClicked_PetList_FeedItemToAll(" .. i .. ")")
      ;
      (((self.feedAllSlot)[i]).icon):addInputEvent("Mouse_On", "HandleOver_PetRestore_FeedItem_ShowTooltip(" .. i .. ")")
      ;
      (((self.feedAllSlot)[i]).icon):addInputEvent("Mouse_Out", "HandleOver_PetRestore_FeedItem_HideTooltip()")
    else
      do
        do
          targetSlot:SetShow(false)
          targetSlot:removeInputEvent("Mouse_LUp")
          -- DECOMPILER ERROR at PC85: LeaveBlock: unexpected jumping out DO_STMT

          -- DECOMPILER ERROR at PC85: LeaveBlock: unexpected jumping out IF_ELSE_STMT

          -- DECOMPILER ERROR at PC85: LeaveBlock: unexpected jumping out IF_STMT

        end
      end
    end
  end
end

PetList.updateFeedUi = function(self)
  -- function num : 0_72
  if not (self.feedUi):GetShow() then
    return 
  end
  local userFeedItemCount = ToClient_Pet_GetFeedItemCount()
  self:updateUserFeedItemCount(userFeedItemCount)
  for i = 0, self.feedStaticItemCount - 1 do
    local targetSlot = (UI.getChildControl)(self.feedUi, "Static_IconBg" .. tostring(i))
    if i < userFeedItemCount then
      targetSlot:SetShow(true)
      local feedItem = ToClient_Pet_GetFeedItemByIndex(i)
      if not feedItem then
        return 
      end
      ;
      ((self.feedSlot)[i]):setItem(feedItem)
      ;
      (((self.feedSlot)[i]).icon):addInputEvent("Mouse_On", "HandleOver_PetList_FeedItem_ShowTooltip(" .. i .. ")")
      ;
      (((self.feedSlot)[i]).icon):addInputEvent("Mouse_Out", "HandleOver_PetList_FeedItem_HideTooltip()")
      ;
      (((self.feedSlot)[i]).icon):addInputEvent("Mouse_LUp", "HandleClicked_PetList_FeedItem(" .. i .. ")")
    else
      do
        do
          targetSlot:SetShow(false)
          targetSlot:removeInputEvent("Mouse_LUp")
          -- DECOMPILER ERROR at PC75: LeaveBlock: unexpected jumping out DO_STMT

          -- DECOMPILER ERROR at PC75: LeaveBlock: unexpected jumping out IF_ELSE_STMT

          -- DECOMPILER ERROR at PC75: LeaveBlock: unexpected jumping out IF_STMT

        end
      end
    end
  end
end

PetList.showFeedUi = function(self, targetPetIndex)
  -- function num : 0_73 , upvalues : PetList
  if self.feedingPetIndex == targetPetIndex then
    targetPetIndex = -1
  end
  self:initSelection()
  local showFlag = targetPetIndex >= 0
  ;
  (self.feedUi):SetShow(showFlag)
  self.feedingPetIndex = targetPetIndex
  if showFlag then
    PetList:showFeedAllUi(false)
    local petData = ToClient_getPetUnsealedDataByIndex(targetPetIndex)
    if not petData then
      return 
    end
    local petNo = petData:getPcPetNo()
    local contents = (self.list2_PetList):GetContentByKey(petNo)
    local btnFeed = (UI.getChildControl)(contents, "Button_Feeding")
    local nameUi = (UI.getChildControl)(contents, "Template_StaticText_PetName")
    ;
    (self.feedUi):SetPosX(contents:GetPosX() + btnFeed:GetPosX() + 50)
    ;
    (self.feedUi):SetPosY(contents:GetPosY() + btnFeed:GetPosY())
    self:updateFeedUi()
  end
  -- DECOMPILER ERROR: 3 unprocessed JMP targets
end

FGlobal_PetList_FeedClose = function()
  -- function num : 0_74 , upvalues : PetList
  PetList:showFeedUi(-1)
  PetList:showFeedAllUi(false)
end

PetList_useFeedOneItem = function()
  -- function num : 0_75 , upvalues : PetList
  local self = PetList
  if self.selectItemIndex < 0 then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_PETLISTNEW_SELECTFOODALERT"))
    return 
  end
  local petData = ToClient_getPetUnsealedDataByIndex(self.feedingPetIndex)
  local petNo = petData:getPcPetNo()
  local fullChargeFlag = isKeyPressed((CppEnums.VirtualKeyCode).KeyCode_SHIFT)
  ToClient_Pet_UseFeedItemByIndex(self.selectItemIndex, petNo)
end

PetList_useFeedFullItem = function()
  -- function num : 0_76 , upvalues : PetList
  local self = PetList
  if self.selectItemIndex < 0 then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_PETLISTNEW_SELECTFOODALERT"))
    return 
  end
  local petData = ToClient_getPetUnsealedDataByIndex(self.feedingPetIndex)
  local petNo = petData:getPcPetNo()
  ToClient_Pet_UseFeedItemFullByIndex(self.selectItemIndex, petNo)
end

PetList_useFeedItemToAll = function()
  -- function num : 0_77 , upvalues : PetList
  if PetList.selectItemIndex < 0 then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_PETLISTNEW_SELECTFOODALERT"))
    return 
  end
  ToClient_Pet_UseFeedItemFullAll(PetList.selectItemIndex)
end

PetList.showFeedAllUi = function(self, showFlag)
  -- function num : 0_78
  if showFlag == (self.feedAllUi):GetShow() then
    showFlag = false
  end
  local unsealPetCount = ToClient_getPetUnsealedList()
  if showFlag and unsealPetCount == 0 then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_PETLISTNEW_UNSEALALERT"))
    return 
  end
  ;
  (self.feedAllUi):SetShow(showFlag)
  self:initSelection()
  if showFlag then
    self:updateFeedAllUi()
    Panel_PetRestoreAll:SetPosX(Panel_Window_PetListNew:GetPosX() + Panel_Window_PetListNew:GetSizeX() + 10)
    Panel_PetRestoreAll:SetPosY(Panel_Window_PetListNew:GetPosY() + Panel_Window_PetListNew:GetSizeY() - Panel_PetRestoreAll:GetSizeY())
  end
end

PetList.registEventHandler = function(self)
  -- function num : 0_79
  (self.BTN_Close):addInputEvent("Mouse_LUp", "FGlobal_PetListNew_Close()")
  ;
  (self.BTN_Compose):addInputEvent("Mouse_LUp", "PetListNew_Compose()")
  ;
  (self.BTN_Compose):addInputEvent("Mouse_On", "PetListNew_SimpleTooltip(true, 4)")
  ;
  (self.BTN_Compose):addInputEvent("Mouse_Out", "PetListNew_SimpleTooltip(false)")
  ;
  (self.BTN_FeedAll):addInputEvent("Mouse_LUp", "HandleClicked_PetList_FeedAll()")
  ;
  (self.BTN_AllUnSeal):addInputEvent("Mouse_LUp", "FGlobal_HandleClicked_petControl_AllUnSeal()")
  ;
  (self.BTN_AllUnSeal):addInputEvent("Mouse_On", "PetListNew_SimpleTooltip(true, 5)")
  ;
  (self.BTN_AllUnSeal):addInputEvent("Mouse_Out", "PetListNew_SimpleTooltip(false)")
  ;
  (self.BTN_GroupSeal1):addInputEvent("Mouse_LUp", "FGlobal_HandleClicked_petControl_AllSeal(1)")
  ;
  (self.BTN_GroupSeal2):addInputEvent("Mouse_LUp", "FGlobal_HandleClicked_petControl_AllSeal(2)")
  ;
  (self.BTN_GroupSeal3):addInputEvent("Mouse_LUp", "FGlobal_HandleClicked_petControl_AllSeal(3)")
  ;
  (self.BTN_AllUnSeal):setButtonShortcuts("PANEL_SIMPLESHORTCUT_PET_ALLGROUP")
  ;
  (self.BTN_GroupSeal1):setButtonShortcuts("PANEL_SIMPLESHORTCUT_PET_GROUP1")
  ;
  (self.BTN_GroupSeal2):setButtonShortcuts("PANEL_SIMPLESHORTCUT_PET_GROUP2")
  ;
  (self.BTN_GroupSeal3):setButtonShortcuts("PANEL_SIMPLESHORTCUT_PET_GROUP3")
  ;
  (self.list2_PetList):registEvent((CppEnums.PAUIList2EventType).luaChangeContent, "PetListControlCreate")
  ;
  (self.list2_PetList):createChildContent((CppEnums.PAUIList2ElementManagerType).list)
end

FromClient_PetPromotion = function(fromWhereType, fromSlotNo)
  -- function num : 0_80
end

PetList.registMessageHandler = function(self)
  -- function num : 0_81
  registerEvent("FromClient_PetAddSealedList", "FromClient_PetUpdate")
  registerEvent("FromClient_PetDelSealedList", "FromClient_PetUpdate_ButtonShow")
  registerEvent("FromClient_PetDelList", "FromClient_PetUpdate")
  registerEvent("FromClient_InputPetName", "FromClient_PetUpdate")
  registerEvent("FromClient_PetAddSealedList", "FGlobal_PetListNew_NoPet")
  registerEvent("FromClient_PetInfoChanged", "FGlobal_PetListNew_NoPet")
  registerEvent("FromClient_PetInfoChanged", "FromClient_PetUpdate")
  registerEvent("FromClient_PetAddList", "FGlobal_PetListNew_NoPet")
  registerEvent("FromClient_PetPromotion", "FromClient_PetPromotion")
  registerEvent("FromClient_InventoryUpdate", "FromClient_PetList_UpdateFeedUi")
  ToClient_getPetInitLuaInfo()
end

registerEvent("FromClient_luaLoadComplete", "FromClient_luaLoadComplete_PetList")
FromClient_luaLoadComplete_PetList = function()
  -- function num : 0_82 , upvalues : PetList
  PetList:Initialize()
  PetList:initializeFeedUi()
  PetList:initializeFeedAllUi()
  PetList:showFeedUi(-1)
  PetList:showFeedAllUi(false)
  petSkillList_Close()
  FGlobal_PetListNew_NoPet()
  Panel_MyHouseNavi_Update(true)
  PetList:registEventHandler()
  PetList:registMessageHandler()
  petGroupList_Load()
  -- DECOMPILER ERROR at PC35: Confused about usage of register: R0 in 'UnsetPending'

  PetList.UnSealDATACount = ToClient_getPetUnsealedList()
  -- DECOMPILER ERROR at PC39: Confused about usage of register: R0 in 'UnsetPending'

  PetList.SealDATACount = ToClient_getPetSealedList()
end

PetList_VScroll_MoveTop = function()
  -- function num : 0_83 , upvalues : PetList
  (PetList.list2_PetList):moveTopIndex()
end

PetCompose_Simpletooltips = function(isShow, tipType)
  -- function num : 0_84 , upvalues : petCompose
  if not isShow then
    TooltipSimple_Hide()
    return 
  end
  if tipType == 0 then
    name = PAGetString(Defines.StringSheet_RESOURCE, "PANEL_PETCOMPOSE_CHANGESKILL")
    desc = PAGetString(Defines.StringSheet_GAME, "LUA_PETCOMPOSE_TOOLTIP_SELECTSKILL_DESC")
    control = petCompose.radioBtn_PetSkill_1
  else
    if tipType == 1 then
      name = PAGetString(Defines.StringSheet_RESOURCE, "PANEL_PETCOMPOSE_CHANGESKILL")
      desc = PAGetString(Defines.StringSheet_GAME, "LUA_PETCOMPOSE_TOOLTIP_SELECTSKILL_DESC")
      control = petCompose.radioBtn_PetSkill_2
    else
      if tipType == 2 then
        name = PAGetString(Defines.StringSheet_RESOURCE, "PANEL_PETCOMPOSE_NOTCHANGESKILL")
        desc = PAGetString(Defines.StringSheet_GAME, "LUA_PETCOMPOSE_TOOLTIP_RANDOMSKILL_DESC")
        control = petCompose.radioBtn_PetSkill_3
      else
        if tipType == 3 then
          name = PAGetString(Defines.StringSheet_RESOURCE, "PANEL_PETCOMPOSE_CHANGELOOK")
          desc = PAGetString(Defines.StringSheet_GAME, "LUA_PETCOMPOSE_TOOLTIP_SELECTLOOK_DESC")
          control = petCompose.radioBtn_PetLook_1
        else
          if tipType == 4 then
            name = PAGetString(Defines.StringSheet_RESOURCE, "PANEL_PETCOMPOSE_CHANGELOOK")
            desc = PAGetString(Defines.StringSheet_GAME, "LUA_PETCOMPOSE_TOOLTIP_SELECTLOOK_DESC")
            control = petCompose.radioBtn_PetLook_2
          else
            if tipType == 5 then
              name = PAGetString(Defines.StringSheet_RESOURCE, "PANEL_PETCOMPOSE_NOTCHANGELOOK")
              desc = PAGetString(Defines.StringSheet_GAME, "LUA_PETCOMPOSE_TOOLTIP_RANDOMLOOK_DESC")
              control = petCompose.radioBtn_PetLook_3
            end
          end
        end
      end
    end
  end
  TooltipSimple_Show(control, name, desc)
end

PetList_ChangePosition = function(isUp, index)
  -- function num : 0_85 , upvalues : PetList
  ToClient_changePetListOrder(isUp, index)
  PetList:SetPetList(true)
end

PetList.IsCheckGroupBtnByPetNo = function(self, petNo_s64, groupIndex)
  -- function num : 0_86
  local isCheck = (checkUnSealGroupList[groupIndex])[Int64toInt32(petNo_s64)]
  if isCheck == nil then
    isCheck = false
  end
  return isCheck
end

HandleClicked_PetGroupClear = function()
  -- function num : 0_87
  local messageBoxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_WARNING"), content = PAGetString(Defines.StringSheet_GAME, "LUA_PETLIST_GROUPCLEAR_ALERT"), functionYes = PaGlobal_PetList_GroupClear, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
  ;
  (MessageBox.showMessageBox)(messageBoxData)
end

HandleClicked_PetList_Feed = function(index)
  -- function num : 0_88 , upvalues : PetList
  PetList:showFeedUi(index)
end

HandleClicked_PetList_FeedClose = function()
  -- function num : 0_89 , upvalues : PetList
  PetList:showFeedUi(-1)
end

HandleClicked_PetList_FeedAll = function()
  -- function num : 0_90 , upvalues : PetList
  PetList:showFeedUi(-1)
  PetList:showFeedAllUi(true)
end

HandleClicked_PetList_FeedAllClose = function()
  -- function num : 0_91 , upvalues : PetList
  PetList:showFeedAllUi(false)
end

HandleOver_PetList_FeedItem_ShowTooltip = function(index)
  -- function num : 0_92 , upvalues : PetList
  local itemWrapper = ToClient_Pet_GetFeedItemByIndex(index)
  if itemWrapper == nil then
    return 
  end
  local itemSSW = itemWrapper:getStaticStatus()
  if itemSSW ~= nil then
    Panel_Tooltip_Item_SetPosition(index, ((PetList.feedSlot)[index]).icon, "petList")
    Panel_Tooltip_Item_Show(itemSSW, Panel_Window_PetListNew, true)
  end
end

HandleOver_PetList_FeedItem_HideTooltip = function()
  -- function num : 0_93
  Panel_Tooltip_Item_hideTooltip()
end

HandleOver_PetRestore_FeedItem_ShowTooltip = function(index)
  -- function num : 0_94 , upvalues : PetList
  local itemWrapper = ToClient_Pet_GetFeedItemByIndex(index)
  if itemWrapper == nil then
    return 
  end
  local itemSSW = itemWrapper:getStaticStatus()
  if itemSSW ~= nil then
    Panel_Tooltip_Item_SetPosition(index, ((PetList.feedAllSlot)[index]).icon, "petList")
    Panel_Tooltip_Item_Show(itemSSW, Panel_PetRestoreAll, true)
  end
end

HandleOver_PetRestore_FeedItem_HideTooltip = function()
  -- function num : 0_95
  Panel_Tooltip_Item_hideTooltip()
end

HandleClicked_PetList_FeedItem = function(index)
  -- function num : 0_96 , upvalues : PetList
  -- DECOMPILER ERROR at PC1: Confused about usage of register: R1 in 'UnsetPending'

  PetList.selectItemIndex = index
  ;
  (PetList.selectSlotBg):SetShow(true)
  ;
  (PetList.selectSlotBg):SetPosX(8 + 35 * index)
end

HandleClicked_PetList_FeedItemToAll = function(index)
  -- function num : 0_97 , upvalues : PetList
  -- DECOMPILER ERROR at PC1: Confused about usage of register: R1 in 'UnsetPending'

  PetList.selectItemIndex = index
  ;
  (PetList.selectAllSlotBg):SetShow(true)
  ;
  (PetList.selectAllSlotBg):SetPosX(18 + 38 * index)
end

PaGlobal_PetList_GroupClear = function()
  -- function num : 0_98 , upvalues : PetList
  -- DECOMPILER ERROR at PC2: Confused about usage of register: R0 in 'UnsetPending'

  checkUnSealGroupList[1] = {}
  -- DECOMPILER ERROR at PC5: Confused about usage of register: R0 in 'UnsetPending'

  checkUnSealGroupList[2] = {}
  -- DECOMPILER ERROR at PC8: Confused about usage of register: R0 in 'UnsetPending'

  checkUnSealGroupList[3] = {}
  petGroupList_Save()
  PetList:SetPetList()
end

PaGlobal_PetList_CheckGroup = function()
  -- function num : 0_99
  for ii = 1, 3 do
    for key,value in pairs(checkUnSealGroupList[ii]) do
      local isRemain = false
      if value == true then
        for sealPetIndex = 0, ToClient_getPetSealedList() - 1 do
          local petData = ToClient_getPetSealedDataByIndex(sealPetIndex)
          if key == Int64toInt32(petData._petNo) then
            isRemain = true
          end
        end
        for sealPetIndex = 0, ToClient_getPetUnsealedList() - 1 do
          local petData = ToClient_getPetUnsealedDataByIndex(sealPetIndex)
          if key == Int64toInt32(petData:getPcPetNo()) then
            isRemain = true
          end
        end
      end
      do
        do
          -- DECOMPILER ERROR at PC49: Confused about usage of register: R10 in 'UnsetPending'

          if isRemain == false then
            (checkUnSealGroupList[ii])[key] = false
          end
          -- DECOMPILER ERROR at PC54: Confused about usage of register: R10 in 'UnsetPending'

          if isRemain == true then
            (checkUnSealGroupList[ii])[key] = true
          end
          -- DECOMPILER ERROR at PC55: LeaveBlock: unexpected jumping out DO_STMT

        end
      end
    end
  end
end

test_pet = function()
  -- function num : 0_100
end


