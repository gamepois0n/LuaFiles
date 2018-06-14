-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\widget\dialogue\panel_window_mentalgame_renew.luac 

-- params : ...
-- function num : 0
local Window_MentalGameInfo = {_mentalObject; 
_ui = {_static_LeftBg = (UI.getChildControl)(Panel_Window_MentalGame, "LeftBG"), _static_BottomBg = (UI.getChildControl)(Panel_Window_MentalGame, "BottomBG"), _static_keyGuide = (UI.getChildControl)(Panel_Window_MentalGame, "Static_Key_Guide"), _static_TopBg = (UI.getChildControl)(Panel_Window_MentalGame, "TopBG"), _staticText_addInterest = (UI.getChildControl)(Panel_Window_MentalGame, "StaticText_AddInterest"), 
_top = {}
, _static_Finished = (UI.getChildControl)(Panel_Window_MentalGame_Finish, "Static_Finish"), _staticText_Finished = (UI.getChildControl)(Panel_Window_MentalGame_Finish, "StaticText_Finish"), 
_left = {}
, 
_bottom = {}
, 
_tooltip = {_static_Bg = (UI.getChildControl)(Panel_Window_MentalGame_Tooltip, "Static_Tooltip_BG"), _staitcText_NpcName = (UI.getChildControl)(Panel_Window_MentalGame_Tooltip, "StaticText_NPC_Name"), _staticText_StatusTitle = (UI.getChildControl)(Panel_Window_MentalGame_Tooltip, "StaticText_StatusTitle"), _staticText_HitBase = (UI.getChildControl)(Panel_Window_MentalGame_Tooltip, "StaticText_Hit_Base"), _staticText_HitBonus = (UI.getChildControl)(Panel_Window_MentalGame_Tooltip, "StaticText_Hit_Bonus"), _staticText_DDBase = (UI.getChildControl)(Panel_Window_MentalGame_Tooltip, "StaticText_DD_Base"), _staticText_DDBonus = (UI.getChildControl)(Panel_Window_MentalGame_Tooltip, "StaticText_DD_Bonus"), _staticText_InterestComment = (UI.getChildControl)(Panel_Window_MentalGame_Tooltip, "StaticText_Comment_1"), _staticText_FavorityComment = (UI.getChildControl)(Panel_Window_MentalGame_Tooltip, "StaticText_Comment_2"), _staticText_Bonus = (UI.getChildControl)(Panel_Window_MentalGame_Tooltip, "StaticText_Bonus")}
, 
_static_Zodiac = {}
}
, 
_config = {_interestValueMax = 1000, _slotCountMax = 10, _hideTime = 5, _maxPlayCount = 3, _gameStep_CardSelect = 0, _gameStep_StartGame = 1, _gameStep_ReadyGame = 2, _gameStep_EndGame = 3, _gameStep_GameExit = 4}
, 
_configStr = {
_buffTypeString = {[0] = PAGetString(Defines.StringSheet_GAME, "MENTALGAME_BUFFTYPE_FAVOR"), [1] = PAGetString(Defines.StringSheet_GAME, "MENTALGAME_BUFFTYPE_INTERESTING"), [2] = PAGetString(Defines.StringSheet_GAME, "MENTALGAME_BUFFTYPE_DEMANDINGINTERESTING"), [3] = PAGetString(Defines.StringSheet_GAME, "MENTALGAME_BUFFTYPE_DEMANDINGFAVOR")}
, 
_operatorString = {[(CppEnums.DlgCommonConditionOperatorType).Equal] = "", [(CppEnums.DlgCommonConditionOperatorType).Large] = "<PAColor0xFFFF0000>â–\178<PAOldColor>", [(CppEnums.DlgCommonConditionOperatorType).Small] = "<PAColor0xFF0000FF>â–\188<PAOldColor>"}
, _hasMentalCardText = PAGetString(Defines.StringSheet_GAME, "LUA_INTIMACY_INFORMATION_HASMENTALCARD"), _hasntMentalCardText = PAGetString(Defines.StringSheet_GAME, "LUA_INTIMACY_INFORMATION_HASNTMENTALCARD")}
, 
_configUV = {
_intimacyIcon = {
[0] = {
[0] = {texture = "Renewal/UI_Icon/Console_Icon_00.dds", x1 = 38, y1 = 200, x2 = 65, y2 = 227}
, 
[1] = {texture = "Renewal/UI_Icon/Console_Icon_00.dds", x1 = 94, y1 = 200, x2 = 121, y2 = 227}
, 
[2] = {texture = "Renewal/UI_Icon/Console_Icon_00.dds", x1 = 66, y1 = 200, x2 = 93, y2 = 227}
}
, 
[1] = {texture = "Renewal/UI_Icon/Console_Icon_00.dds", x1 = 150, y1 = 200, x2 = 177, y2 = 227}
, 
[2] = {texture = "Renewal/UI_Icon/Console_Icon_00.dds", x1 = 122, y1 = 200, x2 = 149, y2 = 227}
, 
[3] = {texture = "Renewal/UI_Icon/Console_Icon_00.dds", x1 = 178, y1 = 200, x2 = 205, y2 = 227}
, 
[4] = {texture = "Renewal/UI_Icon/Console_Icon_00.dds", x1 = 231, y1 = 1, x2 = 253, y2 = 23}
, 
[5] = {texture = "Renewal/UI_Icon/Console_Icon_00.dds", x1 = 231, y1 = 24, x2 = 205, y2 = 227}
}
}
, _gameStep = 0, _gamePlayCount = 0, _bestPoint = 0, _addIntimacy = 0, _renderMode = (RenderModeWrapper.new)(100, {(Defines.RenderMode).eRenderMode_MentalGame}, false), 
_rewardIconTable = {}
, 
_rewardTextTable = {}
, 
_rewardToolTipDescTable = {}
, 
_selectCardTemplete = {}
, 
_bottomCardTemplete = {}
, 
_selectCardTable = {}
, 
_circleKeyList = {}
, 
_infomationUIList = {}
, 
_animationUIList = {}
, 
_animationList = {}
, _animationIndex = 0, 
_bottomCardList = {}
, 
_bottomCardInfoList = {}
, _scrollPositionResult = 0, _scrollPosition = -5, _selectCardIndex = -1, _overKey = -1, _hideTime = 0}
Window_MentalGameInfo.Clear = function(self)
  -- function num : 0_0
  self._gameStep = 0
  self._gamePlayCount = 0
  self._addIntimacy = 0
  self._scrollPositionResult = 0
  self._scrollPosition = -5
  self._hideTime = 0
  self._overKey = -1
  for _,control in pairs(self._rewardIconTable) do
    if control ~= nil then
      control:SetShow(false)
    end
  end
  for _,control in pairs(self._rewardTextTable) do
    if control ~= nil then
      control:SetShow(false)
    end
  end
  for _,control in pairs(self._selectCardTable) do
    if control ~= nil then
      (control._static_Bg):SetShow(false)
    end
  end
  for _,control in pairs(self._bottomCardList) do
    if control ~= nil then
      (control._static_CardIcon):SetShow(false)
      ;
      (control._staticText_CardText):SetShow(false)
    end
  end
  ;
  (((self._ui)._static_Zodiac)._control):SetShow(false)
  self:CircleLineAndObjectClear()
end

Window_MentalGameInfo.StageClear = function(self)
  -- function num : 0_1
  for value,control in pairs(self._selectCardTable) do
    (control._circularProgress_Progress):SetCurrentControlPos(0)
    ;
    (control._circularProgress_Progress):SetProgressRate(0)
    ;
    (control._static_Success):ResetVertexAni()
    ;
    (control._static_Success):SetShow(false)
    ;
    (control._static_Failed):ResetVertexAni()
    ;
    (control._static_Failed):SetShow(false)
    RequestMentalGame_clearSelectCard(value)
  end
end

Window_MentalGameInfo.UpdateStageInfo = function(self)
  -- function num : 0_2
end

Window_MentalGameInfo.Initialize = function(self)
  -- function num : 0_3
  self:InitRegister()
  self:InitContorl()
  self:InitEvent()
  self:XB_Control_Init()
end

Window_MentalGameInfo.UpdateBottomUIPos = function(self, deltaTime)
  -- function num : 0_4
  local diff = self._scrollPositionResult - self._scrollPosition
  local rightArrow = ((self._ui)._bottom)._button_RightArrow
  local leftArrow = ((self._ui)._bottom)._button_LeftArrow
  if diff == 0 then
    return 
  end
  local mentalObject = getMentalgameObject()
  if mentalObject == nil then
    return 
  end
  self._scrollPosition = self._scrollPosition + diff * (math.min)(deltaTime * 8, 1)
  if (math.abs)(self._scrollPositionResult - self._scrollPosition) < 0.05 then
    self._scrollPosition = self._scrollPositionResult
  end
  local isIgnore = self._scrollPosition ~= self._scrollPositionResult
  for index,value in pairs(self._bottomCardList) do
    local text = value._staticText_CardText
    local icon = value._static_CardIcon
    local selectBg = value._static_SelectBg
    if text ~= nil and icon ~= nil then
      icon:SetIgnore(isIgnore)
      local posIndex = index - self._scrollPosition
      local position = mentalObject:getCirclePosition(float2((leftArrow:GetPosX() + rightArrow:GetPosX() + (leftArrow:GetSizeX() + rightArrow:GetSizeX()) / 2) / 2, leftArrow:GetPosY() + leftArrow:GetSizeY() / 2 + 320), 400, posIndex - 2)
      text:SetPosX(position.x - text:GetSizeX() / 2)
      text:SetPosY(position.y - text:GetSizeY() / 2)
      if posIndex >= -0.25 and posIndex <= 4.25 then
        text:SetShow(true)
        text:SetAlphaExtraChild(1)
        icon:SetShow(true)
        icon:SetAlphaExtraChild(1)
      elseif posIndex >= -0.75 and posIndex < -0.25 then
        text:SetShow(true)
        text:SetAlphaExtraChild((posIndex + 0.75) * 2)
        icon:SetShow(true)
        icon:SetAlphaExtraChild((posIndex + 0.75) * 2)
      elseif posIndex > 4.25 and posIndex <= 4.75 then
        text:SetShow(true)
        text:SetAlphaExtraChild((4.75 - posIndex) * 2)
        icon:SetShow(true)
        icon:SetAlphaExtraChild((4.75 - posIndex) * 2)
      else
        text:SetShow(false)
        icon:SetShow(false)
        selectBg:SetShow(false)
      end
      text:SetPosY(text:GetPosY() - 50)
      icon:SetPosX(text:GetPosX())
      icon:SetPosY(text:GetPosY() - 10)
      selectBg:SetPosX(icon:GetPosX() + 5)
      selectBg:SetPosY(icon:GetPosY() + 3)
    end
  end
  -- DECOMPILER ERROR: 6 unprocessed JMP targets
end

PaGlobalFunc_MentalGame_UpdateHideTime = function(deltaTime)
  -- function num : 0_5 , upvalues : Window_MentalGameInfo
  local self = Window_MentalGameInfo
  if (self._config)._gameStep_GameExit == self._gameStep then
    self._hideTime = self._hideTime + deltaTime
    if (self._config)._hideTime < self._hideTime then
      PaGlobalFunc_MentalGame_Close()
    end
  end
end

PaGlobalFunc_MentalGame_BaseUpdatePerFrame = function(deltaTime)
  -- function num : 0_6 , upvalues : Window_MentalGameInfo
  local self = Window_MentalGameInfo
  self:SetSelectCardPos()
  self:UpdateAnimationList(deltaTime)
  PaGlobalFunc_MentalGame_UpdateHideTime(deltaTime)
  local mentalObject = getMentalgameObject()
  if mentalObject == nil then
    return 
  end
  local yawpitchroll = mentalObject:getYawPitchRoll()
  local zodiac = (self._ui)._static_Zodiac
  ;
  (zodiac._panel):Set3DRotationX(yawpitchroll.x)
  ;
  (zodiac._panel):Set3DRotationY(yawpitchroll.y)
  ;
  (zodiac._panel):Set3DRotationZ(yawpitchroll.z)
  ;
  (zodiac._panel):SetWorldPosX((mentalObject:getCardPos()).x)
  ;
  (zodiac._panel):SetWorldPosY((mentalObject:getCardPos()).y)
  ;
  (zodiac._panel):SetWorldPosZ((mentalObject:getCardPos()).z)
  ;
  (zodiac._panel):SetScale(mentalObject:getScale(), mentalObject:getScale())
  ;
  (zodiac._control):SetScale(mentalObject:getScale(), mentalObject:getScale())
  self:UpdateBottomUIPos(deltaTime)
end

Window_MentalGameInfo.InitEvent = function(self)
  -- function num : 0_7
  Panel_Window_MentalGame:RegisterUpdateFunc("PaGlobalFunc_MentalGame_BaseUpdatePerFrame")
  ;
  (((self._ui)._bottom)._button_RightArrow):addInputEvent("Mouse_LUp", "PaGlobalFunc_MentalGame_LClick_Arrow(false)")
  ;
  (((self._ui)._bottom)._button_LeftArrow):addInputEvent("Mouse_LUp", "PaGlobalFunc_MentalGame_LClick_Arrow(true)")
  ;
  ((self._ui)._button_Back):addInputEvent("Mouse_LUp", "PaGlobalFunc_MentalGame_LClick_Back()")
  ;
  ((self._ui)._button_Select):addInputEvent("Mouse_LUp", "PaGlobalFunc_MentalGame_LClick_SlectCard()")
  ;
  ((self._ui)._button_Clear):addInputEvent("Mouse_LDown", "PaGlobalFunc_MentalGame_SelectClear()")
end

PaGlobalFunc_MentalGame_SelectClear = function()
  -- function num : 0_8 , upvalues : Window_MentalGameInfo
  local self = Window_MentalGameInfo
  local mentalObject = getMentalgameObject()
  if mentalObject == nil then
    return 
  end
  for index = 0, #self._selectCardTable do
    RequestMentalGame_clearSelectCard(index)
    if mentalObject:getCardBySlotIndex(index) ~= nil then
      audioPostEvent_SystemUi(0, 2)
    end
  end
end

PaGlobalFunc_MentalGame_LClick_Back = function()
  -- function num : 0_9 , upvalues : Window_MentalGameInfo
  local self = Window_MentalGameInfo
  local mentalStage = RequestMentalGame_getMentalStage()
  if mentalStage._isSuccess == true then
    self:SetGameStep((self._config)._gameStep_GameExit)
  else
    PaGlobalFunc_MentalGame_Close()
  end
end

PaGlobalFunc_MentalGame_LClick_SlectCard = function()
  -- function num : 0_10
end

PaGlobalFunc_MentalGame_LClick_StartGame = function()
  -- function num : 0_11 , upvalues : Window_MentalGameInfo
  local self = Window_MentalGameInfo
  local mentalObject = getMentalgameObject()
  if mentalObject == nil then
    return 
  end
  self:SetGameStep((self._config)._gameStep_StartGame)
  ;
  (((self._selectCardTable)[mentalObject:getOrder(0)])._circularProgress_Progress):SetProgressRate(100)
  RequestMentalGame_startCard()
end

PaGlobalFunc_MentalGame_LClick_ReStart = function()
  -- function num : 0_12 , upvalues : Window_MentalGameInfo
  local self = Window_MentalGameInfo
  self._gameStep = 0
  self._gamePlayCount = self._gamePlayCount + 1
  self._bestPoint = 0
  self._scrollPositionResult = 0
  self._scrollPosition = -5
  self._selectCardIndex = -1
  self:StageClear()
  self:Update()
  RequestMentalGame_restartCard()
end

PaGlobalFunc_MentalGame_LClick_Arrow = function(isleft)
  -- function num : 0_13 , upvalues : Window_MentalGameInfo
  local self = Window_MentalGameInfo
  local mentalObject = getMentalgameObject()
  if mentalObject == nil then
    return 
  end
  if isleft == true then
    local maxValue = mentalObject:getCardCount() - 5
    self._scrollPositionResult = (math.min)(self._scrollPositionResult + 5, maxValue)
  else
    do
      do
        local totalCard = mentalObject:getCardCount()
        self._scrollPositionResult = (math.max)(self._scrollPositionResult - 5, 0)
        self:UpdateCardScrollButton()
      end
    end
  end
end

Window_MentalGameInfo.UpdateCardScrollButton = function(self)
  -- function num : 0_14
  local mentalObject = getMentalgameObject()
  if mentalObject == nil then
    return 
  end
  local maxValue = mentalObject:getCardCount() - 5
  do
    local totalCard = mentalObject:getCardCount()
    if totalCard <= 4 then
      (((self._ui)._bottom)._button_LeftArrow):SetShow(false)
      ;
      (((self._ui)._bottom)._button_RightArrow):SetShow(false)
      return 
    end
    ;
    (((self._ui)._bottom)._button_LeftArrow):SetShow(self._scrollPositionResult < maxValue)
    ;
    (((self._ui)._bottom)._button_RightArrow):SetShow(self._scrollPositionResult > 0)
    -- DECOMPILER ERROR: 2 unprocessed JMP targets
  end
end

Window_MentalGameInfo.InitContorl = function(self)
  -- function num : 0_15
  local left = (self._ui)._left
  local bottom = (self._ui)._bottom
  left._staticIcon_Type = (UI.getChildControl)((self._ui)._static_LeftBg, "StaticText_TypeIcon")
  left._staticText_Name = (UI.getChildControl)((self._ui)._static_LeftBg, "StaticText_Name")
  left._staticText_Mission = (UI.getChildControl)((self._ui)._static_LeftBg, "StaticText_Mission")
  left._staticText_Tip = (UI.getChildControl)((self._ui)._static_LeftBg, "StaticText_Tip")
  left._static_CircularProgressBg = (UI.getChildControl)((self._ui)._static_LeftBg, "Static_CircularProgress_BG")
  left._circularProgress_IntimacyPoint = (UI.getChildControl)((self._ui)._static_LeftBg, "CircularProgress_Friend_Point")
  left._staticText_IntimacyPoint = (UI.getChildControl)(left._static_CircularProgressBg, "StaticText_CurrentIntimacyPoint")
  left._staticText_Interest = (UI.getChildControl)((self._ui)._static_LeftBg, "StaticText_Interest")
  left._staticText_Impression = (UI.getChildControl)((self._ui)._static_LeftBg, "StaticText_Impression")
  left._static_RewardIcon = (UI.getChildControl)(left._static_CircularProgressBg, "Static_RewardIcon")
  ;
  (left._static_RewardIcon):SetShow(false)
  left._static_RewardText = (UI.getChildControl)(left._static_CircularProgressBg, "StaticText_Reward")
  ;
  (left._static_RewardText):SetShow(false)
  bottom._button_RightArrow = (UI.getChildControl)((self._ui)._static_BottomBg, "Button_RightArrow")
  bottom._button_LeftArrow = (UI.getChildControl)((self._ui)._static_BottomBg, "Button_LeftArrow")
  bottom._button_RB = (UI.getChildControl)(bottom._button_RightArrow, "Static_RB")
  bottom._button_LB = (UI.getChildControl)(bottom._button_LeftArrow, "Static_LB")
  -- DECOMPILER ERROR at PC119: Confused about usage of register: R3 in 'UnsetPending'

  ;
  (self._ui)._button_Back = (UI.getChildControl)((self._ui)._static_keyGuide, "Button_Key_Guide_Back")
  -- DECOMPILER ERROR at PC127: Confused about usage of register: R3 in 'UnsetPending'

  ;
  (self._ui)._button_Select = (UI.getChildControl)((self._ui)._static_keyGuide, "Button_Key_Guide_Select")
  -- DECOMPILER ERROR at PC135: Confused about usage of register: R3 in 'UnsetPending'

  ;
  (self._ui)._button_Clear = (UI.getChildControl)((self._ui)._static_keyGuide, "Button_Key_Guide_Clear")
  ;
  ((self._ui)._staticText_addInterest):SetShow(false)
  -- DECOMPILER ERROR at PC149: Confused about usage of register: R3 in 'UnsetPending'

  ;
  ((self._ui)._top)._staticText_CommentTitle = (UI.getChildControl)((self._ui)._static_TopBg, "StaticText_Comment_1")
  ;
  (((self._ui)._top)._staticText_CommentTitle):SetTextHorizonCenter()
  -- DECOMPILER ERROR at PC163: Confused about usage of register: R3 in 'UnsetPending'

  ;
  ((self._ui)._top)._staticText_CommentDesc = (UI.getChildControl)((self._ui)._static_TopBg, "StaticText_Comment_2")
  ;
  (((self._ui)._top)._staticText_CommentDesc):SetAutoResize(true)
  ;
  (((self._ui)._top)._staticText_CommentDesc):SetTextHorizonCenter()
  ;
  (((self._ui)._tooltip)._staticText_Bonus):SetTextMode((CppEnums.TextMode).eTextMode_AutoWrap)
  -- DECOMPILER ERROR at PC190: Confused about usage of register: R3 in 'UnsetPending'

  ;
  (self._bottomCardTemplete)._static_CardBg = (UI.getChildControl)((self._ui)._static_BottomBg, "Static_CircleBG")
  -- DECOMPILER ERROR at PC198: Confused about usage of register: R3 in 'UnsetPending'

  ;
  (self._bottomCardTemplete)._static_CardIcon = (UI.getChildControl)((self._ui)._static_BottomBg, "Static_MentalIcon_C_0")
  -- DECOMPILER ERROR at PC206: Confused about usage of register: R3 in 'UnsetPending'

  ;
  (self._bottomCardTemplete)._staticText_CardText = (UI.getChildControl)((self._ui)._static_BottomBg, "StaticText_MentalTxt_C_0")
  -- DECOMPILER ERROR at PC214: Confused about usage of register: R3 in 'UnsetPending'

  ;
  (self._bottomCardTemplete)._static_SelectBg = (UI.getChildControl)((self._ui)._static_BottomBg, "Static_Selected_Npc")
  ;
  ((self._bottomCardTemplete)._staticText_CardText):SetTextHorizonCenter()
  ;
  ((self._bottomCardTemplete)._staticText_CardText):SetTextVerticalBottom()
  -- DECOMPILER ERROR at PC229: Confused about usage of register: R3 in 'UnsetPending'

  ;
  (self._selectCardTemplete)._static_Bg = (UI.getChildControl)(Panel_Window_MentalGame, "SelectCardTemplete")
  -- DECOMPILER ERROR at PC237: Confused about usage of register: R3 in 'UnsetPending'

  ;
  (self._selectCardTemplete)._circularProgress_Progress = (UI.getChildControl)((self._selectCardTemplete)._static_Bg, "CircularProgress_Progress")
  -- DECOMPILER ERROR at PC245: Confused about usage of register: R3 in 'UnsetPending'

  ;
  (self._selectCardTemplete)._static_Success = (UI.getChildControl)((self._selectCardTemplete)._static_Bg, "Static_Success")
  -- DECOMPILER ERROR at PC253: Confused about usage of register: R3 in 'UnsetPending'

  ;
  (self._selectCardTemplete)._static_Failed = (UI.getChildControl)((self._selectCardTemplete)._static_Bg, "Static_Failed")
  ;
  ((self._selectCardTemplete)._static_Bg):SetShow(false)
  ;
  ((self._bottomCardTemplete)._static_SelectBg):SetShow(false)
  -- DECOMPILER ERROR at PC273: Confused about usage of register: R3 in 'UnsetPending'

  ;
  ((self._ui)._static_Zodiac)._panel = (UI.createOtherPanel)("ZodiacCenterPanel", (CppEnums.OtherListType).OtherPanelType_Wiki)
  -- DECOMPILER ERROR at PC286: Confused about usage of register: R3 in 'UnsetPending'

  ;
  ((self._ui)._static_Zodiac)._control = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATIC, ((self._ui)._static_Zodiac)._panel, "ZodiacCenterPanelImage")
  ;
  (((self._ui)._static_Zodiac)._panel):SetShow(true)
  ;
  (((self._ui)._static_Zodiac)._control):SetShow(true)
  local zodiac = (self._ui)._static_Zodiac
  if zodiac._panel ~= nil then
    (zodiac._panel):SetAlpha(0)
    ;
    (zodiac._panel):SetSize(600, 600)
    ;
    (zodiac._panel):Set3DRenderType(3)
    ;
    (zodiac._panel):SetDepth(0)
    ;
    (zodiac._panel):SetIgnore(true)
    ;
    (zodiac._panel):SetShow(true, false)
    ;
    (zodiac._control):SetPosX(0)
    ;
    (zodiac._control):SetPosY(0)
    ;
    (zodiac._control):SetSize(600, 600)
    ;
    (zodiac._control):SetAlpha(1)
    ;
    (zodiac._control):SetVerticalMiddle()
    ;
    (zodiac._control):SetHorizonCenter()
    ;
    (zodiac._control):SetIgnore(true)
    ;
    (zodiac._control):SetShow(true)
  end
end

Window_MentalGameInfo.SetGameStep = function(self, gameStep)
  -- function num : 0_16
  self._gameStep = gameStep
  self:UpdateStageByStep()
end

Window_MentalGameInfo.SetCircleLineAndObject = function(self)
  -- function num : 0_17
  (MentalKnowledgeBase.init)()
  -- DECOMPILER ERROR at PC4: Confused about usage of register: R1 in 'UnsetPending'

  MentalKnowledgeBase.circleSize = 25
  -- DECOMPILER ERROR at PC12: Confused about usage of register: R1 in 'UnsetPending'

  MentalKnowledgeBase.color = float4(1, 1, 1, 1)
  -- DECOMPILER ERROR at PC14: Confused about usage of register: R1 in 'UnsetPending'

  MentalKnowledgeBase.lineWidth = 1.5
  local mentalObject = getMentalgameObject()
  if mentalObject == nil then
    return 
  end
  local basePos = mentalObject:getCardPos()
  local slotCount = mentalObject:getSlotCount()
  local pointCount = mentalObject:getPointCount()
  local orderCount = mentalObject:getOrderCount()
  for index = 0, pointCount - 1 do
    local starPos = mentalObject:getPoint(index)
    local float3Pos = ((Util.Math).AddVectorToVector)(basePos, starPos)
    local circleKey = (MentalKnowledgeBase.InsertCircle)(float3Pos, 1)
    -- DECOMPILER ERROR at PC47: Confused about usage of register: R13 in 'UnsetPending'

    ;
    (self._circleKeyList)[index] = circleKey
  end
  local lineCount = mentalObject:getLineCount()
  for index = 0, lineCount - 1 do
    local firstIndex = mentalObject:getLineFirst(index)
    local secondIndex = mentalObject:getLineSecond(index)
    ;
    (MentalKnowledgeBase.InsertLineByCircle)((self._circleKeyList)[firstIndex], (self._circleKeyList)[secondIndex])
  end
  -- DECOMPILER ERROR at PC70: Confused about usage of register: R7 in 'UnsetPending'

  MentalKnowledgeBase.usingEndArrow = true
  -- DECOMPILER ERROR at PC72: Confused about usage of register: R7 in 'UnsetPending'

  MentalKnowledgeBase.arrowLineWidth = 9
  -- DECOMPILER ERROR at PC74: Confused about usage of register: R7 in 'UnsetPending'

  MentalKnowledgeBase.lineWidth = 20
  -- DECOMPILER ERROR at PC82: Confused about usage of register: R7 in 'UnsetPending'

  MentalKnowledgeBase.color = float4(0.11764705882353, 0.81960784313725, 0.9921568627451, 0.3)
  -- DECOMPILER ERROR at PC90: Confused about usage of register: R7 in 'UnsetPending'

  MentalKnowledgeBase.arrowColor = float4(0.11764705882353, 0.81960784313725, 0.9921568627451, 0.3)
  for srcSlot = 0, orderCount - 2 do
    for dstSlot = srcSlot + 1, orderCount - 1 do
      local srcIndex = mentalObject:getOrder(srcSlot)
      local dstIndex = mentalObject:getOrder(dstSlot)
      if srcIndex ~= -1 and dstIndex ~= -1 then
        local isApplied = mentalObject:isAppliedEffect(srcSlot, dstSlot)
        local card = mentalObject:getCardBySlotIndex(srcIndex)
        if isApplied == true then
          (MentalKnowledgeBase.InsertLineByCircle)((self._circleKeyList)[srcIndex], (self._circleKeyList)[dstIndex])
        end
      end
    end
  end
  -- DECOMPILER ERROR at PC128: Confused about usage of register: R7 in 'UnsetPending'

  MentalKnowledgeBase.lineWidth = 4
  -- DECOMPILER ERROR at PC130: Confused about usage of register: R7 in 'UnsetPending'

  MentalKnowledgeBase.arrowLineWidth = 4
  -- DECOMPILER ERROR at PC138: Confused about usage of register: R7 in 'UnsetPending'

  MentalKnowledgeBase.color = float4(0.83, 0.79, 0.54, 1)
  -- DECOMPILER ERROR at PC146: Confused about usage of register: R7 in 'UnsetPending'

  MentalKnowledgeBase.arrowColor = float4(0.83, 0.79, 0.54, 1)
  local prevIndex = -1
  for srcIndex = 0, orderCount - 1 do
    if mentalObject:getCardBySlotOrder(srcIndex) ~= nil then
      local currIndex = srcIndex
      if prevIndex > -1 then
        local slotNumberSrc = mentalObject:getOrder(prevIndex)
        local slotNumberDst = mentalObject:getOrder(currIndex)
        ;
        (MentalKnowledgeBase.InsertLineByCircle)((self._circleKeyList)[slotNumberSrc], (self._circleKeyList)[slotNumberDst])
      end
      do
        do
          prevIndex = currIndex
          -- DECOMPILER ERROR at PC174: LeaveBlock: unexpected jumping out DO_STMT

          -- DECOMPILER ERROR at PC174: LeaveBlock: unexpected jumping out IF_THEN_STMT

          -- DECOMPILER ERROR at PC174: LeaveBlock: unexpected jumping out IF_STMT

        end
      end
    end
  end
  ;
  (MentalKnowledgeBase.UpdateLineAndCircle)()
end

Window_MentalGameInfo.CircleLineAndObjectClear = function(self)
  -- function num : 0_18
  self._circleKeyList = {}
  ;
  (MentalKnowledgeBase.ClearLineAndCircle)()
end

Window_MentalGameInfo.SetBottomCardList = function(self)
  -- function num : 0_19
  self._bottomCardList = {}
  self._bottomCardInfoList = {}
  local UCT = CppEnums.PA_UI_CONTROL_TYPE
  local index = 0
  local PrePosY = 0
  local mentalObject = getMentalgameObject()
  if mentalObject == nil then
    return 
  end
  local count = mentalObject:getCardCount()
  for index = 0, count - 1 do
    local cardWrapper = mentalObject:getCard(index)
    local gap = ((self._bottomCardTemplete)._static_CardIcon):GetSizeY() * 13 / 10
    -- DECOMPILER ERROR at PC34: Confused about usage of register: R12 in 'UnsetPending'

    if (self._bottomCardList)[index] == nil then
      (self._bottomCardList)[index] = {}
    end
    local ui = {}
    ui._staticText_CardText = (UI.createControl)(UCT.PA_UI_CONTROL_STATICTEXT, (self._ui)._static_BottomBg, "cardText_" .. index)
    CopyBaseProperty((self._bottomCardTemplete)._staticText_CardText, ui._staticText_CardText)
    ;
    (ui._staticText_CardText):ComputePos()
    ;
    (ui._staticText_CardText):SetShow(true)
    ;
    (ui._staticText_CardText):SetPosX(index * gap)
    ;
    (ui._staticText_CardText):SetAutoResize(true)
    ;
    (ui._staticText_CardText):SetTextMode((CppEnums.TextMode).eTextMode_AutoWrap)
    ;
    (ui._staticText_CardText):SetText(cardWrapper:getName())
    ;
    (ui._staticText_CardText):SetVerticalBottom()
    ui._static_SelectBg = (UI.createControl)(UCT.PA_UI_CONTROL_STATIC, (self._ui)._static_BottomBg, "selectIcon_" .. index)
    CopyBaseProperty((self._bottomCardTemplete)._static_SelectBg, ui._static_SelectBg)
    ;
    (ui._static_SelectBg):SetPosX(index * gap)
    ;
    (ui._static_SelectBg):ComputePos()
    ui._static_CardIcon = (UI.createControl)(UCT.PA_UI_CONTROL_STATIC, (self._ui)._static_BottomBg, "cardIcon_" .. index)
    CopyBaseProperty((self._bottomCardTemplete)._static_CardIcon, ui._static_CardIcon)
    ;
    (ui._static_CardIcon):ComputePos()
    ;
    (ui._static_CardIcon):ChangeTextureInfoName(cardWrapper:getPicture())
    ;
    (ui._static_CardIcon):SetVerticalTop()
    ;
    (ui._static_CardIcon):SetSpanSize(0, 0 - (ui._static_CardIcon):GetSizeY())
    ;
    (ui._static_CardIcon):SetShow(true)
    ;
    (ui._static_CardIcon):SetIgnore(false)
    ;
    (ui._static_CardIcon):addInputEvent("Mouse_RUp", "PaGlobalFunc_MentalGame_RClick_BottomCard(" .. index .. " )")
    ;
    (ui._static_CardIcon):addInputEvent("Mouse_On", "PaGlobalFunc_MentalGame_CardOver(" .. index .. ",false,true)")
    ;
    (ui._static_CardIcon):addInputEvent("Mouse_Out", "PaGlobalFunc_MentalGame_CardOver(" .. index .. ",false,false)")
    if mentalObject:isBanedCard(cardWrapper) == true or mentalObject:isSelectedCard(cardWrapper) == true then
      (ui._static_CardIcon):SetColor((Defines.Color).C_FF626262)
    else
      ;
      (ui._static_CardIcon):SetColor((Defines.Color).C_FFFFFFFF)
    end
    if PrePosY < (ui._static_CardIcon):GetSizeY() then
      PrePosY = (ui._static_CardIcon):GetSizeY()
    end
    ;
    (ui._staticText_CardText):SetSize((ui._staticText_CardText):GetSizeX(), PrePosY)
    ;
    (ui._staticText_CardText):ComputePos()
    ;
    (ui._static_CardIcon):ComputePos()
    -- DECOMPILER ERROR at PC214: Confused about usage of register: R13 in 'UnsetPending'

    ;
    (self._bottomCardList)[index] = ui
  end
end

Window_MentalGameInfo.SetCardColor = function(self)
  -- function num : 0_20
  local mentalObject = getMentalgameObject()
  if mentalObject == nil then
    return 
  end
  local count = mentalObject:getCardCount()
  for index = 0, count - 1 do
    local cardWrapper = mentalObject:getCard(index)
    if (self._bottomCardList)[index] == nil or ((self._bottomCardList)[index])._static_CardIcon == nil or ((self._bottomCardList)[index])._static_CardText == nil then
      return 
    end
    local iconUI = ((self._bottomCardList)[index])._static_CardIcon
    if mentalObject:isBanedCard(cardWrapper) or mentalObject:isSelectedCard(cardWrapper) then
      iconUI:SetColor((Defines.Color).C_FF626262)
    else
      iconUI:SetColor((Defines.Color).C_FFFFFFFF)
    end
  end
end

PaGlobalFunc_MentalGame_RClick_BanedCard = function(index)
  -- function num : 0_21 , upvalues : Window_MentalGameInfo
  local self = Window_MentalGameInfo
  local mentalObject = getMentalgameObject()
  if mentalObject == nil then
    return 
  end
  RequestMentalGame_clearSelectCard(index)
  if mentalObject:getCardBySlotIndex(key) ~= nil then
    audioPostEvent_SystemUi(0, 2)
  end
end

PaGlobalFunc_MentalGame_RClick_BottomCard = function(index)
  -- function num : 0_22 , upvalues : Window_MentalGameInfo
  local self = Window_MentalGameInfo
  self._selectCardIndex = index
  local mentalObject = getMentalgameObject()
  if mentalObject == nil then
    return 
  end
  if self._selectCardIndex < mentalObject:getCardCount() then
    local value = mentalObject:getCard(self._selectCardIndex)
    if value ~= nil then
      local staticKey = (value:getStaticStatus()):getKey()
      if mentalObject:isSelectedCard(value) == false then
        RequestMentalGame_selectCardByKey(staticKey, 99)
        audioPostEvent_SystemUi(0, 2)
      end
    end
  end
  do
    self._selectCardIndex = -1
  end
end

Window_MentalGameInfo.InitRegister = function(self)
  -- function num : 0_23
  registerEvent("startMentalGame", "PaGlobalFunc_FromClient_MentalGame_Open")
  registerEvent("onScreenResize", "PaGlobalFunc_MentalGame_ScreenResize")
  registerEvent("ResponseMentalGame_updateStage", "PaGlobalFunc_FromClient_MentalGame_UpdateStage")
  registerEvent("ResponseMentalGame_endStage", "PaGlobalFunc_MentalGame_endStage")
  registerEvent("MentalGame_updateMatrix", "PaGlobalFunc_MentalGame_updateMatrix")
  registerEvent("EventSelfPlayerPreDead", "PaGlobalFunc_MentalGame_HideByDead")
  registerEvent("progressEventCancelByAttacked", "PaGlobalFunc_MentalGame_HideByDamage")
end

PaGlobalFunc_MentalGame_ScreenResize = function()
  -- function num : 0_24
end

PaGlobalFunc_FromClient_MentalGame_Open = function()
  -- function num : 0_25 , upvalues : Window_MentalGameInfo
  local self = Window_MentalGameInfo
  ToClient_SaveUiInfo(false)
  if GetUIMode() ~= (Defines.UIMode).eUIMode_NpcDialog then
    return 
  end
  SetUIMode((Defines.UIMode).eUIMode_MentalGame)
  PaGlobalFunc_MentalGame_Open()
  PaGlobalFunc_MainDialog_Close(false)
  Panel_Dialogue_Itemtake:SetShow(false)
  PaGlobalFunc_Dialog_NPCShop_Close()
  local isSuccess = show_MentalGame()
  if isSuccess == false then
    return 
  end
  Panel_Window_MentalGame_Finish:SetShow(false)
  ;
  ((self._ui)._static_LeftBg):SetShow(true)
  ;
  ((self._ui)._static_BottomBg):SetShow(true)
  ;
  ((self._ui)._static_keyGuide):SetShow(true)
  ;
  ((self._ui)._static_TopBg):SetShow(true)
  self:Clear()
  self:SetMentalGameInfo()
  self:SetZodiac()
  self:SetBottomCardList()
  self:CreateInfomationUI()
  self:CreateAnimationUI()
  self:CircleLineAndObjectClear()
  self:SetCircleLineAndObject()
  self:SetSelectCardPos()
  self:UpdateState()
end

Window_MentalGameInfo.SetZodiac = function(self)
  -- function num : 0_26
  local mentalObject = getMentalgameObject()
  if mentalObject == nil then
    return 
  end
  local zodiacStaticStatusWrapper = mentalObject:getZodiacStaticStatusWrapper()
  if zodiacStaticStatusWrapper ~= nil then
    (((self._ui)._static_Zodiac)._control):SetShow(true)
    ;
    (((self._ui)._static_Zodiac)._control):ChangeTextureInfoName(zodiacStaticStatusWrapper:getZodiacImagePath())
  end
end

Window_MentalGameInfo.SetSelectCardPos = function(self)
  -- function num : 0_27
  local mentalObject = getMentalgameObject()
  if mentalObject == nil then
    return 
  end
  local basePos = mentalObject:getCardPos()
  local count = mentalObject:getPointCount()
  local gameOptionSetting = ToClient_getGameOptionControllerWrapper()
  local CropModeEnable = gameOptionSetting:getCropModeEnable()
  local CropModeScaleX = gameOptionSetting:getCropModeScaleX()
  local CropModeScaleY = gameOptionSetting:getCropModeScaleY()
  local screenX = getScreenSizeX() - getScreenSizeX() * CropModeScaleX
  local screenY = getScreenSizeY() - getScreenSizeY() * CropModeScaleY
  for index = 0, count - 1 do
    local starPos = mentalObject:getPoint(index)
    local float3Pos = ((Util.Math).AddVectorToVector)(basePos, starPos)
    local selectCard = (self._selectCardTable)[index]
    if selectCard == nil then
      selectCard = self:CreateSelectCard(index)
    end
    local transformData = getTransformRevers(float3Pos.x, float3Pos.y, float3Pos.z)
    if transformData.x > -1 and transformData.y > -1 then
      local cameraDistance = distanceFromCamera(float3Pos.x, float3Pos.y, float3Pos.z)
      local scaleSize = 100000 / cameraDistance * 0.85
      ;
      (selectCard._static_Bg):SetSize(scaleSize, scaleSize)
      ;
      (selectCard._circularProgress_Progress):ComputePos()
      ;
      (selectCard._static_Success):ComputePos()
      ;
      (selectCard._static_Failed):ComputePos()
      ;
      (selectCard._circularProgress_Progress):SetAniSpeed(mentalObject:getMentalGameSpeed() / 100)
      if CropModeEnable == true then
        (selectCard._static_Bg):SetPosX(transformData.x * CropModeScaleX + screenX / 2 - (selectCard._static_Bg):GetSizeX() / 2)
        ;
        (selectCard._static_Bg):SetPosY(transformData.y * CropModeScaleY + screenY / 2 - (selectCard._static_Bg):GetSizeY() / 2)
      else
        ;
        (selectCard._static_Bg):SetPosX(transformData.x - (selectCard._static_Bg):GetSizeX() / 2)
        ;
        (selectCard._static_Bg):SetPosY(transformData.y - (selectCard._static_Bg):GetSizeY() / 2)
      end
      ;
      (selectCard._static_Bg):SetPosY((selectCard._static_Bg):GetPosY() - 25)
      ;
      (selectCard._static_Bg):SetAlpha(1)
      ;
      (selectCard._static_Bg):SetDepth(cameraDistance)
      -- DECOMPILER ERROR at PC149: Confused about usage of register: R20 in 'UnsetPending'

      ;
      (self._selectCardTable)[index] = selectCard
    end
  end
end

Window_MentalGameInfo.CreateSelectCard = function(self, index)
  -- function num : 0_28
  local selectCard = {_static_Bg, _circularProgress_Progress, _static_Success, _static_Failed}
  local UCT = CppEnums.PA_UI_CONTROL_TYPE
  selectCard._static_Bg = (UI.createControl)(UCT.PA_UI_CONTROL_STATIC, Panel_Window_MentalGame, "static_Bg_" .. index)
  CopyBaseProperty((self._selectCardTemplete)._static_Bg, selectCard._static_Bg)
  ;
  (selectCard._static_Bg):SetIgnore(false)
  ;
  (selectCard._static_Bg):addInputEvent("Mouse_RUp", "PaGlobalFunc_MentalGame_RClick_BanedCard(" .. index .. ")")
  ;
  (selectCard._static_Bg):addInputEvent("Mouse_On", "PaGlobalFunc_MentalGame_CardOver(" .. index .. ",true,true)")
  ;
  (selectCard._static_Bg):addInputEvent("Mouse_Out", "PaGlobalFunc_MentalGame_CardOver(" .. index .. ",true,false)")
  selectCard._circularProgress_Progress = (UI.createControl)(UCT.PA_UI_CONTROL_CIRCULAR_PROGRESS, selectCard._static_Bg, "circular_Progress_" .. index)
  CopyBaseProperty((self._selectCardTemplete)._circularProgress_Progress, selectCard._circularProgress_Progress)
  ;
  (selectCard._circularProgress_Progress):SetShow(true)
  ;
  (selectCard._circularProgress_Progress):SetCurrentControlPos(0)
  ;
  (selectCard._circularProgress_Progress):SetProgressRate(0)
  ;
  (selectCard._circularProgress_Progress):SetSmoothMode(true)
  selectCard._static_Success = (UI.createControl)(UCT.PA_UI_CONTROL_STATIC, selectCard._static_Bg, "static_Success_" .. index)
  CopyBaseProperty((self._selectCardTemplete)._static_Success, selectCard._static_Success)
  selectCard._static_Failed = (UI.createControl)(UCT.PA_UI_CONTROL_STATIC, selectCard._static_Bg, "static_Failed_" .. index)
  CopyBaseProperty((self._selectCardTemplete)._static_Failed, selectCard._static_Failed)
  return selectCard
end

PaGlobalFunc_MentalGame_CardOver = function(mouseOverKey, isInserted, isShow)
  -- function num : 0_29 , upvalues : Window_MentalGameInfo
  local self = Window_MentalGameInfo
  local prevIndex = self._selectCardIndex
  self._selectCardIndex = mouseOverKey
  if prevIndex ~= -1 then
    (((self._bottomCardList)[prevIndex])._static_SelectBg):SetShow(false)
  end
  if isShow ~= true then
    (((self._bottomCardList)[self._selectCardIndex])._static_SelectBg):SetShow(self._selectCardIndex == -1)
    local tooltip = (self._ui)._tooltip
    Panel_Window_MentalGame_Tooltip:SetShow(false)
    local mentalObject = getMentalgameObject()
    if mentalObject == nil then
      return 
    end
    -- DECOMPILER ERROR at PC48: Unhandled construct in 'MakeBoolean' P1

    -- DECOMPILER ERROR at PC48: Unhandled construct in 'MakeBoolean' P1

    if (self._config)._gameStep_StartGame ~= self._gameStep and self._overKey == mouseOverKey and isShow == false then
      Panel_Window_MentalGame_Tooltip:SetShow(false)
      self._overKey = -1
    end
    if isShow == true then
      local targetUI = nil
      local isSuccess = true
      if isInserted == true then
        isSuccess = self:UpdateTooltipContext(mentalObject:getCardBySlotIndex(mouseOverKey), isInserted, mouseOverKey)
        uiGroup = (self._selectCardTable)[mouseOverKey]
        if (self._selectCardTable)[mouseOverKey] ~= nil then
          targetUI = ((self._selectCardTable)[mouseOverKey])._static_Bg
        end
      else
        isSuccess = self:UpdateTooltipContext(mentalObject:getCard(mouseOverKey), isInserted, mouseOverKey)
        if (self._bottomCardList)[mouseOverKey] ~= nil and ((self._bottomCardList)[mouseOverKey])._static_CardIcon ~= nil then
          targetUI = ((self._bottomCardList)[mouseOverKey])._static_CardIcon
        end
      end
      if isSuccess == true then
        Panel_Window_MentalGame_Tooltip:SetShow(true)
      end
    end
    -- DECOMPILER ERROR: 7 unprocessed JMP targets
  end
end

Window_MentalGameInfo.UpdateTooltipContext = function(self, mentalCard, isInserted, slotIndex)
  -- function num : 0_30
  local mentalObject = getMentalgameObject()
  if mentalCard == nil or mentalObject == nil then
    return false
  end
  local maxHitPercent = mentalCard:getHit() / mentalObject:getCurrentDV() * 100
  local minDamage = mentalCard:getMinDD() - mentalObject:getCurrentPV()
  local maxDamage = mentalCard:getMaxDD() - mentalObject:getCurrentPV()
  local _mentalCard = mentalCard:getStaticStatus()
  local objectHit = mentalCard:getHit()
  if maxHitPercent < 0 then
    maxHitPercent = 0
  else
    if maxHitPercent > 100 then
      maxHitPercent = 100
    end
  end
  if minDamage < 0 then
    minDamage = 0
  end
  if maxDamage < 0 then
    maxDamage = 0
  end
  local buffText = PAGetString(Defines.StringSheet_GAME, "MENTALGAME_BUFF_EMPTY")
  if _mentalCard:isBuff() == true then
    if _mentalCard:getApplyTurn() == 0 then
      if _mentalCard:getBuffType() < 2 then
        buffText = PAGetStringParam3(Defines.StringSheet_GAME, "MENTALGAME_BUFF_MESSAGE_1_UP", "buff", ((self._configStr)._buffTypeString)[_mentalCard:getBuffType()], "turn", tostring(_mentalCard:getValidTurn()), "value", tostring(_mentalCard:getVariedValue()))
      else
        buffText = PAGetStringParam3(Defines.StringSheet_GAME, "MENTALGAME_BUFF_MESSAGE_1_DOWN", "buff", ((self._configStr)._buffTypeString)[_mentalCard:getBuffType()], "turn", tostring(_mentalCard:getValidTurn()), "value", tostring(_mentalCard:getVariedValue()))
      end
    else
      if _mentalCard:getBuffType() < 2 then
        buffText = PAGetStringParam4(Defines.StringSheet_GAME, "MENTALGAME_BUFF_MESSAGE_ANY_UP", "count", tostring(_mentalCard:getApplyTurn() + 1), "buff", ((self._configStr)._buffTypeString)[_mentalCard:getBuffType()], "turn", tostring(_mentalCard:getValidTurn()), "value", tostring(_mentalCard:getVariedValue()))
      else
        buffText = PAGetStringParam4(Defines.StringSheet_GAME, "MENTALGAME_BUFF_MESSAGE_ANY_DOWN", "count", tostring(_mentalCard:getApplyTurn() + 1), "buff", ((self._configStr)._buffTypeString)[_mentalCard:getBuffType()], "turn", tostring(_mentalCard:getValidTurn()), "value", tostring(_mentalCard:getVariedValue()))
      end
    end
  end
  local overKey_StaticKey = _mentalCard:getKey()
  local overKeyIndex = -1
  for index = 0, (self._config)._slotCountMax - 1 do
    local mentalCardData = RequestMentalGame_getCardSlotAt(index)
    -- DECOMPILER ERROR at PC185: Unhandled construct in 'MakeBoolean' P1

    if mentalCardData ~= nil and (mentalCardData:getStaticStatus()):getKey() == overKey_StaticKey then
      overKeyIndex = index
      break
    end
    overKeyIndex = index
    do break end
  end
  do
    local tooltip = (self._ui)._tooltip
    ;
    (tooltip._staticText_HitBase):SetText(((self._configStr)._buffTypeString)[1] .. " : " .. mentalCard:getHit())
    ;
    (tooltip._staticText_DDBase):SetText(((self._configStr)._buffTypeString)[0] .. " : " .. mentalCard:getMinDD() .. " ~ " .. mentalCard:getMaxDD())
    ;
    (tooltip._staitcText_NpcName):SetText(mentalCard:getName())
    local temp1 = PAGetStringParam2(Defines.StringSheet_GAME, "MENTALGAME_TOOLTIP_CAUSE_INTERESTING", "hit", tostring(objectHit), "percent", (string.format)("%.0f", maxHitPercent))
    local temp2 = PAGetStringParam2(Defines.StringSheet_GAME, "MENTALGAME_TOOLTIP_FAVOR", "min", tostring(minDamage), "max", tostring(maxDamage))
    ;
    (tooltip._staticText_InterestComment):SetText(temp1)
    ;
    (tooltip._staticText_FavorityComment):SetText(temp2)
    local hitBonusText = ""
    local ddBonusText = ""
    local valueText = ""
    if isInserted == true then
      local startIndex = mentalObject:getBuffStartIndex(slotIndex, 0)
      for index = startIndex, slotIndex - 1 do
        local value = mentalObject:getBuffValue(R26_PC272)
        if value > 0 then
          valueText = " +" .. R26_PC272
        else
          -- DECOMPILER ERROR at PC284: Overwrote pending register: R26 in 'AssignReg'

          if value < 0 then
            valueText = " " .. R26_PC272
          else
            valueText = ""
          end
        end
        -- DECOMPILER ERROR at PC291: Overwrote pending register: R26 in 'AssignReg'

        ddBonusText = ddBonusText .. R26_PC272
      end
      local startIndex = mentalObject:getBuffStartIndex(slotIndex, 1)
      for index = startIndex, slotIndex - 1 do
        -- DECOMPILER ERROR at PC302: Overwrote pending register: R26 in 'AssignReg'

        local value = mentalObject:getBuffValue(index)
        -- DECOMPILER ERROR at PC307: Overwrote pending register: R26 in 'AssignReg'

        if value > 0 then
          valueText = R26_PC272 .. tostring(value)
        else
          -- DECOMPILER ERROR at PC315: Overwrote pending register: R26 in 'AssignReg'

          if value < 0 then
            valueText = R26_PC272 .. tostring(value)
          else
            valueText = ""
          end
        end
        -- DECOMPILER ERROR at PC322: Overwrote pending register: R26 in 'AssignReg'

        hitBonusText = R26_PC272 .. valueText
      end
    end
    do
      ;
      (tooltip._staticText_Bonus):SetText(buffText)
      ;
      (tooltip._staticText_HitBonus):SetText(hitBonusText)
      ;
      (tooltip._staticText_DDBonus):SetText(ddBonusText)
      ;
      (tooltip._staticText_HitBonus):SetPosX((tooltip._staticText_HitBase):GetPosX() + (tooltip._staticText_HitBase):GetSizeX() + (tooltip._staticText_HitBase):GetTextSizeX() + 5)
      ;
      (tooltip._staticText_DDBonus):SetPosX((tooltip._staticText_DDBase):GetPosX() + (tooltip._staticText_DDBase):GetSizeX() + (tooltip._staticText_DDBase):GetTextSizeX() + 5)
      return true
    end
  end
end

Window_MentalGameInfo.SetMentalGameInfo = function(self)
  -- function num : 0_31
  local left = (self._ui)._left
  local mentalStage = RequestMentalGame_getMentalStage()
  local mentalObject = getMentalgameObject()
  if mentalObject == nil then
    return 
  end
  local dialogData = ToClient_GetCurrentDialogData()
  if dialogData == nil then
    return 
  end
  local npcTitle = dialogData:getContactNpcTitle()
  local goaltype = mentalObject:getGoalType()
  local destGoalValue = mentalObject:getDestGoalValue()
  local currentDv = mentalObject:getCurrentDV()
  local currentPv = mentalObject:getCurrentPV()
  local comboCount = mentalObject:getCombo()
  local variedDv = mentalObject:getVariedDv()
  local variedPv = (mentalObject:getVariedPv())
  local characterkey = nil
  local talker = dialog_getTalker()
  local talkerName = ""
  local intimacy = nil
  if talker ~= nil then
    talkerName = talker:getName()
    intimacy = talker:getIntimacy()
    characterkey = talker:getCharacterKey()
  end
  ;
  (left._staticIcon_Type):SetText(npcTitle)
  ;
  (left._staticText_Name):SetText(talkerName)
  ;
  (left._staticText_IntimacyPoint):SetText(intimacy)
  local valuePercent = intimacy / (self._config)._interestValueMax * 100
  if valuePercent > 100 then
    valuePercent = 100
  end
  ;
  (left._circularProgress_IntimacyPoint):SetProgressRate(valuePercent)
  local intimacyRewardCount = getIntimacyInformationCount(characterkey)
  local startSize = 28
  local endSize = ((left._circularProgress_IntimacyPoint):GetSizeX() + (left._static_RewardIcon):GetSizeX()) / 2
  local centerPosition = float3((left._circularProgress_IntimacyPoint):GetPosX() + (left._circularProgress_IntimacyPoint):GetSizeX() / 2, (left._circularProgress_IntimacyPoint):GetPosY() + (left._circularProgress_IntimacyPoint):GetSizeY() / 2, 0)
  local questIndex = 0
  self._rewardToolTipDescTable = {}
  for index = 0, intimacyRewardCount - 1 do
    local intimacyInformationData = getIntimacyInformation(characterkey, index)
    if intimacyInformationData == nil then
      return 
    end
    local percent = intimacyInformationData:getIntimacy() / 1000
    local imageType = intimacyInformationData:getTypeIndex()
    local giftName = intimacyInformationData:getTypeName()
    local giftDesc = intimacyInformationData:getTypeDescription()
    local giftMentalCardWrapper = ToClinet_getMentalCardStaticStatus(intimacyInformationData:getMentalCardKeyRaw())
    local giftOperator = intimacyInformationData:getOperatorType()
    if giftMentalCardWrapper ~= nil then
      if giftMentalCardWrapper:isHasCard() == true then
        giftDesc = giftDesc .. (self._configStr)._hasMentalCardText
      else
        giftDesc = giftDesc .. (self._configStr)._hasntMentalCardText
      end
    end
    giftDesc = giftDesc .. "(" .. ((self._configStr)._operatorString)[giftOperator] .. " " .. percent * 1000 .. ")"
    local imageFileName = ""
    if percent >= 0 and percent <= 1 and ToClient_checkIntimacyInformationFixedState(intimacyInformationData) == true then
      local angle = math.pi * 2 * percent
      local lineStart = float3((math.sin)(angle), -(math.cos)(angle), 0)
      local lineEnd = float3((math.sin)(angle), -(math.cos)(angle), 0)
      lineStart = ((Util.Math).AddVectorToVector)(centerPosition, ((Util.Math).MulNumberToVector)(lineStart, startSize))
      lineEnd = ((Util.Math).AddVectorToVector)(centerPosition, ((Util.Math).MulNumberToVector)(lineEnd, endSize))
      local rewardIcon = (self._rewardIconTable)[index]
      if rewardIcon == nil then
        rewardIcon = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATIC, (self._ui)._static_LeftBg, "static_rewardIcon_" .. tostring(index))
        CopyBaseProperty(left._static_RewardIcon, rewardIcon)
        -- DECOMPILER ERROR at PC238: Confused about usage of register: R39 in 'UnsetPending'

        ;
        (self._rewardIconTable)[index] = rewardIcon
      end
      local icon = nil
      if imageType == 0 then
        icon = (((self._configUV)._intimacyIcon)[imageType])[questIndex]
        questIndex = questIndex + 1
      else
        icon = ((self._configUV)._intimacyIcon)[imageType]
      end
      rewardIcon:SetShow(true)
      rewardIcon:ChangeTextureInfoName(icon.texture)
      local x1, y1, x2, y2 = setTextureUV_Func(rewardIcon, icon.x1, icon.y1, icon.x2, icon.y2)
      ;
      (rewardIcon:getBaseTexture()):setUV(x1, y1, x2, y2)
      rewardIcon:setRenderTexture(rewardIcon:getBaseTexture())
      rewardIcon:SetPosX(lineEnd.x - rewardIcon:GetSizeX() / 2)
      rewardIcon:SetPosY(lineEnd.y - rewardIcon:GetSizeY() / 2)
      local rewardText = (self._rewardTextTable)[index]
      if rewardText == nil then
        rewardText = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATICTEXT, (self._ui)._static_LeftBg, "static_rewardText_" .. tostring(index))
        CopyBaseProperty(left._static_RewardText, rewardText)
        rewardText:SetPosY(rewardText:GetPosY() + (rewardText:GetSizeY() + 3) * index)
        -- DECOMPILER ERROR at PC322: Confused about usage of register: R45 in 'UnsetPending'

        ;
        (self._rewardTextTable)[index] = rewardText
      end
      rewardText:SetShow(true)
      rewardText:ChangeTextureInfoName(icon.texture)
      local x1, y1, x2, y2 = setTextureUV_Func(rewardText, icon.x1, icon.y1, icon.x2, icon.y2)
      ;
      (rewardText:getBaseTexture()):setUV(x1, y1, x2, y2)
      rewardText:setRenderTexture(rewardText:getBaseTexture())
      rewardText:SetText(giftName .. " : " .. giftDesc)
      if intimacy < percent * 1000 then
        rewardIcon:SetColor((Defines.Color).C_FF888888)
        rewardText:SetColor((Defines.Color).C_FF888888)
        rewardText:SetFontColor((Defines.Color).C_FF888888)
      else
        rewardIcon:SetColor((Defines.Color).C_FFEFEFEF)
        rewardText:SetColor((Defines.Color).C_FFEFEFEF)
        rewardText:SetFontColor((Defines.Color).C_FFEFEFEF)
      end
    end
  end
  local DvStr = ""
  local PvStr = ""
  if variedDv ~= 0 and variedPv ~= 0 then
    DvStr = ((self._configStr)._buffTypeString)[1] .. " : " .. tostring(currentDv) .. " - " .. variedDv
    PvStr = ((self._configStr)._buffTypeString)[0] .. " : " .. tostring(currentPv) .. " - " .. variedPv
  else
    if variedDv == 0 and variedPv ~= 0 then
      DvStr = ((self._configStr)._buffTypeString)[1] .. " : " .. tostring(currentDv)
      PvStr = ((self._configStr)._buffTypeString)[0] .. " : " .. tostring(currentPv) .. " - " .. variedPv
    else
      if variedDv ~= 0 and variedPv == 0 then
        DvStr = ((self._configStr)._buffTypeString)[1] .. " : " .. tostring(currentDv) .. " - " .. variedDv
        PvStr = ((self._configStr)._buffTypeString)[0] .. " : " .. tostring(currentPv)
      else
        DvStr = ((self._configStr)._buffTypeString)[1] .. " : " .. tostring(currentDv)
        PvStr = ((self._configStr)._buffTypeString)[0] .. " : " .. tostring(currentPv)
      end
    end
  end
  ;
  (left._staticText_Interest):SetText(DvStr)
  ;
  (left._staticText_Impression):SetText(PvStr)
end

Window_MentalGameInfo.Update = function(self)
  -- function num : 0_32
  self:SetMentalGameInfo()
  self:SetZodiac()
  self:CircleLineAndObjectClear()
  self:SetCircleLineAndObject()
  self:SetSelectCardPos()
  self:UpdateCardScrollButton()
end

Window_MentalGameInfo.UpdateState = function(self)
  -- function num : 0_33
  local left = (self._ui)._left
  local mentalStage = RequestMentalGame_getMentalStage()
  local mentalObject = getMentalgameObject()
  if mentalObject == nil then
    return 
  end
  local goaltype = mentalObject:getGoalType()
  local destGoalValue = mentalObject:getDestGoalValue()
  local currentDv = mentalObject:getCurrentDV()
  local currentPv = mentalObject:getCurrentPV()
  local comboCount = mentalObject:getCombo()
  local talker = dialog_getTalker()
  local talkerName = ""
  local intimacy = nil
  if talker ~= nil then
    talkerName = talker:getName()
  end
  local missionStr = ""
  local tipStr = ""
  if gameStep == 3 then
    tipStr = ""
  else
    if goaltype == 0 then
      tipStr = ""
      missionStr = PAGetStringParam1(Defines.StringSheet_GAME, "MENTALGAME_TALKING_FREE", "target", tostring(talkerName))
    else
      if goaltype == 1 then
        tipStr = PAGetString(Defines.StringSheet_GAME, "MENTALGAME_TALK_TIP1")
        if destGoalValue == 1 then
          missionStr = PAGetStringParam1(Defines.StringSheet_GAME, "MENTALGAME_TALKING_INTERESTING", "target", tostring(talkerName))
        else
          missionStr = PAGetStringParam2(Defines.StringSheet_GAME, "MENTALGAME_TALKING_INTERESTING_COMBO", "target", tostring(talkerName), "count", tostring(destGoalValue))
        end
      else
        if goaltype == 2 then
          tipStr = PAGetString(Defines.StringSheet_GAME, "MENTALGAME_TALK_TIP2")
          missionStr = PAGetStringParam2(Defines.StringSheet_GAME, "MENTALGAME_TALKING_ACCUMULATE", "target", tostring(talkerName), "count", tostring(destGoalValue))
        else
          if goaltype == 3 then
            tipStr = PAGetString(Defines.StringSheet_GAME, "MENTALGAME_TALK_TIP3")
            missionStr = PAGetStringParam2(Defines.StringSheet_GAME, "MENTALGAME_TALKING_MOST", "target", tostring(talkerName), "count", tostring(destGoalValue))
          else
            if goaltype == 4 then
              tipStr = PAGetString(Defines.StringSheet_GAME, "MENTALGAME_TALK_TIP4")
              missionStr = PAGetStringParam2(Defines.StringSheet_GAME, "MENTALGAME_TALKING_FAILED", "target", tostring(talkerName), "count", tostring(destGoalValue))
            end
          end
        end
      end
    end
  end
  ;
  (left._staticText_Tip):SetText(tipStr)
  ;
  (left._staticText_Mission):SetText(missionStr)
end

PaGlobalFunc_FromClient_MentalGame_UpdateStage = function(isNext)
  -- function num : 0_34 , upvalues : Window_MentalGameInfo
  local self = Window_MentalGameInfo
  local mentalObject = getMentalgameObject()
  if mentalObject == nil then
    return 
  end
  local slotCount = mentalObject:getSlotCount()
  local Cardcount = mentalObject:getCardCount()
  for index = 0, slotCount - 1 do
    local cardWrapper = mentalObject:getCardBySlotIndex(index)
    if (self._selectCardTable)[index] ~= nil and ((self._selectCardTable)[index])._static_Bg ~= nil then
      local target = ((self._selectCardTable)[index])._static_Bg
      if cardWrapper ~= nil then
        target:ChangeTextureInfoName(cardWrapper:getPicture())
      else
        target:ChangeTextureInfoName("")
      end
      target:SetShow(true, false)
    end
  end
  local goaltype = mentalObject:getGoalType()
  local destGoalValue = mentalObject:getDestGoalValue()
  local currentDv = mentalObject:getCurrentDV()
  local currentPv = mentalObject:getCurrentPV()
  local comboCount = mentalObject:getCombo()
  local variedDv = mentalObject:getVariedDv()
  local variedPv = mentalObject:getVariedPv()
  local minCardSlotCount = mentalObject:getMinCardSlotCount()
  local filledSlotCount = mentalObject:getFilledSlotCount()
  local count = minCardSlotCount - filledSlotCount
  ;
  ((self._ui)._button_Clear):SetShow(filledSlotCount ~= 0)
  do
    local commentDesc = PAGetString(Defines.StringSheet_RESOURCE, "PANEL_MENTALGAME_BASE_COMMENT2")
    if (self._config)._gameStep_CardSelect == self._gameStep and count ~= 0 then
      (((self._ui)._top)._staticText_CommentTitle):SetFontColor((Defines.Color).C_FF888888)
      ;
      (((self._ui)._top)._staticText_CommentTitle):SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_MENTALGAME_BASE_COMMENT1"))
      ;
      (((self._ui)._top)._staticText_CommentDesc):SetFontColor((Defines.Color).C_FF888888)
      ;
      (((self._ui)._top)._staticText_CommentDesc):SetText(count .. commentDesc)
    else
      (((self._ui)._top)._staticText_CommentDesc):SetText("")
    end
    if (self._config)._gameStep_StartGame == self._gameStep then
      local currentPoint = mentalObject:getInterestValue()
      self._bestPoint = (math.max)(self._bestPoint, currentPoint)
      local descStr = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_MENTALGAME_INTEREST_COMBOANDFAILED", "combo", comboCount, "failed", mentalObject:getFail()) .. "\n"
      descStr = descStr .. "      " .. PAGetString(Defines.StringSheet_GAME, "MENTALGAME_TALK_ACC_INTERESTING") .. " : " .. mentalObject:getTotalInterest() .. "\n"
      descStr = descStr .. "      " .. PAGetString(Defines.StringSheet_GAME, "MENTALGAME_TALK_MOST_INTERESTING") .. " : " .. self._bestPoint
      ;
      (((self._ui)._top)._staticText_CommentDesc):SetFontColor((Defines.Color).C_FFEFEFEF)
      ;
      (((self._ui)._top)._staticText_CommentDesc):SetText(descStr)
    end
    -- DECOMPILER ERROR at PC195: Unhandled construct in 'MakeBoolean' P1

    if minCardSlotCount <= filledSlotCount and (self._config)._gameStep_CardSelect == self._gameStep then
      self:SetGameStep((self._config)._gameStep_ReadyGame)
    end
    if (self._config)._gameStep_ReadyGame == self._gameStep then
      self:SetGameStep((self._config)._gameStep_CardSelect)
    end
    self:CircleLineAndObjectClear()
    self:SetCircleLineAndObject()
    self:UpdateState()
    self:UpdateStageByStep()
    self:SetCardColor()
    self:UpdateCardScrollButton()
    for index = 0, Cardcount - 1 do
      local cardWrapper = mentalObject:getCard(index)
      if (self._bottomCardList)[index] ~= nil and ((self._bottomCardList)[index])._static_CardIcon ~= nil then
        if mentalObject:isBanedCard(cardWrapper) == true or mentalObject:isSelectedCard(cardWrapper) == true then
          (((self._bottomCardList)[index])._static_CardIcon):SetColor((Defines.Color).C_FF626262)
        else
          (((self._bottomCardList)[index])._static_CardIcon):SetColor((Defines.Color).C_FFFFFFFF)
        end
      end
    end
    if isNext == true then
      self:UpdateNextTryEvent()
    end
    -- DECOMPILER ERROR: 10 unprocessed JMP targets
  end
end

PaGlobalFunc_MentalGame_PosUpdateAnimation = function(key, value)
  -- function num : 0_35
  local mentalObject = getMentalgameObject()
  if mentalObject == nil then
    return 
  end
  local basePos = mentalObject:getCardPos()
  local pos = mentalObject:getLerpBySlot(value._startIndex, value._endIndex, (value._deltaTime - value._startTime) / (value._endTime - value._startTime))
  local float3Pos = ((Util.Math).AddVectorToVector)(basePos, pos)
  float3Pos.y = float3Pos.y + 20
  local transformData = getTransformRevers(float3Pos.x, float3Pos.y, float3Pos.z)
  ;
  (value._ui):SetPosX(transformData.x - (value._ui):GetSizeX() / 2)
  ;
  (value._ui):SetPosY(transformData.y - (value._ui):GetSizeY() / 2)
end

PaGlobalFunc_MentalGame_FontAlphaUpdateAnimation = function(key, value)
  -- function num : 0_36
  local playTime = value._endTime - value._startTime
  local halfPlayTime = (value._endTime - value._startTime) / 2
  local inPlayDelta = value._deltaTime - value._startTime
  if value._startTime + halfPlayTime <= value._deltaTime then
    (value._ui):SetFontAlpha((playTime - inPlayDelta) / halfPlayTime)
    ;
    (value._ui):SetAlpha(inPlayDelta / halfPlayTime)
  else
    ;
    (value._ui):SetFontAlpha(inPlayDelta / halfPlayTime)
    ;
    (value._ui):SetAlpha(inPlayDelta / halfPlayTime)
  end
end

Window_MentalGameInfo.CreateInfomationUI = function(self)
  -- function num : 0_37
  local otherControlTextType = (CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATICTEXT
  for from = 0, 19 do
    -- DECOMPILER ERROR at PC13: Confused about usage of register: R6 in 'UnsetPending'

    if (self._infomationUIList)[from] == nil then
      (self._infomationUIList)[from] = {}
    end
    for to = from + 1, 19 do
      -- DECOMPILER ERROR at PC26: Confused about usage of register: R10 in 'UnsetPending'

      if ((self._infomationUIList)[from])[to] == nil then
        ((self._infomationUIList)[from])[to] = {}
      end
      local targetGroup = ((self._infomationUIList)[from])[to]
      do
        if targetGroup._panel == nil then
          local target = (UI.createPanel)("MentalGame_Information_" .. tostring(from) .. "_" .. tostring(to), (Defines.UIGroup).PAGameUIGroup_QuestLog)
          target:SetIgnore(true)
          target:SetShow(true)
          target:SetSpanSize(0, 0)
          target:SetAlpha(1)
          target:ComputePos()
          targetGroup._panel = target
        end
        do
          if targetGroup._pointImage == nil then
            local target = (UI.createControl)(otherControlTextType, targetGroup._panel, "PointImage")
            CopyBaseProperty((self._ui)._staticText_addInterest, target)
            target:SetIgnore(false)
            target:SetShow(true)
            target:SetAlpha(1)
            target:SetSpanSize(0, 0)
            target:SetFontAlpha(0)
            target:ComputePos()
            target:SetHorizonCenter()
            target:SetVerticalMiddle()
            targetGroup._pointImage = target
          end
          do
            do
              if targetGroup._nameTag == nil then
                local nameTag = (UI.createControl)(otherControlTextType, targetGroup._pointImage, "NameTag")
                nameTag:SetIgnore(true)
                nameTag:SetShow(true)
                nameTag:SetFontAlpha(0)
                nameTag:SetSpanSize(0, 30)
                nameTag:SetHorizonCenter()
                nameTag:SetVerticalBottom()
                targetGroup._nameTag = nameTag
              end
              -- DECOMPILER ERROR at PC130: Confused about usage of register: R11 in 'UnsetPending'

              ;
              ((self._infomationUIList)[from])[to] = targetGroup
              -- DECOMPILER ERROR at PC131: LeaveBlock: unexpected jumping out DO_STMT

              -- DECOMPILER ERROR at PC131: LeaveBlock: unexpected jumping out DO_STMT

              -- DECOMPILER ERROR at PC131: LeaveBlock: unexpected jumping out DO_STMT

            end
          end
        end
      end
    end
  end
end

Window_MentalGameInfo.CreateAnimationUI = function(self)
  -- function num : 0_38
  local otherControlTextType = (CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATICTEXT
  for from = 0, 19 do
    -- DECOMPILER ERROR at PC13: Confused about usage of register: R6 in 'UnsetPending'

    if (self._animationUIList)[from] == nil then
      (self._animationUIList)[from] = {}
    end
    for to = from + 1, 19 do
      -- DECOMPILER ERROR at PC26: Confused about usage of register: R10 in 'UnsetPending'

      if ((self._animationUIList)[from])[to] == nil then
        ((self._animationUIList)[from])[to] = {}
      end
      local targetGroup = ((self._animationUIList)[from])[to]
      do
        if targetGroup._pointImage == nil then
          local target = (UI.createControl)(otherControlTextType, Panel_Window_MentalGame, "PointImage_" .. tostring(from) .. "_" .. tostring(to))
          CopyBaseProperty((self._ui)._staticText_addInterest, target)
          target:SetIgnore(true)
          target:SetShow(false)
          target:SetAlpha(0.5)
          target:SetFontAlpha(0)
          target:SetSpanSize(0, 0)
          target:SetPosX(0)
          target:SetPosY(0)
          target:ChangeTextureInfoName("new_ui_common_forlua/widget/worldmap/worldmap_etc_00.dds")
          target:ComputePos()
          target:SetHorizonCenter()
          target:SetVerticalMiddle()
          targetGroup._pointImage = target
        end
        do
          if targetGroup._nameTag == nil then
            local nameTag = (UI.createControl)(otherControlTextType, targetGroup._pointImage, "NameTag_" .. tostring(from) .. "_" .. tostring(to))
            nameTag:SetIgnore(true)
            nameTag:SetShow(true)
            nameTag:SetSpanSize(0, 30)
            nameTag:SetHorizonCenter()
            nameTag:SetVerticalBottom()
            targetGroup._nameTag = nameTag
          end
          -- DECOMPILER ERROR at PC116: LeaveBlock: unexpected jumping out DO_STMT

        end
      end
    end
  end
end

Window_MentalGameInfo.UpdateStageByStep = function(self)
  -- function num : 0_39
  ((self._ui)._button_Select):addInputEvent("Mouse_LUp", "")
  if (self._config)._gameStep_CardSelect == self._gameStep then
    ((self._ui)._button_Select):SetShow(true)
    ;
    ((self._ui)._button_Back):SetShow(true)
    ;
    ((self._ui)._button_Select):SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_WORLDMAP_GUILDHOUSE_CHANGEWORKER_SELECTBTN"))
    ;
    ((self._ui)._button_Select):addInputEvent("Mouse_LUp", "PaGlobalFunc_MentalGame_LClick_SlectCard()")
    ;
    (((self._ui)._top)._staticText_CommentTitle):SetShow(true)
    ;
    (((self._ui)._top)._staticText_CommentDesc):SetShow(true)
  else
    if (self._config)._gameStep_ReadyGame == self._gameStep then
      ((self._ui)._button_Select):SetShow(true)
      ;
      ((self._ui)._button_Back):SetShow(true)
      ;
      ((self._ui)._button_Select):SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_MENTALGAME_RIGHT_APPLY_NEW_BTN"))
      ;
      ((self._ui)._button_Select):addInputEvent("Mouse_LUp", "PaGlobalFunc_MentalGame_LClick_StartGame()")
      ;
      (((self._ui)._top)._staticText_CommentDesc):SetShow(true)
      ;
      (((self._ui)._top)._staticText_CommentTitle):SetShow(false)
    else
      if (self._config)._gameStep_StartGame == self._gameStep then
        ((self._ui)._button_Back):SetShow(false)
        ;
        ((self._ui)._button_Select):SetShow(false)
        ;
        (((self._ui)._top)._staticText_CommentDesc):SetShow(true)
        ;
        ((self._ui)._button_Clear):SetShow(false)
      else
        if (self._config)._gameStep_EndGame == self._gameStep then
          ((self._ui)._button_Clear):SetShow(false)
          local mentalStage = RequestMentalGame_getMentalStage()
          local playableNextGame = self._gamePlayCount < (self._config)._maxPlayCount - 1
          ;
          ((self._ui)._button_Back):SetShow(true)
          ;
          ((self._ui)._button_Select):SetShow(not mentalStage._isSuccess or playableNextGame)
          ;
          ((self._ui)._button_Select):SetText(PAGetString(Defines.StringSheet_RESOURCE, "MENTAL_BASE_TEXT_TRYAGAIN"))
          ;
          (((self._ui)._top)._staticText_CommentTitle):SetShow(true)
          ;
          ((self._ui)._button_Select):addInputEvent("Mouse_LUp", "PaGlobalFunc_MentalGame_LClick_ReStart()")
        elseif (self._config)._gameStep_GameExit == self._gameStep then
          ((self._ui)._button_Clear):SetShow(false)
          ;
          (((self._ui)._top)._staticText_CommentDesc):SetShow(true)
          ;
          (((self._ui)._top)._staticText_CommentTitle):SetShow(true)
          ;
          ((self._ui)._button_Select):SetShow(false)
          ;
          ((self._ui)._button_Back):SetShow(false)
          local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
          Panel_Window_MentalGame_Finish:SetShow(true)
          local talker = dialog_getTalker()
          local intimacy = 0
          if talker ~= nil then
            intimacy = talker:getIntimacy()
          end
          local addIntimacyValue = self._addIntimacy
          local resultIntimacy = intimacy + addIntimacyValue
          local resultStr = PAGetStringParam2(Defines.StringSheet_GAME, "MENTALGAME_AQUIRE_INTIMACY_POINT", "result", tostring(resultIntimacy), "point", tostring(addIntimacyValue))
          ;
          ((self._ui)._staticText_Finished):SetText(resultStr)
          local aniInfo1 = ((self._ui)._static_Finished):addScaleAnimation(0, 0.16, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
          aniInfo1:SetStartScale(0.5)
          aniInfo1:SetEndScale(1.15)
          aniInfo1.AxisX = ((self._ui)._static_Finished):GetSizeX() / 2
          aniInfo1.AxisY = ((self._ui)._static_Finished):GetSizeY() / 2
          aniInfo1.ScaleType = 2
          aniInfo1.IsChangeChild = true
          local aniInfo2 = ((self._ui)._static_Finished):addScaleAnimation(0.16, 0.3, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
          aniInfo2:SetStartScale(1.15)
          aniInfo2:SetEndScale(1)
          aniInfo2.AxisX = ((self._ui)._static_Finished):GetSizeX() / 2
          aniInfo2.AxisY = ((self._ui)._static_Finished):GetSizeY() / 2
          aniInfo2.ScaleType = 2
          aniInfo2.IsChangeChild = true
          local aniInfo3 = ((self._ui)._staticText_Finished):addScaleAnimation(0, 0.16, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
          aniInfo3:SetStartScale(0.5)
          aniInfo3:SetEndScale(1.15)
          aniInfo3.AxisX = ((self._ui)._staticText_Finished):GetSizeX() / 2
          aniInfo3.AxisY = ((self._ui)._staticText_Finished):GetSizeY() / 2
          aniInfo3.ScaleType = 2
          aniInfo3.IsChangeChild = true
          local aniInfo4 = ((self._ui)._staticText_Finished):addScaleAnimation(0.16, 0.3, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
          aniInfo4:SetStartScale(1.15)
          aniInfo4:SetEndScale(1)
          aniInfo4.AxisX = ((self._ui)._staticText_Finished):GetSizeX() / 2
          aniInfo4.AxisY = ((self._ui)._staticText_Finished):GetSizeY() / 2
          aniInfo4.ScaleType = 2
          aniInfo4.IsChangeChild = true
        end
      end
    end
  end
  -- DECOMPILER ERROR: 5 unprocessed JMP targets
end

Window_MentalGameInfo.UpdateNextTryEvent = function(self)
  -- function num : 0_40
  local mentalObject = getMentalgameObject()
  if mentalObject == nil then
    return 
  end
  local nextSlot = mentalObject:getNextSlot()
  if nextSlot > 0 then
    local prevSlot = nextSlot - 1
    local index = mentalObject:getOrder(prevSlot)
    if (self._selectCardTable)[index] == nil or ((self._selectCardTable)[index])._static_Success == nil then
      return 
    end
    ;
    (((self._selectCardTable)[index])._static_Success):ResetVertexAni()
    ;
    (((self._selectCardTable)[index])._static_Failed):ResetVertexAni()
    ;
    (((self._selectCardTable)[index])._static_Success):SetShow(false)
    ;
    (((self._selectCardTable)[index])._static_Failed):SetShow(false)
    if mentalObject:isComboSuccess() == true then
      (((self._selectCardTable)[index])._static_Bg):AddEffect("fUI_KnowledgeNotice02", false, 0, 0)
      ;
      (((self._selectCardTable)[index])._static_Success):SetVertexAniRun("Ani_Color_New", true)
      ;
      (((self._selectCardTable)[index])._static_Success):SetVertexAniRun("Ani_Move_Pos_New", true)
      ;
      (((self._selectCardTable)[index])._static_Success):SetShow(true)
      audioPostEvent_SystemUi(4, 9)
    else
      ;
      (((self._selectCardTable)[index])._static_Failed):SetVertexAniRun("Ani_Color_New", true)
      ;
      (((self._selectCardTable)[index])._static_Failed):SetVertexAniRun("Ani_Move_Pos_New", true)
      ;
      (((self._selectCardTable)[index])._static_Failed):SetShow(true)
      audioPostEvent_SystemUi(4, 8)
    end
    local lastIndex = mentalObject:getOrderCount() - 1
    local nextIndex = mentalObject:getOrder(nextSlot)
    if mentalObject:getHasNextSlot() and ((self._selectCardTable)[nextIndex])._circularProgress_Progress ~= nil then
      (((self._selectCardTable)[nextIndex])._circularProgress_Progress):SetShow(true)
      ;
      (((self._selectCardTable)[nextIndex])._circularProgress_Progress):SetCurrentControlPos(0)
      ;
      (((self._selectCardTable)[nextIndex])._circularProgress_Progress):SetProgressRate(100)
    end
    local isFirst = true
    for index = nextSlot, lastIndex do
      local isApplied = mentalObject:isAppliedEffect(prevSlot, index)
      local isFirstAnimation = false
      if isFirst == true and mentalObject:getCardBySlotOrder(index) ~= nil then
        isFirst = false
        isFirstAnimation = true
      end
      if isApplied == true or isFirstAnimation == true then
        if isFirstAnimation == true then
          ((((self._animationUIList)[prevSlot])[index])._pointImage):SetColor((Defines.Color).C_FFEF9C7F)
        else
          ;
          ((((self._animationUIList)[prevSlot])[index])._pointImage):SetColor((Defines.Color).C_FFFFFFFF)
        end
        local playCount = index - prevSlot - mentalObject:getEmptyCount(prevSlot, index)
        self:AddAnimation((((self._animationUIList)[prevSlot])[index])._pointImage, 0, mentalObject:getMentalGameSpeed() / 1000 * playCount, prevSlot, index, PaGlobalFunc_MentalGame_PosUpdateAnimation)
        self:AddAnimation((((self._infomationUIList)[prevSlot])[index])._nameTag, 0, mentalObject:getMentalGameSpeed() / 1000 * playCount, prevSlot, index, PaGlobalFunc_MentalGame_FontAlphaUpdateAnimation)
      end
    end
  end
end

Window_MentalGameInfo.AddAnimation = function(self, ui, startTime, endTime, startIndex, endIndex, animationFunc)
  -- function num : 0_41
  if endTime <= startTime or ui == nil or endTime <= 0 or animationFunc == nil then
    return 
  end
  -- DECOMPILER ERROR at PC19: Confused about usage of register: R7 in 'UnsetPending'

  ;
  (self._animationList)[self._animationIndex] = {_ui = ui, _startTime = startTime, _endTime = endTime, _startIndex = startIndex, _endIndex = endIndex, _deltaTime = 0, _animationFunc = animationFunc}
  self._animationIndex = self._animationIndex + 1
end

Window_MentalGameInfo.UpdateAnimationList = function(self, deltaTime)
  -- function num : 0_42
  for key,value in pairs(self._animationList) do
    value._deltaTime = value._deltaTime + deltaTime
    if value._endTime < value._deltaTime then
      (value._ui):SetShow(false)
      -- DECOMPILER ERROR at PC16: Confused about usage of register: R7 in 'UnsetPending'

      ;
      (self._animationList)[key] = nil
    else
      if value._startTime <= value._deltaTime then
        (value._animationFunc)(key, value)
        ;
        (value._ui):SetShow(true)
      else
        ;
        (value._ui):SetShow(false)
      end
    end
  end
end

PaGlobalFunc_MentalGame_tryCard = function()
  -- function num : 0_43
end

PaGlobalFunc_MentalGame_endStage = function(addedIntimacy)
  -- function num : 0_44 , upvalues : Window_MentalGameInfo
  local self = Window_MentalGameInfo
  local mentalObject = getMentalgameObject()
  if mentalObject == nil then
    return 
  end
  local mentalStage = RequestMentalGame_getMentalStage()
  if mentalStage._isSuccess == true then
    self._addIntimacy = self._addIntimacy + addedIntimacy
  else
    self._addIntimacy = 0
  end
  if self._addIntimacy == 0 then
    (((self._ui)._top)._staticText_CommentTitle):SetFontColor((Defines.Color).C_FF888888)
    ;
    (((self._ui)._top)._staticText_CommentTitle):SetText(PAGetString(Defines.StringSheet_GAME, "MENTALGAME_INTIMACY_ACQUIRE_EMPTY"))
  else
    ;
    (((self._ui)._top)._staticText_CommentTitle):SetFontColor((Defines.Color).C_FF00C0D7)
    ;
    (((self._ui)._top)._staticText_CommentTitle):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_MENTALGAME_ADDINTIMACY", "value", self._addIntimacy))
  end
  self._bestPoint = 0
  self:UpdateState()
  self:SetGameStep((self._config)._gameStep_EndGame)
end

PaGlobalFunc_MentalGame_updateMatrix = function()
  -- function num : 0_45 , upvalues : Window_MentalGameInfo
  local self = Window_MentalGameInfo
  self:CircleLineAndObjectClear()
  self:SetCircleLineAndObject()
  self:SetSelectCardPos()
end

PaGlobalFunc_MentalGame_HideByDead = function()
  -- function num : 0_46 , upvalues : Window_MentalGameInfo
  local self = Window_MentalGameInfo
  if PaGlobalFunc_MentalGame_GetShow() == false then
    return 
  end
  Panel_Window_MentalGame:SetShow(false)
  Panel_Window_MentalGame_Tooltip:SetShow(false)
  Panel_Window_MentalGame_Finish:SetShow(false)
  ;
  ((self._ui)._static_LeftBg):SetShow(false)
  ;
  ((self._ui)._static_BottomBg):SetShow(false)
  ;
  ((self._ui)._static_keyGuide):SetShow(false)
  ;
  ((self._ui)._static_TopBg):SetShow(false)
  self:Clear()
  self:StageClear()
  hide_MentalGame(true)
  RequestMentalGame_endGame()
  ;
  (self._renderMode):reset()
  if _ContentsGroup_RenewUI_Dailog == true then
    PaGlobalFunc_MainDialog_Open()
    PaGlobalFunc_Dialog_Main_CloseNpcTalk()
  else
    Panel_Npc_Dialog:SetShow(true)
    dialog_CloseNpcTalk(true)
  end
  setShowNpcDialog(false)
  setShowLine(true)
  ToClient_PopDialogueFlush()
end

PaGlobalFunc_MentalGame_HideByDamage = function()
  -- function num : 0_47 , upvalues : Window_MentalGameInfo
  local self = Window_MentalGameInfo
  if PaGlobalFunc_MentalGame_GetShow() == false then
    return 
  end
  Panel_Window_MentalGame:SetShow(false)
  Panel_Window_MentalGame_Tooltip:SetShow(false)
  Panel_Window_MentalGame_Finish:SetShow(false)
  ;
  ((self._ui)._static_LeftBg):SetShow(false)
  ;
  ((self._ui)._static_BottomBg):SetShow(false)
  ;
  ((self._ui)._static_keyGuide):SetShow(false)
  ;
  ((self._ui)._static_TopBg):SetShow(false)
  self:Clear()
  self:StageClear()
  hide_MentalGame(false)
  RequestMentalGame_endGame()
  SetUIMode((Defines.UIMode).eUIMode_Default)
  ;
  (self._renderMode):reset()
  if _ContentsGroup_RenewUI_Dailog == true then
    PaGlobalFunc_MainDialog_Open()
    PaGlobalFunc_Dialog_Main_CloseNpcTalk()
  else
    Panel_Npc_Dialog:SetShow(true)
    dialog_CloseNpcTalk(true)
  end
  setShowNpcDialog(false)
  setShowLine(true)
  ToClient_PopDialogueFlush()
end

PaGlobalFunc_FromClient_MentalGame_luaLoadComplete = function()
  -- function num : 0_48 , upvalues : Window_MentalGameInfo
  local self = Window_MentalGameInfo
  self:Initialize()
end

PaGlobalFunc_MentalGame_Close = function()
  -- function num : 0_49 , upvalues : Window_MentalGameInfo
  local self = Window_MentalGameInfo
  if PaGlobalFunc_MentalGame_GetShow() == false then
    return 
  end
  hide_MentalGame(false)
  RequestMentalGame_endGame()
  ;
  (self._renderMode):reset()
  SetUIMode((Defines.UIMode).eUIMode_NpcDialog)
  Panel_Window_MentalGame:SetShow(false)
  Panel_Window_MentalGame_Tooltip:SetShow(false)
  Panel_Window_MentalGame_Finish:SetShow(false)
  ;
  ((self._ui)._static_LeftBg):SetShow(false)
  ;
  ((self._ui)._static_BottomBg):SetShow(false)
  ;
  ((self._ui)._static_keyGuide):SetShow(false)
  ;
  ((self._ui)._static_TopBg):SetShow(false)
  self:Clear()
  self:StageClear()
  if _ContentsGroup_RenewUI_Dailog == true then
    PaGlobalFunc_MainDialog_ReOpen()
  else
    FromClient_ShowDialog()
  end
end

PaGlobalFunc_MentalGame_Open = function()
  -- function num : 0_50
  Panel_Window_MentalGame:SetShow(true)
end

Window_MentalGameInfo.XB_Control_Init = function(self)
  -- function num : 0_51
  ((self._ui)._button_Select):registerPadUpEvent(__eCONSOLE_UI_INPUT_TYPE_Y, "PaGlobalFunc_MentalGame_LClick_ReStart()")
  Panel_Window_MentalGame:registerPadUpEvent(__eCONSOLE_UI_INPUT_TYPE_LB, "PaGlobalFunc_MentalGame_LClick_Arrow(true)")
  Panel_Window_MentalGame:registerPadUpEvent(__eCONSOLE_UI_INPUT_TYPE_RB, "PaGlobalFunc_MentalGame_LClick_Arrow(false)")
end

PaGlobalFunc_MentalGame_GetShow = function()
  -- function num : 0_52
  return Panel_Window_MentalGame:GetShow()
end

registerEvent("FromClient_luaLoadComplete", "PaGlobalFunc_FromClient_MentalGame_luaLoadComplete")

