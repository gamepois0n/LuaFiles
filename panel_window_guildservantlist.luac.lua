-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\servant\panel_window_guildservantlist.luac 

-- params : ...
-- function num : 0
Panel_GuildServantList:SetShow(false)
local guildServantList = {_static_Bg = (UI.getChildControl)(Panel_GuildServantList, "Static_BG"), _btn_Close = (UI.getChildControl)(Panel_GuildServantList, "Button_Close"), _frame = (UI.getChildControl)(Panel_GuildServantList, "Frame_GuildServantList"), 
_listPool = {}
}
guildServantList._frame_Contents = (UI.getChildControl)(guildServantList._frame, "Frame_1_Content")
guildServantList._frameScroll = (UI.getChildControl)(guildServantList._frame, "Frame_1_VerticalScroll")
;
(guildServantList._frameScroll):SetShow(false)
GuildServantList_Init = function()
  -- function num : 0_0 , upvalues : guildServantList
  local self = guildServantList
  local guildServantCount = guildstable_getUnsealGuildServantCount()
  for index = 0, guildServantCount - 1 do
    local list = {}
    if (self._listPool)[index] ~= nil then
      (UI.deleteControl)(((self._listPool)[index]).name)
      ;
      (UI.deleteControl)(((self._listPool)[index]).channel)
      ;
      (UI.deleteControl)(((self._listPool)[index]).call)
      -- DECOMPILER ERROR at PC32: Confused about usage of register: R7 in 'UnsetPending'

      ;
      (self._listPool)[index] = {}
    end
    list.name = (UI.createAndCopyBasePropertyControl)(Panel_GuildServantList, "StaticText_ServantName", self._frame_Contents, "GuildServantList_Name_" .. index)
    list.channel = (UI.createAndCopyBasePropertyControl)(Panel_GuildServantList, "StaticText_ChannelName", self._frame_Contents, "GuildServantList_Channel_" .. index)
    list.call = (UI.createAndCopyBasePropertyControl)(Panel_GuildServantList, "Button_Call", self._frame_Contents, "GuildServantList_Call_" .. index)
    ;
    (list.name):SetPosX(15)
    ;
    (list.name):SetPosY(0 + 20 * index)
    ;
    (list.channel):SetPosX(165)
    ;
    (list.channel):SetPosY(0 + 20 * index)
    ;
    (list.call):SetPosX(295)
    ;
    (list.call):SetPosY(2 + 20 * index)
    -- DECOMPILER ERROR at PC91: Confused about usage of register: R7 in 'UnsetPending'

    ;
    (self._listPool)[index] = list
  end
end

local guildServant = {}
local beforeGuildeServantCount = 0
GuildServantList_Update = function()
  -- function num : 0_1 , upvalues : guildServantList, beforeGuildeServantCount, guildServant
  local self = guildServantList
  local guildServantCount = guildstable_getUnsealGuildServantCount()
  local temporaryWrapper = getTemporaryInformationWrapper()
  local worldNo = temporaryWrapper:getSelectedWorldServerNo()
  if beforeGuildeServantCount > 0 then
    GuildServantList_ContorlShow(beforeGuildeServantCount, false)
  end
  guildServant = {}
  for index = 0, guildServantCount - 1 do
    local list = (self._listPool)[index]
    local servantWrapper = guildStable_getUnsealGuildServantAt(index)
    if servantWrapper ~= nil then
      local servantName = servantWrapper:getName()
      local servantNo = servantWrapper:getServantNo()
      local servantServerNo = servantWrapper:getServerNo()
      local channelName = getChannelName(worldNo, servantServerNo)
      local vehicleType = servantWrapper:getServantType()
      ;
      (list.name):SetText(servantName)
      ;
      (list.channel):SetText(channelName)
      -- DECOMPILER ERROR at PC48: Confused about usage of register: R15 in 'UnsetPending'

      guildServant[index] = servantNo
      ;
      (list.call):addInputEvent("Mouse_LUp", "HandleClicked_GuildServantCall( " .. index .. ")")
      GuildServantList_ContorlShow(guildServantCount, true)
      beforeGuildeServantCount = guildServantCount
      if vehicleType == 1 then
        (list.call):SetShow(false)
      end
    end
  end
end

GuildServantList_ContorlShow = function(count, isShow)
  -- function num : 0_2 , upvalues : guildServantList
  for index = 0, count - 1 do
    local list = (guildServantList._listPool)[index]
    ;
    (list.name):SetShow(isShow)
    ;
    (list.channel):SetShow(isShow)
    ;
    (list.call):SetShow(isShow)
  end
end

HandleClicked_GuildServantCall = function(index)
  -- function num : 0_3 , upvalues : guildServant
  if guildServant[index] == nil then
    return 
  end
  servant_callGuildServant(guildServant[index])
end

FGlobal_GuildServantList_Open = function()
  -- function num : 0_4
  local isShow = Panel_GuildServantList:GetShow()
  if isShow then
    Panel_GuildServantList:SetShow(false)
  else
    Panel_GuildServantList:SetShow(true)
    GuildServantList_Init()
    GuildServantList_Update()
  end
end

GuildServantList_Close = function()
  -- function num : 0_5
  Panel_GuildServantList:SetShow(false)
end

GuildServantList_ListRefresh = function()
  -- function num : 0_6
  GuildServantList_Init()
  GuildServantList_Update()
end

FromClient_GuildServantListUpdate = function()
  -- function num : 0_7
  GuildServantList_ListRefresh()
end

GuildServantList_registMessageHandler = function()
  -- function num : 0_8 , upvalues : guildServantList
  local self = guildServantList
  ;
  (self._btn_Close):addInputEvent("Mouse_LUp", "GuildServantList_Close()")
end

GuildServantList_registEventHandler = function()
  -- function num : 0_9
  registerEvent("FromClient_GuildServantListUpdate", "FromClient_GuildServantListUpdate")
  registerEvent("FromClient_ServantUnseal", "FromClient_GuildServantListUpdate")
  registerEvent("FromClient_ServantSeal", "FromClient_GuildServantListUpdate")
end

GuildServantList_Init()
GuildServantList_Update()
GuildServantList_registMessageHandler()
GuildServantList_registEventHandler()

