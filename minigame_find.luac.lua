-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\widget\minigame\minigame_find.luac 

-- params : ...
-- function num : 0
PaGlobal_MiniGame_Find = {
_ui = {_baseOpenSlot = (UI.getChildControl)(Panel_MiniGame_Find, "Static_OpenSlot"), _baseCloseSlot = (UI.getChildControl)(Panel_MiniGame_Find, "Static_CloseSlot"), _closeButton = (UI.getChildControl)(Panel_MiniGame_Find, "Button_Win_Close"), _rightBG = (UI.getChildControl)(Panel_MiniGame_Find, "Static_RightBg"), _rightBottomBG = (UI.getChildControl)(Panel_MiniGame_Find, "Static_BottomRightBg"), _timerMsg = (UI.getChildControl)(Panel_MiniGame_MiniGameResult, "StaticText_Msg"), _staticObjBg = (UI.getChildControl)(Panel_MiniGame_Find, "Static_Body")}
, 
_config = {_slotCols = 16, _slotRows = 16, _slotSize = 36, _slotStartPosX = 13, _slotStartPosY = 45, _rewardMaxCount = 6, _nextGameSec = 3, _slotTypeDefault = 0, _slotTypeEmpty = 1, _slotTypeMain = 2, _slotTypeSub = 3, _slotTypeTrap = 5}
, 
_clickType = {LClcik = 1, RClcik = 2}
, 
_state = {None = 0, Play = 1, Wait = 2, Reward = 3}
, 
_rewardSlotConfig = {createIcon = true, createBorder = true, createEnchant = true}
, _slots = (Array.new)(), _rewardSlot = (Array.new)(), _gameState = nil, _readyToNextGame = false, _curSec = 0, _gameCurDepth = 0, _gameLastDepth = 0}
-- DECOMPILER ERROR at PC90: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_MiniGame_Find.initialize = function(self)
  -- function num : 0_0
  -- DECOMPILER ERROR at PC7: Confused about usage of register: R1 in 'UnsetPending'

  (self._ui)._rightTopBG = (UI.getChildControl)((self._ui)._rightBG, "Static_TopBg")
  -- DECOMPILER ERROR at PC15: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._percent = (UI.getChildControl)((self._ui)._rightTopBG, "StaticText_DDPercent")
  -- DECOMPILER ERROR at PC23: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._RClickCnt = (UI.getChildControl)((self._ui)._rightTopBG, "StaticText_RClickCount")
  -- DECOMPILER ERROR at PC31: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._LeftValueBg = (UI.getChildControl)((self._ui)._rightBG, "Static_LeftValueBg")
  -- DECOMPILER ERROR at PC39: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._damageGauge = (UI.getChildControl)((self._ui)._rightBG, "Progress2_DamageDegree")
  -- DECOMPILER ERROR at PC47: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._slotBackground = (UI.getChildControl)((self._ui)._rightBG, "Static_RewardSlotBg")
  -- DECOMPILER ERROR at PC55: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._focusSlot = (UI.getChildControl)((self._ui)._rightBG, "Static_CurrentSlotFocus")
  -- DECOMPILER ERROR at PC63: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._gameDepth = (UI.getChildControl)((self._ui)._rightBG, "StaticText_GradeTitle")
  -- DECOMPILER ERROR at PC71: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._curRewardSlot = (UI.getChildControl)((self._ui)._rightBG, "Static_CurrentSlotFocus")
  -- DECOMPILER ERROR at PC79: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._emptyCnt = (UI.getChildControl)((self._ui)._LeftValueBg, "StaticText_LandCountValue")
  -- DECOMPILER ERROR at PC87: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._subObjCnt = (UI.getChildControl)((self._ui)._LeftValueBg, "StaticText_RootCountValue")
  -- DECOMPILER ERROR at PC95: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._trapCnt = (UI.getChildControl)((self._ui)._LeftValueBg, "StaticText_StoneCountValue")
  self:createSlot()
  self:createRewardSlot()
  self:registEventHandler()
  self._messageBoxData = {tostringitle = PAGetString(Defines.StringSheet_GAME, "LUA_WARNING"), content = "종료하면 보상 못받습니�\164. 종료 하시겠습니까?", functionYes = FGlobal_MiniGameFind_Close, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
  Panel_MiniGame_Find:SetShow(false)
end

-- DECOMPILER ERROR at PC93: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_MiniGame_Find.close = function(self)
  -- function num : 0_1
  Panel_MiniGame_MiniGameResult:SetShow(false)
  Panel_MiniGame_Find:SetShow(false)
  ToClient_MiniGameFindHide()
end

-- DECOMPILER ERROR at PC96: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_MiniGame_Find.createSlot = function(self)
  -- function num : 0_2
  for col = 0, (self._config)._slotCols - 1 do
    -- DECOMPILER ERROR at PC10: Confused about usage of register: R5 in 'UnsetPending'

    (self._slots)[col] = (Array.new)()
    for row = 0, (self._config)._slotRows - 1 do
      local slot = {close = nil, open = nil}
      slot.close = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATIC, Panel_MiniGame_Find, "Slot_Close_" .. col .. "_" .. row)
      slot.open = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATIC, Panel_MiniGame_Find, "Slot_Open_" .. col .. "_" .. row)
      CopyBaseProperty((self._ui)._baseCloseSlot, slot.close)
      CopyBaseProperty((self._ui)._baseOpenSlot, slot.open)
      ;
      (slot.close):SetSize((self._config)._slotSize, (self._config)._slotSize)
      ;
      (slot.close):SetPosX((self._config)._slotStartPosX + (self._config)._slotSize * col)
      ;
      (slot.close):SetPosY((self._config)._slotStartPosY + (self._config)._slotSize * row)
      ;
      (slot.close):SetShow(false)
      ;
      (slot.open):SetSize((self._config)._slotSize, (self._config)._slotSize)
      ;
      (slot.open):SetPosX((self._config)._slotStartPosX + (self._config)._slotSize * col)
      ;
      (slot.open):SetPosY((self._config)._slotStartPosY + (self._config)._slotSize * row)
      ;
      (slot.open):SetShow(false)
      ;
      (slot.open):SetEnable(false)
      ;
      (slot.close):addInputEvent("Mouse_LUp", "PaGlobal_MiniGame_Find:ClickCloseSlot(" .. col .. "," .. row .. "," .. (self._clickType).LClcik .. ")")
      ;
      (slot.close):addInputEvent("Mouse_RUp", "PaGlobal_MiniGame_Find:ClickCloseSlot(" .. col .. "," .. row .. "," .. (self._clickType).RClcik .. ")")
      -- DECOMPILER ERROR at PC146: Confused about usage of register: R10 in 'UnsetPending'

      ;
      ((self._slots)[col])[row] = slot
    end
  end
  -- DECOMPILER ERROR at PC158: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._mainObjBG = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATIC, Panel_MiniGame_Find, "MainObjBG")
  CopyBaseProperty((self._ui)._staticObjBg, (self._ui)._mainObjBG)
  ;
  ((self._ui)._mainObjBG):SetShow(false)
end

-- DECOMPILER ERROR at PC99: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_MiniGame_Find.registEventHandler = function(self)
  -- function num : 0_3
  Panel_MiniGame_Find:RegisterUpdateFunc("FGlobal_MiniGameFind_Update")
  ;
  ((self._ui)._closeButton):addInputEvent("Mouse_LUp", "PaGlobal_MiniGame_Find:askGameClose()")
  registerEvent("FromClient_MiniGameFindSlotShowEmpty", "FromClient_MiniGameFindSlotShowEmpty")
  registerEvent("FromClient_MiniGameFindSlotShowMain", "FromClient_MiniGameFindSlotShowMain")
  registerEvent("FromClient_MiniGameFindSlotShowSub", "FromClient_MiniGameFindSlotShowSub")
  registerEvent("FromClient_MiniGameFindSlotShowTrap", "FromClient_MiniGameFindSlotShowTrap")
  registerEvent("FromClient_MiniGameFindSetShow", "FromClient_MiniGameFindSetShow")
  registerEvent("FromClient_MiniGameFindSetReward", "FromClient_MiniGameFindSetReward")
  registerEvent("FromClient_MiniGameFindSetState", "FromClient_MiniGameFindSetState")
  registerEvent("FromClient_MiniGameFindDefaultImage", "FromClient_MiniGameFindDefaultImage")
  registerEvent("FromClient_MiniGameFindDynamicInfo", "FromClient_MiniGameFindDynamicInfo")
  registerEvent("FromClient_MiniGameFindStaticInfo", "FromClient_MiniGameFindStaticInfo")
end

-- DECOMPILER ERROR at PC102: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_MiniGame_Find.ClickCloseSlot = function(self, col, row, clickType)
  -- function num : 0_4
  local itemWrapper = ToClient_getEquipmentItem((CppEnums.EquipSlotNoClient).eEquipSlotNoSubTool)
  if itemWrapper ~= nil and (itemWrapper:get()):getEndurance() > 0 then
    if (self._clickType).LClcik == clickType then
      audioPostEvent_SystemUi(11, 31)
    else
      audioPostEvent_SystemUi(11, 32)
    end
    ToClient_MiniGameFindClick(col, row, clickType)
  else
    Proc_ShowMessage_Ack("아이템의 내구도가 0입니�\164.")
  end
end

-- DECOMPILER ERROR at PC105: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_MiniGame_Find.endGame = function(self)
  -- function num : 0_5
  for row = 0, (self._config)._slotRows - 1 do
    for col = 0, (self._config)._slotCols - 1 do
      local slot = ((self._slots)[col])[row]
      ;
      (slot.close):SetEnable(false)
    end
  end
  audioPostEvent_SystemUi(11, 33)
end

-- DECOMPILER ERROR at PC108: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_MiniGame_Find.refresh = function(self, slotMaxCol, slotMaxRow)
  -- function num : 0_6
  local diffCount = (self._config)._slotCols - slotMaxCol
  local slotSize = (self._config)._slotSize + 3 * diffCount
  for row = 0, (self._config)._slotRows - 1 do
    for col = 0, (self._config)._slotCols - 1 do
      local slot = ((self._slots)[col])[row]
      if slotMaxCol <= col or slotMaxRow <= row then
        (slot.close):SetShow(false)
        ;
        (slot.close):SetEnable(false)
        ;
        (slot.open):SetShow(false)
      else
        ;
        (slot.close):SetSize(slotSize, slotSize)
        ;
        (slot.close):SetPosX((self._config)._slotStartPosX + slotSize * col)
        ;
        (slot.close):SetPosY((self._config)._slotStartPosY + slotSize * row)
        ;
        (slot.close):SetShow(true)
        ;
        (slot.close):SetEnable(true)
        ;
        (slot.open):SetSize(slotSize, slotSize)
        ;
        (slot.open):SetPosX((self._config)._slotStartPosX + slotSize * col)
        ;
        (slot.open):SetPosY((self._config)._slotStartPosY + slotSize * row)
        ;
        (slot.open):SetShow(false)
      end
    end
  end
end

-- DECOMPILER ERROR at PC111: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_MiniGame_Find.askGameClose = function(self)
  -- function num : 0_7
  if (self._state).None == self._gameState then
    self:close()
  else
    ;
    (MessageBox.showMessageBox)(self._messageBoxData, "top")
  end
end

-- DECOMPILER ERROR at PC114: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_MiniGame_Find.createRewardSlot = function(self)
  -- function num : 0_8
  ((self._ui)._slotBackground):SetShow(false)
  for ii = 0, (self._config)._rewardMaxCount - 1 do
    local slot = {}
    slot.background = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATIC, (self._ui)._rightBG, "RewardItemBG_" .. ii)
    CopyBaseProperty((self._ui)._slotBackground, slot.background)
    ;
    (slot.background):SetPosY(122 + ii * 65)
    ;
    (slot.background):SetShow(true)
    ;
    (SlotItem.new)(slot, "RewardItemIcon_" .. ii, ii, slot.background, self._rewardSlotConfig)
    slot:createChild()
    ;
    (slot.icon):SetPosX(4)
    ;
    (slot.icon):SetPosY(4)
    ;
    (slot.icon):SetShow(true)
    ;
    (slot.icon):addInputEvent("Mouse_On", "PaGlobal_MiniGame_Find:itemTooltip_Show(" .. ii .. ")")
    ;
    (slot.icon):addInputEvent("Mouse_Out", "PaGlobal_MiniGame_Find:itemTooltip_Hide()")
    -- DECOMPILER ERROR at PC76: Confused about usage of register: R6 in 'UnsetPending'

    ;
    (self._rewardSlot)[ii] = slot
  end
end

-- DECOMPILER ERROR at PC117: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_MiniGame_Find.itemTooltip_Show = function(self, index)
  -- function num : 0_9
  local itemSSW = getItemEnchantStaticStatus(((self._rewardSlot)[index]).itemNo)
  if itemSSW ~= nil then
    Panel_Tooltip_Item_SetPosition(index, (self._rewardSlot)[index], "minigameFindReward")
    Panel_Tooltip_Item_Show(itemSSW, Panel_MiniGame_Find, true)
  end
end

-- DECOMPILER ERROR at PC120: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_MiniGame_Find.itemTooltip_Hide = function(self)
  -- function num : 0_10
  Panel_Tooltip_Item_hideTooltip()
end

-- DECOMPILER ERROR at PC123: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_MiniGame_Find.getRewardIndex = function(self, pct)
  -- function num : 0_11
  if pct == 100 then
    return 0
  else
    local idx = 1
    for ii = 1, (self._config)._rewardMaxCount - 1 do
      if pct <= ii * 20 then
        return (self._config)._rewardMaxCount - ii
      end
    end
    return (self._config)._rewardMaxCount - 1
  end
end

-- DECOMPILER ERROR at PC126: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_MiniGame_Find.nextGameStart = function(self)
  -- function num : 0_12
  Panel_MiniGame_MiniGameResult:SetShow(false)
  self._readyToNextGame = false
  self._gameState = (self._state).None
  if self._gameCurDepth + 1 <= self._gameLastDepth then
    ToClient_MiniGameFindNext()
  end
end

FGlobal_MiniGameFind_RefreshText = function()
  -- function num : 0_13
  local self = PaGlobal_MiniGame_Find
  local itemWrapper = ToClient_getEquipmentItem((CppEnums.EquipSlotNoClient).eEquipSlotNoSubTool)
  if itemWrapper ~= nil then
    local lv = ((itemWrapper:get()):getKey()):getEnchantLevel()
    self._maxRClickCount = ToClient_GetMiniGameToolParam(lv, 0)
    ;
    ((self._ui)._RClickCnt):SetText((string.format)("%s / %s", self._curRClickCount, self._maxRClickCount))
  end
end

FGlobal_MiniGameFind_Close = function()
  -- function num : 0_14
  PaGlobal_MiniGame_Find:close()
end

FGlobal_MiniGameFind_Update = function(deltaTime)
  -- function num : 0_15
  local self = PaGlobal_MiniGame_Find
  if self._gameState ~= (self._state).Wait then
    return 
  end
  if self._readyToNextGame == false then
    return 
  end
  self._curSec = self._curSec + deltaTime
  ;
  ((self._ui)._timerMsg):SetText((string.format)("다음 게임 : %s �\136", (math.floor)((self._config)._nextGameSec - self._curSec + 1)))
  if (self._config)._nextGameSec <= self._curSec then
    self:nextGameStart()
  end
end

FromClient_MiniGameFindSlotShowEmpty = function(col, row, uv0, uv1, uv2, uv3, imagePath)
  -- function num : 0_16
  local self = PaGlobal_MiniGame_Find
  local slot = (((self._slots)[col])[row]).close
  slot:ChangeTextureInfoName(imagePath)
  local xx1, yy1, xx2, yy2 = setTextureUV_Func(slot, uv0, uv1, uv2, uv3)
  ;
  (slot:getBaseTexture()):setUV(xx1, yy1, xx2, yy2)
  slot:setRenderTexture(slot:getBaseTexture())
  slot:SetEnable(false)
  slot:AddEffect("fUI_Minigame_Lbutton", false, 0, 0)
end

FromClient_MiniGameFindSlotShowMain = function(col, row, uv0, uv1, uv2, uv3, imagePath)
  -- function num : 0_17
  local self = PaGlobal_MiniGame_Find
  local slot = (((self._slots)[col])[row]).close
  if self._isMainLoad == false then
    ((self._ui)._mainObjBG):SetPosX(slot:GetPosX())
    ;
    ((self._ui)._mainObjBG):SetPosY(slot:GetPosY())
    ;
    ((self._ui)._mainObjBG):SetShow(true)
    self._isMainLoad = true
  end
  slot:SetEnable(false)
end

FromClient_MiniGameFindSlotShowSub = function(col, row, uv0, uv1, uv2, uv3, imagePath)
  -- function num : 0_18
  local self = PaGlobal_MiniGame_Find
  local slot = (((self._slots)[col])[row]).open
  slot:ChangeTextureInfoName(imagePath)
  local xx1, yy1, xx2, yy2 = setTextureUV_Func(slot, uv0, uv1, uv2, uv3)
  ;
  (slot:getBaseTexture()):setUV(xx1, yy1, xx2, yy2)
  slot:setRenderTexture(slot:getBaseTexture())
  slot:SetShow(true)
  slot:AddEffect("fUI_Minigame_Lbutton", false, 0, 0)
end

FromClient_MiniGameFindSlotShowTrap = function(col, row, stoneType)
  -- function num : 0_19
  local self = PaGlobal_MiniGame_Find
  local slot = (((self._slots)[col])[row]).open
  slot:ChangeTextureInfoName("New_UI_Common_forLua/Window/MiniGame/MiniGameFind_01.dds")
  if stoneType == 0 then
    local xx1, yy1, xx2, yy2 = setTextureUV_Func(slot, 1, 595, 54, 648)
    ;
    (slot:getBaseTexture()):setUV(xx1, yy1, xx2, yy2)
  else
    do
      do
        local xx1, yy1, xx2, yy2 = setTextureUV_Func(slot, 1, 649, 54, 702)
        ;
        (slot:getBaseTexture()):setUV(xx1, yy1, xx2, yy2)
        slot:setRenderTexture(slot:getBaseTexture())
        ;
        ((((self._slots)[col])[row]).open):SetShow(true)
        slot:AddEffect("fUI_Minigame_Rbutton", false, 0, 0)
        audioPostEvent_SystemUi(11, 34)
      end
    end
  end
end

FromClient_MiniGameFindDynamicInfo = function(damageRate, RClickCount, emptyCount, subObjCount, trapCount)
  -- function num : 0_20
  local self = PaGlobal_MiniGame_Find
  local curPercent = damageRate / 10000
  if curPercent <= 0 then
    curPercent = 0
  end
  self._curRClickCount = RClickCount
  ;
  ((self._ui)._percent):SetText((string.format)("%.2f", curPercent) .. "%")
  ;
  ((self._ui)._damageGauge):SetProgressRate(curPercent)
  ;
  ((self._ui)._damageGauge):SetCurrentProgressRate(curPercent)
  ;
  ((self._ui)._RClickCnt):SetText((string.format)("%s / %s", self._curRClickCount, self._maxRClickCount))
  ;
  ((self._ui)._emptyCnt):SetText((string.format)("%s �\156", emptyCount))
  ;
  ((self._ui)._subObjCnt):SetText((string.format)("%s �\156", subObjCount))
  ;
  ((self._ui)._trapCnt):SetText((string.format)("%s �\156", trapCount))
  local idx = self:getRewardIndex(curPercent)
  ;
  ((self._ui)._curRewardSlot):SetPosX((((self._rewardSlot)[idx]).background):GetPosX() - 5)
  ;
  ((self._ui)._curRewardSlot):SetPosY((((self._rewardSlot)[idx]).background):GetPosY() - 5)
end

FromClient_MiniGameFindStaticInfo = function(damageRate, RClickCount, emptyCount, subObjCount, trapCount, gameCurDepth, gameLastDepth)
  -- function num : 0_21
  local self = PaGlobal_MiniGame_Find
  local curPercent = damageRate / 10000
  if curPercent <= 0 then
    curPercent = 0
  end
  self._curRClickCount = 0
  self._maxRClickCount = RClickCount
  self._maxEmptyCount = emptyCount
  self._maxSubObjCount = subObjCount
  self._gameCurDepth = gameCurDepth
  self._gameLastDepth = gameLastDepth
  ;
  ((self._ui)._percent):SetText((string.format)("%.2f", curPercent) .. "%")
  ;
  ((self._ui)._damageGauge):SetProgressRate(curPercent)
  ;
  ((self._ui)._damageGauge):SetCurrentProgressRate(curPercent)
  ;
  ((self._ui)._RClickCnt):SetText((string.format)("%s / %s", self._curRClickCount, self._maxRClickCount))
  ;
  ((self._ui)._emptyCnt):SetText((string.format)("%s �\156", self._maxEmptyCount))
  ;
  ((self._ui)._subObjCnt):SetText((string.format)("%s �\156", self._maxSubObjCount))
  ;
  ((self._ui)._trapCnt):SetText((string.format)("%s �\156", trapCount))
  ;
  ((self._ui)._gameDepth):SetText((string.format)("%s / %s 단계", self._gameCurDepth, self._gameLastDepth))
  local idx = self:getRewardIndex(curPercent)
  ;
  ((self._ui)._curRewardSlot):SetPosX((((self._rewardSlot)[idx]).background):GetPosX() - 5)
  ;
  ((self._ui)._curRewardSlot):SetPosY((((self._rewardSlot)[idx]).background):GetPosY() - 5)
end

FromClient_MiniGameFindDefaultImage = function(col, row, uv0, uv1, uv2, uv3, imagePath)
  -- function num : 0_22
  local self = PaGlobal_MiniGame_Find
  local slot = (((self._slots)[col])[row]).close
  slot:ChangeTextureInfoName(imagePath)
  local xx1, yy1, xx2, yy2 = setTextureUV_Func(slot, uv0, uv1, uv2, uv3)
  ;
  (slot:getBaseTexture()):setUV(xx1, yy1, xx2, yy2)
  slot:setRenderTexture(slot:getBaseTexture())
end

FromClient_MiniGameFindSetShow = function(isShow, col, row)
  -- function num : 0_23
  local self = PaGlobal_MiniGame_Find
  if isShow == true then
    ((self._ui)._percent):SetText((string.format)("%.2f", 100) .. "%")
    self._gameState = (self._state).Play
    self:refresh(col, row)
    self._isMainLoad = false
  else
    self._gameState = (self._state).None
  end
  Panel_MiniGame_Find:SetShow(isShow)
end

FromClient_MiniGameFindSetReward = function(rewardList)
  -- function num : 0_24
  if rewardList == nil then
    return 
  end
  local self = PaGlobal_MiniGame_Find
  for ii = 0, #rewardList do
    local itemSSW = getItemEnchantStaticStatus(rewardList[ii])
    ;
    ((self._rewardSlot)[ii]):setItemByStaticStatus(itemSSW)
    ;
    (((self._rewardSlot)[ii]).icon):SetShow(true)
    -- DECOMPILER ERROR at PC25: Confused about usage of register: R7 in 'UnsetPending'

    ;
    ((self._rewardSlot)[ii]).itemNo = rewardList[ii]
  end
end

FromClient_MiniGameFindSetState = function(serverState)
  -- function num : 0_25
  local self = PaGlobal_MiniGame_Find
  self._gameState = serverState
  if serverState == (self._state).None then
    ((self._ui)._timerMsg):SetText("게임 종료")
    self:endGame()
  else
    if serverState == (self._state).Wait then
      self._readyToNextGame = true
      self._curSec = 0
    end
  end
  Panel_MiniGame_MiniGameResult:SetShow(true)
end

PaGlobal_MiniGame_Find:initialize()
minigamefind = function()
  -- function num : 0_26
  ToClient_MiniGameFindShow(27622)
end


