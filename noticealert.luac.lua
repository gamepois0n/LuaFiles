-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\widget\noticealert\noticealert.luac 

-- params : ...
-- function num : 0
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
local UCT = CppEnums.PA_UI_CONTROL_TYPE
local UI_color = Defines.Color
local posIndex = 0
local _maxNoticeCount = 3
local noticePanelList = {}
local noticeAlertList = {}
local createNoticeMsg = function()
  -- function num : 0_0 , upvalues : _maxNoticeCount, UCT, noticePanelList, noticeAlertList
  local _text_Msg = (UI.getChildControl)(Panel_NoticeAlert, "StaticText_NoticeAlert_Text")
  _text_Msg:SetShow(false)
  local _bg_Msg = (UI.getChildControl)(Panel_NoticeAlert, "Static_NoticeAlertBG")
  _bg_Msg:SetShow(false)
  local getScrX = getScreenSizeX()
  for index = 1, _maxNoticeCount do
    local noticePanel = (UI.createPanel)("Panel_NoticeAlert" .. index, (Defines.UIGroup).PAGameUIGroup_GameSystemMenu)
    noticePanel:SetSize(Panel_NoticeAlert:GetSizeX(), Panel_NoticeAlert:GetSizeY())
    noticePanel:SetIgnore(true)
    noticePanel:SetShow(false, false)
    noticePanel:ChangeTextureInfoName("")
    local bgMsg = (UI.createControl)(UCT.PA_UI_CONTROL_STATIC, noticePanel, "NoticeAlertBG_" .. index)
    CopyBaseProperty(_bg_Msg, bgMsg)
    bgMsg:SetShow(true)
    local textMsg = (UI.createControl)(UCT.PA_UI_CONTROL_STATICTEXT, noticePanel, "NoticeAlert_Text_" .. index)
    CopyBaseProperty(_text_Msg, textMsg)
    textMsg:SetShow(true)
    -- DECOMPILER ERROR at PC82: Confused about usage of register: R10 in 'UnsetPending'

    noticePanelList[index] = noticePanel
    local noticeAlert = {}
    -- DECOMPILER ERROR at PC85: Confused about usage of register: R11 in 'UnsetPending'

    noticeAlertList[index] = noticeAlert
    noticeAlert.textMsg = textMsg
    noticeAlert.bgMsg = bgMsg
  end
end

createNoticeMsg()
local MessageOpen = function(panel)
  -- function num : 0_1 , upvalues : UI_ANI_ADV, UI_color
  audioPostEvent_SystemUi(4, 4)
  panel:SetShow(true, false)
  panel:ResetVertexAni()
  panel:SetScaleChild(1, 1)
  local aniInfo = panel:addColorAnimation(0, 0.25, UI_ANI_ADV.PAUI_ANIM_ADVANCE_SIN_HALF_PI)
  aniInfo:SetStartColor(UI_color.C_00FFFFFF)
  aniInfo:SetEndColor(UI_color.C_FFFFFFFF)
  aniInfo.IsChangeChild = true
  local aniInfo1 = panel:addScaleAnimation(0, 0.25, UI_ANI_ADV.PAUI_ANIM_ADVANCE_SIN_HALF_PI)
  aniInfo1:SetStartScale(0.85)
  aniInfo1:SetEndScale(1)
  aniInfo1.IsChangeChild = true
  local aniInfo2 = panel:addScaleAnimation(0.25, 7, UI_ANI_ADV.PAUI_ANIM_ADVANCE_SIN_HALF_PI)
  aniInfo2:SetStartScale(1)
  aniInfo2:SetEndScale(1)
  aniInfo2.IsChangeChild = true
  local aniInfo3 = panel:addColorAnimation(7, 8, UI_ANI_ADV.PAUI_ANIM_ADVANCE_SIN_HALF_PI)
  aniInfo3:SetStartColor(UI_color.C_FFFFFFFF)
  aniInfo3:SetEndColor(UI_color.C_00FFFFFF)
  aniInfo3.IsChangeChild = true
  local aniInfo4 = panel:addScaleAnimation(8, 8.25, UI_ANI_ADV.PAUI_ANIM_ADVANCE_SIN_HALF_PI)
  aniInfo4:SetStartScale(1)
  aniInfo4:SetEndScale(0)
  aniInfo4.IsChangeChild = true
end

local updatePosition = function()
  -- function num : 0_2 , upvalues : _maxNoticeCount, posIndex, noticePanelList
  local centerPos = getScreenSizeX() / 2 - Panel_NoticeAlert:GetSizeX() / 2
  for index = 1, _maxNoticeCount do
    local realIndex = (index - posIndex + 5) % _maxNoticeCount + 1
    local panel = noticePanelList[index]
    if panel:IsShow() then
      panel:SetPosX(centerPos)
      panel:SetPosY(Panel_NoticeAlert:GetSizeY() * realIndex + 5)
    end
  end
end

Proc_NoticeAlert_Ack = function(message, noticeType, noticeValue)
  -- function num : 0_3 , upvalues : posIndex, _maxNoticeCount, noticeAlertList, MessageOpen, noticePanelList, updatePosition
  if (CppEnums.EChatNoticeType).HuntingStart == noticeType or (CppEnums.EChatNoticeType).HuntingEnd == noticeType then
    if message ~= nil then
      WhaleHuntingEvent(message, noticeType, noticeValue)
    end
    return 
  end
  if (CppEnums.EChatNoticeType).Kzarka == noticeType or (CppEnums.EChatNoticeType).Nuberu == noticeType then
    if message ~= nil then
      FGlobal_WorldBossShow(message, noticeType, noticeValue)
    end
    return 
  end
  if (CppEnums.EChatNoticeType).FieldBoss == noticeType then
    if message ~= nil then
      FGlobal_WorldBossShow(message, noticeType, noticeValue)
    end
    return 
  end
  if (CppEnums.EChatNoticeType).SavageDefenceBoss == noticeType then
    if message ~= nil then
      Proc_ShowMessage_Ack_WithOut_ChattingMessage(message)
    end
    return 
  end
  posIndex = posIndex % _maxNoticeCount + 1
  ;
  ((noticeAlertList[posIndex]).textMsg):SetFontColor(Chatting_MessageColor((CppEnums.ChatType).Notice, noticeType))
  ;
  ((noticeAlertList[posIndex]).textMsg):SetText(message)
  MessageOpen(noticePanelList[posIndex])
  updatePosition()
end

NoticeAlert_Resize = function()
  -- function num : 0_4 , upvalues : updatePosition
  updatePosition()
end

registerEvent("EventNotifyAlertMessage", "Proc_NoticeAlert_Ack")
registerEvent("onScreenResize", "NoticeAlert_Resize")

