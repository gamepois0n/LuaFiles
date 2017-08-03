-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\widget\questlist\panel_newquest.luac 

-- params : ...
-- function num : 0
local UI_TM = CppEnums.TextMode
local UI_PUCT = CppEnums.PA_UI_CONTROL_TYPE
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
local UI_TISNU = CppEnums.TInventorySlotNoUndefined
local UI_PSFT = CppEnums.PAUI_SHOW_FADE_TYPE
local UI_color = Defines.Color
local isRide = false
local _blackStone = (UI.getChildControl)(Panel_NewQuest, "Static_blackDust_0")
local _newQuestTextBubble = (UI.getChildControl)(Panel_NewQuest, "Static_NewQuestBubble")
local _newQuestText = (UI.getChildControl)(Panel_NewQuest, "StaticText_newQuestText")
local _callingYou = (UI.getChildControl)(Panel_NewQuest, "StaticText_Purpose")
local _callingYou_Sub = (UI.getChildControl)(Panel_NewQuest, "StaticText_Purpose_Sub")
_newQuestTextBubble:SetShow(false)
_newQuestText:SetShow(false)
_newQuestText:SetText("")
_blackStone:SetIgnore(true)
Panel_NewQuest:SetDragEnable(false)
Panel_NewQuest:SetIgnore(true)
Panel_NewQuest:RegisterShowEventFunc(true, "newQuest_ShowAnimation()")
Panel_NewQuest:RegisterShowEventFunc(false, "newQuest_HideAnimation()")
local _cumulatedTime = 0
local _bubbleCount = 0
local _startAnimation = false
local _isBubbleCount = _bubbleCount + 1
local _blackStone_BeforCallingTime = 0
_blackStone_CallingTime = 0
FGlobal_NewMainQuest_Alarm_Check = function()
  -- function num : 0_0
  if not ToClient_getIsBlackSpiritNotice() then
    Panel_NewQuest:SetShow(false, false)
  end
end

FGlobal_NewMainQuest_Alarm_Open = function()
  -- function num : 0_1 , upvalues : isRide, UI_PSFT, UI_ANI_ADV, UI_color, _blackStone, _startAnimation, _callingYou, _callingYou_Sub, _cumulatedTime
  if not ToClient_getIsBlackSpiritNotice() then
    Panel_NewQuest:SetShow(false, true)
    return 
  end
  if Panel_LocalWarTeam:GetShow() then
    Panel_NewQuest:SetShow(false, false)
    return 
  end
  if Panel_LifeTutorial:GetShow() then
    Panel_NewQuest:SetShow(false, false)
    return 
  end
  if ToClient_IsMyselfInArena() then
    Panel_NewQuest:SetShow(false, false)
    return 
  end
  if ToClient_getPlayNowSavageDefence() then
    Panel_NewQuest:SetShow(false, false)
    return 
  end
  local isColorBlindMode = (ToClient_getGameUIManagerWrapper()):getLuaCacheDataListNumber((CppEnums.GlobalUIOptionType).ColorBlindMode)
  if isRide == false and not Panel_Npc_Dialog:GetShow() then
    _blackStone_CallingTime = _blackStone_CallingTime + 1
    Panel_NewQuest:SetShow(true, true)
    if Panel_LocalWar:GetShow() then
      Panel_NewQuest:SetPosY(140)
    else
      Panel_NewQuest:SetPosY(120)
    end
    Panel_NewQuest:SetShowWithFade(UI_PSFT.PAUI_ANI_TYPE_FADE_OUT)
    local QuickSlotClose_Alpha = Panel_NewQuest:addColorAnimation(2, 3, UI_ANI_ADV.PAUI_ANIM_ADVANCE_SIN_HALF_PI)
    QuickSlotClose_Alpha:SetStartColor(UI_color.C_FFFFFFFF)
    QuickSlotClose_Alpha:SetEndColor(UI_color.C_00FFFFFF)
    QuickSlotClose_Alpha.IsChangeChild = true
    QuickSlotClose_Alpha:SetHideAtEnd(true)
    QuickSlotClose_Alpha:SetDisableWhileAni(true)
    Panel_NewQuest:SetIgnore(true)
    _blackStone:SetShow(true)
    _blackStone:SetIgnore(true)
    newQuest_ShowAnimation()
    if _startAnimation == false then
      audioPostEvent_SystemUi(4, 5)
      Panel_NewQuest:ComputePos()
      _blackStone:ResetVertexAni()
      _blackStone:SetVertexAniRun("Ani_Scale_StoneShow", true)
      _blackStone:SetVertexAniRun("Ani_Color_StoneShow", true)
      _startAnimation = true
    else
      return 
    end
    _callingYou:SetShow(true)
    if isColorBlindMode == 0 then
      _callingYou:SetFontColor(UI_color.C_FFEE5555)
    else
      if isColorBlindMode == 1 then
        _callingYou:SetFontColor(UI_color.C_FF0096FF)
      else
        if isColorBlindMode == 2 then
          _callingYou:SetFontColor(UI_color.C_FF0096FF)
        end
      end
    end
    _callingYou:SetText(PAGetString(Defines.StringSheet_GAME, "PANEL_QUESTLIST_CALLINGYOUT"))
    local blackSpiritKeyString = keyCustom_GetString_UiKey((CppEnums.UiInputType).UiInputType_BlackSpirit)
    _callingYou_Sub:SetShow(true)
    _callingYou_Sub:SetText(PAGetStringParam1(Defines.StringSheet_GAME, "PANEL_QUESTLIST_CALLINGYOU_SUB", "keyString", blackSpiritKeyString))
    _cumulatedTime = 0
  end
  do
    Panel_NewQuest:SetShow(false, true)
  end
end

newQuest_ShowAnimation = function()
  -- function num : 0_2 , upvalues : _blackStone
  _blackStone:ResetVertexAni()
  _blackStone:SetAlpha(1)
end

newQuest_HideAnimation = function()
  -- function num : 0_3 , upvalues : _startAnimation, _blackStone, _newQuestTextBubble, _newQuestText
  if _startAnimation == true then
    _blackStone:ResetVertexAni()
    _blackStone:SetVertexAniRun("Ani_Scale_StoneHide", true)
    _blackStone:SetVertexAniRun("Ani_Color_StoneHide", true)
    _newQuestTextBubble:SetShow(false)
    _newQuestText:SetShow(false)
    Panel_NewQuest:EraseAllEffect()
    _startAnimation = false
  end
end

Panel_NewQuest_ScreenResize = function()
  -- function num : 0_4
  Panel_NewQuest:SetPosX(getScreenSizeX() - getScreenSizeX() / 2 - Panel_NewQuest:GetSizeX() / 2)
  Panel_NewQuest:SetPosY(120)
end

Panel_NewQuest:RegisterUpdateFunc("updateNewQuestOpenRate")
updateNewQuestOpenRate = function(deltaTime)
  -- function num : 0_5 , upvalues : _cumulatedTime
  _cumulatedTime = _cumulatedTime + deltaTime
  if _cumulatedTime > 3.5 then
    Panel_NewQuest:SetShow(false, true)
    _cumulatedTime = 0
  end
end

SelfPlayer_RideOn = function()
  -- function num : 0_6 , upvalues : isRide
  HideUseTab_Func()
  isRide = true
end

SelfPlayer_RideOff = function()
  -- function num : 0_7 , upvalues : isRide
  isRide = false
end

registerEvent("onScreenResize", "Panel_NewQuest_ScreenResize")
registerEvent("EventSelfPlayerRideOn", "SelfPlayer_RideOn")
registerEvent("EventSelfPlayerRideOff", "SelfPlayer_RideOff")

