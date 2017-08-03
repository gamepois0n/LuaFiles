-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\monsterranking\panel_window_monsterranking.luac 

-- params : ...
-- function num : 0
Panel_Window_MonsterRanking:SetShow(false)
PaGlobal_MonsterRanking = {
_ui = {_btn_ListBtn = (UI.getChildControl)(Panel_Window_MonsterRanking, "RadioButton_Tab"), _titleList2 = (UI.getChildControl)(Panel_Window_MonsterRanking, "List2_MonsterRankingTitleList"), _list2 = (UI.getChildControl)(Panel_Window_MonsterRanking, "List2_MonsterRankingList"), _nameTitle = (UI.getChildControl)(Panel_Window_MonsterRanking, "StaticText_NameTitle"), _btn_Close = (UI.getChildControl)(Panel_Window_MonsterRanking, "Button_Win_Close")}
, _listIndex = 0}
-- DECOMPILER ERROR at PC41: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_MonsterRanking.MonsterRanking_Initialize = function(self)
  -- function num : 0_0
  local minSize = float2()
  minSize.x = 100
  minSize.y = 50
  ;
  ((self._ui)._list2):setMinScrollBtnSize(minSize)
end

FGlobal_MonsterRanking_Open = function()
  -- function num : 0_1
  local self = PaGlobal_MonsterRanking
  Panel_Window_MonsterRanking:SetShow(true)
  PaGlobal_MonsterRanking:MonsterRanking_SetPos()
  self._listIndex = 0
  local listMaxCount = ToClient_GetTimeAttackListCount()
  for listCount = 0, listMaxCount - 1 do
    (((self._ui)._titleList2):getElementManager()):pushKey(toInt64(0, listCount))
  end
  PaGlobal_MonsterRanking:MonsterRankingList_Update(self._listIndex)
end

FGlobal_MonsterRanking_Close = function()
  -- function num : 0_2
  local self = PaGlobal_MonsterRanking
  ;
  (((self._ui)._titleList2):getElementManager()):clearKey()
  ;
  (((self._ui)._list2):getElementManager()):clearKey()
  Panel_Window_MonsterRanking:SetShow(false)
end

-- DECOMPILER ERROR at PC48: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_MonsterRanking.MonsterRanking_SetPos = function(self)
  -- function num : 0_3
  Panel_Window_MonsterRanking:SetPosX(getScreenSizeX() / 2 - Panel_Window_MonsterRanking:GetSizeX() / 2)
  Panel_Window_MonsterRanking:SetPosY(getScreenSizeY() / 2 - Panel_Window_MonsterRanking:GetSizeY() / 2)
end

-- DECOMPILER ERROR at PC51: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_MonsterRanking.MonsterRankingList_Update = function(self, listIndex)
  -- function num : 0_4
  self._listIndex = listIndex
  ;
  (((self._ui)._list2):getElementManager()):clearKey()
  local titleInfo = ToClient_GetTimeAttackGroupInfo(self._listIndex)
  if titleInfo == nil then
    return 
  end
  local isGuild = titleInfo:isGuild()
  if isGuild then
    ((self._ui)._nameTitle):SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_BOSSRANKING_GUILDNAME"))
  else
    ;
    ((self._ui)._nameTitle):SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_BOSSRANKING_FAMILYNAME"))
  end
  ToClient_RequestTimeAttackRank(self._listIndex)
end

FromClient_updateTimeAttackRank = function()
  -- function num : 0_5
  local self = PaGlobal_MonsterRanking
  local titleInfo = ToClient_GetTimeAttackGroupInfo(self._listIndex)
  if titleInfo == nil then
    return 
  end
  local rankMaxCount = titleInfo:getListCount()
  for rankCount = 0, rankMaxCount - 1 do
    (((self._ui)._list2):getElementManager()):pushKey(toInt64(0, rankCount))
  end
end

MonsterRanking_Title_ListControlCreate = function(content, key)
  -- function num : 0_6
  PaGlobal_MonsterRanking:MonsterRanking_Title_ListControlCreate(content, key)
end

-- DECOMPILER ERROR at PC58: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_MonsterRanking.MonsterRanking_Title_ListControlCreate = function(self, content, key)
  -- function num : 0_7
  local index = Int64toInt32(key)
  local title = (UI.getChildControl)(content, "List2_RadioButton_Tab")
  local titleInfo = ToClient_GetTimeAttackGroupInfo(index)
  title:setNotImpactScrollEvent(true)
  if titleInfo == nil then
    return 
  end
  title:SetText(titleInfo:getGroupName())
  if index == self._listIndex then
    title:SetCheck(true)
  else
    title:SetCheck(false)
  end
  title:addInputEvent("Mouse_LUp", "PaGlobal_MonsterRanking:MonsterRankingList_Update( " .. index .. " )")
end

MonsterRanking_Rank_ListControlCreate = function(content, key)
  -- function num : 0_8
  PaGlobal_MonsterRanking:MonsterRanking_Rank_ListControlCreate(content, key)
end

-- DECOMPILER ERROR at PC63: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_MonsterRanking.MonsterRanking_Rank_ListControlCreate = function(self, content, key)
  -- function num : 0_9
  local index = Int64toInt32(key)
  local rank = (UI.getChildControl)(content, "StaticText_List2_Rank")
  local name = (UI.getChildControl)(content, "StaticText_List2_Name")
  local time = (UI.getChildControl)(content, "StaticText_List2_Time")
  local titleInfo = ToClient_GetTimeAttackGroupInfo(self._listIndex)
  local rankMaxCount = titleInfo:getListCount()
  local rankInfo = titleInfo:getAt(index)
  local isGuild = titleInfo:isGuild()
  name:ChangeTextureInfoName("New_UI_Common_forLua/Default/Default_Buttons.dds")
  local x1, y1, x2, y2 = setTextureUV_Func(name, 183, 1, 188, 6)
  ;
  (name:getBaseTexture()):setUV(x1, y1, x2, y2)
  name:setRenderTexture(name:getBaseTexture())
  if isGuild then
    local guildNo_s64 = rankInfo:getOwnerNo()
    local isSet = setGuildTextureByGuildNo(guildNo_s64, name)
    if isSet then
      (name:getBaseTexture()):setUV(0, 0, 1, 1)
      name:setRenderTexture(name:getBaseTexture())
    end
  end
  do
    local rankTime = rankInfo:getCompleteTime()
    if index == 0 then
      rank:ChangeTextureInfoName("New_UI_Common_forLua/Default/Default_Etc_03.dds")
      local x1, y1, x2, y2 = setTextureUV_Func(rank, 51, 81, 87, 112)
      ;
      (rank:getBaseTexture()):setUV(x1, y1, x2, y2)
      rank:setRenderTexture(rank:getBaseTexture())
      rank:SetText("")
      name:SetFontColor((Defines.Color).C_FFD20000)
      time:SetFontColor((Defines.Color).C_FFD20000)
    else
      do
        if index == 1 then
          rank:ChangeTextureInfoName("New_UI_Common_forLua/Default/Default_Etc_03.dds")
          local x1, y1, x2, y2 = setTextureUV_Func(rank, 51, 113, 86, 141)
          ;
          (rank:getBaseTexture()):setUV(x1, y1, x2, y2)
          rank:setRenderTexture(rank:getBaseTexture())
          rank:SetText("")
          name:SetFontColor((Defines.Color).C_FFA3EF00)
          time:SetFontColor((Defines.Color).C_FFA3EF00)
        else
          do
            if index == 2 then
              rank:ChangeTextureInfoName("New_UI_Common_forLua/Default/Default_Etc_03.dds")
              local x1, y1, x2, y2 = setTextureUV_Func(rank, 87, 113, 121, 143)
              ;
              (rank:getBaseTexture()):setUV(x1, y1, x2, y2)
              rank:setRenderTexture(rank:getBaseTexture())
              rank:SetText("")
              name:SetFontColor((Defines.Color).C_FF00C0D7)
              time:SetFontColor((Defines.Color).C_FF00C0D7)
            else
              do
                rank:ChangeTextureInfoName("")
                name:SetFontColor((Defines.Color).C_FFFFFFFF)
                time:SetFontColor((Defines.Color).C_FFFFFFFF)
                local highRankInfo = titleInfo:getAt(index - 1)
                do
                  local highRankTime = highRankInfo:getCompleteTime()
                  if highRankTime == rankTime then
                    rank:SetText(" - ")
                  else
                    rank:SetText(index + 1)
                  end
                  rankTime = Int64toInt32(rankTime)
                  name:SetText(rankInfo:getName())
                  time:SetText(((Util.Time).timeFormatting)(rankTime))
                end
              end
            end
          end
        end
      end
    end
  end
end

-- DECOMPILER ERROR at PC66: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_MonsterRanking.registEventHandler = function(self)
  -- function num : 0_10
  ((self._ui)._titleList2):registEvent((CppEnums.PAUIList2EventType).luaChangeContent, "MonsterRanking_Title_ListControlCreate")
  ;
  ((self._ui)._titleList2):createChildContent((CppEnums.PAUIList2ElementManagerType).list)
  ;
  ((self._ui)._list2):registEvent((CppEnums.PAUIList2EventType).luaChangeContent, "MonsterRanking_Rank_ListControlCreate")
  ;
  ((self._ui)._list2):createChildContent((CppEnums.PAUIList2ElementManagerType).list)
  ;
  ((self._ui)._btn_Close):addInputEvent("Mouse_LUp", "FGlobal_MonsterRanking_Close()")
  registerEvent("FromClient_updateTimeAttackRank", "FromClient_updateTimeAttackRank")
end

PaGlobal_MonsterRanking:registEventHandler()
PaGlobal_MonsterRanking:MonsterRanking_Initialize()

