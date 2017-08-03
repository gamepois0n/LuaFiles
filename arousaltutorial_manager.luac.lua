-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\tutorial\arousaltutorial_manager.luac 

-- params : ...
-- function num : 0
local UI_TM = CppEnums.TextMode
local VCK = CppEnums.VirtualKeyCode
local UI_color = Defines.Color
local UI_classType = CppEnums.ClassType
local IM = CppEnums.EProcessorInputMode
PaGlobal_ArousalTutorial_Manager = {_isDoingArousalTutorial = false}
local _stepNo = 0
local _updateTime = 0
local classType = nil
local get_ClassType = function()
  -- function num : 0_0 , upvalues : classType
  local selfPlayer = getSelfPlayer()
  if selfPlayer ~= nil then
    classType = selfPlayer:getClassType()
  end
end

get_ClassType()
Panel_ArousalTutorial:RegisterUpdateFunc("FGlobal_ArousalTutorial_UpdatePerFrame")
FGlobal_ArousalTutorial_UpdatePerFrame = function(deltaTime)
  -- function num : 0_1
  PaGlobal_ArousalTutorial_Manager:updatePerFrame(deltaTime)
end

-- DECOMPILER ERROR at PC28: Confused about usage of register: R9 in 'UnsetPending'

PaGlobal_ArousalTutorial_Manager.isDoingArousalTutorial = function(self)
  -- function num : 0_2
  return self._isDoingArousalTutorial
end

-- DECOMPILER ERROR at PC31: Confused about usage of register: R9 in 'UnsetPending'

PaGlobal_ArousalTutorial_Manager.setDoingArousalTutorial = function(self, bDoing)
  -- function num : 0_3
  self._isDoingArousalTutorial = bDoing
end

-- DECOMPILER ERROR at PC34: Confused about usage of register: R9 in 'UnsetPending'

PaGlobal_ArousalTutorial_Manager.endTutorial = function(self)
  -- function num : 0_4
  PaGlobal_ArousalTutorial_UiManager:hideAllTutorialUi()
  Panel_ArousalTutorial:SetShow(false, true)
  PaGlobal_ArousalTutorial_Manager:setDoingArousalTutorial(false)
end

local hasGuildQuest = ToClient_isProgressingGuildQuest()
-- DECOMPILER ERROR at PC39: Confused about usage of register: R10 in 'UnsetPending'

PaGlobal_ArousalTutorial_Manager.getStringResize = function(self, string1, string2, stringType)
  -- function num : 0_5
  local stringSizeY = 0
  if stringType == 1 then
    (((PaGlobal_ArousalTutorial_UiManager:getUiHeadlineMessage())._ui)._nextStep_1):SetText(string1)
    stringSizeY = (((PaGlobal_ArousalTutorial_UiManager:getUiHeadlineMessage())._ui)._nextStep_1):GetTextSizeY()
  else
    if stringType == 2 then
      (((PaGlobal_ArousalTutorial_UiManager:getUiHeadlineMessage())._ui)._nextStep_2):SetText(string1)
      stringSizeY = (((PaGlobal_ArousalTutorial_UiManager:getUiHeadlineMessage())._ui)._nextStep_2):GetTextSizeY()
    else
      if stringType == 3 then
        (((PaGlobal_ArousalTutorial_UiManager:getUiHeadlineMessage())._ui)._nextStep_3):SetText(string1)
        stringSizeY = (((PaGlobal_ArousalTutorial_UiManager:getUiHeadlineMessage())._ui)._nextStep_3):GetTextSizeY()
      else
        if stringType == 4 then
          (((PaGlobal_ArousalTutorial_UiManager:getUiHeadlineMessage())._ui)._nextStep_4):SetText(string1)
          stringSizeY = (((PaGlobal_ArousalTutorial_UiManager:getUiHeadlineMessage())._ui)._nextStep_4):GetTextSizeY()
        end
      end
    end
  end
  local stringSet = string1 .. "\n" .. string2
  if stringSizeY > 20 then
    stringSet = string1 .. string2
  else
    stringSet = string1 .. "\n" .. string2
  end
  return stringSet
end

local baseComboCount = 4
local usedSkillKey = {}
local usedSkillMatch = {}
for index = 0, baseComboCount - 1 do
  usedSkillKey[index] = nil
  usedSkillMatch[index] = false
end
local SkillComboCheck = {
[UI_classType.ClassType_Warrior] = {
[0] = {
{349, 350, 351, 705}
, 
{1712}
; 
[0] = {349, 350, 351, 705}
}
, 
[1] = {
{1712}
, 
{1765, 1766, 1767, 1768}
; 
[0] = {385}
}
}
, 
[UI_classType.ClassType_Ranger] = {
[0] = {
{1855}
; 
[0] = {1006, 1091, 1092, 1093, 375, 1102}
}
, 
[1] = {
{1855}
, 
{1875, 1876, 1877, 1878}
; 
[0] = {1029, 1119, 1250, 1251}
}
}
, 
[UI_classType.ClassType_Sorcerer] = {
[0] = {
{1769}
; 
[0] = {1056, 1202, 1203, 583}
}
, 
[1] = {
{1769}
, 
{1785, 1786, 1787, 1788}
; 
[0] = {1056, 1202, 1203, 583}
}
}
, 
[UI_classType.ClassType_Giant] = {
[0] = {
{1812}
; 
[0] = {1041, 1163, 1164, 1165, 1166, 296}
}
, 
[1] = {
{1812}
, 
{1830, 1831, 1832, 1833}
; 
[0] = {1042, 1167, 1168, 1169, 1170, 1171}
}
}
, 
[UI_classType.ClassType_Tamer] = {
[0] = {
{1898}
; 
[0] = {1070, 1232, 1233, 1234}
}
, 
[1] = {
{1898}
, 
{1913, 1914, 1915, 1916}
; 
[0] = {129, 130, 131, 132, 205}
}
}
, 
[UI_classType.ClassType_BladeMaster] = {
[0] = {
{1986}
; 
[0] = {1445, 1446, 1447}
}
, 
[1] = {
{1986}
, 
{2000, 2001, 2002, 2003}
; 
[0] = {1263, 1264, 1265, 418}
}
}
, 
[UI_classType.ClassType_BladeMasterWomen] = {
[0] = {
{2029}
; 
[0] = {1549, 1550, 1551, 1552, 1553}
}
, 
[1] = {
{2029}
, 
{2040, 2041, 2042, 2043}
; 
[0] = {1515, 1516, 1517, 1518, 1520}
}
}
, 
[UI_classType.ClassType_Valkyrie] = {
[0] = {
{1943}
; 
[0] = {732, 733, 734, 735, 770}
}
, 
[1] = {
{1943}
, 
{1963, 1964, 1965, 1966}
; 
[0] = {1497, 1498, 1499}
}
}
, 
[UI_classType.ClassType_Wizard] = {
[0] = {
{2209}
; 
[0] = {822, 823, 824, 825, 826}
}
, 
[1] = {
{2209}
, 
{2225, 2226, 2227, 2228}
; 
[0] = {834, 835, 836, 837, 838}
}
}
, 
[UI_classType.ClassType_WizardWomen] = {
[0] = {
{2163}
; 
[0] = {822, 823, 824, 825, 826}
}
, 
[1] = {
{2163}
, 
{2186, 2187, 2188, 2189}
; 
[0] = {834, 835, 836, 837, 838}
}
}
, 
[UI_classType.ClassType_NinjaMan] = {
[0] = {
{2077}
; 
[0] = {962, 963, 964, 965}
}
, 
[1] = {
{2077}
, 
{2104, 2105, 2106, 2107}
; 
[0] = {966, 967, 968, 969, 970}
}
}
, 
[UI_classType.ClassType_NinjaWomen] = {
[0] = {
{2120}
; 
[0] = {962, 963, 964, 965}
}
, 
[1] = {
{2120}
, 
{2154, 2155, 2156, 2157}
; 
[0] = {966, 967, 968, 969, 970}
}
}
, 
[UI_classType.ClassType_DarkElf] = {
[0] = {
{2380}
; 
[0] = {2268, 2340, 2363}
}
, 
[1] = {
{2380}
, 
{2391, 2392, 2393, 2394}
; 
[0] = {2269, 2270, 2271, 2272, 2273}
}
}
, 
[UI_classType.ClassType_Combattant] = {
[0] = {
{2558}
; 
[0] = {2486, 2487, 2488, 2489}
}
, 
[1] = {
{2558}
, 
{2562, 2563, 2564, 2565}
; 
[0] = {2486, 2487, 2488, 2489}
}
}
}
local questCheck = {
[UI_classType.ClassType_Warrior] = {
[0] = {questGroup = 285, questId = 6, clearMinigameIndex = 100, purposeText = PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_COMBO_Warrior_0_PurposeText"), 
combo = {PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_COMBO_Warrior_0_Combo_1"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_COMBO_Warrior_0_Combo_1"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_COMBO_Warrior_0_Combo_2")}
, 
comboKey = {PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_COMBO_Warrior_0_ComboKey_1"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_COMBO_Warrior_0_ComboKey_1"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_COMBO_Warrior_0_ComboKey_2")}
}
, 
[1] = {questGroup = 285, questId = 7, clearMinigameIndex = 101, purposeText = PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_COMBO_Warrior_1_PurposeText"), 
combo = {PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_COMBO_Warrior_1_Combo_1"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_COMBO_Warrior_0_Combo_2"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_COMBO_Warrior_1_Combo_2")}
, 
comboKey = {PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_COMBO_Warrior_1_ComboKey_1"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_COMBO_Warrior_0_ComboKey_2"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_COMBO_Warrior_1_ComboKey_2")}
}
}
, 
[UI_classType.ClassType_Ranger] = {
[0] = {questGroup = 293, questId = 6, clearMinigameIndex = 100, purposeText = PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_COMBO_Ranger_0_PurposeText"), 
combo = {PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_COMBO_Ranger_0_Combo_1"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_COMBO_Ranger_0_Combo_2")}
, 
comboKey = {PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_COMBO_Ranger_0_ComboKey_1"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_COMBO_Ranger_0_ComboKey_2")}
}
, 
[1] = {questGroup = 293, questId = 7, clearMinigameIndex = 101, purposeText = PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_COMBO_Ranger_1_PurposeText"), 
combo = {PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_COMBO_Ranger_1_Combo_1"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_COMBO_Ranger_1_Combo_2"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_COMBO_Ranger_1_Combo_3")}
, 
comboKey = {PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_COMBO_Ranger_1_ComboKey_1"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_COMBO_Ranger_1_ComboKey_2"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_COMBO_Ranger_1_ComboKey_3")}
}
}
, 
[UI_classType.ClassType_Sorcerer] = {
[0] = {questGroup = 287, questId = 6, clearMinigameIndex = 100, purposeText = PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_COMBO_Socceror_0_PurposeText"), 
combo = {PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_COMBO_Socceror_0_Combo_1"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_COMBO_Socceror_0_Combo_2")}
, 
comboKey = {PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_COMBO_Socceror_0_ComboKey_1"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_COMBO_Socceror_0_ComboKey_2")}
}
, 
[1] = {questGroup = 287, questId = 7, clearMinigameIndex = 101, purposeText = PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_COMBO_Socceror_1_PurposeText"), 
combo = {PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_COMBO_Socceror_0_Combo_1"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_COMBO_Socceror_0_Combo_2"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_COMBO_Socceror_0_Combo_3")}
, 
comboKey = {PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_COMBO_Socceror_0_ComboKey_1"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_COMBO_Socceror_0_ComboKey_2"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_COMBO_Socceror_0_ComboKey_1")}
}
}
, 
[UI_classType.ClassType_Giant] = {
[0] = {questGroup = 290, questId = 6, clearMinigameIndex = 100, purposeText = PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_COMBO_Giant_0_PurposeText"), 
combo = {PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_COMBO_Giant_0_Combo_1"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_COMBO_Giant_0_Combo_2")}
, 
comboKey = {PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_COMBO_Giant_0_ComboKey_1"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_COMBO_Giant_0_ComboKey_2")}
}
, 
[1] = {questGroup = 290, questId = 7, clearMinigameIndex = 101, purposeText = PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_COMBO_Giant_1_PurposeText"), 
combo = {PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_COMBO_Giant_1_Combo_1"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_COMBO_Giant_1_Combo_2"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_COMBO_Giant_1_Combo_3")}
, 
comboKey = {PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_COMBO_Giant_1_ComboKey_1"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_COMBO_Giant_1_ComboKey_2"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_COMBO_Giant_1_ComboKey_3")}
}
}
, 
[UI_classType.ClassType_Tamer] = {
[0] = {questGroup = 296, questId = 6, clearMinigameIndex = 100, purposeText = PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_COMBO_Tamer_0_PurposeText"), 
combo = {PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_COMBO_Tamer_0_Combo_1"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_COMBO_Tamer_0_Combo_2")}
, 
comboKey = {PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_COMBO_Tamer_0_ComboKey_1"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_COMBO_Ranger_1_ComboKey_2")}
}
, 
[1] = {questGroup = 296, questId = 7, clearMinigameIndex = 101, purposeText = PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_COMBO_Tamer_1_PurposeText"), 
combo = {PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_COMBO_Tamer_1_Combo_1"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_COMBO_Tamer_0_Combo_2"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_COMBO_Tamer_1_Combo_3")}
, 
comboKey = {PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_COMBO_Giant_0_ComboKey_1"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_COMBO_Ranger_1_ComboKey_2"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_COMBO_Ranger_1_ComboKey_3")}
}
}
, 
[UI_classType.ClassType_BladeMaster] = {
[0] = {questGroup = 319, questId = 6, clearMinigameIndex = 100, purposeText = PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_COMBO_BladeMaster_0_PurposeText"), 
combo = {PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_COMBO_BladeMaster_0_Combo_1"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_COMBO_BladeMaster_0_Combo_2")}
, 
comboKey = {PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_COMBO_BladeMaster_0_ComboKey_1"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_COMBO_BladeMaster_0_ComboKey_2")}
}
, 
[1] = {questGroup = 319, questId = 7, clearMinigameIndex = 101, purposeText = PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_COMBO_BladeMaster_1_PurposeText"), 
combo = {PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_COMBO_BladeMaster_1_Combo_1"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_COMBO_BladeMaster_1_Combo_2"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_COMBO_BladeMaster_1_Combo_3")}
, 
comboKey = {PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_COMBO_BladeMaster_1_ComboKey_1"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_COMBO_BladeMaster_1_ComboKey_2"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_COMBO_BladeMaster_1_ComboKey_3")}
}
}
, 
[UI_classType.ClassType_BladeMasterWomen] = {
[0] = {questGroup = 321, questId = 6, clearMinigameIndex = 100, purposeText = PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_COMBO_BladeMasterWoman_0_PurposeText"), 
combo = {PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_COMBO_BladeMasterWoman_0_Combo_1"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_COMBO_BladeMasterWoman_0_Combo_2")}
, 
comboKey = {PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_COMBO_BladeMasterWoman_0_ComboKey_1"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_COMBO_BladeMasterWoman_0_ComboKey_2")}
}
, 
[1] = {questGroup = 321, questId = 7, clearMinigameIndex = 101, purposeText = PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_COMBO_BladeMasterWoman_1_PurposeText"), 
combo = {PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_COMBO_BladeMasterWoman_1_Combo_1"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_COMBO_BladeMasterWoman_1_Combo_2"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_COMBO_BladeMasterWoman_1_Combo_3")}
, 
comboKey = {PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_COMBO_BladeMasterWoman_1_ComboKey_1"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_COMBO_BladeMasterWoman_1_ComboKey_2"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_COMBO_BladeMasterWoman_1_ComboKey_3")}
}
}
, 
[UI_classType.ClassType_Valkyrie] = {
[0] = {questGroup = 298, questId = 6, clearMinigameIndex = 100, purposeText = PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_COMBO_Valkyrie_0_PurposeText"), 
combo = {PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_COMBO_Valkyrie_0_Combo_1"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_COMBO_Valkyrie_0_Combo_2")}
, 
comboKey = {PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_COMBO_Valkyrie_0_ComboKey_1"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_COMBO_Valkyrie_0_ComboKey_2")}
}
, 
[1] = {questGroup = 298, questId = 7, clearMinigameIndex = 101, purposeText = PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_COMBO_Valkyrie_1_PurposeText"), 
combo = {PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_COMBO_Valkyrie_1_Combo_1"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_COMBO_Valkyrie_1_Combo_2"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_COMBO_Valkyrie_1_Combo_3")}
, 
comboKey = {PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_COMBO_Valkyrie_1_ComboKey_1"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_COMBO_Valkyrie_1_ComboKey_2"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_COMBO_Valkyrie_1_ComboKey_3")}
}
}
, 
[UI_classType.ClassType_Wizard] = {
[0] = {questGroup = 336, questId = 6, clearMinigameIndex = 100, purposeText = PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_WIZARD_PURPOSETEXT_0_0"), 
combo = {PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_WIZARD_COMBO_0_0"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_WIZARD_COMBO_0_1")}
, 
comboKey = {PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_WIZARD_COMBOKEY_0_0"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_WIZARD_COMBOKEY_0_1")}
}
, 
[1] = {questGroup = 336, questId = 7, clearMinigameIndex = 101, purposeText = PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_WIZARD_PURPOSETEXT_1_0"), 
combo = {PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_WIZARD_COMBO_1_0"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_WIZARD_COMBO_1_1"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_WIZARD_COMBO_1_2")}
, 
comboKey = {PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_WIZARD_COMBOKEY_1_0"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_WIZARD_COMBOKEY_1_1"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_WIZARD_COMBOKEY_1_2")}
}
}
, 
[UI_classType.ClassType_WizardWomen] = {
[0] = {questGroup = 334, questId = 6, clearMinigameIndex = 100, purposeText = PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_WITCH_PURPOSETEXT_0_0"), 
combo = {PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_WITCH_COMBO_0_0"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_WITCH_COMBO_0_1")}
, 
comboKey = {PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_WITCH_COMBOKEY_0_0"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_WITCH_COMBOKEY_0_1")}
}
, 
[1] = {questGroup = 334, questId = 7, clearMinigameIndex = 101, purposeText = PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_WITCH_PURPOSETEXT_1_0"), 
combo = {PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_WITCH_COMBO_1_0"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_WITCH_COMBO_1_1"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_WITCH_COMBO_1_2")}
, 
comboKey = {PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_WITCH_COMBOKEY_1_0"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_WITCH_COMBOKEY_1_1"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_WITCH_COMBOKEY_1_2")}
}
}
, 
[UI_classType.ClassType_NinjaMan] = {
[0] = {questGroup = 325, questId = 6, clearMinigameIndex = 100, purposeText = PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_COMBO_Ninja_0_PurposeText"), 
combo = {PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_COMBO_Ninja_0_Combo_1"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_COMBO_Ninja_0_Combo_2")}
, 
comboKey = {PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_COMBO_Ninja_0_ComboKey_1"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_COMBO_Ninja_0_ComboKey_2")}
}
, 
[1] = {questGroup = 325, questId = 7, clearMinigameIndex = 101, purposeText = PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_COMBO_Ninja_1_PurposeText"), 
combo = {PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_COMBO_Ninja_1_Combo_1"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_COMBO_Ninja_1_Combo_2"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_COMBO_Ninja_1_Combo_3")}
, 
comboKey = {PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_COMBO_Ninja_1_ComboKey_1"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_COMBO_Ninja_1_ComboKey_2"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_COMBO_Ninja_1_ComboKey_3")}
}
}
, 
[UI_classType.ClassType_NinjaWomen] = {
[0] = {questGroup = 327, questId = 6, clearMinigameIndex = 100, purposeText = PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_COMBO_NinjaWoman_0_PurposeText"), 
combo = {PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_COMBO_NinjaWoman_0_Combo_1"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_COMBO_NinjaWoman_0_Combo_2")}
, 
comboKey = {PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_COMBO_NinjaWoman_0_ComboKey_1"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_COMBO_NinjaWoman_0_ComboKey_2")}
}
, 
[1] = {questGroup = 327, questId = 7, clearMinigameIndex = 101, purposeText = PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_COMBO_NinjaWoman_1_PurposeText"), 
combo = {PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_COMBO_NinjaWoman_1_Combo_1"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_COMBO_NinjaWoman_1_Combo_2"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_COMBO_NinjaWoman_1_Combo_3")}
, 
comboKey = {PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_COMBO_NinjaWoman_1_ComboKey_1"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_COMBO_NinjaWoman_1_ComboKey_2"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_COMBO_NinjaWoman_1_ComboKey_3")}
}
}
, 
[UI_classType.ClassType_DarkElf] = {
[0] = {questGroup = 338, questId = 6, clearMinigameIndex = 100, purposeText = PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_COMBO_DarkElf_0_PurposeText"), 
combo = {PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_COMBO_DarkElf_0_Combo_1"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_COMBO_DarkElf_0_Combo_2")}
, 
comboKey = {PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_COMBO_DarkElf_0_ComboKey_1"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_COMBO_DarkElf_0_ComboKey_2")}
}
, 
[1] = {questGroup = 338, questId = 7, clearMinigameIndex = 101, purposeText = PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_COMBO_DarkElf_1_PurposeText"), 
combo = {PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_COMBO_DarkElf_1_Combo_1"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_COMBO_DarkElf_1_Combo_2"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_COMBO_DarkElf_1_Combo_3")}
, 
comboKey = {PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_COMBO_DarkElf_1_ComboKey_1"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_COMBO_DarkElf_1_ComboKey_2"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_COMBO_DarkElf_1_ComboKey_3")}
}
}
, 
[UI_classType.ClassType_Combattant] = {
[0] = {questGroup = 342, questId = 8, clearMinigameIndex = 100, purposeText = PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_COMBO_Combattant_0_PurposeText"), 
combo = {PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_COMBO_Combattant_0_Combo_1"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_COMBO_Combattant_0_Combo_2")}
, 
comboKey = {PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_COMBO_Combattant_0_ComboKey_1"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_COMBO_Combattant_0_ComboKey_2")}
}
, 
[1] = {questGroup = 342, questId = 9, clearMinigameIndex = 101, purposeText = PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_COMBO_Combattant_1_PurposeText"), 
combo = {PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_COMBO_Combattant_1_Combo_1"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_COMBO_Combattant_1_Combo_2"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_COMBO_Combattant_1_Combo_3")}
, 
comboKey = {PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_COMBO_Combattant_1_ComboKey_1"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_COMBO_Combattant_1_ComboKey_2"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_COMBO_Combattant_1_ComboKey_3")}
}
}
}
pushSkillKey = function(startIndex, endIndex)
  -- function num : 0_6 , upvalues : usedSkillKey
  if startIndex == endIndex then
    return 
  end
  if usedSkillKey[startIndex] ~= nil then
    pushSkillKey(startIndex + 1, endIndex)
  else
    return 
  end
  -- DECOMPILER ERROR at PC17: Confused about usage of register: R2 in 'UnsetPending'

  usedSkillKey[startIndex + 1] = usedSkillKey[startIndex]
end

local progressQuestIndex = 0
local _ramainTime = 0
compareSkillCombo = function(classType)
  -- function num : 0_7 , upvalues : progressQuestIndex, questCheck, SkillComboCheck, usedSkillKey, _ramainTime
  progressQuestIndex = -1
  for index = 0, #questCheck[classType] do
    if questList_hasProgressQuest(((questCheck[classType])[index]).questGroup, ((questCheck[classType])[index]).questId) then
      progressQuestIndex = index
      if not PaGlobal_ArousalTutorial_Manager:isDoingArousalTutorial() then
        PaGlobal_ArousalTutorial_Manager:startTutorial()
      end
    end
  end
  if progressQuestIndex == -1 then
    return 
  end
  local comboSkillKey = (SkillComboCheck[classType])[progressQuestIndex]
  local matchCount = 0
  for index = #comboSkillKey, 0, -1 do
    for key,value in pairs(comboSkillKey[index]) do
      if value == usedSkillKey[matchCount] then
        matchCount = matchCount + 1
        _ramainTime = 0
      end
    end
  end
  if #comboSkillKey + 1 == matchCount then
    return true
  end
  return false
end

local comboQuestClear = false
Tutorial_CheckUsedSkill = function(skillWrapper)
  -- function num : 0_8 , upvalues : SkillComboCheck, classType, questCheck, comboQuestClear, baseComboCount, usedSkillKey, progressQuestIndex
  if ((getSelfPlayer()):get()):getLevel() < 56 then
    return 
  end
  if SkillComboCheck[classType] == nil then
    return 
  end
  for index = 0, #questCheck[classType] do
    if questList_hasProgressQuest(((questCheck[classType])[index]).questGroup, ((questCheck[classType])[index]).questId) then
      local uiQuestInfo = ToClient_GetQuestInfo(((questCheck[classType])[index]).questGroup, ((questCheck[classType])[index]).questId)
      if uiQuestInfo == nil then
        _PA_ASSERT(false, "공존�\160 �\152 없는 퀘스트가 공존해서 문제�\128 생겼습니�\164. 완료했어�\188 하는 연계퀘스트를 억지�\156 초기화하�\160 다시 받으�\180 이럴 �\152 있습니다.")
        return 
      end
      local questCondition = uiQuestInfo:getDemandAt(0)
      if questCondition._destCount <= questCondition._currentCount then
        return 
      else
        if not PaGlobal_ArousalTutorial_Manager:isDoingArousalTutorial() then
          PaGlobal_ArousalTutorial_Manager:startTutorial()
        end
      end
    end
  end
  if comboQuestClear then
    return 
  end
  pushSkillKey(0, baseComboCount)
  local skillWrapper = selfPlayerUsedSkillFront()
  if skillWrapper ~= nil then
    local skillNo = skillWrapper:getSkillNo()
    local skillName = skillWrapper:getName()
    -- DECOMPILER ERROR at PC90: Confused about usage of register: R4 in 'UnsetPending'

    usedSkillKey[0] = skillNo
    selfPlayerUsedSkillPopFront()
  end
  do
    comboQuestClear = false
    if compareSkillCombo(classType) then
      request_clearMiniGame(((questCheck[classType])[progressQuestIndex]).clearMinigameIndex)
      ;
      (((PaGlobal_ArousalTutorial_UiManager:getUiHeadlineMessage())._ui)._purposeText):AddEffect("fUI_Gauge_BigWhite", false, 0, 0)
      comboQuestClear = true
    end
  end
end

ComboTutorial_NextStep_FontColorChange = function(index1, index2, index3, index4)
  -- function num : 0_9 , upvalues : UI_color
  if index1 then
    (((PaGlobal_ArousalTutorial_UiManager:getUiHeadlineMessage())._ui)._nextStep_1):SetFontColor(UI_color.C_FFB5FF6D)
    ;
    (((PaGlobal_ArousalTutorial_UiManager:getUiHeadlineMessage())._ui)._clearStep_1):SetShow(true)
    ;
    (((PaGlobal_ArousalTutorial_UiManager:getUiHeadlineMessage())._ui)._clearStep_1):AddEffect("UI_Check01", false, -2, 0)
    ;
    (((PaGlobal_ArousalTutorial_UiManager:getUiHeadlineMessage())._ui)._clearStep_1):AddEffect("fL_CheckSpark01", false, -2, 0)
  else
    ;
    (((PaGlobal_ArousalTutorial_UiManager:getUiHeadlineMessage())._ui)._nextStep_1):SetFontColor(UI_color.C_FFC4BEBE)
    ;
    (((PaGlobal_ArousalTutorial_UiManager:getUiHeadlineMessage())._ui)._clearStep_1):EraseAllEffect()
    ;
    (((PaGlobal_ArousalTutorial_UiManager:getUiHeadlineMessage())._ui)._clearStep_1):SetShow(false)
  end
  if index2 then
    (((PaGlobal_ArousalTutorial_UiManager:getUiHeadlineMessage())._ui)._nextStep_2):SetFontColor(UI_color.C_FFB5FF6D)
    ;
    (((PaGlobal_ArousalTutorial_UiManager:getUiHeadlineMessage())._ui)._clearStep_2):SetShow(true)
    ;
    (((PaGlobal_ArousalTutorial_UiManager:getUiHeadlineMessage())._ui)._clearStep_2):AddEffect("UI_Check01", false, -2, 0)
    ;
    (((PaGlobal_ArousalTutorial_UiManager:getUiHeadlineMessage())._ui)._clearStep_2):AddEffect("fL_CheckSpark01", false, -2, 0)
  else
    ;
    (((PaGlobal_ArousalTutorial_UiManager:getUiHeadlineMessage())._ui)._nextStep_2):SetFontColor(UI_color.C_FFC4BEBE)
    ;
    (((PaGlobal_ArousalTutorial_UiManager:getUiHeadlineMessage())._ui)._clearStep_2):EraseAllEffect()
    ;
    (((PaGlobal_ArousalTutorial_UiManager:getUiHeadlineMessage())._ui)._clearStep_2):SetShow(false)
  end
  if index3 then
    (((PaGlobal_ArousalTutorial_UiManager:getUiHeadlineMessage())._ui)._nextStep_3):SetFontColor(UI_color.C_FFB5FF6D)
    ;
    (((PaGlobal_ArousalTutorial_UiManager:getUiHeadlineMessage())._ui)._clearStep_3):SetShow(true)
    ;
    (((PaGlobal_ArousalTutorial_UiManager:getUiHeadlineMessage())._ui)._clearStep_3):AddEffect("UI_Check01", false, -2, 0)
    ;
    (((PaGlobal_ArousalTutorial_UiManager:getUiHeadlineMessage())._ui)._clearStep_3):AddEffect("fL_CheckSpark01", false, -2, 0)
  else
    ;
    (((PaGlobal_ArousalTutorial_UiManager:getUiHeadlineMessage())._ui)._nextStep_3):SetFontColor(UI_color.C_FFC4BEBE)
    ;
    (((PaGlobal_ArousalTutorial_UiManager:getUiHeadlineMessage())._ui)._clearStep_3):EraseAllEffect()
    ;
    (((PaGlobal_ArousalTutorial_UiManager:getUiHeadlineMessage())._ui)._clearStep_3):SetShow(false)
  end
  if index4 then
    (((PaGlobal_ArousalTutorial_UiManager:getUiHeadlineMessage())._ui)._nextStep_4):SetFontColor(UI_color.C_FFB5FF6D)
    ;
    (((PaGlobal_ArousalTutorial_UiManager:getUiHeadlineMessage())._ui)._clearStep_4):SetShow(true)
    ;
    (((PaGlobal_ArousalTutorial_UiManager:getUiHeadlineMessage())._ui)._clearStep_4):AddEffect("UI_Check01", false, -2, 0)
    ;
    (((PaGlobal_ArousalTutorial_UiManager:getUiHeadlineMessage())._ui)._clearStep_4):AddEffect("fL_CheckSpark01", false, -2, 0)
  else
    ;
    (((PaGlobal_ArousalTutorial_UiManager:getUiHeadlineMessage())._ui)._nextStep_4):SetFontColor(UI_color.C_FFC4BEBE)
    ;
    (((PaGlobal_ArousalTutorial_UiManager:getUiHeadlineMessage())._ui)._clearStep_4):EraseAllEffect()
    ;
    (((PaGlobal_ArousalTutorial_UiManager:getUiHeadlineMessage())._ui)._clearStep_4):SetShow(false)
  end
end

local comboSuccess = function(comboSkillIndex, usedSkillIndex)
  -- function num : 0_10 , upvalues : SkillComboCheck, classType, progressQuestIndex, usedSkillKey
  local comboSkillKey = (SkillComboCheck[classType])[progressQuestIndex]
  if comboSkillKey[comboSkillIndex] == nil then
    return 
  end
  for key,value in pairs(comboSkillKey[comboSkillIndex]) do
    if value == usedSkillKey[usedSkillIndex] then
      return true
    end
  end
  return false
end

local comboCheck = function()
  -- function num : 0_11 , upvalues : progressQuestIndex, usedSkillMatch, comboSuccess
  if progressQuestIndex < 0 then
    return 
  end
  if usedSkillMatch[3] then
    ComboTutorial_NextStep_FontColorChange(true, true, true, true)
  else
    if usedSkillMatch[2] then
      ComboTutorial_NextStep_FontColorChange(true, true, true, false)
      -- DECOMPILER ERROR at PC38: Confused about usage of register: R0 in 'UnsetPending'

      if comboSuccess(3, 0) and comboSuccess(2, 1) then
        usedSkillMatch[3] = true
      end
    else
      if usedSkillMatch[1] then
        ComboTutorial_NextStep_FontColorChange(true, true, false, false)
        -- DECOMPILER ERROR at PC63: Confused about usage of register: R0 in 'UnsetPending'

        if comboSuccess(2, 0) and comboSuccess(1, 1) then
          usedSkillMatch[2] = true
        end
      else
        if usedSkillMatch[0] then
          ComboTutorial_NextStep_FontColorChange(true, false, false, false)
          -- DECOMPILER ERROR at PC88: Confused about usage of register: R0 in 'UnsetPending'

          if comboSuccess(1, 0) and comboSuccess(0, 1) then
            usedSkillMatch[1] = true
          end
        else
          ComboTutorial_NextStep_FontColorChange(false, false, false, false)
        end
      end
    end
  end
  -- DECOMPILER ERROR at PC103: Confused about usage of register: R0 in 'UnsetPending'

  if comboSuccess(0, 0) then
    usedSkillMatch[0] = true
  end
end

local updateDeltaTime_ComboTutorial = function(deltaTime)
  -- function num : 0_12 , upvalues : _ramainTime, comboCheck, comboQuestClear, _stepNo, baseComboCount, usedSkillKey, usedSkillMatch
  _ramainTime = _ramainTime + deltaTime
  comboCheck()
  if comboQuestClear and _ramainTime > 3 then
    _stepNo = 0
    PaGlobal_ArousalTutorial_Manager:endTutorial()
  end
  if not comboQuestClear and _ramainTime > 3 then
    _ramainTime = 0
    for index = 0, baseComboCount - 1 do
      -- DECOMPILER ERROR at PC30: Confused about usage of register: R5 in 'UnsetPending'

      usedSkillKey[index] = nil
      -- DECOMPILER ERROR at PC32: Confused about usage of register: R5 in 'UnsetPending'

      usedSkillMatch[index] = false
    end
  end
end

-- DECOMPILER ERROR at PC1921: Confused about usage of register: R21 in 'UnsetPending'

PaGlobal_ArousalTutorial_Manager.startTutorial = function(self)
  -- function num : 0_13 , upvalues : questCheck, classType, comboQuestClear, UI_TM, UI_color, baseComboCount, usedSkillKey, usedSkillMatch, _stepNo
  if isFlushedUI() then
    return 
  end
  if PaGlobal_TutorialManager:isDoingTutorial() == true then
    PaGlobal_TutorialManager:endTutorial()
  end
  if PaGlobal_SummonBossTutorial_Manager:isDoingSummonBossTutorial() == true then
    PaGlobal_SummonBossTutorial_Manager:endTutorial()
  end
  Panel_ArousalTutorial:SetShow(true, true)
  PaGlobal_ArousalTutorial_Manager:setDoingArousalTutorial(true)
  ;
  (PaGlobal_ArousalTutorial_UiManager:getUiHeadlineMessage()):computePosAll()
  ;
  (((PaGlobal_ArousalTutorial_UiManager:getUiHeadlineMessage())._ui)._nextStep_1):SetShow(false)
  ;
  (((PaGlobal_ArousalTutorial_UiManager:getUiHeadlineMessage())._ui)._nextStep_2):SetShow(false)
  ;
  (((PaGlobal_ArousalTutorial_UiManager:getUiHeadlineMessage())._ui)._nextStep_3):SetShow(false)
  ;
  (((PaGlobal_ArousalTutorial_UiManager:getUiHeadlineMessage())._ui)._nextStep_4):SetShow(false)
  ;
  (((PaGlobal_ArousalTutorial_UiManager:getUiHeadlineMessage())._ui)._nextArrow_0):SetShow(false)
  ;
  (((PaGlobal_ArousalTutorial_UiManager:getUiHeadlineMessage())._ui)._nextArrow_1):SetShow(false)
  ;
  (((PaGlobal_ArousalTutorial_UiManager:getUiHeadlineMessage())._ui)._nextArrow_2):SetShow(false)
  ;
  (((PaGlobal_ArousalTutorial_UiManager:getUiHeadlineMessage())._ui)._clearStep_1):SetShow(false)
  ;
  (((PaGlobal_ArousalTutorial_UiManager:getUiHeadlineMessage())._ui)._clearStep_2):SetShow(false)
  ;
  (((PaGlobal_ArousalTutorial_UiManager:getUiHeadlineMessage())._ui)._clearStep_3):SetShow(false)
  ;
  (((PaGlobal_ArousalTutorial_UiManager:getUiHeadlineMessage())._ui)._clearStep_4):SetShow(false)
  ;
  (((PaGlobal_ArousalTutorial_UiManager:getUiHeadlineMessage())._ui)._clearStep_1):EraseAllEffect()
  ;
  (((PaGlobal_ArousalTutorial_UiManager:getUiHeadlineMessage())._ui)._clearStep_2):EraseAllEffect()
  ;
  (((PaGlobal_ArousalTutorial_UiManager:getUiHeadlineMessage())._ui)._clearStep_3):EraseAllEffect()
  ;
  (((PaGlobal_ArousalTutorial_UiManager:getUiHeadlineMessage())._ui)._clearStep_4):EraseAllEffect()
  ;
  (PaGlobal_ArousalTutorial_UiManager:getUiKeyButton()):setShowAll(false)
  ;
  (PaGlobal_ArousalTutorial_UiManager:getUiBlackSpirit()):hideBubbleKey()
  ;
  (((PaGlobal_ArousalTutorial_UiManager:getUiBlackSpirit())._ui)._obsidian):SetShow(false)
  ;
  (((PaGlobal_ArousalTutorial_UiManager:getUiBlackSpirit())._ui)._obsidian_B):SetShow(false)
  ;
  (((PaGlobal_ArousalTutorial_UiManager:getUiBlackSpirit())._ui)._obsidian_Text):SetShow(false)
  ;
  (((PaGlobal_ArousalTutorial_UiManager:getUiBlackSpirit())._ui)._obsidian_B_Left):SetShow(false)
  ;
  (((PaGlobal_ArousalTutorial_UiManager:getUiBlackSpirit())._ui)._obsidian_Text_2):SetShow(false)
  ;
  (((PaGlobal_ArousalTutorial_UiManager:getUiBlackSpirit())._ui)._bubbleKey_Ctrl):SetShow(false)
  ;
  (((PaGlobal_ArousalTutorial_UiManager:getUiBlackSpirit())._ui)._bubbleKey_T):SetShow(false)
  ;
  (((PaGlobal_ArousalTutorial_UiManager:getUiHeadlineMessage())._ui)._purposeText):SetText("")
  ;
  (((PaGlobal_ArousalTutorial_UiManager:getUiHeadlineMessage())._ui)._purposeText):SetShow(true)
  ;
  (((PaGlobal_ArousalTutorial_UiManager:getUiHeadlineMessage())._ui)._purposeText):SetAlpha(1)
  ;
  (((PaGlobal_ArousalTutorial_UiManager:getUiHeadlineMessage())._ui)._nextStep_1):SetAlpha(1)
  ;
  (((PaGlobal_ArousalTutorial_UiManager:getUiHeadlineMessage())._ui)._nextStep_2):SetAlpha(1)
  ;
  (((PaGlobal_ArousalTutorial_UiManager:getUiHeadlineMessage())._ui)._nextStep_3):SetAlpha(1)
  ;
  (((PaGlobal_ArousalTutorial_UiManager:getUiHeadlineMessage())._ui)._nextArrow_0):SetAlpha(1)
  ;
  (((PaGlobal_ArousalTutorial_UiManager:getUiHeadlineMessage())._ui)._nextArrow_1):SetAlpha(1)
  ;
  (PaGlobal_ArousalTutorial_UiManager:getUiKeyButton()):ButtonToggleAll(false)
  ;
  (PaGlobal_ArousalTutorial_UiManager:getUiKeyButton()):ButtonToggle("_button_Q", false)
  ;
  (PaGlobal_ArousalTutorial_UiManager:getUiKeyButton()):ButtonToggle("_button_W", false)
  ;
  (PaGlobal_ArousalTutorial_UiManager:getUiKeyButton()):ButtonToggle("_button_A", false)
  ;
  (PaGlobal_ArousalTutorial_UiManager:getUiKeyButton()):ButtonToggle("_button_S", false)
  ;
  (PaGlobal_ArousalTutorial_UiManager:getUiKeyButton()):ButtonToggle("_button_D", false)
  ;
  (PaGlobal_ArousalTutorial_UiManager:getUiKeyButton()):ButtonToggle("_button_Shift", false)
  -- DECOMPILER ERROR at PC335: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (((PaGlobal_ArousalTutorial_UiManager:getUiKeyButton())._ui)._prevUsingKey)._button_Q = false
  -- DECOMPILER ERROR at PC341: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (((PaGlobal_ArousalTutorial_UiManager:getUiKeyButton())._ui)._prevUsingKey)._button_W = false
  -- DECOMPILER ERROR at PC347: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (((PaGlobal_ArousalTutorial_UiManager:getUiKeyButton())._ui)._prevUsingKey)._button_A = false
  -- DECOMPILER ERROR at PC353: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (((PaGlobal_ArousalTutorial_UiManager:getUiKeyButton())._ui)._prevUsingKey)._button_S = false
  -- DECOMPILER ERROR at PC359: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (((PaGlobal_ArousalTutorial_UiManager:getUiKeyButton())._ui)._prevUsingKey)._button_D = false
  -- DECOMPILER ERROR at PC365: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (((PaGlobal_ArousalTutorial_UiManager:getUiKeyButton())._ui)._prevUsingKey)._button_F = false
  -- DECOMPILER ERROR at PC371: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (((PaGlobal_ArousalTutorial_UiManager:getUiKeyButton())._ui)._prevUsingKey)._button_Shift = false
  -- DECOMPILER ERROR at PC377: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (((PaGlobal_ArousalTutorial_UiManager:getUiKeyButton())._ui)._prevUsingKey)._m0 = false
  -- DECOMPILER ERROR at PC383: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (((PaGlobal_ArousalTutorial_UiManager:getUiKeyButton())._ui)._prevUsingKey)._m1 = false
  for index = 0, #questCheck[classType] do
    if questList_hasProgressQuest(((questCheck[classType])[index]).questGroup, ((questCheck[classType])[index]).questId) then
      (((PaGlobal_ArousalTutorial_UiManager:getUiHeadlineMessage())._ui)._purposeText):SetText(((questCheck[classType])[index]).purposeText)
      -- DECOMPILER ERROR at PC423: Confused about usage of register: R5 in 'UnsetPending'

      progressQuestNo._group = ((questCheck[classType])[index]).questGroup
      -- DECOMPILER ERROR at PC430: Confused about usage of register: R5 in 'UnsetPending'

      progressQuestNo._id = ((questCheck[classType])[index]).questId
      comboQuestClear = false
      for ii = 1, #((questCheck[classType])[index]).combo do
        if (((questCheck[classType])[index]).combo)[ii] ~= nil then
          if ii == 1 then
            (((PaGlobal_ArousalTutorial_UiManager:getUiHeadlineMessage())._ui)._nextStep_1):SetTextMode(UI_TM.eTextMode_AutoWrap)
            ;
            (((PaGlobal_ArousalTutorial_UiManager:getUiHeadlineMessage())._ui)._nextStep_1):SetText(PaGlobal_ArousalTutorial_Manager:getStringResize((((questCheck[classType])[index]).combo)[ii], (((questCheck[classType])[index]).comboKey)[ii], 1))
            ;
            (((PaGlobal_ArousalTutorial_UiManager:getUiHeadlineMessage())._ui)._nextStep_1):SetFontColor(UI_color.C_FFC4BEBE)
            ;
            (((PaGlobal_ArousalTutorial_UiManager:getUiHeadlineMessage())._ui)._nextStep_1):SetShow(true)
          else
            if ii == 2 then
              (((PaGlobal_ArousalTutorial_UiManager:getUiHeadlineMessage())._ui)._nextStep_2):SetTextMode(UI_TM.eTextMode_AutoWrap)
              ;
              (((PaGlobal_ArousalTutorial_UiManager:getUiHeadlineMessage())._ui)._nextStep_2):SetText(PaGlobal_ArousalTutorial_Manager:getStringResize((((questCheck[classType])[index]).combo)[ii], (((questCheck[classType])[index]).comboKey)[ii], 2))
              ;
              (((PaGlobal_ArousalTutorial_UiManager:getUiHeadlineMessage())._ui)._nextStep_2):SetShow(true)
              ;
              (((PaGlobal_ArousalTutorial_UiManager:getUiHeadlineMessage())._ui)._nextStep_2):SetFontColor(UI_color.C_FFC4BEBE)
              ;
              (((PaGlobal_ArousalTutorial_UiManager:getUiHeadlineMessage())._ui)._nextArrow_0):SetShow(true)
            else
              if ii == 3 then
                (((PaGlobal_ArousalTutorial_UiManager:getUiHeadlineMessage())._ui)._nextStep_3):SetTextMode(UI_TM.eTextMode_AutoWrap)
                ;
                (((PaGlobal_ArousalTutorial_UiManager:getUiHeadlineMessage())._ui)._nextStep_3):SetText(PaGlobal_ArousalTutorial_Manager:getStringResize((((questCheck[classType])[index]).combo)[ii], (((questCheck[classType])[index]).comboKey)[ii], 3))
                ;
                (((PaGlobal_ArousalTutorial_UiManager:getUiHeadlineMessage())._ui)._nextStep_3):SetShow(true)
                ;
                (((PaGlobal_ArousalTutorial_UiManager:getUiHeadlineMessage())._ui)._nextStep_3):SetFontColor(UI_color.C_FFC4BEBE)
                ;
                (((PaGlobal_ArousalTutorial_UiManager:getUiHeadlineMessage())._ui)._nextArrow_1):SetShow(true)
              else
                if ii == 4 then
                  (((PaGlobal_ArousalTutorial_UiManager:getUiHeadlineMessage())._ui)._nextStep_4):SetTextMode(UI_TM.eTextMode_AutoWrap)
                  ;
                  (((PaGlobal_ArousalTutorial_UiManager:getUiHeadlineMessage())._ui)._nextStep_4):SetText(PaGlobal_ArousalTutorial_Manager:getStringResize((((questCheck[classType])[index]).combo)[ii], (((questCheck[classType])[index]).comboKey)[ii], 4))
                  ;
                  (((PaGlobal_ArousalTutorial_UiManager:getUiHeadlineMessage())._ui)._nextStep_4):SetShow(true)
                  ;
                  (((PaGlobal_ArousalTutorial_UiManager:getUiHeadlineMessage())._ui)._nextStep_4):SetFontColor(UI_color.C_FFC4BEBE)
                  ;
                  (((PaGlobal_ArousalTutorial_UiManager:getUiHeadlineMessage())._ui)._nextArrow_2):SetShow(true)
                end
              end
            end
          end
        end
      end
    end
  end
  for index = 0, baseComboCount - 1 do
    -- DECOMPILER ERROR at PC689: Confused about usage of register: R5 in 'UnsetPending'

    usedSkillKey[index] = nil
    -- DECOMPILER ERROR at PC691: Confused about usage of register: R5 in 'UnsetPending'

    usedSkillMatch[index] = false
  end
  _stepNo = 101
end

-- DECOMPILER ERROR at PC1927: Confused about usage of register: R21 in 'UnsetPending'

PaGlobal_ArousalTutorial_Manager.updatePerFrame = function(self, deltaTime)
  -- function num : 0_14 , upvalues : _stepNo, updateDeltaTime_ComboTutorial
  if _stepNo == 101 then
    updateDeltaTime_ComboTutorial(deltaTime)
  end
end


