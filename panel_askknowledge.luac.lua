-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\widget\dialogue\panel_askknowledge.luac 

-- params : ...
-- function num : 0
Panel_AskKnowledge:SetShow(false, false)
Panel_AskKnowledge:setMaskingChild(true)
Panel_AskKnowledge:ActiveMouseEventEffect(true)
Panel_AskKnowledge:setGlassBackground(true)
local _uiBackGround = (UI.getChildControl)(Panel_AskKnowledge, "Static_BackGround")
local _styleButton = (UI.getChildControl)(Panel_AskKnowledge, "Style_Button")
local _scroll = (UI.getChildControl)(Panel_AskKnowledge, "VerticalScroll")
local _scrollIndex = 0
local _knowledgeSize = nil
_styleButton:SetShow(false)
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
local UI_PP = CppEnums.PAUIMB_PRIORITY
local UI_PUCT = CppEnums.PA_UI_CONTROL_TYPE
local UI_PSFT = CppEnums.PAUI_SHOW_FADE_TYPE
local UI_color = Defines.Color
local buttonGap = 1
Panel_AskKnowledge:RegisterShowEventFunc(true, "AskKnowledgeShowAni()")
Panel_AskKnowledge:RegisterShowEventFunc(false, "AskKnowledgeHideAni()")
AskKnowledgeShowAni = function()
  -- function num : 0_0
  (UIAni.fadeInSCR_Down)(Panel_AskKnowledge)
  audioPostEvent_SystemUi(1, 0)
end

AskKnowledgeHideAni = function()
  -- function num : 0_1 , upvalues : UI_ANI_ADV
  Panel_AskKnowledge:SetShowWithFade((CppEnums.PAUI_SHOW_FADE_TYPE).PAUI_ANI_TYPE_FADE_OUT)
  local aniInfo1 = Panel_AskKnowledge:addColorAnimation(0, 0.22, UI_ANI_ADV.PAUI_ANIM_ADVANCE_SIN_HALF_PI)
  aniInfo1:SetStartColor((Defines.Color).C_FFFFFFFF)
  aniInfo1:SetEndColor((Defines.Color).C_00FFFFFF)
  aniInfo1:SetStartIntensity(3)
  aniInfo1:SetEndIntensity(1)
  aniInfo1.IsChangeChild = true
  aniInfo1:SetHideAtEnd(true)
  aniInfo1:SetDisableWhileAni(true)
  audioPostEvent_SystemUi(1, 1)
end

local askKnowledge = {}
askKnowledge.createSlot = function(index)
  -- function num : 0_2 , upvalues : UI_PUCT, _styleButton, buttonGap
  local uiAskButton = {}
  uiAskButton._base = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_BUTTON, Panel_AskKnowledge, "ButtonKnowledge_" .. index)
  CopyBaseProperty(_styleButton, uiAskButton._base)
  ;
  (uiAskButton._base):SetShow(true)
  ;
  (uiAskButton._base):addInputEvent("Mouse_LUp", "clickAskKnowledge(" .. index .. ")")
  ;
  (uiAskButton._base):SetPosY(45 + index * (uiAskButton._base):GetSizeY() + (index - 1) * buttonGap)
  ;
  (uiAskButton._base):addInputEvent("Mouse_UpScroll", "askKnowledge_Scroll( true )")
  ;
  (uiAskButton._base):addInputEvent("Mouse_DownScroll", "askKnowledge_Scroll( false )")
  uiAskButton.SetShow = function(self, isShow)
    -- function num : 0_2_0 , upvalues : uiAskButton
    (uiAskButton._base):SetShow(isShow)
  end

  uiAskButton.SetButtonData = function(self, data)
    -- function num : 0_2_1 , upvalues : uiAskButton
    (uiAskButton._base):SetText(data:getName())
  end

  return uiAskButton
end

local AskKnowledgeManager = {
_dataList = {}
, _buttonCount = 8, 
_uiButtonKnowledgeList = {}
}
AskKnowledgeManager.initialize = function(self)
  -- function num : 0_3 , upvalues : askKnowledge, _scroll, _uiBackGround
  for index = 0, self._buttonCount - 1 do
    -- DECOMPILER ERROR at PC10: Confused about usage of register: R5 in 'UnsetPending'

    (self._uiButtonKnowledgeList)[index] = (askKnowledge.createSlot)(index)
    ;
    ((self._uiButtonKnowledgeList)[index]):SetShow(false)
  end
  ;
  (UIScroll.InputEvent)(_scroll, "askKnowledge_Scroll")
  _uiBackGround:addInputEvent("Mouse_UpScroll", "askKnowledge_Scroll( true )")
  _uiBackGround:addInputEvent("Mouse_DownScroll", "askKnowledge_Scroll( false )")
end

AskKnowledgeManager.update = function(self)
  -- function num : 0_4 , upvalues : _knowledgeSize, _scroll, _scrollIndex
  Panel_AskKnowledge:SetShow(true, true)
  local count = _knowledgeSize
  if count > 5 then
    _scroll:SetShow(true)
  else
    _scroll:SetShow(false)
  end
  for index = 0, 4 do
    if _scrollIndex + index < count then
      local data = ToClient_GetKnowledgeStatus(_scrollIndex + index)
      ;
      ((self._uiButtonKnowledgeList)[index]):SetButtonData(data)
      ;
      ((self._uiButtonKnowledgeList)[index]):SetShow(true)
    else
      do
        do
          ;
          ((self._uiButtonKnowledgeList)[index]):SetShow(false)
          -- DECOMPILER ERROR at PC45: LeaveBlock: unexpected jumping out DO_STMT

          -- DECOMPILER ERROR at PC45: LeaveBlock: unexpected jumping out IF_ELSE_STMT

          -- DECOMPILER ERROR at PC45: LeaveBlock: unexpected jumping out IF_STMT

        end
      end
    end
  end
end

AskKnowledgeManager:initialize()
FromClient_AskKnowledge = function()
  -- function num : 0_5 , upvalues : _scroll, _scrollIndex, _knowledgeSize, AskKnowledgeManager
  _scroll:SetControlPos(0)
  _scrollIndex = 0
  _knowledgeSize = ToClient_GetKnowledgeSize()
  AskKnowledgeManager:update()
end

askKnowledge_Scroll = function(isUp)
  -- function num : 0_6 , upvalues : _scrollIndex, _scroll, _knowledgeSize, AskKnowledgeManager
  _scrollIndex = (UIScroll.ScrollEvent)(_scroll, isUp, 5, _knowledgeSize, _scrollIndex, 1)
  AskKnowledgeManager:update()
end

clickAskKnowledge = function(index)
  -- function num : 0_7 , upvalues : _scrollIndex
  Panel_AskKnowledge:SetShow(false, false)
  local clickedKnowledge = ToClient_GetKnowledgeStatus(_scrollIndex + index)
  local pos = clickedKnowledge:getPosition()
  setShowNpcDialog(false)
  FGlobal_PushOpenWorldMap()
  FromClient_KnowledgeWorldMapPath(float3(pos.x, 0, pos.z))
end

registerEvent("FromClient_AskKnowledge", "FromClient_AskKnowledge")

