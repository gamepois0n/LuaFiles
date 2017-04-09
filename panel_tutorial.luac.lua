-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\widget\tutorial\panel_tutorial.luac 

-- params : ...
-- function num : 0
local UI_TM = CppEnums.TextMode
local VCK = CppEnums.VirtualKeyCode
local UI_color = Defines.Color
local UI_classType = CppEnums.ClassType
local IM = CppEnums.EProcessorInputMode
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
local updateDeltaTime_QuestWidget_Step1 = function(deltaTime)
  -- function num : 0_1 , upvalues : _updateTime
  (((PaGlobal_TutorialUiManager:getUiBlackSpirit())._ui)._obsidian):SetShow(true)
  ;
  (((PaGlobal_TutorialUiManager:getUiBlackSpirit())._ui)._obsidian_B):SetShow(false)
  ;
  (((PaGlobal_TutorialUiManager:getUiBlackSpirit())._ui)._obsidian_B_Left):SetShow(true)
  ;
  (((PaGlobal_TutorialUiManager:getUiBlackSpirit())._ui)._obsidian_Text):SetShow(true)
  ;
  (((PaGlobal_TutorialUiManager:getUiBlackSpirit())._ui)._obsidian_Text_2):SetShow(true)
  ;
  (((PaGlobal_TutorialUiManager:getUiBlackSpirit())._ui)._obsidian):SetPosX(Panel_CheckedQuest:GetPosX() - (((PaGlobal_TutorialUiManager:getUiBlackSpirit())._ui)._obsidian):GetSizeX() - 50)
  ;
  (((PaGlobal_TutorialUiManager:getUiBlackSpirit())._ui)._obsidian):SetPosY(Panel_CheckedQuest:GetPosY() + (((PaGlobal_TutorialUiManager:getUiBlackSpirit())._ui)._obsidian):GetSizeY())
  local obsidianX = (((PaGlobal_TutorialUiManager:getUiBlackSpirit())._ui)._obsidian):GetPosX()
  local obsidianY = (((PaGlobal_TutorialUiManager:getUiBlackSpirit())._ui)._obsidian):GetPosY()
  ;
  (((PaGlobal_TutorialUiManager:getUiBlackSpirit())._ui)._obsidian_Text):SetText(PAGetString(Defines.StringSheet_GAME, "TUTORIAL_QUESTWIDGET_GUIDE_1"))
  ;
  (((PaGlobal_TutorialUiManager:getUiBlackSpirit())._ui)._obsidian_Text_2):SetText(PAGetString(Defines.StringSheet_GAME, "TUTORIAL_QUESTWIDGET_GUIDE_2"))
  local textSizeX = (((PaGlobal_TutorialUiManager:getUiBlackSpirit())._ui)._obsidian_Text):GetTextSizeX()
  local textSizeY = (((PaGlobal_TutorialUiManager:getUiBlackSpirit())._ui)._obsidian_Text):GetTextSizeY()
  ;
  (((PaGlobal_TutorialUiManager:getUiBlackSpirit())._ui)._obsidian_B_Left):SetSize((((PaGlobal_TutorialUiManager:getUiBlackSpirit())._ui)._obsidian_Text_2):GetTextSizeX() + 20, textSizeY + (((PaGlobal_TutorialUiManager:getUiBlackSpirit())._ui)._obsidian_Text_2):GetTextSizeY() + 45)
  ;
  (((PaGlobal_TutorialUiManager:getUiBlackSpirit())._ui)._obsidian_B_Left):SetPosX(obsidianX - (((PaGlobal_TutorialUiManager:getUiBlackSpirit())._ui)._obsidian_B_Left):GetSizeX() - 50)
  ;
  (((PaGlobal_TutorialUiManager:getUiBlackSpirit())._ui)._obsidian_B_Left):SetPosY(obsidianY - 80)
  ;
  (((PaGlobal_TutorialUiManager:getUiBlackSpirit())._ui)._obsidian_Text):SetSize(textSizeX, textSizeY)
  local obsidianB_X = (((PaGlobal_TutorialUiManager:getUiBlackSpirit())._ui)._obsidian_B_Left):GetPosX()
  local obsidianB_Y = (((PaGlobal_TutorialUiManager:getUiBlackSpirit())._ui)._obsidian_B_Left):GetPosY()
  ;
  (((PaGlobal_TutorialUiManager:getUiBlackSpirit())._ui)._obsidian_Text):SetPosX(obsidianB_X + 3)
  ;
  (((PaGlobal_TutorialUiManager:getUiBlackSpirit())._ui)._obsidian_Text):SetPosY(obsidianB_Y + 5)
  ;
  (((PaGlobal_TutorialUiManager:getUiBlackSpirit())._ui)._obsidian_Text_2):SetPosX(obsidianB_X + 3)
  ;
  (((PaGlobal_TutorialUiManager:getUiBlackSpirit())._ui)._obsidian_Text_2):SetPosY((((PaGlobal_TutorialUiManager:getUiBlackSpirit())._ui)._obsidian_Text):GetPosY() + textSizeY + 5)
  _updateTime = _updateTime + deltaTime
end

local hasGuildQuest = ToClient_isProgressingGuildQuest()
local summonText = {}
local updateDeltaTime_SummonBoss_Step1 = function(deltaTime)
  -- function num : 0_2 , upvalues : summonText, _updateTime, _stepNo
  (((PaGlobal_TutorialUiManager:getUiBlackSpirit())._ui)._obsidian):SetShow(true)
  ;
  (((PaGlobal_TutorialUiManager:getUiBlackSpirit())._ui)._obsidian_B):SetShow(true)
  ;
  (((PaGlobal_TutorialUiManager:getUiBlackSpirit())._ui)._obsidian_B_Left):SetShow(false)
  ;
  (((PaGlobal_TutorialUiManager:getUiBlackSpirit())._ui)._obsidian_Text):SetShow(true)
  ;
  (((PaGlobal_TutorialUiManager:getUiBlackSpirit())._ui)._obsidian_Text_2):SetShow(true)
  ;
  (((PaGlobal_TutorialUiManager:getUiBlackSpirit())._ui)._bubbleKey_I):SetShow(true)
  ;
  (((PaGlobal_TutorialUiManager:getUiBlackSpirit())._ui)._obsidian_Text):SetText(summonText[0])
  ;
  (((PaGlobal_TutorialUiManager:getUiBlackSpirit())._ui)._obsidian_Text_2):SetText(summonText[1])
  local textSizeX = (((PaGlobal_TutorialUiManager:getUiBlackSpirit())._ui)._obsidian_Text):GetTextSizeX()
  local textSizeY = (((PaGlobal_TutorialUiManager:getUiBlackSpirit())._ui)._obsidian_Text):GetTextSizeY()
  local scrX = getScreenSizeX()
  local scrY = getScreenSizeY()
  ;
  (((PaGlobal_TutorialUiManager:getUiBlackSpirit())._ui)._obsidian_B):SetSize((((PaGlobal_TutorialUiManager:getUiBlackSpirit())._ui)._obsidian_Text_2):GetTextSizeX() + (((PaGlobal_TutorialUiManager:getUiBlackSpirit())._ui)._bubbleKey_I):GetSizeX() + 30, (((PaGlobal_TutorialUiManager:getUiBlackSpirit())._ui)._obsidian_Text_2):GetTextSizeY() + textSizeY + 40)
  ;
  (((PaGlobal_TutorialUiManager:getUiBlackSpirit())._ui)._obsidian_Text):SetSize(textSizeX, textSizeY)
  ;
  (((PaGlobal_TutorialUiManager:getUiBlackSpirit())._ui)._obsidian):SetPosX(scrX / 2 - (((PaGlobal_TutorialUiManager:getUiBlackSpirit())._ui)._obsidian_B):GetSizeX() / 2 - (((PaGlobal_TutorialUiManager:getUiBlackSpirit())._ui)._obsidian):GetSizeX() / 2)
  ;
  (((PaGlobal_TutorialUiManager:getUiBlackSpirit())._ui)._obsidian):SetPosY(100)
  local obsidianX = (((PaGlobal_TutorialUiManager:getUiBlackSpirit())._ui)._obsidian):GetPosX()
  local obsidianY = (((PaGlobal_TutorialUiManager:getUiBlackSpirit())._ui)._obsidian):GetPosY()
  ;
  (((PaGlobal_TutorialUiManager:getUiBlackSpirit())._ui)._obsidian_B):SetPosX(obsidianX + 80)
  ;
  (((PaGlobal_TutorialUiManager:getUiBlackSpirit())._ui)._obsidian_B):SetPosY(obsidianY + 30)
  local obsidianB_X = (((PaGlobal_TutorialUiManager:getUiBlackSpirit())._ui)._obsidian_B):GetPosX()
  local obsidianB_Y = (((PaGlobal_TutorialUiManager:getUiBlackSpirit())._ui)._obsidian_B):GetPosY()
  ;
  (((PaGlobal_TutorialUiManager:getUiBlackSpirit())._ui)._obsidian_Text):SetPosX(obsidianB_X + 3)
  ;
  (((PaGlobal_TutorialUiManager:getUiBlackSpirit())._ui)._obsidian_Text):SetPosY(obsidianB_Y + 25)
  ;
  (((PaGlobal_TutorialUiManager:getUiBlackSpirit())._ui)._bubbleKey_I):SetPosX((((PaGlobal_TutorialUiManager:getUiBlackSpirit())._ui)._obsidian_Text_2):GetPosX() + (((PaGlobal_TutorialUiManager:getUiBlackSpirit())._ui)._obsidian_Text_2):GetTextSizeX() + 10)
  ;
  (((PaGlobal_TutorialUiManager:getUiBlackSpirit())._ui)._bubbleKey_I):SetPosY((((PaGlobal_TutorialUiManager:getUiBlackSpirit())._ui)._obsidian_Text_2):GetPosY())
  ;
  (((PaGlobal_TutorialUiManager:getUiBlackSpirit())._ui)._obsidian_Text_2):SetPosX(obsidianB_X + 3)
  ;
  (((PaGlobal_TutorialUiManager:getUiBlackSpirit())._ui)._obsidian_Text_2):SetPosY((((PaGlobal_TutorialUiManager:getUiBlackSpirit())._ui)._obsidian_Text):GetPosY() + textSizeY + 5)
  local invenOpenCheck = Panel_Window_Inventory:GetShow()
  _updateTime = _updateTime + deltaTime
  if invenOpenCheck or _updateTime > 20 then
    if not Panel_Window_Inventory:GetShow() then
      InventoryWindow_Show()
    end
    audioPostEvent_SystemUi(4, 12)
    _updateTime = 0
    _stepNo = 52
    ;
    (((PaGlobal_TutorialUiManager:getUiBlackSpirit())._ui)._bubbleKey_I):SetShow(false)
  end
end

local updateDeltaTime_SummonBoss_Step2 = function(deltaTime)
  -- function num : 0_3 , upvalues : summonText, _updateTime, _stepNo
  (((PaGlobal_TutorialUiManager:getUiBlackSpirit())._ui)._obsidian):SetShow(true)
  ;
  (((PaGlobal_TutorialUiManager:getUiBlackSpirit())._ui)._obsidian_B):SetShow(true)
  ;
  (((PaGlobal_TutorialUiManager:getUiBlackSpirit())._ui)._obsidian_B_Left):SetShow(false)
  ;
  (((PaGlobal_TutorialUiManager:getUiBlackSpirit())._ui)._obsidian_Text):SetShow(true)
  ;
  (((PaGlobal_TutorialUiManager:getUiBlackSpirit())._ui)._obsidian_Text_2):SetShow(true)
  ;
  (((PaGlobal_TutorialUiManager:getUiBlackSpirit())._ui)._obsidian_Text):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_25"))
  ;
  (((PaGlobal_TutorialUiManager:getUiBlackSpirit())._ui)._obsidian_Text_2):SetText(summonText[2])
  local textSizeX = (((PaGlobal_TutorialUiManager:getUiBlackSpirit())._ui)._obsidian_Text):GetTextSizeX()
  local textSizeY = (((PaGlobal_TutorialUiManager:getUiBlackSpirit())._ui)._obsidian_Text):GetTextSizeY()
  local scrX = getScreenSizeX()
  local scrY = getScreenSizeY()
  ;
  (((PaGlobal_TutorialUiManager:getUiBlackSpirit())._ui)._obsidian_B):SetSize((((PaGlobal_TutorialUiManager:getUiBlackSpirit())._ui)._obsidian_Text_2):GetTextSizeX() + 20, (((PaGlobal_TutorialUiManager:getUiBlackSpirit())._ui)._obsidian_Text_2):GetTextSizeY() + textSizeY + 40)
  ;
  (((PaGlobal_TutorialUiManager:getUiBlackSpirit())._ui)._obsidian_Text):SetSize(textSizeX, textSizeY)
  ;
  (((PaGlobal_TutorialUiManager:getUiBlackSpirit())._ui)._obsidian):SetPosX(scrX / 2 - (((PaGlobal_TutorialUiManager:getUiBlackSpirit())._ui)._obsidian_B):GetSizeX() / 2 - (((PaGlobal_TutorialUiManager:getUiBlackSpirit())._ui)._obsidian):GetSizeX() / 2)
  ;
  (((PaGlobal_TutorialUiManager:getUiBlackSpirit())._ui)._obsidian):SetPosY(100)
  local obsidianX = (((PaGlobal_TutorialUiManager:getUiBlackSpirit())._ui)._obsidian):GetPosX()
  local obsidianY = (((PaGlobal_TutorialUiManager:getUiBlackSpirit())._ui)._obsidian):GetPosY()
  ;
  (((PaGlobal_TutorialUiManager:getUiBlackSpirit())._ui)._obsidian_B):SetPosX(obsidianX + 80)
  ;
  (((PaGlobal_TutorialUiManager:getUiBlackSpirit())._ui)._obsidian_B):SetPosY(obsidianY + 30)
  local obsidianB_X = (((PaGlobal_TutorialUiManager:getUiBlackSpirit())._ui)._obsidian_B):GetPosX()
  local obsidianB_Y = (((PaGlobal_TutorialUiManager:getUiBlackSpirit())._ui)._obsidian_B):GetPosY()
  ;
  (((PaGlobal_TutorialUiManager:getUiBlackSpirit())._ui)._obsidian_Text):SetPosX(obsidianB_X + 3)
  ;
  (((PaGlobal_TutorialUiManager:getUiBlackSpirit())._ui)._obsidian_Text):SetPosY(obsidianB_Y + 25)
  ;
  (((PaGlobal_TutorialUiManager:getUiBlackSpirit())._ui)._obsidian_Text_2):SetPosX(obsidianB_X + 3)
  ;
  (((PaGlobal_TutorialUiManager:getUiBlackSpirit())._ui)._obsidian_Text_2):SetPosY((((PaGlobal_TutorialUiManager:getUiBlackSpirit())._ui)._obsidian_Text):GetPosY() + textSizeY + 5)
  if FGlobal_FirstSummonItemUse() then
    _updateTime = 0
    _stepNo = 53
  end
  if not Panel_Window_Inventory:GetShow() then
    _updateTime = 0
    _stepNo = 0
    PaGlobal_TutorialManager:closeTutorial()
  end
end

local updateDeltaTime_SummonBoss_Step3 = function(deltaTime)
  -- function num : 0_4 , upvalues : _updateTime, _stepNo
  _updateTime = _updateTime + deltaTime
  ;
  (((PaGlobal_TutorialUiManager:getUiBlackSpirit())._ui)._obsidian):SetShow(true)
  ;
  (((PaGlobal_TutorialUiManager:getUiBlackSpirit())._ui)._obsidian_B):SetShow(true)
  ;
  (((PaGlobal_TutorialUiManager:getUiBlackSpirit())._ui)._obsidian_B_Left):SetShow(false)
  ;
  (((PaGlobal_TutorialUiManager:getUiBlackSpirit())._ui)._obsidian_Text):SetShow(true)
  ;
  (((PaGlobal_TutorialUiManager:getUiBlackSpirit())._ui)._obsidian_Text_2):SetShow(true)
  ;
  (((PaGlobal_TutorialUiManager:getUiBlackSpirit())._ui)._obsidian_Text):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_27"))
  ;
  (((PaGlobal_TutorialUiManager:getUiBlackSpirit())._ui)._obsidian_Text_2):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_28"))
  local textSizeX = (((PaGlobal_TutorialUiManager:getUiBlackSpirit())._ui)._obsidian_Text):GetTextSizeX()
  local textSizeY = (((PaGlobal_TutorialUiManager:getUiBlackSpirit())._ui)._obsidian_Text):GetTextSizeY()
  local scrX = getScreenSizeX()
  local scrY = getScreenSizeY()
  ;
  (((PaGlobal_TutorialUiManager:getUiBlackSpirit())._ui)._obsidian_B):SetSize((((PaGlobal_TutorialUiManager:getUiBlackSpirit())._ui)._obsidian_Text_2):GetTextSizeX() + 20, (((PaGlobal_TutorialUiManager:getUiBlackSpirit())._ui)._obsidian_Text_2):GetTextSizeY() + textSizeY + 40)
  ;
  (((PaGlobal_TutorialUiManager:getUiBlackSpirit())._ui)._obsidian_Text):SetSize(textSizeX, textSizeY)
  ;
  (((PaGlobal_TutorialUiManager:getUiBlackSpirit())._ui)._obsidian):SetPosX(scrX / 2 - (((PaGlobal_TutorialUiManager:getUiBlackSpirit())._ui)._obsidian_B):GetSizeX() / 2 - (((PaGlobal_TutorialUiManager:getUiBlackSpirit())._ui)._obsidian):GetSizeX() / 2)
  ;
  (((PaGlobal_TutorialUiManager:getUiBlackSpirit())._ui)._obsidian):SetPosY(100)
  local obsidianX = (((PaGlobal_TutorialUiManager:getUiBlackSpirit())._ui)._obsidian):GetPosX()
  local obsidianY = (((PaGlobal_TutorialUiManager:getUiBlackSpirit())._ui)._obsidian):GetPosY()
  ;
  (((PaGlobal_TutorialUiManager:getUiBlackSpirit())._ui)._obsidian_B):SetPosX(obsidianX + 80)
  ;
  (((PaGlobal_TutorialUiManager:getUiBlackSpirit())._ui)._obsidian_B):SetPosY(obsidianY + 30)
  local obsidianB_X = (((PaGlobal_TutorialUiManager:getUiBlackSpirit())._ui)._obsidian_B):GetPosX()
  local obsidianB_Y = (((PaGlobal_TutorialUiManager:getUiBlackSpirit())._ui)._obsidian_B):GetPosY()
  ;
  (((PaGlobal_TutorialUiManager:getUiBlackSpirit())._ui)._obsidian_Text):SetPosX(obsidianB_X + 3)
  ;
  (((PaGlobal_TutorialUiManager:getUiBlackSpirit())._ui)._obsidian_Text):SetPosY(obsidianB_Y + 25)
  ;
  (((PaGlobal_TutorialUiManager:getUiBlackSpirit())._ui)._obsidian_Text_2):SetPosX(obsidianB_X + 3)
  ;
  (((PaGlobal_TutorialUiManager:getUiBlackSpirit())._ui)._obsidian_Text_2):SetPosY((((PaGlobal_TutorialUiManager:getUiBlackSpirit())._ui)._obsidian_Text):GetPosY() + textSizeY + 5)
  if _updateTime > 8 then
    _updateTime = 0
    _stepNo = 0
    PaGlobal_TutorialManager:endTutorial()
  end
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
}
pushSkillKey = function(startIndex, endIndex)
  -- function num : 0_5 , upvalues : usedSkillKey
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
  -- function num : 0_6 , upvalues : progressQuestIndex, questCheck, SkillComboCheck, usedSkillKey, _ramainTime
  progressQuestIndex = -1
  for index = 0, #questCheck[classType] do
    if questList_hasProgressQuest(((questCheck[classType])[index]).questGroup, ((questCheck[classType])[index]).questId) then
      progressQuestIndex = index
      if not PaGlobal_TutorialManager:isDoingTutorial() then
        FGlobal_CharacterSkill_Tutorial()
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
  -- function num : 0_7 , upvalues : SkillComboCheck, classType, questCheck, comboQuestClear, baseComboCount, usedSkillKey, progressQuestIndex
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
        if not PaGlobal_TutorialManager:isDoingTutorial() then
          FGlobal_CharacterSkill_Tutorial()
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
    -- DECOMPILER ERROR at PC89: Confused about usage of register: R4 in 'UnsetPending'

    usedSkillKey[0] = skillNo
    selfPlayerUsedSkillPopFront()
  end
  do
    comboQuestClear = false
    if compareSkillCombo(classType) then
      request_clearMiniGame(((questCheck[classType])[progressQuestIndex]).clearMinigameIndex)
      ;
      (((PaGlobal_TutorialUiManager:getUiHeadlineMessage())._ui)._purposeText):AddEffect("fUI_Gauge_BigWhite", false, 0, 0)
      comboQuestClear = true
    end
  end
end

ComboTutorial_NextStep_FontColorChange = function(index1, index2, index3, index4)
  -- function num : 0_8 , upvalues : UI_color
  if index1 then
    (((PaGlobal_TutorialUiManager:getUiHeadlineMessage())._ui)._nextStep_1):SetFontColor(UI_color.C_FFB5FF6D)
    ;
    (((PaGlobal_TutorialUiManager:getUiHeadlineMessage())._ui)._clearStep_1):SetShow(true)
    ;
    (((PaGlobal_TutorialUiManager:getUiHeadlineMessage())._ui)._clearStep_1):AddEffect("UI_Check01", false, -2, 0)
    ;
    (((PaGlobal_TutorialUiManager:getUiHeadlineMessage())._ui)._clearStep_1):AddEffect("fL_CheckSpark01", false, -2, 0)
  else
    ;
    (((PaGlobal_TutorialUiManager:getUiHeadlineMessage())._ui)._nextStep_1):SetFontColor(UI_color.C_FFC4BEBE)
    ;
    (((PaGlobal_TutorialUiManager:getUiHeadlineMessage())._ui)._clearStep_1):EraseAllEffect()
    ;
    (((PaGlobal_TutorialUiManager:getUiHeadlineMessage())._ui)._clearStep_1):SetShow(false)
  end
  if index2 then
    (((PaGlobal_TutorialUiManager:getUiHeadlineMessage())._ui)._nextStep_2):SetFontColor(UI_color.C_FFB5FF6D)
    ;
    (((PaGlobal_TutorialUiManager:getUiHeadlineMessage())._ui)._clearStep_2):SetShow(true)
    ;
    (((PaGlobal_TutorialUiManager:getUiHeadlineMessage())._ui)._clearStep_2):AddEffect("UI_Check01", false, -2, 0)
    ;
    (((PaGlobal_TutorialUiManager:getUiHeadlineMessage())._ui)._clearStep_2):AddEffect("fL_CheckSpark01", false, -2, 0)
  else
    ;
    (((PaGlobal_TutorialUiManager:getUiHeadlineMessage())._ui)._nextStep_2):SetFontColor(UI_color.C_FFC4BEBE)
    ;
    (((PaGlobal_TutorialUiManager:getUiHeadlineMessage())._ui)._clearStep_2):EraseAllEffect()
    ;
    (((PaGlobal_TutorialUiManager:getUiHeadlineMessage())._ui)._clearStep_2):SetShow(false)
  end
  if index3 then
    (((PaGlobal_TutorialUiManager:getUiHeadlineMessage())._ui)._nextStep_3):SetFontColor(UI_color.C_FFB5FF6D)
    ;
    (((PaGlobal_TutorialUiManager:getUiHeadlineMessage())._ui)._clearStep_3):SetShow(true)
    ;
    (((PaGlobal_TutorialUiManager:getUiHeadlineMessage())._ui)._clearStep_3):AddEffect("UI_Check01", false, -2, 0)
    ;
    (((PaGlobal_TutorialUiManager:getUiHeadlineMessage())._ui)._clearStep_3):AddEffect("fL_CheckSpark01", false, -2, 0)
  else
    ;
    (((PaGlobal_TutorialUiManager:getUiHeadlineMessage())._ui)._nextStep_3):SetFontColor(UI_color.C_FFC4BEBE)
    ;
    (((PaGlobal_TutorialUiManager:getUiHeadlineMessage())._ui)._clearStep_3):EraseAllEffect()
    ;
    (((PaGlobal_TutorialUiManager:getUiHeadlineMessage())._ui)._clearStep_3):SetShow(false)
  end
  if index4 then
    (((PaGlobal_TutorialUiManager:getUiHeadlineMessage())._ui)._nextStep_4):SetFontColor(UI_color.C_FFB5FF6D)
    ;
    (((PaGlobal_TutorialUiManager:getUiHeadlineMessage())._ui)._clearStep_4):SetShow(true)
    ;
    (((PaGlobal_TutorialUiManager:getUiHeadlineMessage())._ui)._clearStep_4):AddEffect("UI_Check01", false, -2, 0)
    ;
    (((PaGlobal_TutorialUiManager:getUiHeadlineMessage())._ui)._clearStep_4):AddEffect("fL_CheckSpark01", false, -2, 0)
  else
    ;
    (((PaGlobal_TutorialUiManager:getUiHeadlineMessage())._ui)._nextStep_4):SetFontColor(UI_color.C_FFC4BEBE)
    ;
    (((PaGlobal_TutorialUiManager:getUiHeadlineMessage())._ui)._clearStep_4):EraseAllEffect()
    ;
    (((PaGlobal_TutorialUiManager:getUiHeadlineMessage())._ui)._clearStep_4):SetShow(false)
  end
end

local comboSuccess = function(comboSkillIndex, usedSkillIndex)
  -- function num : 0_9 , upvalues : SkillComboCheck, classType, progressQuestIndex, usedSkillKey
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
  -- function num : 0_10 , upvalues : progressQuestIndex, usedSkillMatch, comboSuccess
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
  -- function num : 0_11 , upvalues : _ramainTime, comboCheck, comboQuestClear, _stepNo, baseComboCount, usedSkillKey, usedSkillMatch
  _ramainTime = _ramainTime + deltaTime
  comboCheck()
  if comboQuestClear and _ramainTime > 3 then
    _stepNo = 0
    PaGlobal_TutorialManager:closeTutorial()
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

FGlobal_Tutorial_CallSpirit = function()
  -- function num : 0_12
  (PaGlobal_TutorialUiManager:getUiBlackSpirit()):showSuggestCallSpiritUi()
end

FGlobal_BossSummon_Alert = function(index)
  -- function num : 0_13 , upvalues : summonText, _stepNo
  if isFlushedUI() then
    return 
  end
  Panel_Tutorial:SetShow(true, true)
  PaGlobal_TutorialUiManager:hideAllTutorialUi()
  ;
  (((PaGlobal_TutorialUiManager:getUiBlackSpirit())._ui)._obsidian):SetShow(true)
  ;
  (((PaGlobal_TutorialUiManager:getUiBlackSpirit())._ui)._obsidian_B):SetShow(false)
  ;
  (((PaGlobal_TutorialUiManager:getUiBlackSpirit())._ui)._obsidian_B_Left):SetShow(true)
  ;
  (((PaGlobal_TutorialUiManager:getUiBlackSpirit())._ui)._obsidian_Text):SetShow(true)
  ;
  (((PaGlobal_TutorialUiManager:getUiBlackSpirit())._ui)._obsidian_Text_2):SetShow(true)
  ;
  (((PaGlobal_TutorialUiManager:getUiBlackSpirit())._ui)._bubbleKey_R):SetShow(true)
  ;
  (((PaGlobal_TutorialUiManager:getUiBlackSpirit())._ui)._obsidian):EraseAllEffect()
  ;
  (((PaGlobal_TutorialUiManager:getUiBlackSpirit())._ui)._obsidian):AddEffect("fUI_DarkSpirit_Tutorial", true, 0, 0)
  ;
  (PaGlobal_TutorialUiManager:getUiKeyButton()):ButtonToggleAll(false)
  ;
  (PaGlobal_TutorialUiManager:getUiKeyButton()):setShowAll(false)
  ;
  (PaGlobal_TutorialUiManager:getUiBlackSpirit()):hideBubbleKey()
  -- DECOMPILER ERROR at PC104: Confused about usage of register: R1 in 'UnsetPending'

  if index == 0 then
    summonText[0] = PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_23")
    -- DECOMPILER ERROR at PC111: Confused about usage of register: R1 in 'UnsetPending'

    summonText[1] = PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_24")
    -- DECOMPILER ERROR at PC118: Confused about usage of register: R1 in 'UnsetPending'

    summonText[2] = PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_26")
  else
    -- DECOMPILER ERROR at PC128: Confused about usage of register: R1 in 'UnsetPending'

    if index == 1 then
      summonText[0] = PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_29")
      -- DECOMPILER ERROR at PC135: Confused about usage of register: R1 in 'UnsetPending'

      summonText[1] = PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_30")
      -- DECOMPILER ERROR at PC142: Confused about usage of register: R1 in 'UnsetPending'

      summonText[2] = PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_31")
    else
      -- DECOMPILER ERROR at PC152: Confused about usage of register: R1 in 'UnsetPending'

      if index == 2 then
        summonText[0] = PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_50")
        -- DECOMPILER ERROR at PC159: Confused about usage of register: R1 in 'UnsetPending'

        summonText[1] = PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_51")
        -- DECOMPILER ERROR at PC166: Confused about usage of register: R1 in 'UnsetPending'

        summonText[2] = PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_52")
      end
    end
  end
  _stepNo = 51
end

FGlobal_QuestWidgetTutorial = function()
  -- function num : 0_14 , upvalues : _stepNo
  if isFlushedUI() then
    return 
  end
  Panel_Tutorial:SetShow(true, true)
  PaGlobal_TutorialUiManager:hideAllTutorialUi()
  ;
  (((PaGlobal_TutorialUiManager:getUiBlackSpirit())._ui)._obsidian):SetShow(true)
  ;
  (((PaGlobal_TutorialUiManager:getUiBlackSpirit())._ui)._obsidian_B):SetShow(false)
  ;
  (((PaGlobal_TutorialUiManager:getUiBlackSpirit())._ui)._obsidian_B_Left):SetShow(true)
  ;
  (((PaGlobal_TutorialUiManager:getUiBlackSpirit())._ui)._obsidian_Text):SetShow(true)
  ;
  (((PaGlobal_TutorialUiManager:getUiBlackSpirit())._ui)._obsidian_Text_2):SetShow(true)
  ;
  (((PaGlobal_TutorialUiManager:getUiBlackSpirit())._ui)._obsidian):EraseAllEffect()
  ;
  (((PaGlobal_TutorialUiManager:getUiBlackSpirit())._ui)._obsidian):AddEffect("fUI_DarkSpirit_Tutorial", true, 0, 0)
  ;
  (PaGlobal_TutorialUiManager:getUiKeyButton()):ButtonToggleAll(false)
  ;
  (PaGlobal_TutorialUiManager:getUiKeyButton()):setShowAll(true)
  ;
  (PaGlobal_TutorialUiManager:getUiBlackSpirit()):hideBubbleKey()
  _stepNo = 27
end

FGlobal_CharacterSkill_Tutorial = function()
  -- function num : 0_15 , upvalues : questCheck, classType, comboQuestClear, UI_TM, UI_color, baseComboCount, usedSkillKey, usedSkillMatch, _stepNo
  -- DECOMPILER ERROR at PC1: Confused about usage of register: R0 in 'UnsetPending'

  PaGlobal_TutorialManager._isReformedSection = false
  if isFlushedUI() then
    return 
  end
  Panel_Tutorial:SetShow(true, true)
  ;
  (PaGlobal_TutorialUiManager:getUiHeadlineMessage()):computePosAll()
  ;
  (((PaGlobal_TutorialUiManager:getUiHeadlineMessage())._ui)._nextStep_1):SetShow(false)
  ;
  (((PaGlobal_TutorialUiManager:getUiHeadlineMessage())._ui)._nextStep_2):SetShow(false)
  ;
  (((PaGlobal_TutorialUiManager:getUiHeadlineMessage())._ui)._nextStep_3):SetShow(false)
  ;
  (((PaGlobal_TutorialUiManager:getUiHeadlineMessage())._ui)._nextStep_4):SetShow(false)
  ;
  (((PaGlobal_TutorialUiManager:getUiHeadlineMessage())._ui)._nextArrow_0):SetShow(false)
  ;
  (((PaGlobal_TutorialUiManager:getUiHeadlineMessage())._ui)._nextArrow_1):SetShow(false)
  ;
  (((PaGlobal_TutorialUiManager:getUiHeadlineMessage())._ui)._nextArrow_2):SetShow(false)
  ;
  (((PaGlobal_TutorialUiManager:getUiHeadlineMessage())._ui)._clearStep_1):SetShow(false)
  ;
  (((PaGlobal_TutorialUiManager:getUiHeadlineMessage())._ui)._clearStep_2):SetShow(false)
  ;
  (((PaGlobal_TutorialUiManager:getUiHeadlineMessage())._ui)._clearStep_3):SetShow(false)
  ;
  (((PaGlobal_TutorialUiManager:getUiHeadlineMessage())._ui)._clearStep_4):SetShow(false)
  ;
  (((PaGlobal_TutorialUiManager:getUiHeadlineMessage())._ui)._clearStep_1):EraseAllEffect()
  ;
  (((PaGlobal_TutorialUiManager:getUiHeadlineMessage())._ui)._clearStep_2):EraseAllEffect()
  ;
  (((PaGlobal_TutorialUiManager:getUiHeadlineMessage())._ui)._clearStep_3):EraseAllEffect()
  ;
  (((PaGlobal_TutorialUiManager:getUiHeadlineMessage())._ui)._clearStep_4):EraseAllEffect()
  ;
  (PaGlobal_TutorialUiManager:getUiKeyButton()):setShowAll(false)
  ;
  (PaGlobal_TutorialUiManager:getUiBlackSpirit()):hideBubbleKey()
  ;
  (((PaGlobal_TutorialUiManager:getUiBlackSpirit())._ui)._obsidian):SetShow(false)
  ;
  (((PaGlobal_TutorialUiManager:getUiBlackSpirit())._ui)._obsidian_B):SetShow(false)
  ;
  (((PaGlobal_TutorialUiManager:getUiBlackSpirit())._ui)._obsidian_Text):SetShow(false)
  ;
  (((PaGlobal_TutorialUiManager:getUiBlackSpirit())._ui)._obsidian_B_Left):SetShow(false)
  ;
  (((PaGlobal_TutorialUiManager:getUiBlackSpirit())._ui)._obsidian_Text_2):SetShow(false)
  ;
  (((PaGlobal_TutorialUiManager:getUiBlackSpirit())._ui)._bubbleKey_Ctrl):SetShow(false)
  ;
  (((PaGlobal_TutorialUiManager:getUiBlackSpirit())._ui)._bubbleKey_T):SetShow(false)
  ;
  (((PaGlobal_TutorialUiManager:getUiHeadlineMessage())._ui)._purposeText):SetText("")
  ;
  (((PaGlobal_TutorialUiManager:getUiHeadlineMessage())._ui)._purposeText):SetShow(true)
  ;
  (((PaGlobal_TutorialUiManager:getUiHeadlineMessage())._ui)._purposeText):SetAlpha(1)
  ;
  (((PaGlobal_TutorialUiManager:getUiHeadlineMessage())._ui)._nextStep_1):SetAlpha(1)
  ;
  (((PaGlobal_TutorialUiManager:getUiHeadlineMessage())._ui)._nextStep_2):SetAlpha(1)
  ;
  (((PaGlobal_TutorialUiManager:getUiHeadlineMessage())._ui)._nextStep_3):SetAlpha(1)
  ;
  (((PaGlobal_TutorialUiManager:getUiHeadlineMessage())._ui)._nextArrow_0):SetAlpha(1)
  ;
  (((PaGlobal_TutorialUiManager:getUiHeadlineMessage())._ui)._nextArrow_1):SetAlpha(1)
  ;
  (PaGlobal_TutorialUiManager:getUiKeyButton()):ButtonToggleAll(false)
  ;
  (PaGlobal_TutorialUiManager:getUiKeyButton()):ButtonToggle("_button_Q", false)
  ;
  (PaGlobal_TutorialUiManager:getUiKeyButton()):ButtonToggle("_button_W", false)
  ;
  (PaGlobal_TutorialUiManager:getUiKeyButton()):ButtonToggle("_button_A", false)
  ;
  (PaGlobal_TutorialUiManager:getUiKeyButton()):ButtonToggle("_button_S", false)
  ;
  (PaGlobal_TutorialUiManager:getUiKeyButton()):ButtonToggle("_button_D", false)
  ;
  (PaGlobal_TutorialUiManager:getUiKeyButton()):ButtonToggle("_button_Shift", false)
  -- DECOMPILER ERROR at PC317: Confused about usage of register: R0 in 'UnsetPending'

  ;
  (((PaGlobal_TutorialUiManager:getUiKeyButton())._ui)._prevUsingKey)._button_Q = false
  -- DECOMPILER ERROR at PC323: Confused about usage of register: R0 in 'UnsetPending'

  ;
  (((PaGlobal_TutorialUiManager:getUiKeyButton())._ui)._prevUsingKey)._button_W = false
  -- DECOMPILER ERROR at PC329: Confused about usage of register: R0 in 'UnsetPending'

  ;
  (((PaGlobal_TutorialUiManager:getUiKeyButton())._ui)._prevUsingKey)._button_A = false
  -- DECOMPILER ERROR at PC335: Confused about usage of register: R0 in 'UnsetPending'

  ;
  (((PaGlobal_TutorialUiManager:getUiKeyButton())._ui)._prevUsingKey)._button_S = false
  -- DECOMPILER ERROR at PC341: Confused about usage of register: R0 in 'UnsetPending'

  ;
  (((PaGlobal_TutorialUiManager:getUiKeyButton())._ui)._prevUsingKey)._button_D = false
  -- DECOMPILER ERROR at PC347: Confused about usage of register: R0 in 'UnsetPending'

  ;
  (((PaGlobal_TutorialUiManager:getUiKeyButton())._ui)._prevUsingKey)._button_F = false
  -- DECOMPILER ERROR at PC353: Confused about usage of register: R0 in 'UnsetPending'

  ;
  (((PaGlobal_TutorialUiManager:getUiKeyButton())._ui)._prevUsingKey)._button_Shift = false
  -- DECOMPILER ERROR at PC359: Confused about usage of register: R0 in 'UnsetPending'

  ;
  (((PaGlobal_TutorialUiManager:getUiKeyButton())._ui)._prevUsingKey)._m0 = false
  -- DECOMPILER ERROR at PC365: Confused about usage of register: R0 in 'UnsetPending'

  ;
  (((PaGlobal_TutorialUiManager:getUiKeyButton())._ui)._prevUsingKey)._m1 = false
  for index = 0, #questCheck[classType] do
    if questList_hasProgressQuest(((questCheck[classType])[index]).questGroup, ((questCheck[classType])[index]).questId) then
      (((PaGlobal_TutorialUiManager:getUiHeadlineMessage())._ui)._purposeText):SetText(((questCheck[classType])[index]).purposeText)
      -- DECOMPILER ERROR at PC405: Confused about usage of register: R4 in 'UnsetPending'

      progressQuestNo._group = ((questCheck[classType])[index]).questGroup
      -- DECOMPILER ERROR at PC412: Confused about usage of register: R4 in 'UnsetPending'

      progressQuestNo._id = ((questCheck[classType])[index]).questId
      comboQuestClear = false
      for ii = 1, #((questCheck[classType])[index]).combo do
        if (((questCheck[classType])[index]).combo)[ii] ~= nil then
          if ii == 1 then
            (((PaGlobal_TutorialUiManager:getUiHeadlineMessage())._ui)._nextStep_1):SetTextMode(UI_TM.eTextMode_AutoWrap)
            ;
            (((PaGlobal_TutorialUiManager:getUiHeadlineMessage())._ui)._nextStep_1):SetText(PaGlobal_TutorialManager:getStringResize((((questCheck[classType])[index]).combo)[ii], (((questCheck[classType])[index]).comboKey)[ii], 1))
            ;
            (((PaGlobal_TutorialUiManager:getUiHeadlineMessage())._ui)._nextStep_1):SetFontColor(UI_color.C_FFC4BEBE)
            ;
            (((PaGlobal_TutorialUiManager:getUiHeadlineMessage())._ui)._nextStep_1):SetShow(true)
          else
            if ii == 2 then
              (((PaGlobal_TutorialUiManager:getUiHeadlineMessage())._ui)._nextStep_2):SetTextMode(UI_TM.eTextMode_AutoWrap)
              ;
              (((PaGlobal_TutorialUiManager:getUiHeadlineMessage())._ui)._nextStep_2):SetText(PaGlobal_TutorialManager:getStringResize((((questCheck[classType])[index]).combo)[ii], (((questCheck[classType])[index]).comboKey)[ii], 2))
              ;
              (((PaGlobal_TutorialUiManager:getUiHeadlineMessage())._ui)._nextStep_2):SetShow(true)
              ;
              (((PaGlobal_TutorialUiManager:getUiHeadlineMessage())._ui)._nextStep_2):SetFontColor(UI_color.C_FFC4BEBE)
              ;
              (((PaGlobal_TutorialUiManager:getUiHeadlineMessage())._ui)._nextArrow_0):SetShow(true)
            else
              if ii == 3 then
                (((PaGlobal_TutorialUiManager:getUiHeadlineMessage())._ui)._nextStep_3):SetTextMode(UI_TM.eTextMode_AutoWrap)
                ;
                (((PaGlobal_TutorialUiManager:getUiHeadlineMessage())._ui)._nextStep_3):SetText(PaGlobal_TutorialManager:getStringResize((((questCheck[classType])[index]).combo)[ii], (((questCheck[classType])[index]).comboKey)[ii], 3))
                ;
                (((PaGlobal_TutorialUiManager:getUiHeadlineMessage())._ui)._nextStep_3):SetShow(true)
                ;
                (((PaGlobal_TutorialUiManager:getUiHeadlineMessage())._ui)._nextStep_3):SetFontColor(UI_color.C_FFC4BEBE)
                ;
                (((PaGlobal_TutorialUiManager:getUiHeadlineMessage())._ui)._nextArrow_1):SetShow(true)
              else
                if ii == 4 then
                  (((PaGlobal_TutorialUiManager:getUiHeadlineMessage())._ui)._nextStep_4):SetTextMode(UI_TM.eTextMode_AutoWrap)
                  ;
                  (((PaGlobal_TutorialUiManager:getUiHeadlineMessage())._ui)._nextStep_4):SetText(PaGlobal_TutorialManager:getStringResize((((questCheck[classType])[index]).combo)[ii], (((questCheck[classType])[index]).comboKey)[ii], 4))
                  ;
                  (((PaGlobal_TutorialUiManager:getUiHeadlineMessage())._ui)._nextStep_4):SetShow(true)
                  ;
                  (((PaGlobal_TutorialUiManager:getUiHeadlineMessage())._ui)._nextStep_4):SetFontColor(UI_color.C_FFC4BEBE)
                  ;
                  (((PaGlobal_TutorialUiManager:getUiHeadlineMessage())._ui)._nextArrow_2):SetShow(true)
                end
              end
            end
          end
        end
      end
    end
  end
  for index = 0, baseComboCount - 1 do
    -- DECOMPILER ERROR at PC671: Confused about usage of register: R4 in 'UnsetPending'

    usedSkillKey[index] = nil
    -- DECOMPILER ERROR at PC673: Confused about usage of register: R4 in 'UnsetPending'

    usedSkillMatch[index] = false
  end
  _stepNo = 101
end

local summonBossQuest = {
groupId = {104, 105}
, 
questId = {2, 6}
}
FGlobal_Tutorial_BossSummon_Close = function()
  -- function num : 0_16 , upvalues : summonBossQuest
  if not PaGlobal_TutorialManager:isDoingTutorial() then
    return 
  end
  for index = 1, #summonBossQuest.groupId do
    local bossTutorialProgress = questList_hasProgressQuest((summonBossQuest.groupId)[index], (summonBossQuest.questId)[index])
    if bossTutorialProgress then
      local uiQuestInfo = ToClient_GetQuestInfo((summonBossQuest.groupId)[index], (summonBossQuest.questId)[index])
      local questCondition = uiQuestInfo:getDemandAt(0)
      if questCondition._destCount <= questCondition._currentCount then
        PaGlobal_TutorialManager:closeTutorial()
        return 
      end
    end
  end
end

Panel_Tutorial_doStep = function(deltaTime)
  -- function num : 0_17 , upvalues : _stepNo, updateDeltaTime_SummonBoss_Step1, updateDeltaTime_SummonBoss_Step2, updateDeltaTime_SummonBoss_Step3, updateDeltaTime_ComboTutorial
  if PaGlobal_TutorialManager:isDoingTutorial() == true then
    PvpMode_ShowButton(false)
  end
  if _stepNo == 51 then
    updateDeltaTime_SummonBoss_Step1(deltaTime)
  else
    if _stepNo == 52 then
      updateDeltaTime_SummonBoss_Step2(deltaTime)
    else
      if _stepNo == 53 then
        updateDeltaTime_SummonBoss_Step3(deltaTime)
      else
        if _stepNo == 101 then
          updateDeltaTime_ComboTutorial(deltaTime)
        end
      end
    end
  end
end


