-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\window\worldmap_grand\grand_worldmap_plundervote.luac 

-- params : ...
-- function num : 0
local PlunderTerritoryKey = {calpheon = 2, media = 3, valencia = 4}
local PaGlobal_PlunderVote = {
ui = {_staticTitle = (UI.getChildControl)(Panel_WorldMap_PlunderVote, "Static_Text_Title"), _approvalRatingBg = (UI.getChildControl)(Panel_WorldMap_PlunderVote, "Static_ApprovalRatingBg"), 
_approvalRating = {}
, _decreaseDisLikeBg = (UI.getChildControl)(Panel_WorldMap_PlunderVote, "Static_DecreaseBg"), 
_decreaseDisLike = {}
, _voteBtn = (UI.getChildControl)(Panel_WorldMap_PlunderVote, "Button_Vote"), _decreaseDislikeBtn = (UI.getChildControl)(Panel_WorldMap_PlunderVote, "Button_DecreaseDislike"), _voteCancelBtn = (UI.getChildControl)(Panel_WorldMap_PlunderVote, "Button_Cancel")}
, _territoryKey = 0, _isLike = 0, _decreaseDisLikeCount = 0}
PaGlobal_PlunderVote.init = function(self)
  -- function num : 0_0 , upvalues : PaGlobal_PlunderVote
  -- DECOMPILER ERROR at PC51: Confused about usage of register: R1 in 'UnsetPending'

  (self.ui)._approvalRating = {_territoryName = (UI.getChildControl)((self.ui)._approvalRatingBg, "StaticText_TerritoryName"), _guildIconBG = (UI.getChildControl)((self.ui)._approvalRatingBg, "Static_GuildIcon_BG"), _guildIcon = (UI.getChildControl)((self.ui)._approvalRatingBg, "Static_Guild_Icon"), _guildName = (UI.getChildControl)((self.ui)._approvalRatingBg, "StaticText_GuildName"), _currentState = (UI.getChildControl)((self.ui)._approvalRatingBg, "StaticText_CurrentState"), _plusRadioBtn = (UI.getChildControl)((self.ui)._approvalRatingBg, "RadioButton_Plus"), _minusRadioBtn = (UI.getChildControl)((self.ui)._approvalRatingBg, "RadioButton_Minus")}
  ;
  ((self.ui)._voteBtn):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_APPROVERATINGRATING_BTN_VOTE"))
  ;
  ((self.ui)._decreaseDislikeBtn):SetText(PAGetString(Defines.StringSheet_RESOURCE, "AUCTION_POPUP_BTN_YES"))
  ;
  ((self.ui)._voteCancelBtn):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_APPROVERATINGRATING_BTN_CANCEL"))
  ;
  (((self.ui)._approvalRating)._plusRadioBtn):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_APPROVERATINGRATING_SUPPORT_VOTE"))
  ;
  (((self.ui)._approvalRating)._minusRadioBtn):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_APPROVERATINGRATING_COMPLAIN_VOTE"))
  -- DECOMPILER ERROR at PC100: Confused about usage of register: R1 in 'UnsetPending'

  PaGlobal_PlunderVote._territoryKey = 0
  -- DECOMPILER ERROR at PC152: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self.ui)._decreaseDisLike = {_territoryName = (UI.getChildControl)((self.ui)._decreaseDisLikeBg, "StaticText_TerritoryName"), _guildIconBG = (UI.getChildControl)((self.ui)._decreaseDisLikeBg, "Static_GuildIcon_BG"), _guildIcon = (UI.getChildControl)((self.ui)._decreaseDisLikeBg, "Static_Guild_Icon"), _guildName = (UI.getChildControl)((self.ui)._decreaseDisLikeBg, "StaticText_GuildName"), _currentState = (UI.getChildControl)((self.ui)._decreaseDisLikeBg, "StaticText_CurrentState"), _editCount = (UI.getChildControl)((self.ui)._decreaseDisLikeBg, "Edit_Count"), _needMoneyValue = (UI.getChildControl)((self.ui)._decreaseDisLikeBg, "StaticText_NeedMoneyValue")}
end

PaGlobal_PlunderVote.open = function(self, key, currentstate, territoryName, guildName, isGuildMaster)
  -- function num : 0_1
  self._territoryKey = key
  self._decreaseDisLikeCount = 0
  if isGuildMaster == false then
    ((self.ui)._approvalRatingBg):SetShow(true)
    ;
    ((self.ui)._voteBtn):SetShow(true)
    ;
    ((self.ui)._decreaseDisLikeBg):SetShow(false)
    ;
    ((self.ui)._decreaseDislikeBtn):SetShow(false)
    ;
    (((self.ui)._approvalRating)._currentState):SetText(currentstate)
    ;
    (((self.ui)._approvalRating)._territoryName):SetText(territoryName)
    ;
    (((self.ui)._approvalRating)._guildName):SetText(guildName)
    HandleClicked_PlunderGameRadioBtn(true)
  else
    ;
    ((self.ui)._approvalRatingBg):SetShow(false)
    ;
    ((self.ui)._voteBtn):SetShow(false)
    ;
    ((self.ui)._decreaseDisLikeBg):SetShow(true)
    ;
    ((self.ui)._decreaseDislikeBtn):SetShow(true)
    ;
    (((self.ui)._decreaseDisLike)._currentState):SetText(currentstate)
    ;
    (((self.ui)._decreaseDisLike)._territoryName):SetText(territoryName)
    ;
    (((self.ui)._decreaseDisLike)._guildName):SetText(guildName)
    ;
    (((self.ui)._decreaseDisLike)._editCount):SetEditText("0")
    ;
    (((self.ui)._decreaseDisLike)._needMoneyValue):SetText("0")
  end
end

FGlobal_PlunderVoteOpen = function(key, currentstate, isGuildMaster)
  -- function num : 0_2 , upvalues : PaGlobal_PlunderVote
  if Panel_WorldMap_PlunderVote:GetShow() == true then
    return 
  end
  local territorySiege = ToClient_GetSiegeWrapper(key)
  if territorySiege == nil then
    _PA_LOG("무정", "여기까지 �\128�\156 해당 영지�\128 없는�\180 말이 �\136 됩니�\164.")
    return 
  end
  local guildNo = (territorySiege:getGuildNo())
  local guildIcon = nil
  if isGuildMaster == false then
    guildIcon = ((PaGlobal_PlunderVote.ui)._approvalRating)._guildIcon
    ;
    ((PaGlobal_PlunderVote.ui)._staticTitle):SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_WORLDMAP_GRAND_VOTE_POPUP"))
  else
    guildIcon = ((PaGlobal_PlunderVote.ui)._decreaseDisLike)._guildIcon
    ;
    ((PaGlobal_PlunderVote.ui)._staticTitle):SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_WORLDMAP_GRAND_COMPLAINT_MANAGEMENT"))
  end
  local isSet = setGuildTextureByGuildNo(guildNo, guildIcon)
  if isSet == false then
    _PA_LOG("무정", "점령�\156 길드�\128 없습니다. 필요하다�\180 메시�\128 띄울 �\131")
    return 
  else
    ;
    (guildIcon:getBaseTexture()):setUV(0, 0, 1, 1)
    guildIcon:setRenderTexture(guildIcon:getBaseTexture())
  end
  PaGlobal_PlunderVote:open(key, currentstate, territorySiege:getTerritoryName(), territorySiege:getGuildName(), isGuildMaster)
  Panel_WorldMap_PlunderVote:SetShow(true)
end

FGlobal_PlunderDecreaseDisLike = function(count)
  -- function num : 0_3 , upvalues : PaGlobal_PlunderVote
  count = Int64toInt32(count)
  -- DECOMPILER ERROR at PC5: Confused about usage of register: R1 in 'UnsetPending'

  PaGlobal_PlunderVote._decreaseDisLikeCount = count
  ;
  (((PaGlobal_PlunderVote.ui)._decreaseDisLike)._editCount):SetEditText(tostring(count))
  local money = ToClient_GetPlunderGameDecreaseDislikeNeedMoney(PaGlobal_PlunderVote._decreaseDisLikeCount)
  ;
  (((PaGlobal_PlunderVote.ui)._decreaseDisLike)._needMoneyValue):SetText(makeDotMoney(money))
end

HandleClicked_PlunderGameVote = function()
  -- function num : 0_4 , upvalues : PaGlobal_PlunderVote
  ToClient_PlunderGameVote(PaGlobal_PlunderVote._territoryKey, PaGlobal_PlunderVote._isLike)
  Panel_WorldMap_PlunderVote:SetShow(false)
end

HandleClicked_PlunderGameDecreaseDislike = function()
  -- function num : 0_5 , upvalues : PaGlobal_PlunderVote
  if PaGlobal_PlunderVote._decreaseDisLikeCount > 0 then
    ToClient_decreaseDisLike(PaGlobal_PlunderVote._decreaseDisLikeCount)
    Panel_WorldMap_PlunderVote:SetShow(false)
  end
end

HandleClicked_PlunderGameVoteCancel = function()
  -- function num : 0_6
  Panel_WorldMap_PlunderVote:SetShow(false)
end

HandleClicked_PlunderGameRadioBtn = function(isPlue)
  -- function num : 0_7 , upvalues : PaGlobal_PlunderVote
  local ui = PaGlobal_PlunderVote.ui
  if isPlue == true then
    ((ui._approvalRating)._plusRadioBtn):SetCheck(true)
    ;
    ((ui._approvalRating)._minusRadioBtn):SetCheck(false)
    -- DECOMPILER ERROR at PC15: Confused about usage of register: R2 in 'UnsetPending'

    paGlobal_PlunderVote._isLike = true
  else
    ;
    ((ui._approvalRating)._plusRadioBtn):SetCheck(false)
    ;
    ((ui._approvalRating)._minusRadioBtn):SetCheck(true)
    -- DECOMPILER ERROR at PC28: Confused about usage of register: R2 in 'UnsetPending'

    paGlobal_PlunderVote._isLike = false
  end
end

HandleClicked_PlunderGameEditCount = function()
  -- function num : 0_8
  local count = ToClient_getMaxDecreaseDisLikeCount()
  Panel_NumberPad_Show(true, toInt64(0, count), 0, FGlobal_PlunderDecreaseDisLike)
end

FromClient_luaLoadComplete_PlunderVote = function()
  -- function num : 0_9 , upvalues : PaGlobal_PlunderVote
  PaGlobal_PlunderVote:init()
  PaGlobal_PlunderVote:registEventHandler()
end

PaGlobal_PlunderVote.registEventHandler = function(self)
  -- function num : 0_10
  local ui = self.ui
  ;
  (ui._voteBtn):addInputEvent("Mouse_LUp", "HandleClicked_PlunderGameVote()")
  ;
  (ui._decreaseDislikeBtn):addInputEvent("Mouse_LUp", "HandleClicked_PlunderGameDecreaseDislike()")
  ;
  (ui._voteCancelBtn):addInputEvent("Mouse_LUp", "HandleClicked_PlunderGameVoteCancel()")
  ;
  ((ui._approvalRating)._plusRadioBtn):addInputEvent("Mouse_LUp", "HandleClicked_PlunderGameRadioBtn(true)")
  ;
  ((ui._approvalRating)._minusRadioBtn):addInputEvent("Mouse_LUp", "HandleClicked_PlunderGameRadioBtn(false)")
  ;
  ((ui._decreaseDisLike)._editCount):addInputEvent("Mouse_LUp", "HandleClicked_PlunderGameEditCount()")
end

registerEvent("FromClient_luaLoadComplete", "FromClient_luaLoadComplete_PlunderVote")

