-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\widget\minigame\minigame_find.luac 

-- params : ...
-- function num : 0
PaGlobal_MiniGame_Find = {
_ui = {_baseOpenSlot = (UI.getChildControl)(Panel_MiniGame_Find, "Static_OpenSlot"), _baseCloseSlot = (UI.getChildControl)(Panel_MiniGame_Find, "Static_CloseSlot"), _closeButton = (UI.getChildControl)(Panel_MiniGame_Find, "Button_Win_Close"), _percent = (UI.getChildControl)(Panel_MiniGame_Find, "Static_Text_Percent_Value"), _btn_nextGame = (UI.getChildControl)(Panel_MiniGame_Find, "Button_NextGame"), _btn_giveMeReward = (UI.getChildControl)(Panel_MiniGame_Find, "Button_GiveMeReward"), _showSlotCount = (UI.getChildControl)(Panel_MiniGame_Find, "Static_Text_ShowSlotCount_Value"), _objTotalCount = (UI.getChildControl)(Panel_MiniGame_Find, "Static_Text_ObjTotalCount_Value"), _curObjTotalCount = (UI.getChildControl)(Panel_MiniGame_Find, "Static_Text_CurObjTotalCount_Value")}
, 
_config = {_slotCols = 16, _slotRows = 16, _slotStartPosX = 30, _slotStartPosY = 70, _slotGapX = 47, _slotGapY = 47}
, 
_slotType = {default = 0, empty = 1, obj = 2}
, _slots = (Array.new)()}
-- DECOMPILER ERROR at PC77: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_MiniGame_Find.initialize = function(self)
  -- function num : 0_0
  self:createSlot()
  self:registEventHandler()
  self._messageBoxData = {tostringitle = PAGetString(Defines.StringSheet_GAME, "LUA_WARNING"), content = "성공! 다음 게임�\132 진행하면 �\148 좋은 보상�\132 받을�\152 있습니다. �\168, 실패�\156 아이�\156 안줌. 하시겠습니까? 다음스테이지 실패�\156 보상 X", functionYes = FGlobal_MiniGameFind_Next, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
  Panel_MiniGame_Find:SetShow(false)
end

-- DECOMPILER ERROR at PC80: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_MiniGame_Find.close = function(self)
  -- function num : 0_1
  ToClient_MiniGameFindSetShow(false)
end

-- DECOMPILER ERROR at PC83: Confused about usage of register: R0 in 'UnsetPending'

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
      (slot.close):addInputEvent("Mouse_LUp", "PaGlobal_MiniGame_Find:LClickCloseSlot(" .. col .. ", " .. row .. ")")
      ;
      (slot.close):addInputEvent("Mouse_RUp", "PaGlobal_MiniGame_Find:RClickCloseSlot(" .. col .. ", " .. row .. ")")
      -- DECOMPILER ERROR at PC122: Confused about usage of register: R10 in 'UnsetPending'

      ;
      ((self._slots)[col])[row] = slot
    end
  end
end

-- DECOMPILER ERROR at PC86: Confused about usage of register: R0 in 'UnsetPending'

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
  registerEvent("FromClient_MiniGameFindDefaultImage", "FromClient_MiniGameFindDefaultImage")
  registerEvent("FromClient_MiniGameFindInformation", "FromClient_MiniGameFindInformation")
end

-- DECOMPILER ERROR at PC89: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_MiniGame_Find.LClickCloseSlot = function(self, col, row)
  -- function num : 0_4
  _PA_LOG("박규나_MiniGame_Find", "clickCloseSlot " .. tostring(col) .. ", " .. tostring(row))
  ToClient_MiniGameFindClick(col, row)
end

-- DECOMPILER ERROR at PC92: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_MiniGame_Find.RClickCloseSlot = function(self, col, row)
  -- function num : 0_5
  local slot = (((self._slots)[col])[row]).close
  slot:ChangeTextureInfoName("New_UI_Common_forLua/Window/MiniGame/MiniGame_00.dds")
  local xx1, yy1, xx2, yy2 = setTextureUV_Func(slot, 62, 184, 122, 244)
  ;
  (slot:getBaseTexture()):setUV(xx1, yy1, xx2, yy2)
  slot:setRenderTexture(slot:getBaseTexture())
  slot:SetShow(true)
end

-- DECOMPILER ERROR at PC95: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_MiniGame_Find.endGame = function(self)
  -- function num : 0_6
  for row = 0, (self._config)._slotRows - 1 do
    for col = 0, (self._config)._slotCols - 1 do
      local slot = ((self._slots)[col])[row]
      ;
      (slot.close):SetEnable(false)
    end
  end
end

-- DECOMPILER ERROR at PC98: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_MiniGame_Find.refresh = function(self, slotMaxCol, slotMaxRow)
  -- function num : 0_7
  for row = 0, (self._config)._slotRows - 1 do
    for col = 0, (self._config)._slotCols - 1 do
      local slot = ((self._slots)[col])[row]
      if slotMaxCol <= col or slotMaxRow <= row then
        (slot.close):SetShow(false)
        ;
        (slot.open):SetShow(false)
      else
        ;
        (slot.close):SetShow(true)
        ;
        (slot.close):SetEnable(true)
        ;
        (slot.open):SetShow(false)
      end
    end
  end
end

-- DECOMPILER ERROR at PC101: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_MiniGame_Find.askNextGame = function(self)
  -- function num : 0_8
  (MessageBox.showMessageBox)(self._messageBoxData, "top")
end

FromClient_MiniGameFindInformation = function(damageRate, showSlotCount, objTotalCount, curObjTotalCount)
  -- function num : 0_9
  local self = PaGlobal_MiniGame_Find
  ;
  ((self._ui)._percent):SetText((string.format)("%.2f", damageRate / 10000) .. "%")
  ;
  ((self._ui)._showSlotCount):SetText(tostring(showSlotCount))
  ;
  ((self._ui)._objTotalCount):SetText(tostring(objTotalCount))
  ;
  ((self._ui)._curObjTotalCount):SetText(tostring(curObjTotalCount))
end

FromClient_MiniGameFindDefaultImage = function(col, row, uv0, uv1, uv2, uv3, imagePath)
  -- function num : 0_10
  local self = PaGlobal_MiniGame_Find
  local slot = (((self._slots)[col])[row]).close
  slot:ChangeTextureInfoName(imagePath)
  local xx1, yy1, xx2, yy2 = setTextureUV_Func(slot, uv0, uv1, uv2, uv3)
  ;
  (slot:getBaseTexture()):setUV(xx1, yy1, xx2, yy2)
  slot:setRenderTexture(slot:getBaseTexture())
end

FromClient_MiniGameFindSlotShow = function(col, row, uv0, uv1, uv2, uv3, _imagePath)
  -- function num : 0_11
  local self = PaGlobal_MiniGame_Find
  local slot = (((self._slots)[col])[row]).open
  slot:ChangeTextureInfoName(_imagePath)
  local xx1, yy1, xx2, yy2 = setTextureUV_Func(slot, uv0, uv1, uv2, uv3)
  ;
  (slot:getBaseTexture()):setUV(xx1, yy1, xx2, yy2)
  slot:setRenderTexture(slot:getBaseTexture())
  ;
  ((((self._slots)[col])[row]).close):SetShow(false)
  ;
  ((((self._slots)[col])[row]).open):SetShow(true)
end

FromClient_MiniGameFindSetShow = function(isShow, col, row)
  -- function num : 0_12
  local self = PaGlobal_MiniGame_Find
  if isShow == true then
    ((self._ui)._percent):SetText((string.format)("%.2f", 0) .. "%")
    ;
    ((self._ui)._btn_nextGame):SetShow(false)
    ;
    ((self._ui)._btn_giveMeReward):SetShow(false)
    self:refresh(col, row)
  end
  Panel_MiniGame_Find:SetShow(isShow)
end

FromClient_MiniGameFindSetShowButtonList = function(isNextGame, isGiveMeReward)
  -- function num : 0_13
  local self = PaGlobal_MiniGame_Find
  ;
  ((self._ui)._btn_nextGame):SetShow(isNextGame)
  ;
  ((self._ui)._btn_giveMeReward):SetShow(isGiveMeReward)
  if isNextGame == true or isGiveMeReward == true then
    self:endGame()
  end
end

FGlobal_MiniGameFind_Next = function()
  -- function num : 0_14
  ToClient_MiniGameFindSetShow(true)
end

PaGlobal_MiniGame_Find:initialize()
minigamefind = function()
  -- function num : 0_15
  _PA_LOG("박규나_MiniGame_Find", "minigamefind ")
  ToClient_MiniGameFindSetShow(true)
end


