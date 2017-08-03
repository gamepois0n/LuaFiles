-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\guild\panel_guildrank.luac 

-- params : ...
-- function num : 0
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
local UI_color = Defines.Color
local IM = CppEnums.EProcessorInputMode
local GST = CppEnums.GameServiceType
Panel_Guild_Rank:SetShow(false, false)
Panel_Guild_Rank:RegisterShowEventFunc(true, "GuildRankingShowAni()")
Panel_Guild_Rank:RegisterShowEventFunc(false, "GuildRankingHideAni()")
Panel_Guild_Rank:setGlassBackground(true)
Panel_Guild_Rank:ActiveMouseEventEffect(true)
GuildRankingShowAni = function()
  -- function num : 0_0 , upvalues : UI_ANI_ADV
  (UIAni.fadeInSCR_Down)(Panel_Guild_Rank)
  local aniInfo1 = Panel_Guild_Rank:addScaleAnimation(0, 0.08, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo1:SetStartScale(0.5)
  aniInfo1:SetEndScale(1.2)
  aniInfo1.AxisX = Panel_Guild_Rank:GetSizeX() / 2
  aniInfo1.AxisY = Panel_Guild_Rank:GetSizeY() / 2
  aniInfo1.ScaleType = 2
  aniInfo1.IsChangeChild = true
  local aniInfo2 = Panel_Guild_Rank:addScaleAnimation(0.08, 0.15, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo2:SetStartScale(1.2)
  aniInfo2:SetEndScale(1)
  aniInfo2.AxisX = Panel_Guild_Rank:GetSizeX() / 2
  aniInfo2.AxisY = Panel_Guild_Rank:GetSizeY() / 2
  aniInfo2.ScaleType = 2
  aniInfo2.IsChangeChild = true
end

GuildRankingHideAni = function()
  -- function num : 0_1 , upvalues : UI_ANI_ADV, UI_color
  local aniInfo1 = Panel_Guild_Rank:addColorAnimation(0, 0.1, UI_ANI_ADV.PAUI_ANIM_ADVANCE_SIN_HALF_PI)
  aniInfo1:SetStartColor(UI_color.C_FFFFFFFF)
  aniInfo1:SetEndColor(UI_color.C_00FFFFFF)
  aniInfo1:SetStartIntensity(3)
  aniInfo1:SetEndIntensity(1)
  aniInfo1.IsChangeChild = true
  aniInfo1:SetHideAtEnd(true)
  aniInfo1:SetDisableWhileAni(true)
end

local guildRanking = {_txtTitle = (UI.getChildControl)(Panel_Guild_Rank, "StaticText_Title"), _btnClose = (UI.getChildControl)(Panel_Guild_Rank, "Button_Win_Close"), _btnHelp = (UI.getChildControl)(Panel_Guild_Rank, "Button_Question"), _scroll = (UI.getChildControl)(Panel_Guild_Rank, "Scroll_RankingList"), _listBg = (UI.getChildControl)(Panel_Guild_Rank, "Static_RankListBG"), guildRankNum = (UI.getChildControl)(Panel_Guild_Rank, "StaticText_RankNum"), guildRankGuildName = (UI.getChildControl)(Panel_Guild_Rank, "StaticText_GuildName"), guildRankFamilyName = (UI.getChildControl)(Panel_Guild_Rank, "StaticText_FamilyName"), iconSerendia = (UI.getChildControl)(Panel_Guild_Rank, "Static_Serendia"), iconBalenos = (UI.getChildControl)(Panel_Guild_Rank, "Static_Balenos"), iconKalpeon = (UI.getChildControl)(Panel_Guild_Rank, "Static_Kalpeon"), iconMedia = (UI.getChildControl)(Panel_Guild_Rank, "Static_Media"), iconBalencia = (UI.getChildControl)(Panel_Guild_Rank, "Static_Balencia"), guildRankNode = (UI.getChildControl)(Panel_Guild_Rank, "StaticText_NodeOccupation"), guildDuelWar = (UI.getChildControl)(Panel_Guild_Rank, "StaticText_GuildDuelWar"), guildRankPersonnel = (UI.getChildControl)(Panel_Guild_Rank, "StaticText_Personnel"), guildRankPoint = (UI.getChildControl)(Panel_Guild_Rank, "StaticText_GuildPoint"), _createListCount = 23, territoryCount = 4, _listCount = 0, _startIndex = 0, _selectPage = 0, _selectMaxPage = 0, 
_listPool = {}
, 
_posConfig = {_listStartPosY = 128, _iconStartPosY = 128, _listPosYGap = 19.7}
}
local radioBtn_GuildName = (UI.getChildControl)(Panel_Guild_Rank, "RadioButton_GuildName")
local editBox_Search = (UI.getChildControl)(Panel_Guild_Rank, "Edit_Naming")
local btn_Search = (UI.getChildControl)(Panel_Guild_Rank, "Button_Search")
editBox_Search:addInputEvent("Mouse_LUp", "HandleClicked_GuildSearch_EditBox()")
btn_Search:addInputEvent("Mouse_LUp", "GuildSearch_Confirm()")
HandleClicked_GuildSearch_EditBox = function()
  -- function num : 0_2 , upvalues : IM, editBox_Search
  (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_ChattingInputMode)
  editBox_Search:SetMaxInput(10)
  SetFocusEdit(editBox_Search)
  editBox_Search:SetEditText("", true)
end

GuildSearch_Confirm = function()
  -- function num : 0_3 , upvalues : editBox_Search
  local guildName = editBox_Search:GetEditText()
  if guildName == "" or guildName == nil then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_GUILDRANK_SERACHALERT"))
    return 
  end
  ToClient_RequestGuildWebInfoByName(guildName)
  ClearFocusEdit()
end

FGlobal_CheckEditBox_GuildRank = function(uiEditBox)
  -- function num : 0_4 , upvalues : editBox_Search
  do return (uiEditBox ~= nil and editBox_Search ~= nil and uiEditBox:GetKey() == editBox_Search:GetKey() and Panel_Guild_Rank:GetShow()) end
  -- DECOMPILER ERROR: 2 unprocessed JMP targets
end

FGlobal_EscapeEditBox_GuildRank = function(bool)
  -- function num : 0_5 , upvalues : IM, editBox_Search
  (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_UiMode)
  ClearFocusEdit(editBox_Search)
end

local _txt_page = (UI.getChildControl)(Panel_Guild_Rank, "Static_PageNo")
local _btn_Prev = (UI.getChildControl)(Panel_Guild_Rank, "Button_Prev")
local _btn_Next = (UI.getChildControl)(Panel_Guild_Rank, "Button_Next")
local _web_Desc = (UI.getChildControl)(Panel_Guild_Rank, "StaticText_Web_Desc")
guildRanking_Initionalize = function()
  -- function num : 0_6 , upvalues : _web_Desc, guildRanking, _btn_Next
  if getGameServiceType() == 0 or getGameServiceType() == 1 or getGameServiceType() == 2 or getGameServiceType() == 3 or getGameServiceType() == 4 then
    _web_Desc:SetShow(true)
  else
    _web_Desc:SetShow(false)
  end
  local self = guildRanking
  for listIdx = 0, self._createListCount - 1 do
    local rankList = {}
    rankList.rank = (UI.createAndCopyBasePropertyControl)(Panel_Guild_Rank, "StaticText_RankNum", Panel_Guild_Rank, "guildRanking_Rank_" .. listIdx)
    ;
    (rankList.rank):SetPosX(47)
    ;
    (rankList.rank):SetPosY((self._posConfig)._listStartPosY + (self._posConfig)._listPosYGap * listIdx)
    rankList.guild = (UI.createAndCopyBasePropertyControl)(Panel_Guild_Rank, "StaticText_GuildName", Panel_Guild_Rank, "guildRanking_Name_" .. listIdx)
    ;
    (rankList.guild):SetPosX(80)
    ;
    (rankList.guild):SetPosY((self._posConfig)._listStartPosY + (self._posConfig)._listPosYGap * listIdx)
    ;
    (rankList.guild):SetIgnore(false)
    ;
    (rankList.guild):SetEnableArea(0, 0, 190, 15)
    rankList.familyName = (UI.createAndCopyBasePropertyControl)(Panel_Guild_Rank, "StaticText_FamilyName", Panel_Guild_Rank, "guildRanking_Guild_" .. listIdx)
    ;
    (rankList.familyName):SetPosX(260)
    ;
    (rankList.familyName):SetPosY((self._posConfig)._listStartPosY + (self._posConfig)._listPosYGap * listIdx)
    rankList.icon1 = (UI.createAndCopyBasePropertyControl)(Panel_Guild_Rank, "Static_Serendia", Panel_Guild_Rank, "guildRanking_IconSerendia_" .. listIdx)
    ;
    (rankList.icon1):SetPosX(430)
    ;
    (rankList.icon1):SetPosY((self._posConfig)._iconStartPosY + (self._posConfig)._listPosYGap * listIdx)
    rankList.icon2 = (UI.createAndCopyBasePropertyControl)(Panel_Guild_Rank, "Static_Balenos", Panel_Guild_Rank, "guildRanking_IconBalenos_" .. listIdx)
    ;
    (rankList.icon2):SetPosX(497)
    ;
    (rankList.icon2):SetPosY((self._posConfig)._iconStartPosY + (self._posConfig)._listPosYGap * listIdx)
    rankList.icon3 = (UI.createAndCopyBasePropertyControl)(Panel_Guild_Rank, "Static_Kalpeon", Panel_Guild_Rank, "guildRanking_IconKalpeon_" .. listIdx)
    ;
    (rankList.icon3):SetPosX(522)
    ;
    (rankList.icon3):SetPosY((self._posConfig)._iconStartPosY + (self._posConfig)._listPosYGap * listIdx)
    rankList.icon4 = (UI.createAndCopyBasePropertyControl)(Panel_Guild_Rank, "Static_Media", Panel_Guild_Rank, "guildRanking_IconMedia_" .. listIdx)
    ;
    (rankList.icon4):SetPosX(547)
    ;
    (rankList.icon4):SetPosY((self._posConfig)._iconStartPosY + (self._posConfig)._listPosYGap * listIdx)
    rankList.icon5 = (UI.createAndCopyBasePropertyControl)(Panel_Guild_Rank, "Static_Balencia", Panel_Guild_Rank, "guildRanking_IconBalencia_" .. listIdx)
    ;
    (rankList.icon5):SetPosX(572)
    ;
    (rankList.icon5):SetPosY((self._posConfig)._iconStartPosY + (self._posConfig)._listPosYGap * listIdx)
    rankList.dash1 = (UI.createAndCopyBasePropertyControl)(Panel_Guild_Rank, "StaticText_Dash1", Panel_Guild_Rank, "guildRanking_DashSerendia_" .. listIdx)
    ;
    (rankList.dash1):SetPosX(469)
    ;
    (rankList.dash1):SetPosY((self._posConfig)._iconStartPosY + (self._posConfig)._listPosYGap * listIdx)
    rankList.node = (UI.createAndCopyBasePropertyControl)(Panel_Guild_Rank, "StaticText_NodeOccupation", Panel_Guild_Rank, "guildRanking_Node_" .. listIdx)
    ;
    (rankList.node):SetPosX(550)
    ;
    (rankList.node):SetPosY((self._posConfig)._listStartPosY + (self._posConfig)._listPosYGap * listIdx)
    rankList.duelWar = (UI.createAndCopyBasePropertyControl)(Panel_Guild_Rank, "StaticText_GuildDuelWar", Panel_Guild_Rank, "guildRanking_DuelWar_" .. listIdx)
    ;
    (rankList.duelWar):SetPosX(630)
    ;
    (rankList.duelWar):SetPosY((self._posConfig)._listStartPosY + (self._posConfig)._listPosYGap * listIdx)
    rankList.personnel = (UI.createAndCopyBasePropertyControl)(Panel_Guild_Rank, "StaticText_Personnel", Panel_Guild_Rank, "guildRanking_Personnel_" .. listIdx)
    ;
    (rankList.personnel):SetPosX(710)
    ;
    (rankList.personnel):SetPosY((self._posConfig)._listStartPosY + (self._posConfig)._listPosYGap * listIdx)
    rankList.point = (UI.createAndCopyBasePropertyControl)(Panel_Guild_Rank, "StaticText_GuildPoint", Panel_Guild_Rank, "guildRanking_GuildPoint_" .. listIdx)
    ;
    (rankList.point):SetPosX(785)
    ;
    (rankList.point):SetPosY((self._posConfig)._listStartPosY + (self._posConfig)._listPosYGap * listIdx)
    -- DECOMPILER ERROR at PC347: Confused about usage of register: R6 in 'UnsetPending'

    ;
    (self._listPool)[listIdx] = rankList
  end
  _btn_Next:SetAutoDisableTime(3)
  local screenSizeX = getScreenSizeX()
  local screenSizeY = getScreenSizeY()
  Panel_Guild_Rank:SetPosX((screenSizeX - Panel_Guild_Rank:GetSizeX()) / 2)
  Panel_Guild_Rank:SetPosY((screenSizeY - Panel_Guild_Rank:GetSizeY()) / 2)
end

guildRanking.Update = function(self)
  -- function num : 0_7 , upvalues : UI_color, _btn_Next, _btn_Prev, _txt_page
  for listIdx = 0, self._createListCount - 1 do
    local list = (self._listPool)[listIdx]
    ;
    (list.rank):SetShow(false)
    ;
    (list.guild):SetShow(false)
    ;
    (list.familyName):SetShow(false)
    ;
    (list.icon1):SetShow(false)
    ;
    (list.icon2):SetShow(false)
    ;
    (list.icon3):SetShow(false)
    ;
    (list.icon4):SetShow(false)
    ;
    (list.icon5):SetShow(false)
    ;
    (list.dash1):SetShow(false)
    ;
    (list.node):SetShow(false)
    ;
    (list.duelWar):SetShow(false)
    ;
    (list.personnel):SetShow(false)
    ;
    (list.point):SetShow(false)
  end
  local startSlotNo = 0
  local endSlotNo = 0
  startSlotNo = 0
  endSlotNo = 23
  local maxCount = 400
  self._selectMaxPage = (math.floor)(maxCount / self._createListCount) - 1
  if maxCount % self._createListCount > 0 then
    self._selectMaxPage = self._selectMaxPage + 1
  end
  self._listCount = ToClient_GetGuildCount()
  local count = 0
  for listIdx = startSlotNo, self._listCount - 1 do
    local guildRanker = ToClient_GetGuildRankingInfoAt(listIdx)
    local guildRankerGuildMark_s64 = guildRanker:getGuildNo_s64()
    local guildRankerGuild = guildRanker:getGuildName()
    local guildRankerMasterName = guildRanker:getGuildMasterNickName()
    local guildRankerTerritoryCount = guildRanker:getTerritoryCount()
    local guildRankerNodeCount = guildRanker:getSiegeCount()
    local guildRankerMemberCount = guildRanker._guildMemberCount
    local guildRankerAquirePorint = guildRanker._guildAquiredPoint
    local guildIntroduce = guildRanker:getGuildIntroduction()
    local loadComplete = guildRanker:isLoadComplete()
    local guildDuelWarWin = guildRanker:getGuildDuelWinCount()
    local guildDuelWarLose = guildRanker:getGuildDuelLoseCount()
    if self._createListCount <= count then
      break
    end
    local list = (self._listPool)[count]
    ;
    (list.rank):SetShow(true)
    ;
    (list.guild):SetShow(true)
    ;
    (list.familyName):SetShow(true)
    ;
    (list.dash1):SetShow(true)
    ;
    (list.node):SetShow(true)
    ;
    (list.duelWar):SetShow(true)
    ;
    (list.personnel):SetShow(true)
    ;
    (list.point):SetShow(true)
    ;
    (list.icon1):SetShow(false)
    ;
    (list.icon2):SetShow(false)
    ;
    (list.icon3):SetShow(false)
    ;
    (list.icon4):SetShow(false)
    ;
    (list.icon5):SetShow(false)
    ;
    (list.rank):SetFontColor(UI_color.C_FFC4BEBE)
    ;
    (list.guild):SetFontColor(UI_color.C_FFC4BEBE)
    ;
    (list.familyName):SetFontColor(UI_color.C_FFC4BEBE)
    ;
    (list.duelWar):SetFontColor(UI_color.C_FFC4BEBE)
    ;
    (list.personnel):SetFontColor(UI_color.C_FFC4BEBE)
    ;
    (list.point):SetFontColor(UI_color.C_FFC4BEBE)
    ;
    (list.rank):SetText(listIdx + 1 + self._selectPage * endSlotNo)
    local isSet = setGuildTextureByGuildNo(guildRankerGuildMark_s64, list.guild)
    if isSet == false then
      (list.guild):ChangeTextureInfoName("New_UI_Common_forLua/Default/Default_Buttons.dds")
      local x1, y1, x2, y2 = setTextureUV_Func(list.guild, 183, 1, 188, 6)
      ;
      ((list.guild):getBaseTexture()):setUV(x1, y1, x2, y2)
      ;
      (list.guild):setRenderTexture((list.guild):getBaseTexture())
    else
      do
        ;
        ((list.guild):getBaseTexture()):setUV(0, 0, 1, 1)
        ;
        (list.guild):setRenderTexture((list.guild):getBaseTexture())
        if loadComplete then
          (list.guild):SetText(guildRankerGuild)
        else
          ;
          (list.guild):SetText("Loading...")
        end
        ;
        (list.familyName):SetText(guildRankerMasterName)
        ;
        (list.guild):addInputEvent("Mouse_LUp", "FGlobal_GuildWebInfo_Open( " .. listIdx .. " )")
        ;
        (list.guild):addInputEvent("Mouse_On", "GuildRank_Tooltip(true, " .. listIdx .. ")")
        ;
        (list.guild):addInputEvent("Mouse_Out", "GuildRank_Tooltip(false, " .. listIdx .. ")")
        ;
        (list.guild):setTooltipEventRegistFunc("GuildRank_Tooltip(true, " .. listIdx .. ")")
        ;
        (list.icon1):SetShow(false)
        ;
        (list.icon2):SetShow(false)
        ;
        (list.icon3):SetShow(false)
        ;
        (list.icon4):SetShow(false)
        ;
        (list.icon5):SetShow(false)
        local guildRankerTerritory = -1
        local iconPosX = 430
        do
          local occupationCount = 0
          for i = 0, self.territoryCount - 1 do
            guildRankerTerritory = guildRanker:getTerritoryKeyAt(i)
            if guildRankerTerritory == 0 then
              (list.icon2):SetShow(true)
              ;
              (list.dash1):SetShow(false)
              ;
              (list.icon2):addInputEvent("Mouse_On", "guildRanking_SimpleTooltips( true, 0, " .. listIdx .. ")")
              ;
              (list.icon2):addInputEvent("Mouse_Out", "guildRanking_SimpleTooltips( false )")
              ;
              (list.icon2):setTooltipEventRegistFunc("guildRanking_SimpleTooltips( true, 0, " .. listIdx .. ")")
              occupationCount = occupationCount + 1
            end
            if guildRankerTerritory == 1 then
              (list.icon1):SetShow(true)
              ;
              (list.dash1):SetShow(false)
              ;
              (list.icon1):addInputEvent("Mouse_On", "guildRanking_SimpleTooltips( true, 1, " .. listIdx .. ")")
              ;
              (list.icon1):addInputEvent("Mouse_Out", "guildRanking_SimpleTooltips( false )")
              ;
              (list.icon1):setTooltipEventRegistFunc("guildRanking_SimpleTooltips( true, 1, " .. listIdx .. ")")
              occupationCount = occupationCount + 1
            end
            if guildRankerTerritory == 2 then
              (list.icon3):SetShow(true)
              ;
              (list.dash1):SetShow(false)
              ;
              (list.icon3):addInputEvent("Mouse_On", "guildRanking_SimpleTooltips( true, 2, " .. listIdx .. ")")
              ;
              (list.icon3):addInputEvent("Mouse_Out", "guildRanking_SimpleTooltips( false )")
              ;
              (list.icon3):setTooltipEventRegistFunc("guildRanking_SimpleTooltips( true, 2, " .. listIdx .. ")")
              occupationCount = occupationCount + 1
            end
            if guildRankerTerritory == 3 then
              (list.icon4):SetShow(true)
              ;
              (list.dash1):SetShow(false)
              ;
              (list.icon4):addInputEvent("Mouse_On", "guildRanking_SimpleTooltips( true, 3, " .. listIdx .. ")")
              ;
              (list.icon4):addInputEvent("Mouse_Out", "guildRanking_SimpleTooltips( false )")
              ;
              (list.icon4):setTooltipEventRegistFunc("guildRanking_SimpleTooltips( true, 3, " .. listIdx .. ")")
              occupationCount = occupationCount + 1
            end
            if guildRankerTerritory == 4 then
              (list.icon5):SetShow(true)
              ;
              (list.dash1):SetShow(false)
              ;
              (list.icon5):addInputEvent("Mouse_On", "guildRanking_SimpleTooltips( true, 4, " .. listIdx .. ")")
              ;
              (list.icon5):addInputEvent("Mouse_Out", "guildRanking_SimpleTooltips( false )")
              ;
              (list.icon5):setTooltipEventRegistFunc("guildRanking_SimpleTooltips( true, 4, " .. listIdx .. ")")
              occupationCount = occupationCount + 1
            end
            if occupationCount == 0 then
              iconPosX = 470
            else
              if occupationCount == 1 then
                iconPosX = 467
              else
                if occupationCount == 2 then
                  iconPosX = 453
                else
                  if occupationCount == 3 then
                    iconPosX = 440
                  else
                    if occupationCount == 4 then
                      iconPosX = 430
                    end
                  end
                end
              end
            end
            if (list.icon1):GetShow() then
              (list.icon1):SetPosX(iconPosX)
              iconPosX = iconPosX + 25
            end
            if (list.icon2):GetShow() then
              (list.icon2):SetPosX(iconPosX)
              iconPosX = iconPosX + 25
            end
            if (list.icon3):GetShow() then
              (list.icon3):SetPosX(iconPosX)
              iconPosX = iconPosX + 25
            end
            if (list.icon4):GetShow() then
              (list.icon4):SetPosX(iconPosX)
              iconPosX = iconPosX + 25
            end
            if (list.icon5):GetShow() then
              (list.icon5):SetPosX(iconPosX)
              iconPosX = iconPosX + 25
            end
          end
          ;
          (list.node):SetText(guildRankerNodeCount)
          ;
          (list.duelWar):SetText("<PAColor0xff00c0d7>" .. guildDuelWarWin .. "<PAOldColor>")
          ;
          (list.personnel):SetText(guildRankerMemberCount)
          ;
          (list.point):SetText(guildRankerAquirePorint)
          count = count + 1
          -- DECOMPILER ERROR at PC577: LeaveBlock: unexpected jumping out DO_STMT

          -- DECOMPILER ERROR at PC577: LeaveBlock: unexpected jumping out IF_ELSE_STMT

          -- DECOMPILER ERROR at PC577: LeaveBlock: unexpected jumping out IF_STMT

        end
      end
    end
  end
  if self._selectPage + 1 == 16 then
    _btn_Next:SetIgnore(true)
  else
    _btn_Next:SetIgnore(false)
  end
  if self._selectPage + 1 == 1 then
    _btn_Prev:SetIgnore(true)
  else
    _btn_Prev:SetIgnore(false)
  end
  _txt_page:SetText(self._selectPage + 1)
end

GuildRank_Tooltip = function(isShow, index)
  -- function num : 0_8 , upvalues : guildRanking
  local self = guildRanking
  local guildRanker = ToClient_GetGuildRankingInfoAt(index)
  local guildRankerGuildMark_s64 = guildRanker:getGuildNo_s64()
  local guildRankerGuild = guildRanker:getGuildName()
  local guildRankerMasterName = guildRanker:getGuildMasterNickName()
  local guildRankerTerritoryCount = guildRanker:getTerritoryCount()
  local guildRankerNodeCount = guildRanker:getSiegeCount()
  local guildRankerMemberCount = guildRanker._guildMemberCount
  local guildRankerAquirePorint = guildRanker._guildAquiredPoint
  local guildIntroduce = guildRanker:getGuildIntroduction()
  local list = ((self._listPool)[index]).guild
  registTooltipControl(list, Panel_Tooltip_Guild_Introduce)
  if isShow == true then
    TooltipGuild_Show(list, guildRankerGuildMark_s64, guildRankerGuild, guildRankerMasterName, guildIntroduce)
  else
    TooltipGuild_Hide()
  end
end

FromClient_UpdateGuildRank = function(page)
  -- function num : 0_9 , upvalues : guildRanking
  local guildCount = ToClient_GetGuildCount()
  local self = guildRanking
  if guildCount == 0 then
    self._selectPage = self._selectPage - 1
    return 
  end
  self._selectPage = page
  audioPostEvent_SystemUi(1, 0)
  self:Update()
end

FGlobal_guildRanking_Open = function()
  -- function num : 0_10 , upvalues : guildRanking, editBox_Search, radioBtn_GuildName
  local self = guildRanking
  if Panel_Guild_Rank:GetShow() then
    Panel_Guild_Rank:SetShow(false, false)
    ClearFocusEdit()
  else
    Panel_Guild_Rank:SetShow(true, true)
  end
  ToClient_RequestGuildRanking(0)
  self:Update()
  editBox_Search:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GUILDRANK_SERACHALERT"))
  radioBtn_GuildName:SetCheck(true)
end

FGlobal_guildRanking_Close = function()
  -- function num : 0_11
  Panel_Guild_Rank:SetShow(false, false)
  ClearFocusEdit()
  TooltipSimple_Hide()
  TooltipGuild_Hide()
end

guildRanking_NextBtn = function()
  -- function num : 0_12 , upvalues : guildRanking
  audioPostEvent_SystemUi(0, 0)
  local self = guildRanking
  if self._selectMaxPage <= self._selectPage then
    return 
  end
  self._selectPage = self._selectPage + 1
  ToClient_RequestGuildRanking(self._selectPage)
end

guildRanking_PrevBtn = function()
  -- function num : 0_13 , upvalues : _btn_Prev, guildRanking
  audioPostEvent_SystemUi(0, 0)
  _btn_Prev:DoAutoDisableTime()
  local self = guildRanking
  if self._selectPage > 0 then
    self._selectPage = self._selectPage - 1
  end
  ToClient_RequestGuildRanking(self._selectPage)
end

guildRanking_SimpleTooltips = function(isShow, terriType, listIdx)
  -- function num : 0_14 , upvalues : guildRanking
  local self = guildRanking
  local name, desc, uiControl = nil, nil, nil
  local list = (self._listPool)[listIdx]
  if terriType == 0 then
    name = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDRANK_TOOLTIP_BALENOS_NAME")
    desc = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDRANK_TOOLTIP_BALENOS_DESC")
    uiControl = list.icon1
  else
    if terriType == 1 then
      name = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDRANK_TOOLTIP_SERENDIA_NAME")
      desc = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDRANK_TOOLTIP_SERENDIA_DESC")
      uiControl = list.icon2
    else
      if terriType == 2 then
        name = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDRANK_TOOLTIP_KALPEON_NAME")
        desc = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDRANK_TOOLTIP_KALPEON_DESC")
        uiControl = list.icon3
      else
        if terriType == 3 then
          name = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDRANK_TOOLTIP_MEDIA_NAME")
          desc = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDRANK_TOOLTIP_MEDIA_DESC")
          uiControl = list.icon4
        else
          if terriType == 4 then
            name = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDRANK_TOOLTIP_BALENCIA_NAME")
            desc = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDRANK_TOOLTIP_BALENCIA_DESC")
            uiControl = list.icon5
          end
        end
      end
    end
  end
  if isShow == true then
    registTooltipControl(uiControl, Panel_Tooltip_SimpleText)
    TooltipSimple_Show(uiControl, name, desc)
  else
    TooltipSimple_Hide()
  end
end

GuildRank_Repos = function()
  -- function num : 0_15
  local screenSizeX = getScreenSizeX()
  local screenSizeY = getScreenSizeY()
  Panel_Guild_Rank:SetPosX((screenSizeX - Panel_Guild_Rank:GetSizeX()) / 2)
  Panel_Guild_Rank:SetPosY((screenSizeY - Panel_Guild_Rank:GetSizeY()) / 2)
end

guildRanking_registEventHandler = function()
  -- function num : 0_16 , upvalues : guildRanking, _btn_Next, _btn_Prev
  local self = guildRanking
  ;
  (self._btnClose):addInputEvent("Mouse_LUp", "FGlobal_guildRanking_Close()")
  _btn_Next:addInputEvent("Mouse_LUp", "guildRanking_NextBtn()")
  _btn_Prev:addInputEvent("Mouse_LUp", "guildRanking_PrevBtn()")
  ;
  (guildRanking._btnHelp):SetShow(false)
end

guildRanking_registMessageHandler = function()
  -- function num : 0_17
  registerEvent("onScreenResize", "GuildRank_Repos")
  registerEvent("FromClient_UpdateGuildRank", "FromClient_UpdateGuildRank")
end

guildRanking_Initionalize()
guildRanking_registEventHandler()
guildRanking_registMessageHandler()
Panel_GuildRank_Web:SetShow(false, false)
Panel_GuildRank_Web:RegisterShowEventFunc(true, "WebGuildRankingShowAni()")
Panel_GuildRank_Web:RegisterShowEventFunc(false, "WebGuildRankingHideAni()")
Panel_GuildRank_Web:setGlassBackground(true)
Panel_GuildRank_Web:ActiveMouseEventEffect(true)
WebGuildRankingShowAni = function()
  -- function num : 0_18 , upvalues : UI_ANI_ADV
  (UIAni.fadeInSCR_Down)(Panel_GuildRank_Web)
  local aniInfo1 = Panel_GuildRank_Web:addScaleAnimation(0, 0.08, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo1:SetStartScale(0.5)
  aniInfo1:SetEndScale(1.2)
  aniInfo1.AxisX = Panel_GuildRank_Web:GetSizeX() / 2
  aniInfo1.AxisY = Panel_GuildRank_Web:GetSizeY() / 2
  aniInfo1.ScaleType = 2
  aniInfo1.IsChangeChild = true
  local aniInfo2 = Panel_GuildRank_Web:addScaleAnimation(0.08, 0.15, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo2:SetStartScale(1.2)
  aniInfo2:SetEndScale(1)
  aniInfo2.AxisX = Panel_GuildRank_Web:GetSizeX() / 2
  aniInfo2.AxisY = Panel_GuildRank_Web:GetSizeY() / 2
  aniInfo2.ScaleType = 2
  aniInfo2.IsChangeChild = true
end

WebGuildRankingHideAni = function()
  -- function num : 0_19 , upvalues : UI_ANI_ADV, UI_color
  local aniInfo1 = Panel_GuildRank_Web:addColorAnimation(0, 0.1, UI_ANI_ADV.PAUI_ANIM_ADVANCE_SIN_HALF_PI)
  aniInfo1:SetStartColor(UI_color.C_FFFFFFFF)
  aniInfo1:SetEndColor(UI_color.C_00FFFFFF)
  aniInfo1:SetStartIntensity(3)
  aniInfo1:SetEndIntensity(1)
  aniInfo1.IsChangeChild = true
  aniInfo1:SetHideAtEnd(true)
  aniInfo1:SetDisableWhileAni(true)
end

local rankBg = (UI.getChildControl)(Panel_GuildRank_Web, "Static_RankListBG")
local webClose = (UI.getChildControl)(Panel_GuildRank_Web, "Button_Win_Close")
local webHelp = (UI.getChildControl)(Panel_GuildRank_Web, "Button_Question")
rankBg:SetShow(false)
webHelp:SetShow(false)
local _Web = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_WEBCONTROL, Panel_GuildRank_Web, "WebControl_GuildRank_WebLink")
_Web:SetShow(true)
_Web:SetPosX(40)
_Web:SetPosY(60)
_Web:SetSize(890, 645)
_Web:ResetUrl()
webClose:addInputEvent("Mouse_LUp", "GuildRank_Web_Close()")
GuildRank_Web_Show = function()
  -- function num : 0_20 , upvalues : _Web, GST
  if not Panel_GuildRank_Web:GetShow() then
    Panel_GuildRank_Web:SetShow(true, true)
    FGlobal_ClearCandidate()
    _Web:ResetUrl()
    FGlobal_SetCandidate()
    local selfPlayer = getSelfPlayer()
    if selfPlayer == nil then
      return 
    end
    local userNo = (selfPlayer:get()):getUserNo()
    local cryptKey = (selfPlayer:get()):getWebAuthenticKeyCryptString()
    local temporaryWrapper = getTemporaryInformationWrapper()
    local worldNo = temporaryWrapper:getSelectedWorldServerNo()
    local gameServiceType = (getGameServiceType())
    local url = nil
    if GST.eGameServiceType_NONE == gameServiceType or GST.eGameServiceType_DEV == gameServiceType then
      url = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDRANKING_URL_KOR_DEV")
    else
      if GST.eGameServiceType_KOR_ALPHA == gameServiceType or GST.eGameServiceType_KOR_TEST == gameServiceType then
        url = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDRANKING_URL_KOR_ALPHA")
      else
        if GST.eGameServiceType_KOR_REAL == gameServiceType then
          url = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDRANKING_URL_KOR_REAL")
        else
          if (CppEnums.CountryType).NA_ALPHA == getGameServiceType() then
            if getServiceNationType() == 0 then
              url = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILDRANKING_URL_NA_ALPHA_NA", "port", worldNo)
            else
              if getServiceNationType() == 1 then
                url = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILDRANKING_URL_NA_ALPHA_EU", "port", worldNo)
              end
            end
          else
            if (CppEnums.CountryType).NA_REAL == getGameServiceType() then
              if getServiceNationType() == 0 then
                url = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILDRANKING_URL_NA_REAL_NA", "port", worldNo)
              else
                if getServiceNationType() == 1 then
                  url = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILDRANKING_URL_NA_REAL_EU", "port", worldNo)
                end
              end
            else
              if (CppEnums.CountryType).JPN_ALPHA == getGameServiceType() then
                url = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDRANKING_URL_JP_ALPHA")
              else
                if (CppEnums.CountryType).JPN_REAL == getGameServiceType() then
                  url = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDRANKING_URL_JP_REAL")
                else
                  if (CppEnums.CountryType).RUS_ALPHA == getGameServiceType() then
                    url = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDRANKING_URL_RUS_ALPHA")
                  else
                    if (CppEnums.CountryType).RUS_REAL == getGameServiceType() then
                      if isServerFixedCharge() then
                        url = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDRANKING_URL_RUS_REAL_P2P")
                      else
                        url = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDRANKING_URL_RUS_REAL_F2P")
                      end
                    else
                      if (CppEnums.CountryType).TW_ALPHA == getGameServiceType() then
                        url = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDRANKING_URL_TW_ALPHA")
                      else
                        if (CppEnums.CountryType).TW_REAL == getGameServiceType() then
                          url = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDRANKING_URL_TW_REAL")
                        else
                          if (CppEnums.CountryType).SA_ALPHA == getGameServiceType() then
                            url = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDRANKING_URL_SA_ALPHA")
                          else
                            if (CppEnums.CountryType).SA_REAL == getGameServiceType() then
                              url = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDRANKING_URL_SA_REAL")
                            else
                              if (CppEnums.CountryType).KR2_ALPHA == getGameServiceType() then
                                url = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDRANKING_URL_KR2_ALPHA")
                              else
                                if (CppEnums.CountryType).KR2_REAL == getGameServiceType() then
                                  url = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDRANKING_URL_KR2_REAL")
                                else
                                  _PA_LOG("정태�\164", "한국, 일본, 러시�\132, 북미&유럽, �\128�\140 �\184 다른 국가�\152 �\128입이 존재한다!!!! 수정해야�\168!!")
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
              end
            end
          end
        end
      end
    end
    url = url .. "?userNo=" .. tostring(userNo) .. "&certKey=" .. tostring(cryptKey)
    _Web:SetUrl(890, 645, url, false, true)
    _Web:SetIME(true)
  end
end

GuildRank_Web_Close = function()
  -- function num : 0_21 , upvalues : _Web
  Panel_GuildRank_Web:SetShow(false, true)
  FGlobal_ClearCandidate()
  _Web:ResetUrl()
end


