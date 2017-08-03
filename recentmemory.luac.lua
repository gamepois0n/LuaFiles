-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\widget\recentmemory\recentmemory.luac 

-- params : ...
-- function num : 0
Panel_RecentMemory:SetPosX(-10)
Panel_RecentMemory:SetPosY(265)
Panel_RecentMemory:ActiveMouseEventEffect(true)
Panel_RecentMemory:setGlassBackground(true)
local RecentMemory = {_close = (UI.getChildControl)(Panel_RecentMemory, "Button_Close"), _questString0_1 = (UI.getChildControl)(Panel_RecentMemory, "StaticText_Quest1_1"), _questString0_2 = (UI.getChildControl)(Panel_RecentMemory, "StaticText_Quest1_2"), _questString1 = (UI.getChildControl)(Panel_RecentMemory, "StaticText_Quest2"), _memo = (UI.getChildControl)(Panel_RecentMemory, "StaticText_Memo"), _time = (UI.getChildControl)(Panel_RecentMemory, "StaticText_Time"), _closeNotify = (UI.getChildControl)(Panel_RecentMemory, "StaticText_CloseNotify")}
;
(RecentMemory._close):addInputEvent("Mouse_LUp", "RecentMemory_Close()")
RecentMemory.filldata = function(self, memo, recentTime, questNo0, questNo1, questNoCurrent)
  -- function num : 0_0
  questWrapper = ToClient_getQuestWrapper(questNo0)
  if questWrapper ~= nil then
    (self._questString0_1):SetText("- " .. questWrapper:getTitle())
  else
    ;
    (self._questString0_1):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_RECENTMEMORY_NOCOMPLETEQUEST"))
  end
  questWrapper = ToClient_getQuestWrapper(questNo1)
  if questWrapper ~= nil then
    (self._questString0_2):SetText("- " .. questWrapper:getTitle())
  else
    ;
    (self._questString0_2):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_RECENTMEMORY_NOCOMPLETEQUEST"))
  end
  local paTime = PATime(recentTime)
  ;
  (self._memo):SetText(memo)
  ;
  (self._time):SetShow(false)
  questWrapper = ToClient_getQuestWrapper(questNoCurrent)
  if questWrapper ~= nil then
    (self._questString1):SetText("- " .. questWrapper:getTitle())
  else
    ;
    (self._questString1):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_RECENTMEMORY_NOPROGRESSQUEST"))
  end
end

RecentMemory.show = function(self)
  -- function num : 0_1
  if isFlushedUI() then
    return 
  end
  local _year = ToClient_GetThisYear()
  local _month = ToClient_GetThisMonth()
  local _day = ToClient_GetToday()
  local dayCheck = (ToClient_getGameUIManagerWrapper()):getLuaCacheDataListTime((CppEnums.GlobalUIOptionType).RecentMemoryCheck)
  if dayCheck ~= nil then
    local savedYear = dayCheck:GetYear()
    local savedMonth = dayCheck:GetMonth()
    local savedDay = dayCheck:GetDay()
    if _year == savedYear and _month == savedMonth and _day == savedDay then
      return 
    end
  end
  do
    if PaGlobal_TutorialManager:isDoingTutorial() == true then
      return 
    end
    Panel_RecentMemory:SetShow(true, false)
  end
end

RecentMemory_Close = function()
  -- function num : 0_2
  local _year = ToClient_GetThisYear()
  local _month = ToClient_GetThisMonth()
  local _day = ToClient_GetToday()
  ;
  (ToClient_getGameUIManagerWrapper()):setLuaCacheDataListTime((CppEnums.GlobalUIOptionType).RecentMemoryCheck, _year, _month, _day, 0, 0, 0)
  Panel_RecentMemory:SetShow(false, false)
end

FromClient_PreviousCharacterDataUpdate = function(memo, recentTime, questNo0, questNo1, questNoCurrent)
  -- function num : 0_3 , upvalues : RecentMemory
  RecentMemory:filldata(memo, recentTime, questNo0, questNo1, questNoCurrent)
  RecentMemory:show()
end

local openTime = 0
local beforTime = 0
recentMemory_OpenTimeCheck = function(deltaTime)
  -- function num : 0_4 , upvalues : openTime, RecentMemory
  openTime = openTime + deltaTime
  local sumTime = 30 - (math.ceil)(openTime)
  ;
  (RecentMemory._closeNotify):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_RECENTMEMORY_CLOSETIME", "sumTime", convertStringFromDatetime(toInt64(0, sumTime))))
  if openTime > 31 then
    RecentMemory_Close()
    openTime = 0
  end
end

Panel_RecentMemory:RegisterUpdateFunc("recentMemory_OpenTimeCheck")
registerEvent("FromClient_PreviousCharacterDataUpdate", "FromClient_PreviousCharacterDataUpdate")

