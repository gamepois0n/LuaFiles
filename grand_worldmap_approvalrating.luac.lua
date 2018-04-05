-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\window\worldmap_grand\grand_worldmap_approvalrating.luac 

-- params : ...
-- function num : 0
local IM = CppEnums.EProcessorInputMode
local UI_color = Defines.Color
local UI_ST = CppEnums.SpawnType
local UI_TM = CppEnums.TextMode
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
local UI_AV = CppEnums.PA_UI_ALIGNVERTICAL
local UI_TT = CppEnums.PAUI_TEXTURE_TYPE
local UI_VT = CppEnums.VillageSiegeType
local PlunderTerritoryKey = {calpheon = 2, media = 3, valencia = 4}
local PaGlobal_ApprovalRating = {
ui = {approvalRatingBg = (UI.getChildControl)(Panel_WorldMap_Main, "Static_ApprovalRatingBg"), 
approvalUi = {}
}
, _checkRadioBtn = 0, 
_approvalRatingValue = {}
, 
_territoryGuildMaster = {}
}
PaGlobal_ApprovalRating.initApprovalRating = function(self)
  -- function num : 0_0 , upvalues : PlunderTerritoryKey
  -- DECOMPILER ERROR at PC23: Confused about usage of register: R1 in 'UnsetPending'

  (self.ui).approvalUi = {calpheonBg = (UI.getChildControl)((self.ui).approvalRatingBg, "Static_CalpheonBg"), mediaBg = (UI.getChildControl)((self.ui).approvalRatingBg, "Static_MediaBg"), valenciaBg = (UI.getChildControl)((self.ui).approvalRatingBg, "Static_ValenciaBg")}
  -- DECOMPILER ERROR at PC105: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self.ui).approvalUi = {calpheonText = (UI.getChildControl)(((self.ui).approvalUi).calpheonBg, "StaticText_Calpheon"), calpheonValue = (UI.getChildControl)(((self.ui).approvalUi).calpheonBg, "StaticText_CalpheonValue"), calpheonRadioBtn = (UI.getChildControl)(((self.ui).approvalUi).calpheonBg, "RadioButton_Calpheon"), mediaText = (UI.getChildControl)(((self.ui).approvalUi).mediaBg, "StaticText_Media"), mediaValue = (UI.getChildControl)(((self.ui).approvalUi).mediaBg, "StaticText_MediaValue"), mediaRadioBtn = (UI.getChildControl)(((self.ui).approvalUi).mediaBg, "RadioButton_Media"), valenciaText = (UI.getChildControl)(((self.ui).approvalUi).valenciaBg, "StaticText_Valencia"), valenciaValue = (UI.getChildControl)(((self.ui).approvalUi).valenciaBg, "StaticText_ValenciaValue"), valenciaRadioBtn = (UI.getChildControl)(((self.ui).approvalUi).valenciaBg, "RadioButton_Valencia"), voteBtn = (UI.getChildControl)((self.ui).approvalRatingBg, "Button_Vote")}
  -- DECOMPILER ERROR at PC109: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._approvalRatingValue)[PlunderTerritoryKey.calpheon] = ""
  -- DECOMPILER ERROR at PC113: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._approvalRatingValue)[PlunderTerritoryKey.media] = ""
  -- DECOMPILER ERROR at PC117: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._approvalRatingValue)[PlunderTerritoryKey.valencia] = ""
  ;
  (((self.ui).approvalUi).voteBtn):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_APPROVERATINGRATING_VOTE"))
  ;
  (((self.ui).approvalUi).calpheonText):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_WORLDMAP_NODE_KALPEON"))
  ;
  (((self.ui).approvalUi).mediaText):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_WORLDMAP_NODE_MEDIA"))
  ;
  (((self.ui).approvalUi).valenciaText):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_WORLDMAP_NODE_BALENCIA"))
  ;
  ((self.ui).approvalRatingBg):SetShow(false)
  ;
  (((self.ui).approvalUi).calpheonRadioBtn):SetShow(false)
  ;
  (((self.ui).approvalUi).mediaRadioBtn):SetShow(false)
  ;
  (((self.ui).approvalUi).valenciaRadioBtn):SetShow(false)
  ;
  (((self.ui).approvalUi).voteBtn):SetShow(false)
end

FGlobal_WorldMap_OpenPlunderVote = function()
  -- function num : 0_1 , upvalues : PaGlobal_ApprovalRating
  local ui = PaGlobal_ApprovalRating.ui
  local territoryKey = PaGlobal_ApprovalRating._checkRadioBtn
  if PaGlobal_ApprovalRating._checkRadioBtn == 0 then
    _PA_LOG("무정", "plundergameVote �\164 값이 없는 경우�\148 있어�\160 �\136 됩니�\164.")
    return 
  end
  FGlobal_PlunderVoteOpen(territoryKey, (PaGlobal_ApprovalRating._approvalRatingValue)[territoryKey], (PaGlobal_ApprovalRating._territoryGuildMaster)[territoryKey])
end

FGlobal_ApprovalRating_SetShow = function(isShow)
  -- function num : 0_2 , upvalues : PaGlobal_ApprovalRating
  ((PaGlobal_ApprovalRating.ui).approvalRatingBg):SetShow(isShow)
  if isShow == true then
    ToClient_requestApprovalRating()
  end
end

HandleClicked_WorldMap_ApprovalRating_Vote = function(territoryKey)
  -- function num : 0_3 , upvalues : PaGlobal_ApprovalRating
  local self = PaGlobal_ApprovalRating
  self._checkRadioBtn = territoryKey
  if (self._territoryGuildMaster)[territoryKey] == false then
    (((self.ui).approvalUi).voteBtn):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_APPROVERATINGRATING_VOTE"))
  else
    ;
    (((self.ui).approvalUi).voteBtn):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_APPROVERATINGRATING_MANAGEMENT"))
  end
end

FromClient_PlunderGame_ApprovalRating = function(territoryKey, like, disLike)
  -- function num : 0_4 , upvalues : PaGlobal_ApprovalRating, PlunderTerritoryKey
  local ui = PaGlobal_ApprovalRating.ui
  local stringText = nil
  if like < disLike then
    stringText = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_APPROVERATINGRATING_COMPLAIN_COUNT", "count", tostring(disLike - like))
  else
    stringText = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_APPROVERATINGRATING_SUPPORT_COUNT", "count", tostring(like - disLike))
  end
  -- DECOMPILER ERROR at PC28: Confused about usage of register: R5 in 'UnsetPending'

  ;
  (PaGlobal_ApprovalRating._approvalRatingValue)[territoryKey] = stringText
  if PlunderTerritoryKey.calpheon == territoryKey then
    ((ui.approvalUi).calpheonValue):SetText(stringText)
  else
    if PlunderTerritoryKey.media == territoryKey then
      ((ui.approvalUi).mediaValue):SetText(stringText)
    else
      if PlunderTerritoryKey.valencia == territoryKey then
        ((ui.approvalUi).valenciaValue):SetText(stringText)
      end
    end
  end
end

FromClient_PlunderGameVote_Setting = function(voteCount)
  -- function num : 0_5 , upvalues : PaGlobal_ApprovalRating, PlunderTerritoryKey
  -- DECOMPILER ERROR at PC1: Confused about usage of register: R1 in 'UnsetPending'

  PaGlobal_ApprovalRating._checkRadioBtn = 0
  -- DECOMPILER ERROR at PC6: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (PaGlobal_ApprovalRating._territoryGuildMaster)[PlunderTerritoryKey.calpheon] = false
  -- DECOMPILER ERROR at PC11: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (PaGlobal_ApprovalRating._territoryGuildMaster)[PlunderTerritoryKey.media] = false
  -- DECOMPILER ERROR at PC16: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (PaGlobal_ApprovalRating._territoryGuildMaster)[PlunderTerritoryKey.valencia] = false
  local ui = PaGlobal_ApprovalRating.ui
  ;
  ((ui.approvalUi).calpheonRadioBtn):SetCheck(false)
  ;
  ((ui.approvalUi).mediaRadioBtn):SetCheck(false)
  ;
  ((ui.approvalUi).valenciaRadioBtn):SetCheck(false)
  ;
  ((ui.approvalUi).calpheonRadioBtn):SetShow(false)
  ;
  ((ui.approvalUi).mediaRadioBtn):SetShow(false)
  ;
  ((ui.approvalUi).valenciaRadioBtn):SetShow(false)
  ;
  ((ui.approvalUi).voteBtn):SetShow(false)
  local myGuildInfo = ToClient_GetMyGuildInfoWrapper()
  if myGuildInfo == nil then
    return 
  end
  local selfPlayer = getSelfPlayer()
  if selfPlayer ~= nil and (selfPlayer:get()):isGuildMaster() == true and myGuildInfo:getTerritoryCount() > 0 then
    for idx = 0, myGuildInfo:getTerritoryCount() - 1 do
      local territoryKey = myGuildInfo:getTerritoryKeyAt(idx)
      if PlunderTerritoryKey.calpheon == territoryKey then
        ((ui.approvalUi).calpheonRadioBtn):SetShow(true)
        ;
        ((ui.approvalUi).voteBtn):SetShow(true)
        -- DECOMPILER ERROR at PC98: Confused about usage of register: R9 in 'UnsetPending'

        ;
        (PaGlobal_ApprovalRating._territoryGuildMaster)[territoryKey] = true
      else
        if PlunderTerritoryKey.media == territoryKey then
          ((ui.approvalUi).mediaRadioBtn):SetShow(true)
          ;
          ((ui.approvalUi).voteBtn):SetShow(true)
          -- DECOMPILER ERROR at PC116: Confused about usage of register: R9 in 'UnsetPending'

          ;
          (PaGlobal_ApprovalRating._territoryGuildMaster)[territoryKey] = true
        else
          if PlunderTerritoryKey.valencia == territoryKey then
            ((ui.approvalUi).valenciaRadioBtn):SetShow(true)
            ;
            ((ui.approvalUi).voteBtn):SetShow(true)
            -- DECOMPILER ERROR at PC134: Confused about usage of register: R9 in 'UnsetPending'

            ;
            (PaGlobal_ApprovalRating._territoryGuildMaster)[territoryKey] = true
          end
        end
      end
    end
  end
  do
    if voteCount <= 0 then
      return 
    end
    if myGuildInfo:getSiegeCount() > 0 then
      for idx = 0, myGuildInfo:getSiegeCount() - 1 do
        local regionKey = myGuildInfo:getSiegeKeyAt(idx)
        local regionInfoWrapper = getRegionInfoWrapper(regionKey)
        local territoryKey = regionInfoWrapper:getTerritoryKeyRaw()
        if PlunderTerritoryKey.calpheon == territoryKey then
          ((ui.approvalUi).calpheonRadioBtn):SetShow(true)
          ;
          ((ui.approvalUi).voteBtn):SetShow(true)
        else
          if PlunderTerritoryKey.media == territoryKey then
            ((ui.approvalUi).mediaRadioBtn):SetShow(true)
            ;
            ((ui.approvalUi).voteBtn):SetShow(true)
          else
            if PlunderTerritoryKey.valencia == territoryKey then
              ((ui.approvalUi).valenciaRadioBtn):SetShow(true)
              ;
              ((ui.approvalUi).voteBtn):SetShow(true)
            end
          end
        end
      end
    end
  end
end

PaGlobal_ApprovalRating.registEventHandler = function(self)
  -- function num : 0_6 , upvalues : PlunderTerritoryKey
  (((self.ui).approvalUi).calpheonRadioBtn):addInputEvent("Mouse_LUp", "HandleClicked_WorldMap_ApprovalRating_Vote(" .. PlunderTerritoryKey.calpheon .. ")")
  ;
  (((self.ui).approvalUi).mediaRadioBtn):addInputEvent("Mouse_LUp", "HandleClicked_WorldMap_ApprovalRating_Vote(" .. PlunderTerritoryKey.media .. ")")
  ;
  (((self.ui).approvalUi).valenciaRadioBtn):addInputEvent("Mouse_LUp", "HandleClicked_WorldMap_ApprovalRating_Vote(" .. PlunderTerritoryKey.valencia .. ")")
  ;
  (((self.ui).approvalUi).voteBtn):addInputEvent("Mouse_LUp", "FGlobal_WorldMap_OpenPlunderVote()")
end

PaGlobal_ApprovalRating:initApprovalRating()
PaGlobal_ApprovalRating:registEventHandler()
registerEvent("FromClient_PlunderGame_ApprovalRating", "FromClient_PlunderGame_ApprovalRating")
registerEvent("FromClient_PlunderGameVote_Setting", "FromClient_PlunderGameVote_Setting")

