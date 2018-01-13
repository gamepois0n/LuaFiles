-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\widget\minigame\minigame_find.luac 

-- params : ...
-- function num : 0
PaGlobal_MiniGame_Find = {
_ui = {_baseOpenSlot = (UI.getChildControl)(Panel_MiniGame_Find, "Static_OpenSlot"), _baseCloseSlot = (UI.getChildControl)(Panel_MiniGame_Find, "Static_CloseSlot"), _closeButton = (UI.getChildControl)(Panel_MiniGame_Find, "Button_Win_Close"), _percent = (UI.getChildControl)(Panel_MiniGame_Find, "Static_Text_Percent_Value"), _btn_nextGame = (UI.getChildControl)(Panel_MiniGame_Find, "Button_NextGame"), _btn_giveMeReward = (UI.getChildControl)(Panel_MiniGame_Find, "Button_GiveMeReward")}
, 
_config = {_slotCols = 16, _slotRows = 16, _slotMax = 0, _slotStartPosX = 30, _slotStartPosY = 70, _slotGapX = 47, _slotGapY = 47}
, 
_slotType = {default = 0, empty = 1, obj = 2}
, _slots = (Array.new)(), _imagePath = nil}
-- DECOMPILER ERROR at PC61: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_MiniGame_Find.initialize = function(self)
  -- function num : 0_0
  self:createSlot()
  self:registEventHandler()
  self._messageBoxData = {tostringitle = PAGetString(Defines.StringSheet_GAME, "LUA_WARNING"), content = "성공! 다음 게임�\132 진행하면 �\148 좋은 보상�\132 받을�\152 있습니다. �\168, 실패�\156 아이�\156 안줌. 하시겠습니까? 다음스테이지 실패�\156 보상 X", functionYes = FGlobal_MiniGameFind_Next, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
end

-- DECOMPILER ERROR at PC64: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_MiniGame_Find.close = function(self)
  -- function num : 0_1
  ToClient_MiniGameFindSetShow(false)
end

-- DECOMPILER ERROR at PC67: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_MiniGame_Find.createSlot = function(self)
  -- function num : 0_2
  -- DECOMPILER ERROR at PC6: Confused about usage of register: R1 in 'UnsetPending'

  (self._config)._slotMax = (self._config)._slotCols * (self._config)._slotRows
  for ii = 0, (self._config)._slotMax - 1 do
    local slot = {close = nil, open = nil}
    slot.close = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATIC, Panel_MiniGame_Find, "Slot_Close" .. ii)
    slot.open = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATIC, Panel_MiniGame_Find, "Slot_Open" .. ii)
    CopyBaseProperty((self._ui)._baseCloseSlot, slot.close)
    CopyBaseProperty((self._ui)._baseOpenSlot, slot.open)
    local col = ii % (self._config)._slotCols
    local row = (math.floor)(ii / (self._config)._slotCols)
    ;
    (slot.close):SetPosX((self._config)._slotStartPosX + (self._config)._slotGapX * col)
    ;
    (slot.close):SetPosY((self._config)._slotStartPosY + (self._config)._slotGapY * row)
    ;
    (slot.close):SetShow(true)
    ;
    (slot.open):SetPosX((self._config)._slotStartPosX + (self._config)._slotGapX * col)
    ;
    (slot.open):SetPosY((self._config)._slotStartPosY + (self._config)._slotGapY * row)
    ;
    (slot.open):SetShow(false)
    ;
    (slot.close):addInputEvent("Mouse_LUp", "PaGlobal_MiniGame_Find:clickCloseSlot(" .. ii .. ")")
    -- DECOMPILER ERROR at PC110: Confused about usage of register: R8 in 'UnsetPending'

    ;
    (self._slots)[ii] = slot
  end
end

-- DECOMPILER ERROR at PC70: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_MiniGame_Find.registEventHandler = function(self)
  -- function num : 0_3
  ((self._ui)._closeButton):addInputEvent("Mouse_LUp", "PaGlobal_MiniGame_Find:close()")
  ;
  ((self._ui)._btn_nextGame):addInputEvent("Mouse_LUp", "PaGlobal_MiniGame_Find:askNextGame()")
  ;
  ((self._ui)._btn_giveMeReward):addInputEvent("Mouse_LUp", "PaGlobal_MiniGame_Find:close()")
  registerEvent("FromClient_MiniGameFindSlotShow", "FromClient_MiniGameFindSlotShow")
  registerEvent("FromClient_MiniGameFindSetShow", "FromClient_MiniGameFindSetShow")
  registerEvent("FromClient_MiniGameFindSetShowButtonList", "FromClient_MiniGameFindSetShowButtonList")
end

-- DECOMPILER ERROR at PC73: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_MiniGame_Find.clickCloseSlot = function(self, ii)
  -- function num : 0_4
  _PA_LOG("박규나_MiniGame_Find", "clickCloseSlot " .. tostring(ii))
  ToClient_MiniGameFindClick(ii)
end

-- DECOMPILER ERROR at PC76: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_MiniGame_Find.endGame = function(self)
  -- function num : 0_5
  for ii = 0, (self._config)._slotMax - 1 do
    local slot = (self._slots)[ii]
    ;
    (slot.close):SetEnable(false)
    ;
    (slot.open):SetEnable(false)
  end
end

-- DECOMPILER ERROR at PC79: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_MiniGame_Find.refresh = function(self, slotMaxCol, slotMaxRow)
  -- function num : 0_6
  _PA_LOG("박규나_MiniGame_Find", "refresh : " .. tostring(col) .. " , " .. tostring(row))
  local slotMax = slotMaxCol * slotMaxRow
  for ii = 0, (self._config)._slotMax - 1 do
    local slot = (self._slots)[ii]
    if slot ~= nil then
      if slotMax <= ii then
        (slot.close):SetShow(false)
        ;
        (slot.open):SetShow(false)
      else
        local col = ii % slotMaxCol
        local row = (math.floor)(ii / slotMaxCol)
        ;
        (slot.close):SetPosX((self._config)._slotStartPosX + (self._config)._slotGapX * col)
        ;
        (slot.close):SetPosY((self._config)._slotStartPosY + (self._config)._slotGapY * row)
        ;
        (slot.close):SetShow(true)
        ;
        (slot.close):SetEnable(true)
        ;
        (slot.open):SetPosX((self._config)._slotStartPosX + (self._config)._slotGapX * col)
        ;
        (slot.open):SetPosY((self._config)._slotStartPosY + (self._config)._slotGapY * row)
        ;
        (slot.open):SetShow(false)
      end
    end
  end
end

-- DECOMPILER ERROR at PC82: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_MiniGame_Find.askNextGame = function(self)
  -- function num : 0_7
  (MessageBox.showMessageBox)(self._messageBoxData, "top")
end

FromClient_MiniGameFindSlotShow = function(idx, uv0, uv1, uv2, uv3, damageRate)
  -- function num : 0_8
  local self = PaGlobal_MiniGame_Find
  local slot = ((self._slots)[idx]).open
  slot:ChangeTextureInfoName(self._imagePath)
  local xx1, yy1, xx2, yy2 = setTextureUV_Func(slot, uv0, uv1, uv2, uv3)
  ;
  (slot:getBaseTexture()):setUV(xx1, yy1, xx2, yy2)
  slot:setRenderTexture(slot:getBaseTexture())
  ;
  (((self._slots)[idx]).close):SetShow(false)
  ;
  (((self._slots)[idx]).open):SetShow(true)
  ;
  ((self._ui)._percent):SetText((string.format)("%.2f", damageRate / 10000) .. "%")
end

FromClient_MiniGameFindSetShow = function(isShow, col, row, imagePath)
  -- function num : 0_9
  local self = PaGlobal_MiniGame_Find
  _PA_LOG("박규나_MiniGame_Find", "FromClient_MiniGameFindSetShow " .. tostring(col) .. "," .. tostring(row) .. "," .. tostring(imagePath))
  if isShow == true then
    self:refresh(col, row)
    self._imagePath = imagePath
    ;
    ((self._ui)._percent):SetText((string.format)("%.2f", 0) .. "%")
    ;
    ((self._ui)._btn_nextGame):SetShow(false)
    ;
    ((self._ui)._btn_giveMeReward):SetShow(false)
  else
    self._imagePath = nil
  end
  Panel_MiniGame_Find:SetShow(isShow)
end

FromClient_MiniGameFindSetShowButtonList = function(isNextGame, isGiveMeReward)
  -- function num : 0_10
  local self = PaGlobal_MiniGame_Find
  ;
  ((self._ui)._btn_nextGame):SetShow(isNextGame)
  ;
  ((self._ui)._btn_giveMeReward):SetShow(isGiveMeReward)
  if isNextGame == true then
    self:endGame()
  end
end

FGlobal_MiniGameFind_Next = function()
  -- function num : 0_11
  ToClient_MiniGameFindSetShow(true)
end

PaGlobal_MiniGame_Find:initialize()
minigamefind = function()
  -- function num : 0_12
  _PA_LOG("박규나_MiniGame_Find", "minigamefind ")
  ToClient_MiniGameFindSetShow(true)
end


