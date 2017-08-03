-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\worldmap_grand\new_worldmap_questtooltip.luac 

-- params : ...
-- function num : 0
Panel_QuestInfo:RegisterShowEventFunc(true, "questInfoAniShow()")
Panel_QuestInfo:RegisterShowEventFunc(false, "questDescHideAni()")
Panel_QuestInfo:setMaskingChild(true)
Panel_QuestInfo:setGlassBackground(true)
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
local UI_TM = CppEnums.TextMode
local UI_color = Defines.Color
local UI_QuestType = CppEnums.QuestType
local _questDescList = {}
local _questTitleCreate = {}
local _questConditionCreate = {}
local _questDescCreate = {}
local _questIconCreate = {}
QuestInfoData = {}
local _questTooltipTitle = (UI.getChildControl)(Panel_QuestInfo, "StaticText_QuestDescPanelTitle")
local _questTitle = (UI.getChildControl)(Panel_QuestInfo, "StaticText_QuestTitle")
local _questCondition = (UI.getChildControl)(Panel_QuestInfo, "StaticText_QuestCondition")
local _questDesc = (UI.getChildControl)(Panel_QuestInfo, "StaticText_QuestDesc")
local _questIcon = (UI.getChildControl)(Panel_QuestInfo, "Static_QuestIcon")
local _questIconBG = (UI.getChildControl)(Panel_QuestInfo, "Static_IconBackground")
local _questMouseHelpBG = (UI.getChildControl)(Panel_QuestInfo, "StaticText_MouseTipBG")
local _questMouseHelpLeftIcon = (UI.getChildControl)(Panel_QuestInfo, "Static_Mouse_Left")
local _questMouseHelpRightIcon = (UI.getChildControl)(Panel_QuestInfo, "Static_Mouse_Right")
local _questMouseHelpLeft = (UI.getChildControl)(Panel_QuestInfo, "StaticText_Mouse_Left")
local _questMouseHelpRight = (UI.getChildControl)(Panel_QuestInfo, "StaticText_Mouse_Right")
local sizeX = Panel_QuestInfo:GetSizeX()
local sizeY = Panel_QuestInfo:GetSizeY()
isQuestDescShow = false
local questInfoWidget_Init = function()
  -- function num : 0_0 , upvalues : _questTitle
  _questTitle:SetTextMode((CppEnums.TextMode).eTextMode_LimitText)
end

questInfoAniShow = function()
  -- function num : 0_1
  Panel_QuestInfo:SetAlpha(0)
  ;
  (UIAni.AlphaAnimation)(1, Panel_QuestInfo, 0, 0.1)
end

questDescHideAni = function()
  -- function num : 0_2
  Panel_QuestInfo:SetShowWithFade((CppEnums.PAUI_SHOW_FADE_TYPE).PAUI_ANI_TYPE_FADE_OUT)
  local aniInfo = (UIAni.AlphaAnimation)(0, Panel_QuestInfo, 0, 0.01)
  aniInfo:SetDisableWhileAni(true)
  aniInfo:SetHideAtEnd(true)
end

questInfo_TooltipShow = function(isShow, questGroupId, questId, mouseX, mouseY, isMouseShow)
  -- function num : 0_3 , upvalues : _questTooltipTitle, _questTitle, _questCondition, UI_TM, _questDesc, _questIcon, _questMouseHelpBG, _questMouseHelpLeftIcon, _questMouseHelpLeft, _questMouseHelpRightIcon, _questMouseHelpRight, sizeX
  local screenY = getScreenSizeY()
  if isShow == true then
    local questInfo = questList_getQuestStatic(questGroupId, questId)
    local demandCount = questInfo:getDemadCount()
    local demandString = ""
    for demandIndex = 0, demandCount - 1 do
      local demand = questInfo:getDemandAt(demandIndex)
      demandString = demandString .. demand._desc .. "\n"
    end
    local questDesc = {_title = "", _desc = ""}
    questDesc._title = questInfo:getTitle()
    questDesc._desc = questInfo:getDesc()
    _questTooltipTitle:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_QUESTTOOLTIP_TITLE_0"))
    _questTitle:SetText(tostring(questDesc._title))
    _questCondition:SetTextMode(UI_TM.eTextMode_AutoWrap)
    _questCondition:SetAutoResize(true)
    _questCondition:SetText(tostring(demandString))
    _questDesc:SetTextMode(UI_TM.eTextMode_AutoWrap)
    _questDesc:SetAutoResize(true)
    _questDesc:SetText(tostring(questDesc._desc))
    _questDesc:SetSize(_questDesc:GetSizeX(), _questDesc:GetSizeY() + 10)
    _questIcon:ChangeTextureInfoName(questInfo:getIconPath())
    local conditionSizeY = _questCondition:GetSizeY() + _questCondition:GetPosY()
    _questDesc:SetPosX(10)
    _questDesc:SetPosY(conditionSizeY + 5)
    if isMouseShow == 0 then
      _questMouseHelpBG:SetShow(true)
      _questMouseHelpLeftIcon:SetShow(true)
      _questMouseHelpLeft:SetShow(true)
      _questMouseHelpRightIcon:SetShow(true)
      _questMouseHelpRight:SetShow(true)
      _questMouseHelpBG:SetPosX(10)
      _questMouseHelpBG:SetPosY(_questDesc:GetPosY() + _questDesc:GetSizeY() + 5)
      _questMouseHelpLeftIcon:SetPosY(_questMouseHelpBG:GetPosY() + 3)
      _questMouseHelpRightIcon:SetPosY(_questMouseHelpBG:GetPosY() + 3)
      _questMouseHelpLeft:SetPosY(_questMouseHelpBG:GetPosY() + 8)
      _questMouseHelpRight:SetPosY(_questMouseHelpBG:GetPosY() + 8)
      _questDesc:ComputePos()
      Panel_QuestInfo:SetShow(true, true)
      Panel_QuestInfo:SetSize(sizeX, _questDesc:GetPosY() + _questDesc:GetSizeY() + 50)
    else
      _questMouseHelpBG:SetShow(false)
      _questMouseHelpLeftIcon:SetShow(false)
      _questMouseHelpLeft:SetShow(false)
      _questMouseHelpRightIcon:SetShow(false)
      _questMouseHelpRight:SetShow(false)
      _questDesc:ComputePos()
      Panel_QuestInfo:SetShow(true, true)
      Panel_QuestInfo:SetSize(sizeX, _questDesc:GetPosY() + _questDesc:GetSizeY() + 10)
    end
    if mouseX < getScreenSizeX() / 2 then
      Panel_QuestInfo:SetPosX(Panel_CheckedQuest:GetPosX() + Panel_CheckedQuest:GetSizeX())
    else
      Panel_QuestInfo:SetPosX(Panel_CheckedQuest:GetPosX() - Panel_QuestInfo:GetSizeX())
    end
    if mouseY < getScreenSizeY() / 2 then
      Panel_QuestInfo:SetPosY(mouseY)
    else
      Panel_QuestInfo:SetPosY(mouseY - Panel_QuestInfo:GetSizeY())
    end
    if Panel_QuestInfo:GetPosY() < screenY or screenY < Panel_QuestInfo:GetPosY() then
      Panel_QuestInfo:SetPosY((screenY - Panel_QuestInfo:GetSizeY()) / 2)
    end
  else
    do
      Panel_QuestInfo:SetShow(false, false)
    end
  end
end

FromClient_OnWorldMapQuestInfo = function(questInfoStatic, mouseX, mouseY)
  -- function num : 0_4 , upvalues : _questTooltipTitle, _questTitle, _questCondition, UI_TM, _questDesc, _questIcon, _questMouseHelpBG, _questMouseHelpLeftIcon, _questMouseHelpLeft, _questMouseHelpRightIcon, _questMouseHelpRight, sizeX
  local questSSW = questInfoStatic:ToClient_GetQuestStaticStatusWrapper()
  local demandCount = questSSW:getDemadCount()
  local demandString = ""
  for demandIndex = 0, demandCount - 1 do
    local demand = questSSW:getDemandAt(demandIndex)
    demandString = demandString .. demand._desc .. "\n"
  end
  local questDesc = {_title = "", _desc = ""}
  questDesc._title = questSSW:getTitle()
  questDesc._desc = questSSW:getDesc()
  _questTooltipTitle:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_QUESTTOOLTIP_TITLE_0"))
  _questTitle:SetText(tostring(questDesc._title))
  _questCondition:SetTextMode(UI_TM.eTextMode_AutoWrap)
  _questCondition:SetAutoResize(true)
  _questCondition:SetText(tostring(demandString))
  _questDesc:SetTextMode(UI_TM.eTextMode_AutoWrap)
  _questDesc:SetAutoResize(true)
  _questDesc:SetText(tostring(questDesc._desc))
  _questDesc:SetSize(_questDesc:GetSizeX(), _questDesc:GetSizeY() + 10)
  _questIcon:ChangeTextureInfoName(questSSW:getIconPath())
  local conditionSizeY = _questCondition:GetSizeY() + _questCondition:GetPosY()
  _questDesc:SetPosX(10)
  _questDesc:SetPosY(conditionSizeY + 5)
  _questMouseHelpBG:SetShow(false)
  _questMouseHelpLeftIcon:SetShow(false)
  _questMouseHelpLeft:SetShow(false)
  _questMouseHelpRightIcon:SetShow(false)
  _questMouseHelpRight:SetShow(false)
  _questDesc:ComputePos()
  Panel_QuestInfo:SetShow(true, true)
  Panel_QuestInfo:SetSize(sizeX, _questDesc:GetPosY() + _questDesc:GetSizeY() + 20)
  Panel_QuestInfo:SetPosX(mouseX)
  Panel_QuestInfo:SetPosY(mouseY)
  Panel_QuestInfo:setFlushAble(false)
  isQuestDescShow = true
end

FromClient_OutWorldMapQuestInfo = function()
  -- function num : 0_5
  (QuestInfoData.questDescHideWindow)()
end

-- DECOMPILER ERROR at PC142: Confused about usage of register: R23 in 'UnsetPending'

QuestInfoData.questDescShowWindow = function(index, questType)
  -- function num : 0_6 , upvalues : UI_QuestType, _questTooltipTitle, _questTitle, _questCondition, UI_TM, _questDesc, _questIcon, sizeX
  local posX = getMousePosX()
  local posY = (getMousePosY())
  local progressQuest = nil
  if UI_QuestType.QuestType_Sub_Cleared == questType then
    progressQuest = questList_getClearedSubQuestAt(index)
  else
    if UI_QuestType.QuestType_Normal_Cleared == questType then
      progressQuest = questList_getClearedNormalQuestAt(index)
    else
      if UI_QuestType.QuestType_DoGuide == questType then
        progressQuest = questList_getDoGuideQuestAt(index)
      else
        progressQuest = questList_getCheckedProgressQuestAt(index)
      end
    end
  end
  local demandCount = progressQuest:getDemadCount()
  local demandString = ""
  for demandIndex = 0, demandCount - 1 do
    local demand = progressQuest:getDemandAt(demandIndex)
    demandString = demandString .. demand._desc .. "\n"
  end
  local questDesc = {_title = "", _desc = ""}
  questDesc._title = progressQuest:getTitle()
  questDesc._desc = progressQuest:getDesc()
  _questTooltipTitle:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_QUESTTOOLTIP_TITLE_0"))
  _questTitle:SetText(tostring(questDesc._title))
  _questCondition:SetTextMode(UI_TM.eTextMode_AutoWrap)
  _questCondition:SetAutoResize(true)
  _questCondition:SetText(tostring(demandString))
  _questDesc:SetTextMode(UI_TM.eTextMode_AutoWrap)
  _questDesc:SetAutoResize(true)
  _questDesc:SetText(tostring(questDesc._desc))
  _questDesc:SetSize(_questDesc:GetSizeX(), _questDesc:GetSizeY() + 10)
  _questIcon:ChangeTextureInfoName(progressQuest:getIconPath())
  local conditionSizeY = _questCondition:GetSizeY() + _questCondition:GetPosY()
  _questDesc:SetPosX(10)
  _questDesc:SetPosY(conditionSizeY + 5)
  _questDesc:ComputePos()
  Panel_QuestInfo:SetShow(true, true)
  Panel_QuestInfo:SetSize(sizeX, _questDesc:GetPosY() + _questDesc:GetSizeY() + 20)
  Panel_QuestInfo:SetPosX(posX)
  Panel_QuestInfo:SetPosY(posY)
  Panel_QuestInfo:setFlushAble(false)
  isQuestDescShow = true
end

-- DECOMPILER ERROR at PC153: Confused about usage of register: R23 in 'UnsetPending'

QuestInfoData.questCheckDescShowWindow = function(questGroupIndex, questIndex, checked)
  -- function num : 0_7 , upvalues : _questTooltipTitle, _questTitle, _questCondition, UI_TM, _questDesc, _questIcon, _questIconBG, sizeX
  local posX = getMousePosX() + 10
  local posY = getMousePosY()
  local questListInfo = (ToClient_GetQuestList())
  local questGroupInfo = nil
  if checked == true then
    questGroupInfo = questListInfo:getQuestCheckedGroupAt(questGroupIndex)
  else
    questGroupInfo = questListInfo:getQuestGroupAt(questGroupIndex)
  end
  local uiQuestInfo = questGroupInfo:getQuestAt(questIndex)
  local demandCount = uiQuestInfo:getDemandCount()
  local demandString = ""
  for demandIndex = 0, demandCount - 1 do
    local demand = uiQuestInfo:getDemandAt(demandIndex)
    demandString = demandString .. demand._desc .. "\n"
  end
  _questTooltipTitle:SetShow(true)
  _questTitle:SetShow(true)
  _questTitle:SetText(uiQuestInfo:getTitle())
  _questCondition:SetShow(true)
  _questCondition:SetTextMode(UI_TM.eTextMode_AutoWrap)
  _questCondition:SetAutoResize(true)
  _questCondition:SetText(tostring(demandString))
  _questDesc:SetShow(true)
  _questDesc:SetTextMode(UI_TM.eTextMode_AutoWrap)
  _questDesc:SetAutoResize(true)
  _questDesc:SetText(tostring(uiQuestInfo:getDesc()))
  _questDesc:SetSize(_questDesc:GetSizeX(), _questDesc:GetSizeY() + 10)
  local conditionSizeY = _questCondition:GetSizeY() + _questCondition:GetPosY()
  _questDesc:SetPosX(10)
  _questDesc:SetPosY(conditionSizeY + 5)
  _questDesc:ComputePos()
  _questIcon:SetShow(true)
  _questIcon:ChangeTextureInfoName(uiQuestInfo:getIconPath())
  _questIconBG:SetShow(true)
  Panel_QuestInfo:SetSize(sizeX, _questDesc:GetPosY() + _questDesc:GetSizeY() + 20)
  Panel_QuestInfo:SetPosX(posX)
  Panel_QuestInfo:SetPosY(posY)
  Panel_QuestInfo:SetShow(true, true)
  Panel_QuestInfo:setFlushAble(false)
end

-- DECOMPILER ERROR at PC164: Confused about usage of register: R23 in 'UnsetPending'

QuestInfoData.questCheckDescShowWindow2 = function(questGroupIndex, questIndex)
  -- function num : 0_8 , upvalues : _questTooltipTitle, _questTitle, _questCondition, UI_TM, _questDesc, _questIcon, _questIconBG, sizeX
  local posX = getMousePosX() + 10
  local posY = getMousePosY()
  local uiQuestInfo = questList_getQuestStatic(questGroupIndex, questIndex)
  local demandCount = uiQuestInfo:getDemadCount()
  local demandString = ""
  for demandIndex = 0, demandCount - 1 do
    local demand = uiQuestInfo:getDemandAt(demandIndex)
    demandString = demandString .. demand._desc .. "\n"
  end
  _questTooltipTitle:SetShow(true)
  _questTitle:SetShow(true)
  _questTitle:SetText(uiQuestInfo:getTitle())
  _questCondition:SetShow(true)
  _questCondition:SetTextMode(UI_TM.eTextMode_AutoWrap)
  _questCondition:SetAutoResize(true)
  _questCondition:SetText(tostring(demandString))
  _questDesc:SetShow(true)
  _questDesc:SetTextMode(UI_TM.eTextMode_AutoWrap)
  _questDesc:SetAutoResize(true)
  _questDesc:SetText(tostring(uiQuestInfo:getDesc()))
  _questDesc:SetSize(_questDesc:GetSizeX(), _questDesc:GetSizeY() + 10)
  local conditionSizeY = _questCondition:GetSizeY() + _questCondition:GetPosY()
  _questDesc:SetPosX(10)
  _questDesc:SetPosY(conditionSizeY + 5)
  _questDesc:ComputePos()
  _questIcon:SetShow(true)
  _questIcon:ChangeTextureInfoName(uiQuestInfo:getIconPath())
  _questIconBG:SetShow(true)
  Panel_QuestInfo:SetSize(sizeX, _questDesc:GetPosY() + _questDesc:GetSizeY() + 20)
  Panel_QuestInfo:SetPosX(posX - Panel_QuestInfo:GetSizeX())
  Panel_QuestInfo:SetPosY(posY)
  Panel_QuestInfo:SetShow(true, true)
  Panel_QuestInfo:setFlushAble(false)
end

local constQuestConditionSizeX = _questCondition:GetSizeX()
-- DECOMPILER ERROR at PC182: Confused about usage of register: R24 in 'UnsetPending'

QuestInfoData.guildQuestDescShowWindow = function()
  -- function num : 0_9 , upvalues : _questTooltipTitle, _questTitle, UI_TM, _questCondition, constQuestConditionSizeX, _questDesc, _questIcon, _questMouseHelpBG, _questMouseHelpLeftIcon, _questMouseHelpLeft, _questMouseHelpRightIcon, _questMouseHelpRight, sizeX
  local posX = getMousePosX()
  local posY = getMousePosY()
  local demandCount = ToClient_getCurrentGuildQuestConditionCount()
  local demandString = ""
  local conditionSizeX = 0
  local maxLen = 0
  for demandIndex = 0, demandCount - 1 do
    local demand = ToClient_getCurrentGuildQuestConditionAt(demandIndex)
    local stringLen = (string.len)(demand._desc .. "( " .. demand._currentCount .. " / " .. demand._destCount .. " )")
    if maxLen < stringLen then
      maxLen = stringLen
    end
    if maxLen > 50 then
      conditionSizeX = (maxLen - 50) * 4
    end
    demandString = demandString .. demand._desc .. "( " .. demand._currentCount .. " / " .. demand._destCount .. " )" .. "\n"
  end
  local questDesc = {_title = "", _desc = ""}
  questDesc._title = ToClient_getCurrentGuildQuestName()
  questDesc._desc = ToClient_getCurrentGuildQuestDesc()
  _questTooltipTitle:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_QUESTTOOLTIP_TITLE_1"))
  _questTitle:SetTextMode(UI_TM.eTextMode_LimitText)
  _questTitle:SetText(tostring(questDesc._title))
  _questCondition:SetSize(constQuestConditionSizeX, _questCondition:GetSizeY())
  _questCondition:SetAutoResize(true)
  _questCondition:SetTextMode(UI_TM.eTextMode_AutoWrap)
  _questCondition:SetText(tostring(demandString))
  _questDesc:SetTextMode(UI_TM.eTextMode_AutoWrap)
  _questDesc:SetAutoResize(true)
  _questDesc:SetText(tostring(questDesc._desc))
  _questDesc:SetSize(_questDesc:GetSizeX(), _questDesc:GetTextSizeY() + 10)
  _questIcon:ChangeTextureInfoName(ToClient_getCurrentGuildQuestIconPath())
  local conditionSizeY = _questCondition:GetTextSizeY() + _questCondition:GetPosY()
  _questDesc:SetPosX(10)
  _questDesc:SetPosY(conditionSizeY)
  _questDesc:ComputePos()
  Panel_QuestInfo:SetShow(true, true)
  local guildQusetWidgetPosX = Panel_CheckedQuest:GetPosX()
  local questInfoTooltipPOsX = 0
  if getScreenSizeX() / 2 < guildQusetWidgetPosX then
    questInfoTooltipPosX = Panel_CheckedQuest:GetPosX() - Panel_QuestInfo:GetSizeX()
  else
    questInfoTooltipPosX = Panel_CheckedQuest:GetPosX() + Panel_CheckedQuest:GetSizeX()
  end
  _questMouseHelpBG:SetShow(false)
  _questMouseHelpLeftIcon:SetShow(false)
  _questMouseHelpLeft:SetShow(false)
  _questMouseHelpRightIcon:SetShow(false)
  _questMouseHelpRight:SetShow(false)
  Panel_QuestInfo:SetSize(sizeX, _questDesc:GetPosY() + _questDesc:GetTextSizeY() + 30)
  Panel_QuestInfo:SetPosX(questInfoTooltipPosX)
  Panel_QuestInfo:SetPosY(Panel_CheckedQuest:GetPosY() + 20)
  Panel_QuestInfo:setFlushAble(false)
end

-- DECOMPILER ERROR at PC192: Confused about usage of register: R24 in 'UnsetPending'

QuestInfoData.questDescShowWindowForLeft = function(index)
  -- function num : 0_10 , upvalues : _questTooltipTitle, _questTitle, _questCondition, UI_TM, _questDesc, _questIcon, sizeX
  local posX = getMousePosX()
  local posY = getMousePosY()
  Panel_QuestInfo:SetPosX(posX - Panel_QuestInfo:GetSizeX())
  Panel_QuestInfo:SetPosY(posY)
  Panel_QuestInfo:SetShow(true, true)
  local progressQuest = questList_getCheckedProgressQuestAt(index)
  local demandCount = progressQuest:getDemadCount()
  local demandString = ""
  for demandIndex = 0, demandCount - 1 do
    local demand = progressQuest:getDemandAt(demandIndex)
    demandString = demandString .. demand._desc .. "\n"
  end
  local questDesc = {_title = "", _desc = ""}
  questDesc._title = progressQuest:getTitle()
  questDesc._desc = progressQuest:getDesc()
  _questTooltipTitle:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_QUESTTOOLTIP_TITLE_0"))
  _questTitle:SetText(tostring(questDesc._title))
  _questCondition:SetTextMode(UI_TM.eTextMode_AutoWrap)
  _questCondition:SetText(tostring(demandString))
  _questDesc:SetTextMode(UI_TM.eTextMode_AutoWrap)
  _questDesc:SetAutoResize(true)
  _questDesc:SetText(tostring(questDesc._desc))
  _questDesc:SetSize(_questDesc:GetSizeX(), _questDesc:GetSizeY() + 10)
  _questIcon:ChangeTextureInfoName(progressQuest:getIconPath())
  local conditionSizeY = _questCondition:GetTextSizeY() + _questCondition:GetPosY()
  _questDesc:SetPosX(10)
  _questDesc:SetPosY(conditionSizeY)
  Panel_QuestInfo:SetSize(sizeX, _questDesc:GetPosY() + _questDesc:GetSizeY() + 20)
end

-- DECOMPILER ERROR at PC203: Confused about usage of register: R24 in 'UnsetPending'

QuestInfoData.questDescShowWindowForStatic = function(index, questGroupQuestNo, questType)
  -- function num : 0_11 , upvalues : UI_QuestType, _questTooltipTitle, _questTitle, _questCondition, UI_TM, _questDesc, _questIcon, sizeX
  local posX = getMousePosX()
  local posY = (getMousePosY())
  local progressQuest = nil
  if UI_QuestType.QuestType_Sub_Cleared == questType then
    progressQuest = questList_getClearedSubQuestAt(index)
  else
    if UI_QuestType.QuestType_Normal_Cleared == questType then
      progressQuest = questList_getClearedNormalQuestAt(index)
    else
      progressQuest = questList_getCheckedProgressQuestAt(index)
    end
  end
  local questData = progressQuest:getQuestGroupQuestAt(questGroupQuestNo)
  local demandCount = questData:getDemadCount()
  local demandString = ""
  for demandIndex = 1, demandCount do
    local demand = questData:getDemandAt(demandIndex - 1)
    demandString = demandString .. demand._desc .. "\n"
  end
  local questDesc = {_title = "", _desc = ""}
  questDesc._title = questData:getTitle()
  questDesc._desc = questData:getDesc()
  _questTooltipTitle:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_QUESTTOOLTIP_TITLE_0"))
  _questTitle:SetText(tostring(questDesc._title))
  _questCondition:SetTextMode(UI_TM.eTextMode_AutoWrap)
  _questCondition:SetText(tostring(demandString))
  _questDesc:SetTextMode(UI_TM.eTextMode_AutoWrap)
  _questDesc:SetText(tostring(questDesc._desc))
  _questIcon:ChangeTextureInfoName(questData:getIconPath())
  local conditionSizeY = _questCondition:GetTextSizeY() + _questCondition:GetPosY()
  _questDesc:SetPosX(10)
  _questDesc:SetPosY(conditionSizeY + 10)
  _questDesc:ComputePos()
  Panel_QuestInfo:SetShow(true, true)
  Panel_QuestInfo:SetSize(sizeX, _questDesc:GetPosY() + _questDesc:GetSizeY() + 20)
  Panel_QuestInfo:SetPosX(posX)
  Panel_QuestInfo:SetPosY(posY)
  Panel_QuestInfo:setFlushAble(false)
end

-- DECOMPILER ERROR at PC206: Confused about usage of register: R24 in 'UnsetPending'

QuestInfoData.questDescHideWindow = function()
  -- function num : 0_12
  Panel_QuestInfo:SetShow(false, true)
  isQuestDescShow = false
end

FGlobal_QuestTooltip_MouseIconOff = function()
  -- function num : 0_13 , upvalues : _questMouseHelpBG, _questMouseHelpLeftIcon, _questMouseHelpLeft, _questMouseHelpRightIcon, _questMouseHelpRight
  _questMouseHelpBG:SetShow(false)
  _questMouseHelpLeftIcon:SetShow(false)
  _questMouseHelpLeft:SetShow(false)
  _questMouseHelpRightIcon:SetShow(false)
  _questMouseHelpRight:SetShow(false)
end

questInfoWidget_Init()
registerEvent("FromClient_OnWorldMapQuestInfo", "FromClient_OnWorldMapQuestInfo")
registerEvent("FromClient_OutWorldMapQuestInfo", "FromClient_OutWorldMapQuestInfo")

