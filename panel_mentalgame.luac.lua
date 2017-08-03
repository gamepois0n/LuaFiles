-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\widget\dialogue\panel_mentalgame.luac 

-- params : ...
-- function num : 0
local renderMode = (RenderModeWrapper.new)(100, {(Defines.RenderMode).eRenderMode_MentalGame}, false)
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
local UCT = CppEnums.PA_UI_CONTROL_TYPE
local _math_MulNumberToVector = (Util.Math).MulNumberToVector
local _math_AddVectorToVector = (Util.Math).AddVectorToVector
local OPT = CppEnums.OtherListType
local UI_color = Defines.Color
local constValue = {interestValueMax = 1000, slotCountMax = 10, 
buffTypeString = {PAGetString(Defines.StringSheet_GAME, "MENTALGAME_BUFFTYPE_INTERESTING"), PAGetString(Defines.StringSheet_GAME, "MENTALGAME_BUFFTYPE_DEMANDINGINTERESTING"), PAGetString(Defines.StringSheet_GAME, "MENTALGAME_BUFFTYPE_DEMANDINGFAVOR"); [0] = PAGetString(Defines.StringSheet_GAME, "MENTALGAME_BUFFTYPE_FAVOR")}
, hideTime = 5, maxPlayCount = 3}
local mgUI = {
base = {}
, 
select = {}
, 
tooltip = {}
, 
left = {}
, 
center = {}
, 
right = {}
, 
zodiac = {}
}
local giftIcon = {}
local gameStep = 0
local mouseInputer = nil
local isRdown = false
local rMovePos = {x = 0, y = 0}
local addIntimacy = 0
local _bestPoint = 0
local hideDeltaTime = 0
local endTimechk = 0
local gamePlayCount = 0
local centerUiList = {}
local animationUIList = {}
local informationUI = {}
local animationList = {}
local animationIndex = 0
local selectCardIndex = -1
local prevDragImageSizeX, prevDragImageSizeY = 20, 20
local mentalGame_End = false
local scrollPosition = -5
local scrollPositionResult = 0
local scrX = getScreenSizeX()
local scrY = getScreenSizeY()
local uiInit = function()
  -- function num : 0_0 , upvalues : mgUI, OPT
  local left = mgUI.left
  left.panel = Panel_MentalGame_Left
  left.statusBG = (UI.getChildControl)(Panel_MentalGame_Left, "Static_StatusBG")
  left.statusBG_1 = (UI.getChildControl)(Panel_MentalGame_Left, "Static_StatusBG_1")
  left.npc_Name = (UI.getChildControl)(Panel_MentalGame_Left, "StaticText_NPC_Name")
  left.npc_Status = (UI.getChildControl)(Panel_MentalGame_Left, "StaticText_NPCStatus")
  left.npcDV = (UI.getChildControl)(Panel_MentalGame_Left, "StaticText_npcDV")
  left.npcPV = (UI.getChildControl)(Panel_MentalGame_Left, "StaticText_npcPV")
  left.statusBG_2 = (UI.getChildControl)(Panel_MentalGame_Left, "Static_StatusBG_2")
  left.effect = (UI.getChildControl)(Panel_MentalGame_Left, "StaticText_Effect")
  left.comboCount = (UI.getChildControl)(Panel_MentalGame_Left, "StaticText_ComboCount")
  left.comboCount_1 = (UI.getChildControl)(Panel_MentalGame_Left, "StaticText_ComboCountValue")
  left.circle = (UI.getChildControl)(Panel_MentalGame_Left, "Static_Circle")
  left.circle2 = (UI.getChildControl)(Panel_MentalGame_Left, "Static_Circle2")
  left.failCount = (UI.getChildControl)(Panel_MentalGame_Left, "StaticText_FailCount")
  left.cumulativePoint = (UI.getChildControl)(Panel_MentalGame_Left, "StaticText_CumulativePoint")
  left.bestPoint = (UI.getChildControl)(Panel_MentalGame_Left, "StaticText_BestPoint")
  left.statusBG_3 = (UI.getChildControl)(Panel_MentalGame_Left, "Static_StatusBG_3")
  left.fruitage = (UI.getChildControl)(Panel_MentalGame_Left, "StaticText_Fruitage")
  left.fruitage_Value = (UI.getChildControl)(Panel_MentalGame_Left, "StaticText_Fruitage_Value")
  left.fruitage_Add = (UI.getChildControl)(Panel_MentalGame_Left, "StaticText_Fruitage_Add")
  left.giftNotice = (UI.getChildControl)(Panel_MentalGame_Left, "StaticText_GiftNotice")
  left.progressBG = (UI.getChildControl)(Panel_MentalGame_Left, "Static_ProgressBG")
  left.prograss_Current = (UI.getChildControl)(Panel_MentalGame_Left, "CircularProgress_Current")
  left.prograss_Success = (UI.getChildControl)(Panel_MentalGame_Left, "CircularProgress_Success")
  left.giftIcon = (UI.getChildControl)(Panel_MentalGame_Left, "Static_GiftIcon")
  left.statusBG_4 = (UI.getChildControl)(Panel_MentalGame_Left, "Static_StatusBg_4")
  left.gameDesc = (UI.getChildControl)(Panel_MentalGame_Left, "StaticText_Desc")
  local base = mgUI.base
  base.panel = Panel_MentalGame_Base
  base.comment_1 = (UI.getChildControl)(Panel_MentalGame_Base, "StaticText_Comment_1")
  base.comment_Value = (UI.getChildControl)(Panel_MentalGame_Base, "StaticText_Comment_Value")
  base.comment_2 = (UI.getChildControl)(Panel_MentalGame_Base, "StaticText_Comment_2")
  base.btnTryAgain = (UI.getChildControl)(Panel_MentalGame_Base, "Button_TryAgain")
  base.tryAgain = (UI.getChildControl)(Panel_MentalGame_Base, "StaticText_TryAgain")
  base.nextSuccess = (UI.getChildControl)(Panel_MentalGame_Base, "StaticText_NextSuccess")
  base.nextFail = (UI.getChildControl)(Panel_MentalGame_Base, "StaticText_NextFail")
  base.btnGameEnd = (UI.getChildControl)(Panel_MentalGame_Base, "Button_GameEnd")
  base.gameEnd = (UI.getChildControl)(Panel_MentalGame_Base, "StaticText_GameEnd")
  base.result = (UI.getChildControl)(Panel_MentalGame_Base, "StaticText_Result")
  base.condition = (UI.getChildControl)(Panel_MentalGame_Base, "StaticText_Condition")
  base.explain = (UI.getChildControl)(Panel_MentalGame_Base, "StaticText_Explain")
  base.statusBG_4 = (UI.getChildControl)(Panel_MentalGame_Base, "Static_StatusBG_4")
  base.bgPosX = (base.statusBG_4):GetPosX()
  base.bgSizeX = (base.statusBG_4):GetSizeX()
  local select = mgUI.select
  select.panel = Panel_MentalGame_Select
  select.interest = (UI.getChildControl)(Panel_MentalGame_Select, "StaticText_Interest")
  select.worth = (UI.getChildControl)(Panel_MentalGame_Select, "StaticText_Worth")
  select.interestAdd = (UI.getChildControl)(Panel_MentalGame_Select, "StaticText_InterestAdd")
  select.worthAdd = (UI.getChildControl)(Panel_MentalGame_Select, "StaticText_WorthAdd")
  select.name = (UI.getChildControl)(Panel_MentalGame_Select, "StaticText_Name")
  select.number = (UI.getChildControl)(Panel_MentalGame_Select, "StaticText_Number")
  select.addInterest = (UI.getChildControl)(Panel_MentalGame_Select, "StaticText_AddInterest")
  select.Combo = (UI.getChildControl)(Panel_MentalGame_Select, "Static_Combo")
  select.CircularProgress = (UI.getChildControl)(Panel_MentalGame_Select, "CircularProgress_Progress")
  select.SuccessIcon = (UI.getChildControl)(Panel_MentalGame_Select, "Static_Success")
  select.FailedIcon = (UI.getChildControl)(Panel_MentalGame_Select, "Static_Failed")
  local tooltip = mgUI.tooltip
  tooltip.panel = Panel_MentalGame_Tooltip
  tooltip.background = (UI.getChildControl)(Panel_MentalGame_Tooltip, "Static_Tooltip_BG")
  tooltip.statusBG = (UI.getChildControl)(Panel_MentalGame_Tooltip, "Static_Tooltip_StatusBG")
  tooltip.CommentBG = (UI.getChildControl)(Panel_MentalGame_Tooltip, "Static_Tooltip_CommentBG")
  tooltip.BonusBG = (UI.getChildControl)(Panel_MentalGame_Tooltip, "Static_Tooltip_BonusBG")
  tooltip.npcName = (UI.getChildControl)(Panel_MentalGame_Tooltip, "StaticText_NPC_Name")
  tooltip.background = (UI.getChildControl)(Panel_MentalGame_Tooltip, "Static_Tooltip_BG")
  tooltip.hitBase = (UI.getChildControl)(Panel_MentalGame_Tooltip, "StaticText_Hit_Base")
  tooltip.hitBonus = (UI.getChildControl)(Panel_MentalGame_Tooltip, "StaticText_Hit_Bonus")
  tooltip.ddBase = (UI.getChildControl)(Panel_MentalGame_Tooltip, "StaticText_DD_Base")
  tooltip.ddBonus = (UI.getChildControl)(Panel_MentalGame_Tooltip, "StaticText_DD_Bonus")
  tooltip.comment_1 = (UI.getChildControl)(Panel_MentalGame_Tooltip, "StaticText_Comment_1")
  tooltip.comment_2 = (UI.getChildControl)(Panel_MentalGame_Tooltip, "StaticText_Comment_2")
  tooltip.nextBonus = (UI.getChildControl)(Panel_MentalGame_Tooltip, "StaticText_Bonus")
  local center = mgUI.center
  center.panel = Panel_MentalGame_Center
  center.finishImage = (UI.getChildControl)(Panel_MentalGame_Center, "Static_Finish")
  center.finishText = (UI.getChildControl)(Panel_MentalGame_Center, "StaticText_Finish")
  ;
  (center.finishImage):SetPosX(0)
  ;
  (center.finishText):SetPosX(0)
  ;
  (center.finishImage):SetPosY(getScreenSizeY() / 2 - (center.finishImage):GetSizeY() / 2)
  ;
  (center.finishText):SetPosY(getScreenSizeY() / 2 - (center.finishText):GetSizeY() / 2)
  ;
  (center.finishText):SetSize(getScreenSizeX(), (center.finishText):GetSizeY())
  local right = mgUI.right
  right.panel = Panel_MentalGame_Right
  right.cardIcon = (UI.getChildControl)(Panel_MentalGame_Right, "Static_MentalIcon_C_0")
  right.cardText = (UI.getChildControl)(Panel_MentalGame_Right, "StaticText_MentalTxt_C_0")
  right.cardLeftArrow = (UI.getChildControl)(Panel_MentalGame_Right, "Button_LeftArrow")
  right.cardRightArrow = (UI.getChildControl)(Panel_MentalGame_Right, "Button_RightArrow")
  right.apply = (UI.getChildControl)(Panel_MentalGame_Right, "Button_Apply_New")
  right.interest = (UI.getChildControl)(Panel_MentalGame_Right, "StaticText_Interest")
  local zodiac = mgUI.zodiac
  zodiac.panel = (UI.createOtherPanel)("ZodiacCenterPanel", OPT.OtherPanelType_Wiki)
  zodiac.control = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATIC, zodiac.panel, "ZodiacCenterPanelImage")
  if zodiac.panel ~= nil then
    (zodiac.panel):SetAlpha(0)
    ;
    (zodiac.panel):SetSize(600, 600)
    ;
    (zodiac.panel):Set3DRenderType(3)
    ;
    (zodiac.panel):SetDepth(0)
    ;
    (zodiac.panel):SetIgnore(true)
    ;
    (zodiac.panel):SetShow(false, false)
    ;
    (zodiac.control):SetPosX(0)
    ;
    (zodiac.control):SetPosY(0)
    ;
    (zodiac.control):SetSize(600, 600)
    ;
    (zodiac.control):SetAlpha(1)
    ;
    (zodiac.control):SetVerticalMiddle()
    ;
    (zodiac.control):SetHorizonCenter()
    ;
    (zodiac.control):SetIgnore(true)
    ;
    (zodiac.control):SetShow(true)
  end
  ;
  (select.addInterest):SetShow(false)
  ;
  (left.giftIcon):SetShow(false)
  local UI_TM = CppEnums.TextMode
  ;
  (tooltip.nextBonus):SetTextMode(UI_TM.eTextMode_AutoWrap)
  ;
  (left.gameDesc):SetTextMode(UI_TM.eTextMode_AutoWrap)
  ;
  (left.gameDesc):SetText((left.gameDesc):GetText())
  ;
  (right.cardLeftArrow):SetAutoDisableTime(0)
  ;
  (right.cardRightArrow):SetAutoDisableTime(0)
end

local registEventInit = function()
  -- function num : 0_1 , upvalues : mgUI
  registerEvent("startMentalGame", "MentalGame_Show")
  registerEvent("onScreenResize", "MentalGame_ScreenResize")
  registerEvent("ResponseMentalGame_updateStage", "MentalGame_StateUpdate")
  registerEvent("ResponseMentalGame_tryCard", "MentalGame_tryCard")
  registerEvent("ResponseMentalGame_endStage", "MentalGame_endStage")
  registerEvent("MentalGame_updateMatrix", "MentalGame_updateMatrix")
  registerEvent("EventSelfPlayerPreDead", "MentalGame_HideByDead")
  registerEvent("progressEventCancelByAttacked", "MentalGame_HideByDamage")
  ;
  ((mgUI.left).panel):RegisterUpdateFunc("MentalKnowledge_UpdatePosition")
  ;
  ((mgUI.center).panel):RegisterUpdateFunc("MentalGame_UpdateHideTime")
  ;
  ((mgUI.right).panel):RegisterUpdateFunc("MentalGame_UpdateEndTimer")
  local base = mgUI.base
  ;
  (base.btnGameEnd):addInputEvent("Mouse_LDown", "MentalKnowledge_GameEnd_LClick()")
  ;
  (base.btnTryAgain):addInputEvent("Mouse_LDown", "MentalKnowledge_TryAgain_LClick()")
  local right = mgUI.right
  ;
  (right.cardLeftArrow):addInputEvent("Mouse_LDown", "MentalKnowledge_CardRotation_Left()")
  ;
  (right.cardRightArrow):addInputEvent("Mouse_LDown", "MentalKnowledge_CardRotation_Right()")
  ;
  (right.apply):addInputEvent("Mouse_LDown", "MentalKnowledge_Apply_LClick()")
end

local mentalBaseInit = function()
  -- function num : 0_2
  (MentalKnowledgeBase.init)()
end

local createCenterUI = function()
  -- function num : 0_3 , upvalues : mgUI, centerUiList
  local mentalObject = getMentalgameObject()
  if mentalObject == nil then
    return 
  end
  local createUI = function(key, uiGroup)
    -- function num : 0_3_0 , upvalues : mgUI, mentalObject
    if uiGroup.panel ~= nil then
      return 
    end
    local select = mgUI.select
    local panel = (UI.createPanelAndSetPanelRenderMode)("Panel_MentalGame_Select_" .. tostring(key), (Defines.UIGroup).PAGameUIGroup_QuestLog, PAUIRenderModeBitSet({(Defines.RenderMode).eRenderMode_MentalGame}))
    panel:SetAlpha(1)
    panel:SetSize(10, 10)
    panel:addInputEvent("Mouse_On", "MentalKnowledge_Over(" .. key .. ",true,true)")
    panel:addInputEvent("Mouse_Out", "MentalKnowledge_Over(" .. key .. ",true,false)")
    panel:addInputEvent("Mouse_RUp", "MentalKnowledge_UpdateCenterSlot(" .. key .. ")")
    uiGroup.panel = panel
    panel:SetAlpha(1)
    panel:SetPosX(0)
    panel:SetPosY(0)
    panel:SetIgnore(false)
    panel:SetShow(false, false)
    local circularProgress = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_CIRCULAR_PROGRESS, panel, "CircularProgres_" .. key)
    CopyBaseProperty(select.CircularProgress, circularProgress)
    uiGroup.circularProgress = circularProgress
    circularProgress:ComputePos()
    circularProgress:SetPosX(0)
    circularProgress:SetPosY(0)
    circularProgress:SetShow(true)
    circularProgress:SetCurrentControlPos(0)
    circularProgress:SetProgressRate(0)
    circularProgress:SetSmoothMode(true)
    circularProgress:SetAniSpeed(mentalObject:getMentalGameSpeed() / 2000)
    local SuccessIcon = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATIC, panel, "SuccessIcon_" .. key)
    CopyBaseProperty(select.SuccessIcon, SuccessIcon)
    uiGroup.SuccessIcon = SuccessIcon
    SuccessIcon:ComputePos()
    local FailedIcon = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATIC, panel, "FailedIcon_" .. key)
    CopyBaseProperty(select.FailedIcon, FailedIcon)
    uiGroup.FailedIcon = FailedIcon
    FailedIcon:ComputePos()
  end

  local slotCount = mentalObject:getSlotCount()
  for index = 0, slotCount - 1 do
    -- DECOMPILER ERROR at PC20: Confused about usage of register: R7 in 'UnsetPending'

    if centerUiList[index] == nil then
      centerUiList[index] = {}
    end
    createUI(index, centerUiList[index])
  end
end

local createAnimationUI = function()
  -- function num : 0_4 , upvalues : mgUI, animationUIList
  local select = mgUI.select
  local left = mgUI.left
  local otherControlTextType = (CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATICTEXT
  for from = 0, 19 do
    -- DECOMPILER ERROR at PC17: Confused about usage of register: R7 in 'UnsetPending'

    if animationUIList[from] == nil then
      animationUIList[from] = {}
    end
    for to = from + 1, 19 do
      -- DECOMPILER ERROR at PC30: Confused about usage of register: R11 in 'UnsetPending'

      if (animationUIList[from])[to] == nil then
        (animationUIList[from])[to] = {}
      end
      local targetGroup = (animationUIList[from])[to]
      do
        if targetGroup.panel == nil then
          local target = (UI.createPanelAndSetPanelRenderMode)("MentalGame_Animation_" .. tostring(from) .. "_" .. tostring(to), (Defines.UIGroup).PAGameUIGroup_QuestLog, PAUIRenderModeBitSet({(Defines.RenderMode).eRenderMode_MentalGame}))
          target:SetIgnore(true)
          target:SetShow(false)
          target:SetSpanSize(0, 0)
          target:SetAlpha(1)
          target:ComputePos()
          targetGroup.panel = target
        end
        do
          if targetGroup.pointImage == nil then
            local target = (UI.createControl)(otherControlTextType, targetGroup.panel, "PointImage")
            CopyBaseProperty(select.addInterest, target)
            target:SetIgnore(true)
            target:SetShow(true)
            target:SetAlpha(0.5)
            target:SetFontAlpha(0)
            target:SetSpanSize(0, 0)
            target:ComputePos()
            target:SetHorizonCenter()
            target:SetVerticalMiddle()
            targetGroup.pointImage = target
          end
          do
            if targetGroup.nameTag == nil then
              local nameTag = (UI.createControl)(otherControlTextType, targetGroup.pointImage, "NameTag")
              nameTag:SetIgnore(true)
              nameTag:SetShow(true)
              nameTag:SetSpanSize(0, 30)
              nameTag:SetHorizonCenter()
              nameTag:SetVerticalBottom()
              targetGroup.nameTag = nameTag
            end
            -- DECOMPILER ERROR at PC135: LeaveBlock: unexpected jumping out DO_STMT

            -- DECOMPILER ERROR at PC135: LeaveBlock: unexpected jumping out DO_STMT

          end
        end
      end
    end
  end
end

local createInformationUI = function()
  -- function num : 0_5 , upvalues : mgUI, informationUI
  local select = mgUI.select
  local left = mgUI.left
  local otherControlTextType = (CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATICTEXT
  for from = 0, 19 do
    -- DECOMPILER ERROR at PC17: Confused about usage of register: R7 in 'UnsetPending'

    if informationUI[from] == nil then
      informationUI[from] = {}
    end
    for to = from + 1, 19 do
      -- DECOMPILER ERROR at PC30: Confused about usage of register: R11 in 'UnsetPending'

      if (informationUI[from])[to] == nil then
        (informationUI[from])[to] = {}
      end
      local targetGroup = (informationUI[from])[to]
      do
        if targetGroup.panel == nil then
          local target = (UI.createPanel)("MentalGame_Information_" .. tostring(from) .. "_" .. tostring(to), (Defines.UIGroup).PAGameUIGroup_QuestLog)
          target:SetIgnore(true)
          target:SetShow(false)
          target:SetSpanSize(0, 0)
          target:SetAlpha(1)
          target:ComputePos()
          targetGroup.panel = target
        end
        do
          if targetGroup.pointImage == nil then
            local target = (UI.createControl)(otherControlTextType, targetGroup.panel, "PointImage")
            CopyBaseProperty(select.addInterest, target)
            target:SetIgnore(false)
            target:SetShow(true)
            target:SetAlpha(1)
            target:SetSpanSize(0, 0)
            target:SetFontAlpha(0)
            target:ComputePos()
            target:SetHorizonCenter()
            target:SetVerticalMiddle()
            target:addInputEvent("Mouse_On", "MentalKnowledge_InformationUIFontAlpha(" .. from .. ", " .. to .. ", 1.0,true)")
            target:addInputEvent("Mouse_Out", "MentalKnowledge_InformationUIFontAlpha(" .. from .. ", " .. to .. ", 0.0,true)")
            targetGroup.pointImage = target
          end
          do
            if targetGroup.nameTag == nil then
              local nameTag = (UI.createControl)(otherControlTextType, targetGroup.pointImage, "NameTag")
              nameTag:SetIgnore(true)
              nameTag:SetShow(true)
              nameTag:SetFontAlpha(0)
              nameTag:SetSpanSize(0, 30)
              nameTag:SetHorizonCenter()
              nameTag:SetVerticalBottom()
              targetGroup.nameTag = nameTag
            end
            -- DECOMPILER ERROR at PC149: LeaveBlock: unexpected jumping out DO_STMT

            -- DECOMPILER ERROR at PC149: LeaveBlock: unexpected jumping out DO_STMT

          end
        end
      end
    end
  end
end

local createMouseInputerAndSetting = function()
  -- function num : 0_6 , upvalues : mouseInputer
  mouseInputer = (UI.createPanel)("MentalGame_MouseInputer", (Defines.UIGroup).PAGameUIGroup_ScreenEffect)
  mouseInputer:SetAlpha(0)
  mouseInputer:SetPosX(0)
  mouseInputer:SetPosY(0)
  mouseInputer:SetSize(getScreenSizeX(), getScreenSizeY())
  mouseInputer:addInputEvent("Mouse_LDown", "MentalKnowledge_OnLDown()")
  mouseInputer:addInputEvent("Mouse_LUp", "MentalKnowledge_OnLUp()")
  mouseInputer:addInputEvent("Mouse_RDown", "MentalKnowledge_OnRDown()")
  mouseInputer:addInputEvent("Mouse_RUp", "MentalKnowledge_OnRUp()")
  mouseInputer:addInputEvent("Mouse_UpScroll", "MentalKnowledge_OnWheelUp()")
  mouseInputer:addInputEvent("Mouse_DownScroll", "MentalKnowledge_OnWheelDown()")
  mouseInputer:SetShow(false, false)
end

local init = function()
  -- function num : 0_7 , upvalues : uiInit, registEventInit, mentalBaseInit, createCenterUI, createAnimationUI, createInformationUI, createMouseInputerAndSetting
  uiInit()
  registEventInit()
  mentalBaseInit()
  createCenterUI()
  createAnimationUI()
  createInformationUI()
  createMouseInputerAndSetting()
end

local maxPointUpdate = function()
  -- function num : 0_8 , upvalues : _bestPoint
  local mentalObject = getMentalgameObject()
  if mentalObject == nil then
    return 
  end
  local currentPoint = mentalObject:getInterestValue()
  _bestPoint = (math.max)(_bestPoint, currentPoint)
end

local posUpdateAnimation = function(key, value)
  -- function num : 0_9
  local mentalObject = getMentalgameObject()
  if mentalObject == nil then
    return 
  end
  local basePos = mentalObject:getCardPos()
  local pos = mentalObject:getLerpBySlot(value.startIndex, value.endIndex, (value.deltaTime - value.startTime) / (value.endTime - value.startTime))
  local float3Pos = ((Util.Math).AddVectorToVector)(basePos, pos)
  local transformData = getTransformRevers(float3Pos.x, float3Pos.y, float3Pos.z)
  ;
  (value.ui):SetPosX(transformData.x - (value.ui):GetSizeX() / 2)
  ;
  (value.ui):SetPosY(transformData.y - (value.ui):GetSizeY() / 2)
end

local fontalphaUpdateAnimation = function(key, value)
  -- function num : 0_10
  local playTime = value.endTime - value.startTime
  local halfPlayTime = (value.endTime - value.startTime) / 2
  local inPlayDelta = value.deltaTime - value.startTime
  if value.startTime + halfPlayTime <= value.deltaTime then
    (value.ui):SetFontAlpha((playTime - inPlayDelta) / halfPlayTime)
    ;
    (value.ui):SetAlpha(inPlayDelta / halfPlayTime)
  else
    ;
    (value.ui):SetFontAlpha(inPlayDelta / halfPlayTime)
    ;
    (value.ui):SetAlpha(inPlayDelta / halfPlayTime)
  end
end

local addAnimation = function(ui, startTime, endTime, startIndex, endIndex, animationFunc)
  -- function num : 0_11 , upvalues : animationList, animationIndex
  if endTime <= startTime or ui == nil or endTime <= 0 or animationFunc == nil then
    return 
  end
  -- DECOMPILER ERROR at PC19: Confused about usage of register: R6 in 'UnsetPending'

  animationList[animationIndex] = {ui = ui, startTime = startTime, endTime = endTime, startIndex = startIndex, endIndex = endIndex, deltaTime = 0, animationFunc = animationFunc}
  animationIndex = animationIndex + 1
end

local updateAnimationList = function(deltaTime)
  -- function num : 0_12 , upvalues : animationList
  for key,value in pairs(animationList) do
    value.deltaTime = value.deltaTime + deltaTime
    if value.endTime < value.deltaTime then
      (value.ui):SetShow(false)
      -- DECOMPILER ERROR at PC16: Confused about usage of register: R6 in 'UnsetPending'

      animationList[key] = nil
    else
      if value.startTime <= value.deltaTime then
        (value.animationFunc)(key, value)
        ;
        (value.ui):SetShow(true)
      else
        ;
        (value.ui):SetShow(false)
      end
    end
  end
end

local clearAnimation = function()
  -- function num : 0_13 , upvalues : animationList
  for key,value in pairs(animationList) do
    (value.ui):SetShow(false)
  end
  animationList = {}
end

local createControl = function(panel, fromType, name, targetObject, key)
  -- function num : 0_14 , upvalues : mgUI
  local target = (UI.createControl)(fromType, panel, name .. tostring(key))
  CopyBaseProperty((mgUI.select)[name], target)
  target:SetIgnore(true)
  target:SetShow(true)
  target:ComputePos()
  return target
end

local circleKeyList = {}
local insertCircleLineAndObject = function()
  -- function num : 0_15 , upvalues : circleKeyList, informationUI, constValue
  (MentalKnowledgeBase.init)()
  -- DECOMPILER ERROR at PC4: Confused about usage of register: R0 in 'UnsetPending'

  MentalKnowledgeBase.circleSize = 25
  -- DECOMPILER ERROR at PC12: Confused about usage of register: R0 in 'UnsetPending'

  MentalKnowledgeBase.color = float4(1, 1, 1, 1)
  -- DECOMPILER ERROR at PC14: Confused about usage of register: R0 in 'UnsetPending'

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
    -- DECOMPILER ERROR at PC47: Confused about usage of register: R12 in 'UnsetPending'

    circleKeyList[index] = circleKey
  end
  local lineCount = mentalObject:getLineCount()
  for index = 0, lineCount - 1 do
    local firstIndex = mentalObject:getLineFirst(index)
    local secondIndex = mentalObject:getLineSecond(index)
    ;
    (MentalKnowledgeBase.InsertLineByCircle)(circleKeyList[firstIndex], circleKeyList[secondIndex])
  end
  -- DECOMPILER ERROR at PC70: Confused about usage of register: R6 in 'UnsetPending'

  MentalKnowledgeBase.usingEndArrow = true
  -- DECOMPILER ERROR at PC72: Confused about usage of register: R6 in 'UnsetPending'

  MentalKnowledgeBase.arrowLineWidth = 9
  -- DECOMPILER ERROR at PC74: Confused about usage of register: R6 in 'UnsetPending'

  MentalKnowledgeBase.lineWidth = 20
  -- DECOMPILER ERROR at PC82: Confused about usage of register: R6 in 'UnsetPending'

  MentalKnowledgeBase.color = float4(0.11764705882353, 0.81960784313725, 0.9921568627451, 0.3)
  -- DECOMPILER ERROR at PC90: Confused about usage of register: R6 in 'UnsetPending'

  MentalKnowledgeBase.arrowColor = float4(0.11764705882353, 0.81960784313725, 0.9921568627451, 0.3)
  for srcSlot = 0, orderCount - 2 do
    for dstSlot = srcSlot + 1, orderCount - 1 do
      local srcIndex = mentalObject:getOrder(srcSlot)
      local dstIndex = mentalObject:getOrder(dstSlot)
      if srcIndex ~= -1 and dstIndex ~= -1 then
        local isApplied = mentalObject:isAppliedEffect(srcSlot, dstSlot)
        local panel = ((informationUI[srcSlot])[dstSlot]).panel
        local nameTag = ((informationUI[srcSlot])[dstSlot]).nameTag
        local card = mentalObject:getCardBySlotIndex(srcIndex)
        if isApplied then
          (MentalKnowledgeBase.InsertLineByCircle)(circleKeyList[srcIndex], circleKeyList[dstIndex])
          local inputText = (constValue.buffTypeString)[card:getBuffType()] .. " : " .. card:getVariedValue()
          local pos = mentalObject:getLerpBySlot(srcSlot, dstSlot, 0.5)
          local float3Pos = ((Util.Math).AddVectorToVector)(basePos, pos)
          local transformData = getTransformRevers(float3Pos.x, float3Pos.y, float3Pos.z)
          nameTag:SetText(inputText)
          panel:SetPosX(transformData.x - panel:GetSizeX() / 2)
          panel:SetPosY(transformData.y - panel:GetSizeY() / 2)
          panel:SetShow(true)
        else
          do
            do
              panel:SetShow(false)
              -- DECOMPILER ERROR at PC182: LeaveBlock: unexpected jumping out DO_STMT

              -- DECOMPILER ERROR at PC182: LeaveBlock: unexpected jumping out IF_ELSE_STMT

              -- DECOMPILER ERROR at PC182: LeaveBlock: unexpected jumping out IF_STMT

              -- DECOMPILER ERROR at PC182: LeaveBlock: unexpected jumping out IF_THEN_STMT

              -- DECOMPILER ERROR at PC182: LeaveBlock: unexpected jumping out IF_STMT

            end
          end
        end
      end
    end
  end
  -- DECOMPILER ERROR at PC185: Confused about usage of register: R6 in 'UnsetPending'

  MentalKnowledgeBase.lineWidth = 4
  -- DECOMPILER ERROR at PC187: Confused about usage of register: R6 in 'UnsetPending'

  MentalKnowledgeBase.arrowLineWidth = 4
  -- DECOMPILER ERROR at PC195: Confused about usage of register: R6 in 'UnsetPending'

  MentalKnowledgeBase.color = float4(0.83, 0.79, 0.54, 1)
  -- DECOMPILER ERROR at PC203: Confused about usage of register: R6 in 'UnsetPending'

  MentalKnowledgeBase.arrowColor = float4(0.83, 0.79, 0.54, 1)
  local prevIndex = -1
  for srcIndex = 0, orderCount - 1 do
    if mentalObject:getCardBySlotOrder(srcIndex) ~= nil then
      local currIndex = srcIndex
      if prevIndex > -1 then
        local slotNumberSrc = mentalObject:getOrder(prevIndex)
        local slotNumberDst = mentalObject:getOrder(currIndex)
        ;
        (MentalKnowledgeBase.InsertLineByCircle)(circleKeyList[slotNumberSrc], circleKeyList[slotNumberDst])
      end
      do
        do
          prevIndex = currIndex
          -- DECOMPILER ERROR at PC231: LeaveBlock: unexpected jumping out DO_STMT

          -- DECOMPILER ERROR at PC231: LeaveBlock: unexpected jumping out IF_THEN_STMT

          -- DECOMPILER ERROR at PC231: LeaveBlock: unexpected jumping out IF_STMT

        end
      end
    end
  end
  ;
  (MentalKnowledgeBase.UpdateLineAndCircle)()
end

local removeCircleLineAndObject = function()
  -- function num : 0_16 , upvalues : circleKeyList
  circleKeyList = {}
  ;
  (MentalKnowledgeBase.ClearLineAndCircle)()
end

local insertCircleLine_CardEffect = function()
  -- function num : 0_17
end

local rightCardList = {}
local createControlRight = function(panel, fromType, name, targetObject, key)
  -- function num : 0_18 , upvalues : mgUI
  local target = (UI.createControl)(fromType, panel, name .. tostring(key))
  -- DECOMPILER ERROR at PC11: Confused about usage of register: R6 in 'UnsetPending'

  ;
  (targetObject.ui)[name] = target
  CopyBaseProperty((mgUI.right)[name], target)
  target:SetShow(true)
  target:ComputePos()
  return target
end

local _aControlPos = 0
local _aTextControlPos = 0
local insertCardList = function()
  -- function num : 0_19 , upvalues : mgUI, rightCardList, createControlRight, UCT, UI_color, _aControlPos
  local right = mgUI.right
  local aControl = {}
  local aTextControl = {}
  local index = 0
  local PrePosY = 0
  local mentalObject = getMentalgameObject()
  if mentalObject == nil then
    return 
  end
  local count = mentalObject:getCardCount()
  for index = 0, count - 1 do
    local cardWrapper = mentalObject:getCard(index)
    local gap = (right.cardIcon):GetSizeY() * 13 / 10
    -- DECOMPILER ERROR at PC33: Confused about usage of register: R13 in 'UnsetPending'

    if rightCardList[index] == nil then
      rightCardList[index] = {
ui = {}
}
    end
    -- DECOMPILER ERROR at PC42: Confused about usage of register: R13 in 'UnsetPending'

    if (rightCardList[index]).ui == nil then
      (rightCardList[index]).ui = {}
    end
    if ((rightCardList[index]).ui).cardText == nil then
      aTextControl[index] = createControlRight(right.panel, UCT.PA_UI_CONTROL_STATICTEXT, "cardText", rightCardList[index], index)
      ;
      (aTextControl[index]):SetPosX(index * gap)
      ;
      (aTextControl[index]):SetAutoResize(true)
      ;
      (aTextControl[index]):SetTextMode((CppEnums.TextMode).eTextMode_AutoWrap)
      ;
      (aTextControl[index]):SetText(cardWrapper:getName())
      ;
      (aTextControl[index]):SetVerticalBottom()
      aControl[index] = createControlRight(aTextControl[index], UCT.PA_UI_CONTROL_STATIC, "cardIcon", rightCardList[index], index)
      ;
      (aControl[index]):ChangeTextureInfoName(cardWrapper:getPicture())
      ;
      (aControl[index]):SetVerticalTop()
      ;
      (aControl[index]):SetSpanSize(0, 0 - (aControl[index]):GetSizeY())
      ;
      (aControl[index]):SetIgnore(false)
      ;
      (aControl[index]):addInputEvent("Mouse_LDown", "MentalKnowledge_OnLDown_Card(" .. index .. " )")
      ;
      (aControl[index]):addInputEvent("Mouse_RDown", "MentalKnowledge_OnRDown_Card(" .. index .. " )")
      ;
      (aControl[index]):addInputEvent("Mouse_On", "MentalKnowledge_Over(" .. index .. ",false,true)")
      ;
      (aControl[index]):addInputEvent("Mouse_Out", "MentalKnowledge_Over(" .. index .. ",false,false)")
      if mentalObject:isBanedCard(cardWrapper) or mentalObject:isSelectedCard(cardWrapper) then
        (aControl[index]):SetColor(UI_color.C_FF626262)
      else
        ;
        (aControl[index]):SetColor(UI_color.C_FFFFFFFF)
      end
      ;
      (aControl[index]):SetHorizonCenter()
      _aControlPos = (aControl[index]):GetPosY()
    else
      aControl[index] = ((rightCardList[index]).ui).cardIcon
    end
    if PrePosY < (aTextControl[index]):GetSizeY() then
      PrePosY = (aTextControl[index]):GetSizeY()
    end
  end
  for index = 0, count - 1 do
    (aTextControl[index]):SetSize((aTextControl[index]):GetSizeX(), PrePosY)
    ;
    (aTextControl[index]):ComputePos()
    ;
    (aControl[index]):ComputePos()
  end
end

local updateCardColor = function()
  -- function num : 0_20 , upvalues : rightCardList, UI_color
  local mentalObject = getMentalgameObject()
  if mentalObject == nil then
    return 
  end
  local count = mentalObject:getCardCount()
  for index = 0, count - 1 do
    local cardWrapper = mentalObject:getCard(index)
    if rightCardList[index] ~= nil and (rightCardList[index]).ui ~= nil and ((rightCardList[index]).ui).cardIcon ~= nil then
      local iconUI = ((rightCardList[index]).ui).cardIcon
      if mentalObject:isBanedCard(cardWrapper) or mentalObject:isSelectedCard(cardWrapper) then
        iconUI:SetColor(UI_color.C_FF626262)
      else
        iconUI:SetColor(UI_color.C_FFFFFFFF)
      end
    end
  end
end

local clearCardList = function()
  -- function num : 0_21 , upvalues : mgUI, rightCardList
  local right = mgUI.right
  for _,value in pairs(rightCardList) do
    if value.ui ~= nil and (value.ui).cardText ~= nil then
      (right.panel):RemoveControl((value.ui).cardText)
    end
  end
  rightCardList = {}
end

local updateCenterBackground = function()
  -- function num : 0_22 , upvalues : mgUI
  local mentalObject = getMentalgameObject()
  if mentalObject == nil then
    return 
  end
  local yawpitchroll = mentalObject:getYawPitchRoll()
  ;
  ((mgUI.zodiac).panel):Set3DRotationX(yawpitchroll.x)
  ;
  ((mgUI.zodiac).panel):Set3DRotationY(yawpitchroll.y)
  ;
  ((mgUI.zodiac).panel):Set3DRotationZ(yawpitchroll.z)
  ;
  ((mgUI.zodiac).panel):SetWorldPosX((mentalObject:getCardPos()).x)
  ;
  ((mgUI.zodiac).panel):SetWorldPosY((mentalObject:getCardPos()).y)
  ;
  ((mgUI.zodiac).panel):SetWorldPosZ((mentalObject:getCardPos()).z)
  ;
  ((mgUI.zodiac).control):SetScale(mentalObject:getScale(), mentalObject:getScale())
end

local updateStateUIShow = function()
  -- function num : 0_23 , upvalues : mouseInputer, mgUI, gameStep, gamePlayCount, constValue, UI_ANI_ADV
  if mouseInputer:GetShow() == false then
    return 
  end
  local base = mgUI.base
  local left = mgUI.left
  local center = mgUI.center
  local right = mgUI.right
  if gameStep == 0 then
    (right.panel):SetShow(true, false)
    ;
    (left.fruitage_Add):SetShow(true)
    ;
    (base.comment_1):SetShow(true)
    ;
    (base.comment_Value):SetShow(true)
    ;
    (base.comment_2):SetShow(true)
    ;
    (right.apply):SetShow(false)
    ;
    (right.interest):SetShow(true)
    ;
    (base.btnTryAgain):SetShow(false)
    ;
    (base.tryAgain):SetShow(false)
    ;
    (base.nextSuccess):SetShow(false)
    ;
    (base.nextFail):SetShow(false)
    ;
    (base.btnGameEnd):SetShow(false)
    ;
    (base.gameEnd):SetShow(false)
    ;
    (base.result):SetShow(false)
    ;
    (center.finishText):SetShow(false)
    ;
    (center.finishImage):SetShow(false)
    ;
    (center.panel):SetShow(false)
  else
    if gameStep == 1 then
      (left.fruitage_Add):SetShow(true)
      ;
      (base.comment_1):SetShow(true)
      ;
      (base.comment_Value):SetShow(false)
      ;
      (base.comment_2):SetShow(false)
      ;
      (right.apply):SetShow(true)
      ;
      (right.apply):SetIgnore(false)
      ;
      (right.interest):SetShow(false)
      ;
      (base.btnTryAgain):SetShow(false)
      ;
      (base.tryAgain):SetShow(false)
      ;
      (base.nextSuccess):SetShow(false)
      ;
      (base.nextFail):SetShow(false)
      ;
      (base.btnGameEnd):SetShow(false)
      ;
      (base.gameEnd):SetShow(false)
      ;
      (base.result):SetShow(false)
      ;
      (center.finishText):SetShow(false)
      ;
      (center.finishImage):SetShow(false)
      ;
      (center.panel):SetShow(false)
    else
      if gameStep == 2 then
        (left.fruitage_Add):SetShow(true)
        ;
        (base.comment_1):SetShow(false)
        ;
        (base.comment_Value):SetShow(false)
        ;
        (base.comment_2):SetShow(false)
        ;
        (right.apply):SetShow(false)
        ;
        (right.interest):SetShow(true)
        ;
        (base.btnTryAgain):SetShow(false)
        ;
        (base.tryAgain):SetShow(false)
        ;
        (base.nextSuccess):SetShow(false)
        ;
        (base.nextFail):SetShow(false)
        ;
        (base.btnGameEnd):SetShow(false)
        ;
        (base.gameEnd):SetShow(false)
        ;
        (base.result):SetShow(false)
        ;
        (center.finishText):SetShow(false)
        ;
        (center.finishImage):SetShow(false)
        ;
        (center.panel):SetShow(false)
      else
        if gameStep == 3 then
          local mentalStage = RequestMentalGame_getMentalStage()
          local playableNextGame = gamePlayCount < constValue.maxPlayCount
          ;
          (left.fruitage_Add):SetShow(true)
          ;
          (base.comment_1):SetShow(false)
          ;
          (base.comment_Value):SetShow(false)
          ;
          (base.comment_2):SetShow(false)
          ;
          (right.apply):SetShow(false)
          ;
          (right.interest):SetShow(true)
          ;
          (base.btnTryAgain):SetShow(not mentalStage._isSuccess or playableNextGame)
          ;
          (base.tryAgain):SetShow(not mentalStage._isSuccess or playableNextGame)
          ;
          (base.nextSuccess):SetShow(not mentalStage._isSuccess or playableNextGame)
          ;
          (base.nextFail):SetShow(not mentalStage._isSuccess or playableNextGame)
          ;
          (base.btnGameEnd):SetShow(true)
          ;
          (base.gameEnd):SetShow(true)
          ;
          (base.result):SetShow(true)
          ;
          (center.finishText):SetShow(false)
          ;
          (center.finishImage):SetShow(false)
          ;
          (center.panel):SetShow(false)
        elseif gameStep == 4 then
          (left.panel):SetShow(false)
          ;
          (base.panel):SetShow(false)
          ;
          (center.panel):SetShow(true)
          ;
          (center.finishText):SetShow(true)
          ;
          (center.finishText):SetTextHorizonCenter()
          ;
          (center.finishText):SetTextVerticalCenter()
          ;
          (center.finishImage):SetShow(true)
          local aniInfo1 = (center.finishImage):addScaleAnimation(0, 0.16, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
          aniInfo1:SetStartScale(0.5)
          aniInfo1:SetEndScale(1.15)
          aniInfo1.AxisX = (center.finishImage):GetSizeX() / 2
          aniInfo1.AxisY = (center.finishImage):GetSizeY() / 2
          aniInfo1.ScaleType = 2
          aniInfo1.IsChangeChild = true
          local aniInfo2 = (center.finishImage):addScaleAnimation(0.16, 0.3, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
          aniInfo2:SetStartScale(1.15)
          aniInfo2:SetEndScale(1)
          aniInfo2.AxisX = (center.finishImage):GetSizeX() / 2
          aniInfo2.AxisY = (center.finishImage):GetSizeY() / 2
          aniInfo2.ScaleType = 2
          aniInfo2.IsChangeChild = true
          local aniInfo3 = (center.finishText):addScaleAnimation(0, 0.16, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
          aniInfo3:SetStartScale(0.5)
          aniInfo3:SetEndScale(1.15)
          aniInfo3.AxisX = (center.finishText):GetSizeX() / 2
          aniInfo3.AxisY = (center.finishText):GetSizeY() / 2
          aniInfo3.ScaleType = 2
          aniInfo3.IsChangeChild = true
          local aniInfo4 = (center.finishText):addScaleAnimation(0.16, 0.3, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
          aniInfo4:SetStartScale(1.15)
          aniInfo4:SetEndScale(1)
          aniInfo4.AxisX = (center.finishText):GetSizeX() / 2
          aniInfo4.AxisY = (center.finishText):GetSizeY() / 2
          aniInfo4.ScaleType = 2
          aniInfo4.IsChangeChild = true
        end
      end
    end
  end
  -- DECOMPILER ERROR: 7 unprocessed JMP targets
end

local updateState = function()
  -- function num : 0_24 , upvalues : mgUI, constValue, gameStep, maxPointUpdate, _bestPoint, addIntimacy
  local left = mgUI.left
  local base = mgUI.base
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
  local variedDv = mentalObject:getVariedDv()
  local variedPv = mentalObject:getVariedPv()
  local talker = dialog_getTalker()
  local talkerName = ""
  if talker ~= nil then
    talkerName = talker:getName()
  end
  ;
  (left.npc_Name):SetText(tostring(talkerName))
  if variedDv ~= 0 and variedPv ~= 0 then
    (left.npcDV):SetText((constValue.buffTypeString)[1] .. " : " .. tostring(currentDv) .. " - " .. variedDv)
    ;
    (left.npcPV):SetText((constValue.buffTypeString)[0] .. " : " .. tostring(currentPv) .. " - " .. variedPv)
  else
    if variedDv == 0 and variedPv ~= 0 then
      (left.npcDV):SetText((constValue.buffTypeString)[1] .. " : " .. tostring(currentDv))
      ;
      (left.npcPV):SetText((constValue.buffTypeString)[0] .. " : " .. tostring(currentPv) .. " - " .. variedPv)
    else
      if variedDv ~= 0 and variedPv == 0 then
        (left.npcDV):SetText((constValue.buffTypeString)[1] .. " : " .. tostring(currentDv) .. " - " .. variedDv)
        ;
        (left.npcPV):SetText((constValue.buffTypeString)[0] .. " : " .. tostring(currentPv))
      else
        ;
        (left.npcDV):SetText((constValue.buffTypeString)[1] .. " : " .. tostring(currentDv))
        ;
        (left.npcPV):SetText((constValue.buffTypeString)[0] .. " : " .. tostring(currentPv))
      end
    end
  end
  ;
  (base.condition):SetShow(true)
  ;
  (base.statusBG_4):SetShow(true)
  if gameStep == 3 then
    (base.condition):SetShow(false)
    ;
    (base.statusBG_4):SetShow(false)
  else
    if goaltype == 0 then
      local temp1 = PAGetStringParam1(Defines.StringSheet_GAME, "MENTALGAME_TALKING_FREE", "target", tostring(talkerName))
      ;
      (base.condition):SetText(temp1)
    else
      do
        if goaltype == 1 then
          local temp1 = ""
          if destGoalValue == 1 then
            temp1 = PAGetStringParam1(Defines.StringSheet_GAME, "MENTALGAME_TALKING_INTERESTING", "target", tostring(talkerName))
          else
            temp1 = PAGetStringParam2(Defines.StringSheet_GAME, "MENTALGAME_TALKING_INTERESTING_COMBO", "target", tostring(talkerName), "count", tostring(destGoalValue))
          end
          ;
          (base.condition):SetText(temp1)
        else
          do
            if goaltype == 2 then
              local temp1 = PAGetStringParam2(Defines.StringSheet_GAME, "MENTALGAME_TALKING_ACCUMULATE", "target", tostring(talkerName), "count", tostring(destGoalValue))
              ;
              (base.condition):SetText(temp1)
            else
              do
                if goaltype == 3 then
                  local temp1 = PAGetStringParam2(Defines.StringSheet_GAME, "MENTALGAME_TALKING_MOST", "target", tostring(talkerName), "count", tostring(destGoalValue))
                  ;
                  (base.condition):SetText(temp1)
                else
                  do
                    do
                      if goaltype == 4 then
                        local temp1 = PAGetStringParam2(Defines.StringSheet_GAME, "MENTALGAME_TALKING_FAILED", "target", tostring(talkerName), "count", tostring(destGoalValue))
                        ;
                        (base.condition):SetText(temp1)
                      end
                      do
                        if (base.condition):GetShow() then
                          local leftPos = 0
                          leftPos = (base.condition):GetTextSizeX() + 5
                          leftPos = ((base.panel):GetSizeX() - (leftPos)) / 2
                        end
                        ;
                        (left.comboCount_1):SetPosX((left.comboCount):GetPosX() + (left.comboCount):GetTextSizeX() + 3)
                        ;
                        (left.comboCount_1):SetText(tostring(comboCount))
                        if comboCount > 0 and gameStep == 2 then
                          (left.comboCount_1):ResetVertexAni()
                          ;
                          (left.comboCount_1):SetVertexAniRun("Ani_Color_0", true)
                          ;
                          (left.comboCount_1):SetVertexAniRun("Ani_Color_1", true)
                          ;
                          (left.circle):ResetVertexAni()
                          ;
                          (left.circle):SetPosX((left.comboCount_1):GetPosX() - 3)
                          ;
                          (left.circle):SetPosY((left.comboCount_1):GetPosY() - 3)
                          ;
                          (left.circle2):ResetVertexAni()
                          ;
                          (left.circle2):SetPosX((left.comboCount_1):GetPosX())
                          ;
                          (left.circle2):SetPosY((left.comboCount_1):GetPosY())
                        end
                        maxPointUpdate()
                        local temp1 = PAGetStringParam1(Defines.StringSheet_GAME, "MENTALGAME_TALK_INTERESTING_FAILED", "count", tostring(mentalObject:getFail()))
                        local temp2 = PAGetStringParam1(Defines.StringSheet_GAME, "MENTALGAME_TALK_ACC_INTERESTING", "count", tostring(mentalObject:getTotalInterest()))
                        local temp3 = PAGetStringParam1(Defines.StringSheet_GAME, "MENTALGAME_TALK_MOST_INTERESTING", "count", tostring(_bestPoint))
                        ;
                        (left.failCount):SetText(temp1)
                        ;
                        (left.cumulativePoint):SetText(temp2)
                        ;
                        (left.bestPoint):SetText(temp3)
                        if gameStep == 3 then
                          (base.explain):SetShow(false)
                        else
                          if goaltype == 0 then
                            (base.explain):SetShow(false)
                          else
                            if goaltype == 1 then
                              (base.explain):SetText(PAGetString(Defines.StringSheet_GAME, "MENTALGAME_TALK_TIP1"))
                              ;
                              (base.explain):SetShow(true)
                            else
                              if goaltype == 2 then
                                (base.explain):SetText(PAGetString(Defines.StringSheet_GAME, "MENTALGAME_TALK_TIP2"))
                                ;
                                (base.explain):SetShow(true)
                              else
                                if goaltype == 3 then
                                  (base.explain):SetText(PAGetString(Defines.StringSheet_GAME, "MENTALGAME_TALK_TIP3"))
                                  ;
                                  (base.explain):SetShow(true)
                                else
                                  if goaltype == 4 then
                                    (base.explain):SetText(PAGetString(Defines.StringSheet_GAME, "MENTALGAME_TALK_TIP4"))
                                    ;
                                    (base.explain):SetShow(true)
                                  end
                                end
                              end
                            end
                          end
                        end
                        local sizeX = (math.max)((base.explain):GetTextSizeX(), (base.condition):GetTextSizeX()) + 40
                        ;
                        (base.statusBG_4):SetSize(sizeX, (base.statusBG_4):GetSizeY())
                        ;
                        (base.statusBG_4):SetPosX(base.bgPosX + (base.bgSizeX - sizeX) / 2)
                        local talker = dialog_getTalker()
                        local intimacy = 0
                        if talker ~= nil then
                          intimacy = talker:getIntimacy()
                        end
                        ;
                        (left.fruitage_Value):SetText(tostring(intimacy))
                        local valuePercent = intimacy / constValue.interestValueMax * 100
                        if valuePercent > 100 then
                          valuePercent = 100
                        end
                        ;
                        (left.prograss_Success):SetProgressRate(valuePercent)
                        valuePercent = (intimacy + addIntimacy) / constValue.interestValueMax * 100
                        if valuePercent > 100 then
                          valuePercent = 100
                        end
                        ;
                        (left.prograss_Current):SetProgressRate(valuePercent)
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

local updateTooltipContext = function(mentalCard, isInserted, slotIndex)
  -- function num : 0_25 , upvalues : constValue, mgUI
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
  if _mentalCard:isBuff() then
    if _mentalCard:getApplyTurn() == 0 then
      if _mentalCard:getBuffType() < 2 then
        buffText = PAGetStringParam3(Defines.StringSheet_GAME, "MENTALGAME_BUFF_MESSAGE_1_UP", "buff", (constValue.buffTypeString)[_mentalCard:getBuffType()], "turn", tostring(_mentalCard:getValidTurn()), "value", tostring(_mentalCard:getVariedValue()))
      else
        buffText = PAGetStringParam3(Defines.StringSheet_GAME, "MENTALGAME_BUFF_MESSAGE_1_DOWN", "buff", (constValue.buffTypeString)[_mentalCard:getBuffType()], "turn", tostring(_mentalCard:getValidTurn()), "value", tostring(_mentalCard:getVariedValue()))
      end
    else
      if _mentalCard:getBuffType() < 2 then
        buffText = PAGetStringParam4(Defines.StringSheet_GAME, "MENTALGAME_BUFF_MESSAGE_ANY_UP", "count", tostring(_mentalCard:getApplyTurn() + 1), "buff", (constValue.buffTypeString)[_mentalCard:getBuffType()], "turn", tostring(_mentalCard:getValidTurn()), "value", tostring(_mentalCard:getVariedValue()))
      else
        buffText = PAGetStringParam4(Defines.StringSheet_GAME, "MENTALGAME_BUFF_MESSAGE_ANY_DOWN", "count", tostring(_mentalCard:getApplyTurn() + 1), "buff", (constValue.buffTypeString)[_mentalCard:getBuffType()], "turn", tostring(_mentalCard:getValidTurn()), "value", tostring(_mentalCard:getVariedValue()))
      end
    end
  end
  local overKey_StaticKey = _mentalCard:getKey()
  local overKeyIndex = -1
  for index = 0, constValue.slotCountMax - 1 do
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
    local tooltip = mgUI.tooltip
    ;
    (tooltip.hitBase):SetText((constValue.buffTypeString)[1] .. " : " .. mentalCard:getHit())
    ;
    (tooltip.ddBase):SetText((constValue.buffTypeString)[0] .. " : " .. mentalCard:getMinDD() .. " ~ " .. mentalCard:getMaxDD())
    ;
    (tooltip.npcName):SetText(mentalCard:getName())
    local temp1 = PAGetStringParam2(Defines.StringSheet_GAME, "MENTALGAME_TOOLTIP_CAUSE_INTERESTING", "hit", tostring(objectHit), "percent", (string.format)("%.0f", maxHitPercent))
    local temp2 = PAGetStringParam2(Defines.StringSheet_GAME, "MENTALGAME_TOOLTIP_FAVOR", "min", tostring(minDamage), "max", tostring(maxDamage))
    ;
    (tooltip.comment_1):SetText(temp1)
    ;
    (tooltip.comment_2):SetText(temp2)
    local hitBonusText = ""
    local ddBonusText = ""
    local valueText = ""
    if isInserted then
      local startIndex = mentalObject:getBuffStartIndex(slotIndex, 0)
      for index = startIndex, slotIndex - 1 do
        local value = mentalObject:getBuffValue(R25_PC272)
        if value > 0 then
          valueText = " +" .. R25_PC272
        else
          -- DECOMPILER ERROR at PC284: Overwrote pending register: R25 in 'AssignReg'

          if value < 0 then
            valueText = " " .. R25_PC272
          else
            valueText = ""
          end
        end
        -- DECOMPILER ERROR at PC291: Overwrote pending register: R25 in 'AssignReg'

        ddBonusText = ddBonusText .. R25_PC272
      end
      local startIndex = mentalObject:getBuffStartIndex(slotIndex, 1)
      for index = startIndex, slotIndex - 1 do
        -- DECOMPILER ERROR at PC302: Overwrote pending register: R25 in 'AssignReg'

        local value = mentalObject:getBuffValue(index)
        -- DECOMPILER ERROR at PC307: Overwrote pending register: R25 in 'AssignReg'

        if value > 0 then
          valueText = R25_PC272 .. tostring(value)
        else
          -- DECOMPILER ERROR at PC315: Overwrote pending register: R25 in 'AssignReg'

          if value < 0 then
            valueText = R25_PC272 .. tostring(value)
          else
            valueText = ""
          end
        end
        -- DECOMPILER ERROR at PC322: Overwrote pending register: R25 in 'AssignReg'

        hitBonusText = R25_PC272 .. valueText
      end
    end
    do
      ;
      (tooltip.nextBonus):SetText(buffText)
      ;
      (tooltip.hitBonus):SetText(hitBonusText)
      ;
      (tooltip.ddBonus):SetText(ddBonusText)
      ;
      (tooltip.hitBonus):SetPosX((tooltip.hitBase):GetPosX() + (tooltip.hitBase):GetSizeX() + (tooltip.hitBase):GetTextSizeX() + 5)
      ;
      (tooltip.ddBonus):SetPosX((tooltip.ddBase):GetPosX() + (tooltip.ddBase):GetSizeX() + (tooltip.ddBase):GetTextSizeX() + 5)
      return true
    end
  end
end

local updateCardScrollButton = function()
  -- function num : 0_26 , upvalues : mgUI, scrollPositionResult
  local right = mgUI.right
  local mentalObject = getMentalgameObject()
  if mentalObject == nil then
    return 
  end
  local maxValue = mentalObject:getCardCount() - 5
  do
    local totalCard = mentalObject:getCardCount()
    if totalCard <= 4 then
      (right.cardLeftArrow):SetShow(false)
      ;
      (right.cardRightArrow):SetShow(false)
      return 
    end
    ;
    (right.cardLeftArrow):SetShow(scrollPositionResult < maxValue)
    ;
    (right.cardRightArrow):SetShow(scrollPositionResult > 0)
    -- DECOMPILER ERROR: 2 unprocessed JMP targets
  end
end

local endUIProcessMentalOnly = function(isDead)
  -- function num : 0_27 , upvalues : centerUiList, informationUI, clearCardList, clearAnimation, mentalBaseInit, removeCircleLineAndObject, prevDragImageSizeX, prevDragImageSizeY, mouseInputer, mgUI
  if isShow_MentalGame() == false then
    return false
  end
  for key,value in pairs(centerUiList) do
    if value.panel ~= nil then
      (value.panel):SetShow(false, false)
      ;
      (value.panel):SetPosX(-1000)
      ;
      (value.panel):SetPosY(-1000)
    end
  end
  for _,value in pairs(informationUI) do
    for _,value2 in pairs(value) do
      (value2.panel):SetShow(false)
    end
  end
  clearCardList()
  clearAnimation()
  mentalBaseInit()
  removeCircleLineAndObject()
  hide_MentalGame(isDead)
  DragManager:setDragImageSize(prevDragImageSizeX, prevDragImageSizeY)
  DragManager:clearInfo()
  mouseInputer:SetShow(false, false)
  for _,value in pairs(mgUI) do
    if value.panel ~= nil then
      (value.panel):SetShow(false, false)
    end
  end
  RequestMentalGame_endGame()
  return true
end

local endUIProcess = function()
  -- function num : 0_28 , upvalues : renderMode, endUIProcessMentalOnly
  renderMode:reset()
  SetUIMode((Defines.UIMode).eUIMode_NpcDialog)
  local isClose = endUIProcessMentalOnly(false)
  if isClose == false then
    return 
  end
  FromClient_ShowDialog()
end

MentalGame_Hide = function()
  -- function num : 0_29 , upvalues : endUIProcess
  endUIProcess()
end

MentalGame_HideByDamage = function()
  -- function num : 0_30 , upvalues : endUIProcessMentalOnly, renderMode, mouseInputer
  local isClose = endUIProcessMentalOnly(false)
  if isClose == false then
    return 
  end
  SetUIMode((Defines.UIMode).eUIMode_Default)
  renderMode:reset()
  ;
  (UI.Set_ProcessorInputMode)((CppEnums.EProcessorInputMode).eProcessorInputMode_GameMode)
  Panel_Npc_Dialog:SetShow(true)
  dialog_CloseNpcTalk(true)
  setShowNpcDialog(false)
  setShowLine(true)
  ToClient_PopDialogueFlush()
  mouseInputer:SetAlpha(0)
end

MentalGame_HideByDead = function()
  -- function num : 0_31 , upvalues : endUIProcessMentalOnly
  local isClose = endUIProcessMentalOnly(true)
end

local gameStartInit = function()
  -- function num : 0_32 , upvalues : _bestPoint, scrollPositionResult, scrollPosition, gamePlayCount, mouseInputer, mgUI, prevDragImageSizeX, prevDragImageSizeY, centerUiList, updateCardScrollButton
  _bestPoint = 0
  scrollPositionResult = 0
  scrollPosition = -5
  nonSelectPlayAlpha = 0.3
  gamePlayCount = gamePlayCount + 1
  mouseInputer:SetShow(true, false)
  ;
  ((mgUI.zodiac).panel):SetShow(true, false)
  prevDragImageSizeX = DragManager:getDragImageSize()
  DragManager:setDragImageSize(80, 80)
  local mentalObject = getMentalgameObject()
  if mentalObject == nil then
    return 
  end
  local zodiacStaticStatusWrapper = mentalObject:getZodiacStaticStatusWrapper()
  if zodiacStaticStatusWrapper ~= nil then
    ((mgUI.zodiac).control):ChangeTextureInfoName(zodiacStaticStatusWrapper:getZodiacImagePath())
  end
  for key,value in pairs(centerUiList) do
    (value.circularProgress):SetCurrentControlPos(0)
    ;
    (value.circularProgress):SetProgressRate(0)
    ;
    (value.SuccessIcon):ResetVertexAni()
    ;
    (value.SuccessIcon):SetShow(false)
    ;
    (value.FailedIcon):ResetVertexAni()
    ;
    (value.FailedIcon):SetShow(false)
  end
  updateCardScrollButton()
end

local uv = {
{_fileName = "New_UI_Common_forLua/Widget/HumanRelations/Compensation_00.dds", x1 = 62, y1 = 1, x2 = 122, y2 = 61}
, 
{_fileName = "New_UI_Common_forLua/Widget/HumanRelations/Compensation_00.dds", x1 = 62, y1 = 62, x2 = 122, y2 = 122}
, 
{_fileName = "New_UI_Common_forLua/Widget/HumanRelations/Compensation_00.dds", x1 = 1, y1 = 62, x2 = 61, y2 = 122}
, 
{_fileName = "New_UI_Common_forLua/Widget/HumanRelations/Compensation_00.dds", x1 = 62, y1 = 62, x2 = 122, y2 = 122}
, 
{_fileName = "New_UI_Common_forLua/Widget/HumanRelations/Compensation_02.dds", x1 = 1, y1 = 1, x2 = 61, y2 = 61}
; 
[0] = {_fileName = "New_UI_Common_forLua/Widget/HumanRelations/Compensation_00.dds", x1 = 1, y1 = 1, x2 = 61, y2 = 61}
}
local hasMentalCardText = PAGetString(Defines.StringSheet_GAME, "LUA_INTIMACY_INFORMATION_HASMENTALCARD")
local hasntMentalCardText = PAGetString(Defines.StringSheet_GAME, "LUA_INTIMACY_INFORMATION_HASNTMENTALCARD")
local operatorString = {[(CppEnums.DlgCommonConditionOperatorType).Equal] = "", [(CppEnums.DlgCommonConditionOperatorType).Large] = "<PAColor0xFFFF0000>â–\178<PAOldColor>", [(CppEnums.DlgCommonConditionOperatorType).Small] = "<PAColor0xFF0000FF>â–\188<PAOldColor>"}
local giftIconInit = function()
  -- function num : 0_33 , upvalues : mgUI, giftIcon, hasMentalCardText, hasntMentalCardText, operatorString, _math_AddVectorToVector, _math_MulNumberToVector, UCT, uv
  local left = mgUI.left
  local talker = dialog_getTalker()
  if talker == nil then
    return 
  end
  local characterKey = talker:getCharacterKey()
  local count = getIntimacyInformationCount(characterKey)
  local colorKey = float4(1, 1, 1, 1)
  local startSize = 28
  local endSize = ((left.progressBG):GetSizeX() + (left.giftIcon):GetSizeX()) / 2
  local centerPosition = float3((left.progressBG):GetPosX() + (left.progressBG):GetSizeX() / 2, (left.progressBG):GetPosY() + (left.progressBG):GetSizeY() / 2, 0)
  for index,value in pairs(giftIcon) do
    (UI.deleteControl)(value)
  end
  giftIcon = {}
  for index = 0, count - 1 do
    local intimacyInformationData = getIntimacyInformation(characterKey, index)
    local percent = intimacyInformationData:getIntimacy() / 1000
    local imageType = intimacyInformationData:getTypeIndex()
    local giftName = intimacyInformationData:getTypeName()
    local giftDesc = intimacyInformationData:getTypeDescription()
    local giftMentalCardWrapper = ToClinet_getMentalCardStaticStatus(intimacyInformationData:getMentalCardKeyRaw())
    local giftOperator = intimacyInformationData:getOperatorType()
    if giftMentalCardWrapper ~= nil then
      if giftMentalCardWrapper:isHasCard() then
        giftDesc = giftDesc .. hasMentalCardText
      else
        giftDesc = giftDesc .. hasntMentalCardText
      end
    end
    giftDesc = giftDesc .. "(" .. operatorString[giftOperator] .. " " .. percent * 1000 .. ")"
    local imageFileName = ""
    if percent >= 0 and percent <= 1 and ToClient_checkIntimacyInformationFixedState(intimacyInformationData) then
      local angle = math.pi * 2 * percent
      local lineStart = float3((math.sin)(angle), -(math.cos)(angle), 0)
      local lineEnd = float3((math.sin)(angle), -(math.cos)(angle), 0)
      lineStart = _math_AddVectorToVector(centerPosition, _math_MulNumberToVector(lineStart, startSize))
      lineEnd = _math_AddVectorToVector(centerPosition, _math_MulNumberToVector(lineEnd, endSize))
      local target = giftIcon[index]
      if target == nil then
        target = (UI.createControl)(UCT.PA_UI_CONTROL_STATIC, left.panel, "GiftIcon_" .. tostring(index))
        -- DECOMPILER ERROR at PC173: Confused about usage of register: R24 in 'UnsetPending'

        giftIcon[index] = target
        CopyBaseProperty(left.giftIcon, target)
      end
      target:SetShow(true)
      target:ChangeTextureInfoName((uv[imageType])._fileName)
      local x1, y1, x2, y2 = setTextureUV_Func(target, (uv[imageType]).x1, (uv[imageType]).y1, (uv[imageType]).x2, (uv[imageType]).y2)
      ;
      (target:getBaseTexture()):setUV(x1, y1, x2, y2)
      target:setRenderTexture(target:getBaseTexture())
      target:SetPosX(lineEnd.x - target:GetSizeX() / 2)
      target:SetPosY(lineEnd.y - target:GetSizeY() / 2)
      target:addInputEvent("Mouse_On", "FruitageGift_ShowTooltip(\"" .. giftName .. "\", \"" .. giftDesc .. "\", " .. target:GetPosX() .. ", " .. target:GetPosY() .. ")")
      target:addInputEvent("Mouse_Out", "FruitageGift_HideTooltip()")
    end
  end
end

MentalGame_Show = function()
  -- function num : 0_34 , upvalues : mentalGame_End, mgUI, renderMode, gameStep, gamePlayCount, addIntimacy, gameStartInit, insertCircleLineAndObject, insertCardList, giftIconInit
  ToClient_SaveUiInfo(false)
  if GetUIMode() ~= (Defines.UIMode).eUIMode_NpcDialog then
    return 
  end
  SetUIMode((Defines.UIMode).eUIMode_MentalGame)
  mentalGame_End = false
  if ((mgUI.left).panel):GetShow() then
    return 
  end
  renderMode:set()
  ;
  ((mgUI.left).panel):SetShow(true, false)
  ;
  ((mgUI.base).panel):SetShow(true, false)
  ;
  ((mgUI.right).panel):SetShow(true, false)
  ;
  ((mgUI.zodiac).panel):SetShow(true, false)
  Panel_Window_WorkerRandomSelect:SetShow(false, false)
  FGlobal_ShowRewardList(false)
  Panel_Npc_Dialog:SetShow(false, false)
  Panel_Dialogue_Itemtake:SetShow(false)
  HandleMLUp_SkillWindow_Close(true)
  NpcShop_WindowClose()
  ;
  ((mgUI.left).panel):SetShow(true, false)
  local isSuccess = show_MentalGame()
  if isSuccess == false then
    local selfProxy = (getSelfPlayer()):get()
    local selfPosition = selfProxy:getCameraTargetPos()
    gameStep = 0
    gamePlayCount = 0
    addIntimacy = 0
    ;
    ((mgUI.left).fruitage_Add):SetText("+0")
    gameStartInit()
    insertCircleLineAndObject()
    insertCardList()
    giftIconInit()
    local mentalObject = getMentalgameObject()
    if mentalObject == nil then
      return 
    end
    mentalObject:scaling(-0.2)
  end
end

MentalGame_ScreenResize = function()
  -- function num : 0_35 , upvalues : mgUI
  local sizeX = getScreenSizeX()
  local sizeY = getScreenSizeY()
  local leftPanel = (mgUI.left).panel
  local centerPanel = (mgUI.center).panel
  local basePanel = (mgUI.base).panel
  local emptySize = sizeX - leftPanel:GetSizeX() - basePanel:GetSizeX()
  leftPanel:SetPosX(emptySize * 17 / 27)
  basePanel:SetPosX(emptySize * 20 / 27 + leftPanel:GetSizeX())
  centerPanel:SetPosX(0)
  centerPanel:SetPosY(0)
  centerPanel:SetSize(sizeX, sizeY)
  ;
  ((mgUI.center).finishImage):SetSize(sizeX, ((mgUI.center).finishImage):GetSizeY())
  ;
  ((mgUI.center).finishText):SetSize(sizeX, ((mgUI.center).finishText):GetSizeY())
  ;
  ((mgUI.center).finishImage):ComputePos()
  ;
  ((mgUI.center).finishText):ComputePos()
end

local updateRotateProcess = function(deltaTime)
  -- function num : 0_36 , upvalues : isRdown, rMovePos, updateCenterBackground
  if isRdown == false then
    return 
  end
  local currPos = {x = getMousePosX(), y = getMousePosY()}
  if currPos.x == rMovePos.x and currPos.y == rMovePos.y then
    return 
  end
  local mentalObject = getMentalgameObject()
  if mentalObject == nil then
    return 
  end
  local diffPos = {x = (currPos.x - rMovePos.x) / getScreenSizeX(), y = (currPos.y - rMovePos.y) / getScreenSizeY()}
  mentalObject:rotate(diffPos.x * -3, diffPos.y * -3)
  updateCenterBackground()
  rMovePos = currPos
end

local updateCenterUIPos = function(deltaTime)
  -- function num : 0_37 , upvalues : centerUiList
  local mentalObject = getMentalgameObject()
  if mentalObject == nil then
    return 
  end
  local basePos = mentalObject:getCardPos()
  local count = mentalObject:getPointCount()
  for index = 0, count - 1 do
    local starPos = mentalObject:getPoint(index)
    local float3Pos = ((Util.Math).AddVectorToVector)(basePos, starPos)
    local panel = (centerUiList[index]).panel
    local progress = (centerUiList[index]).circularProgress
    local transformData = getTransformRevers(float3Pos.x, float3Pos.y, float3Pos.z)
    if transformData.x > -1 and transformData.y > -1 then
      local cameraDistance = distanceFromCamera(float3Pos.x, float3Pos.y, float3Pos.z)
      local scaleSize = 100000 / cameraDistance * 0.85
      panel:SetSize(scaleSize, scaleSize)
      progress:ComputePos()
      panel:SetPosX(transformData.x - panel:GetSizeX() / 2)
      panel:SetPosY(transformData.y - panel:GetSizeY() / 2)
      panel:SetAlpha(1)
      panel:SetDepth(cameraDistance)
    end
  end
end

local updateRightUIPos = function(deltaTime, forceRun)
  -- function num : 0_38 , upvalues : scrollPositionResult, scrollPosition, gameStep, mgUI, rightCardList
  local diff = scrollPositionResult - scrollPosition
  if gameStep >= 2 then
    return 
  end
  if diff == 0 and forceRun == false then
    return 
  end
  local mentalObject = getMentalgameObject()
  if mentalObject == nil then
    return 
  end
  scrollPosition = scrollPosition + diff * (math.min)(deltaTime * 8, 1)
  if (math.abs)(scrollPositionResult - scrollPosition) < 0.05 then
    scrollPosition = scrollPositionResult
  end
  local right = mgUI.right
  local isIgnore = scrollPosition ~= scrollPositionResult
  for index,value in pairs(rightCardList) do
    if value.ui ~= nil and (value.ui).cardText ~= nil then
      ((value.ui).cardIcon):SetIgnore(isIgnore)
      local posIndex = index - scrollPosition
      local position = mentalObject:getCirclePosition(float2(((right.cardLeftArrow):GetPosX() + (right.cardRightArrow):GetPosX() + ((right.cardLeftArrow):GetSizeX() + (right.cardRightArrow):GetSizeX()) / 2) / 2, (right.cardLeftArrow):GetPosY() + (right.cardLeftArrow):GetSizeY() / 2 + 320), 400, posIndex - 2)
      ;
      ((value.ui).cardText):SetPosX(position.x - ((value.ui).cardText):GetSizeX() / 2)
      ;
      ((value.ui).cardText):SetPosY(position.y - ((value.ui).cardText):GetSizeY() / 2)
      if posIndex >= -0.25 and posIndex <= 4.25 then
        ((value.ui).cardText):SetShow(true)
        ;
        ((value.ui).cardText):SetAlphaExtraChild(1)
      elseif posIndex >= -0.75 and posIndex < -0.25 then
        ((value.ui).cardText):SetShow(true)
        ;
        ((value.ui).cardText):SetAlphaExtraChild((posIndex + 0.75) * 2)
      elseif posIndex > 4.25 and posIndex <= 4.75 then
        ((value.ui).cardText):SetShow(true)
        ;
        ((value.ui).cardText):SetAlphaExtraChild((4.75 - posIndex) * 2)
      else
        ((value.ui).cardText):SetShow(false)
      end
    end
  end
  -- DECOMPILER ERROR: 5 unprocessed JMP targets
end

MentalKnowledge_UpdatePosition = function(deltaTime)
  -- function num : 0_39 , upvalues : updateCenterUIPos, updateRotateProcess, updateAnimationList, updateCenterBackground, updateRightUIPos
  updateCenterUIPos(deltaTime)
  updateRotateProcess(deltaTime)
  updateAnimationList(deltaTime)
  updateCenterBackground(deltaTime)
  updateRightUIPos(deltaTime, false)
end

local selectCardReset = function()
  -- function num : 0_40 , upvalues : selectCardIndex
  selectCardIndex = -1
  DragManager:clearInfo()
end

MentalKnowledge_CardRotation_Left = function()
  -- function num : 0_41 , upvalues : scrollPositionResult, updateCardScrollButton
  local mentalObject = getMentalgameObject()
  if mentalObject == nil then
    return 
  end
  local maxValue = mentalObject:getCardCount() - 5
  scrollPositionResult = (math.min)(scrollPositionResult + 5, maxValue)
  updateCardScrollButton()
end

MentalKnowledge_CardRotation_Right = function()
  -- function num : 0_42 , upvalues : mgUI, scrollPositionResult, updateCardScrollButton
  local right = mgUI.right
  local mentalObject = getMentalgameObject()
  if mentalObject == nil then
    return 
  end
  local totalCard = mentalObject:getCardCount()
  scrollPositionResult = (math.max)(scrollPositionResult - 5, 0)
  updateCardScrollButton()
end

MentalKnowledge_OnLDown_Card = function(cardIndex)
  -- function num : 0_43 , upvalues : selectCardIndex
  local mentalObject = getMentalgameObject()
  if mentalObject == nil then
    return 
  end
  local cardWrapper = mentalObject:getCard(cardIndex)
  if cardWrapper == nil then
    return 
  end
  if mentalObject:isSelectedCard(cardWrapper) == true then
    return 
  end
  selectCardIndex = cardIndex
  DragManager:setDragInfo(nil, nil, cardIndex, (cardWrapper:getPicture()), nil, nil)
end

MentalKnowledge_OnRDown_Card = function(cardIndex)
  -- function num : 0_44 , upvalues : gameStep, selectCardIndex
  local mentalObject = getMentalgameObject()
  if mentalObject == nil then
    return 
  end
  if cardIndex < mentalObject:getCardCount() then
    if gameStep < 2 then
      local value = mentalObject:getCard(cardIndex)
      if value ~= nil then
        local staticKey = (value:getStaticStatus()):getKey()
        if mentalObject:isSelectedCard(value) == false then
          RequestMentalGame_selectCardByKey(staticKey, 99)
          audioPostEvent_SystemUi(0, 2)
        end
      end
    end
    do
      selectCardIndex = -1
      DragManager:clearInfo()
    end
  end
end

MentalKnowledge_OnLDown = function()
  -- function num : 0_45 , upvalues : selectCardReset
  selectCardReset()
end

MentalKnowledge_OnLUp = function()
  -- function num : 0_46 , upvalues : selectCardReset
  selectCardReset()
end

MentalKnowledge_OnRDown = function()
  -- function num : 0_47 , upvalues : isRdown, rMovePos, selectCardReset
  isRdown = true
  rMovePos = {x = getMousePosX(), y = getMousePosY()}
  selectCardReset()
end

MentalKnowledge_OnRUp = function()
  -- function num : 0_48 , upvalues : isRdown, selectCardReset
  isRdown = false
  selectCardReset()
end

MentalKnowledge_OnWheelUp = function()
  -- function num : 0_49
  local mentalObject = getMentalgameObject()
  if mentalObject == nil then
    return 
  end
  mentalObject:scaling(0.1)
end

MentalKnowledge_OnWheelDown = function()
  -- function num : 0_50
  local mentalObject = getMentalgameObject()
  if mentalObject == nil then
    return 
  end
  mentalObject:scaling(-0.1)
end

local overKey = -1
MentalKnowledge_Over = function(mouseOverKey, isInserted, isShow)
  -- function num : 0_51 , upvalues : mgUI, gameStep, overKey, updateTooltipContext, centerUiList, rightCardList
  local tooltip = mgUI.tooltip
  local mentalObject = getMentalgameObject()
  if mentalObject == nil then
    return 
  end
  -- DECOMPILER ERROR at PC19: Unhandled construct in 'MakeBoolean' P1

  -- DECOMPILER ERROR at PC19: Unhandled construct in 'MakeBoolean' P1

  if gameStep < 2 and mouseOverKey == overKey and isShow == false then
    (tooltip.panel):SetShow(false, false)
    overKey = -1
  end
  if isShow then
    local targetUI = nil
    local isSuccess = true
    if isInserted then
      isSuccess = updateTooltipContext(mentalObject:getCardBySlotIndex(mouseOverKey), isInserted, mouseOverKey)
      uiGroup = centerUiList[mouseOverKey]
      if centerUiList[mouseOverKey] ~= nil then
        targetUI = (centerUiList[mouseOverKey]).panel
      end
    else
      isSuccess = updateTooltipContext(mentalObject:getCard(mouseOverKey), isInserted, mouseOverKey)
      if rightCardList[mouseOverKey] ~= nil and (rightCardList[mouseOverKey]).ui ~= nil then
        targetUI = ((rightCardList[mouseOverKey]).ui).cardIcon
      end
    end
    if isSuccess then
      (tooltip.panel):SetShow(true, false)
      overKey = mouseOverKey
      if targetUI ~= nil then
        (tooltip.panel):SetPosX(targetUI:GetParentPosX() - ((tooltip.panel):GetSizeX() - 40))
        ;
        (tooltip.panel):SetPosY((math.max)(0, targetUI:GetParentPosY() - ((tooltip.panel):GetSizeY() - 50)))
      end
    end
  end
end

MentalKnowledge_UpdateCenterSlot = function(key)
  -- function num : 0_52 , upvalues : selectCardIndex
  local mentalObject = getMentalgameObject()
  if mentalObject == nil then
    return 
  end
  local value = mentalObject:getCard(selectCardIndex)
  if selectCardIndex < mentalObject:getCardCount() and value ~= nil then
    if mentalObject:isSelectedCard(value) == false then
      audioPostEvent_SystemUi(0, 2)
    end
    RequestMentalGame_clearSelectCard(key)
    local staticKey = (value:getStaticStatus()):getKey()
    RequestMentalGame_selectCardByKey(staticKey, key)
    selectCardIndex = -1
    DragManager:clearInfo()
  else
    do
      RequestMentalGame_clearSelectCard(key)
      MentalKnowledge_Over(key, true, false)
      if mentalObject:getCardBySlotIndex(key) ~= nil then
        audioPostEvent_SystemUi(0, 2)
      end
    end
  end
end

MentalKnowledge_InsertCard = function(key)
  -- function num : 0_53 , upvalues : selectCardIndex, gameStep
  local mentalObject = getMentalgameObject()
  if mentalObject == nil then
    return 
  end
  if selectCardIndex < mentalObject:getCardCount() then
    if gameStep < 2 then
      local value = mentalObject:getCard(selectCardIndex)
      if value ~= nil then
        local staticKey = (value:getStaticStatus()):getKey()
        RequestMentalGame_selectCardByKey(staticKey, 99)
      end
    end
    do
      selectCardIndex = -1
      DragManager:clearInfo()
    end
  end
end

MentalKnowledge_ClearCard = function(key)
  -- function num : 0_54
  RequestMentalGame_clearSelectCard(key)
  MentalKnowledge_Over(key, true, false)
end

MentalKnowledge_Apply_LClick = function()
  -- function num : 0_55 , upvalues : centerUiList, mgUI
  local mentalObject = getMentalgameObject()
  if mentalObject == nil then
    return 
  end
  RequestMentalGame_startCard()
  DragManager:clearInfo()
  ;
  ((centerUiList[mentalObject:getOrder(0)]).circularProgress):SetProgressRate(100)
  local right = mgUI.right
  ;
  (right.apply):SetShow(false)
end

MentalKnowledge_GameEnd_LClick = function()
  -- function num : 0_56 , upvalues : endUIProcess, gameStep, updateStateUIShow, hideDeltaTime, endTimechk, addIntimacy, mgUI, mentalGame_End
  RequestMentalGame_endGame()
  local mentalStage = RequestMentalGame_getMentalStage()
  if mentalStage._isSuccess == false then
    endUIProcess()
    return 
  end
  gameStep = 4
  updateStateUIShow()
  hideDeltaTime = 0
  endTimechk = 0
  local talker = dialog_getTalker()
  local intimacy = 0
  if talker ~= nil then
    intimacy = talker:getIntimacy()
  end
  local addIntimacyValue = addIntimacy
  local resultIntimacy = intimacy + addIntimacyValue
  local center = mgUI.center
  local tempString = PAGetStringParam2(Defines.StringSheet_GAME, "MENTALGAME_AQUIRE_INTIMACY_POINT", "result", tostring(resultIntimacy), "point", tostring(addIntimacyValue))
  ;
  (center.finishText):SetText(tempString)
  audioPostEvent_SystemUi(4, 3)
  mentalGame_End = true
end

MentalKnowledge_TryAgain_LClick = function()
  -- function num : 0_57 , upvalues : gameStep, _bestPoint, gameStartInit
  gameStep = 0
  _bestPoint = 0
  gameStartInit()
  RequestMentalGame_restartCard()
end

MentalKnowledge_InformationUIFontAlpha = function(srcKey, dstKey, alpha, isOver)
  -- function num : 0_58 , upvalues : informationUI, gameStep
  if informationUI[srcKey] == nil or (informationUI[srcKey])[dstKey] == nil then
    return 
  end
  if isOver and gameStep > 1 then
    return 
  end
  ;
  (((informationUI[srcKey])[dstKey]).nameTag):SetFontAlpha(alpha)
end

FruitageGift_ShowTooltip = function(Name, Desc, X, Y)
  -- function num : 0_59 , upvalues : mgUI
  ((mgUI.left).giftNotice):SetText(Name .. " : " .. Desc)
  ;
  ((mgUI.left).giftNotice):SetSize(((mgUI.left).giftNotice):GetTextSizeX() + 15, ((mgUI.left).giftNotice):GetSizeY())
  ;
  ((mgUI.left).giftNotice):SetPosX(X)
  ;
  ((mgUI.left).giftNotice):SetPosY(Y - ((mgUI.left).giftNotice):GetSizeY())
  ;
  ((mgUI.left).giftNotice):SetShow(true)
end

FruitageGift_HideTooltip = function()
  -- function num : 0_60 , upvalues : mgUI
  ((mgUI.left).giftNotice):SetShow(false)
end

local uv = {
[0] = {x1 = 0, y1 = 0, x2 = 0, y2 = 0}
, 
[1] = {x1 = 1, y1 = 258, x2 = 245, y2 = 325}
, 
[2] = {x1 = 246, y1 = 258, x2 = 490, y2 = 325}
, 
[3] = {x1 = 1, y1 = 326, x2 = 245, y2 = 393}
, 
[4] = {x1 = 246, y1 = 326, x2 = 490, y2 = 393}
, 
[5] = {x1 = 1, y1 = 394, x2 = 245, y2 = 461}
}
local updateNextTryEvent = function()
  -- function num : 0_61 , upvalues : centerUiList, animationUIList, addAnimation, posUpdateAnimation, informationUI, fontalphaUpdateAnimation
  local mentalObject = getMentalgameObject()
  if mentalObject == nil then
    return 
  end
  local nextSlot = mentalObject:getNextSlot()
  if nextSlot > 0 then
    local prevSlot = nextSlot - 1
    local index = mentalObject:getOrder(prevSlot)
    if centerUiList[index] == nil or (centerUiList[index]).SuccessIcon == nil then
      return 
    end
    ;
    ((centerUiList[index]).SuccessIcon):ResetVertexAni()
    ;
    ((centerUiList[index]).FailedIcon):ResetVertexAni()
    ;
    ((centerUiList[index]).SuccessIcon):SetShow(false)
    ;
    ((centerUiList[index]).FailedIcon):SetShow(false)
    if mentalObject:isComboSuccess() then
      ((centerUiList[index]).panel):AddEffect("fUI_KnowledgeNotice02", false, 0, 0)
      ;
      ((centerUiList[index]).SuccessIcon):SetVertexAniRun("Ani_Color_New", true)
      ;
      ((centerUiList[index]).SuccessIcon):SetVertexAniRun("Ani_Move_Pos_New", true)
      ;
      ((centerUiList[index]).SuccessIcon):SetShow(true)
      audioPostEvent_SystemUi(4, 9)
    else
      ;
      ((centerUiList[index]).FailedIcon):SetVertexAniRun("Ani_Color_New", true)
      ;
      ((centerUiList[index]).FailedIcon):SetVertexAniRun("Ani_Move_Pos_New", true)
      ;
      ((centerUiList[index]).FailedIcon):SetShow(true)
      audioPostEvent_SystemUi(4, 8)
    end
    local lastIndex = mentalObject:getOrderCount() - 1
    local nextIndex = mentalObject:getOrder(nextSlot)
    if mentalObject:getHasNextSlot() and centerUiList[nextIndex] ~= nil then
      ((centerUiList[nextIndex]).circularProgress):SetCurrentControlPos(0)
      ;
      ((centerUiList[nextIndex]).circularProgress):SetProgressRate(100)
    end
    local isFirst = true
    for index = nextSlot, lastIndex do
      local isApplied = mentalObject:isAppliedEffect(prevSlot, index)
      local isFirstAnimation = false
      if isFirst and mentalObject:getCardBySlotOrder(index) ~= nil then
        isFirst = false
        isFirstAnimation = true
      end
      if isApplied or isFirstAnimation then
        if isFirstAnimation then
          (((animationUIList[prevSlot])[index]).pointImage):SetColor((Defines.Color).C_FFEF9C7F)
        else
          ;
          (((animationUIList[prevSlot])[index]).pointImage):SetColor((Defines.Color).C_FFFFFFFF)
        end
        local playCount = index - prevSlot - mentalObject:getEmptyCount(prevSlot, index)
        addAnimation(((animationUIList[prevSlot])[index]).panel, 0, mentalObject:getMentalGameSpeed() / 1000 * playCount, prevSlot, index, posUpdateAnimation)
        addAnimation(((informationUI[prevSlot])[index]).nameTag, 0, mentalObject:getMentalGameSpeed() / 1000 * playCount, prevSlot, index, fontalphaUpdateAnimation)
      end
    end
  end
end

MentalGame_updateMatrix = function()
  -- function num : 0_62 , upvalues : removeCircleLineAndObject, insertCircleLineAndObject, updateCenterUIPos
  removeCircleLineAndObject()
  insertCircleLineAndObject()
  updateCenterUIPos(0)
end

MentalGame_StateUpdate = function(isNext)
  -- function num : 0_63 , upvalues : centerUiList, mgUI, gameStep, removeCircleLineAndObject, insertCircleLineAndObject, updateState, updateStateUIShow, updateCardColor, updateCardScrollButton, rightCardList, updateNextTryEvent
  local mentalObject = getMentalgameObject()
  if mentalObject == nil then
    return 
  end
  local count = mentalObject:getSlotCount()
  for index = 0, count - 1 do
    local cardWrapper = mentalObject:getCardBySlotIndex(index)
    if centerUiList[index] ~= nil and (centerUiList[index]).panel ~= nil then
      local target = (centerUiList[index]).panel
      if cardWrapper ~= nil then
        target:ChangeTextureInfoName(cardWrapper:getPicture())
      else
        target:ChangeTextureInfoName("")
      end
      target:SetShow(true, false)
    end
  end
  local minCardSlotCount = mentalObject:getMinCardSlotCount()
  local filledSlotCount = mentalObject:getFilledSlotCount()
  ;
  ((mgUI.base).comment_Value):SetText(tostring(minCardSlotCount - filledSlotCount))
  -- DECOMPILER ERROR at PC59: Unhandled construct in 'MakeBoolean' P1

  if minCardSlotCount <= filledSlotCount and gameStep == 0 then
    gameStep = 1
  end
  if gameStep == 1 then
    gameStep = 0
  end
  removeCircleLineAndObject()
  insertCircleLineAndObject()
  updateState()
  updateStateUIShow()
  updateCardColor()
  updateCardScrollButton()
  local right = mgUI.right
  local count = mentalObject:getCardCount()
  for index = 0, count - 1 do
    local cardWrapper = mentalObject:getCard(index)
    if rightCardList[index] ~= nil and (rightCardList[index]).ui ~= nil and ((rightCardList[index]).ui).cardIcon ~= nil then
      (((rightCardList[index]).ui).cardIcon):SetMonoTone(mentalObject:isBanedCard(cardWrapper))
    end
  end
  if isNext then
    updateNextTryEvent()
  end
end

MentalGame_tryCard = function(slotIndex)
  -- function num : 0_64 , upvalues : gameStep, maxPointUpdate
  gameStep = 2
  maxPointUpdate()
end

MentalGame_endStage = function(addedIntimacy)
  -- function num : 0_65 , upvalues : gameStep, maxPointUpdate, addIntimacy, mgUI, updateState, updateStateUIShow
  gameStep = 3
  local mentalStage = RequestMentalGame_getMentalStage()
  maxPointUpdate()
  if mentalStage._isSuccess then
    addIntimacy = addIntimacy + addedIntimacy
  else
    addIntimacy = 0
  end
  local intimacyText = tostring(addIntimacy)
  if addedIntimacy >= 0 then
    intimacyText = "+" .. intimacyText
  end
  local base = mgUI.base
  local left = mgUI.left
  ;
  (left.fruitage_Add):SetText(intimacyText)
  if addIntimacy == 0 then
    (base.result):SetText(PAGetString(Defines.StringSheet_GAME, "MENTALGAME_INTIMACY_ACQUIRE_EMPTY"))
  else
    ;
    (base.result):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "MENTALGAME_INTIMACY_ACQUIRE", "count", intimacyText))
  end
  ;
  (base.nextFail):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "MENTALGAME_INTIMACY_ACQUIRE", "count", tostring(addIntimacy)))
  updateState()
  updateStateUIShow()
end

MentalGame_UpdateEndTimer = function(deltaTime)
  -- function num : 0_66 , upvalues : endTimechk, mentalGame_End
  endTimechk = endTimechk + deltaTime
  if endTimechk > 5 and mentalGame_End == true then
    MentalGame_Hide()
    mentalGame_End = false
  end
  if endTimechk > 6 then
    endTimechk = 0
  end
end

MentalGame_UpdateHideTime = function(deltaTime)
  -- function num : 0_67 , upvalues : hideDeltaTime, constValue, gameStep, endUIProcess
  hideDeltaTime = hideDeltaTime + deltaTime
  if constValue.hideTime <= hideDeltaTime and gameStep == 4 then
    endUIProcess()
  end
end

init()
renderMode:setClosefunctor(renderMode, MentalGame_HideByDamage)

