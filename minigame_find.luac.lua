-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\widget\minigame\minigame_find.luac 

-- params : ...
-- function num : 0
PaGlobal_MiniGame_Find = {
_ui = {_baseOpenSlot = (UI.getChildControl)(Panel_MiniGame_Find, "Static_OpenSlot"), _baseCloseSlot = (UI.getChildControl)(Panel_MiniGame_Find, "Static_CloseSlot"), _closeButton = (UI.getChildControl)(Panel_MiniGame_Find, "Button_Win_Close"), _feverGauge = (UI.getChildControl)(Panel_MiniGame_Find, "Static_Text_Fever_Gauge")}
, 
_config = {_slotCols = 16, _slotRows = 16, _slotMax = 0, _slotStartPosX = 30, _slotStartPosY = 70, _slotGapX = 47, _slotGapY = 47}
, 
_dir = {eCentor = 0, eLeft = 1, eTop = 2, eRight = 4, eBottom = 8}
, 
_objType = {eObjectTypeEmpty = 0, eObjectTypeMain = 1, eObjectTypeSub = 2}
, _slots = (Array.new)()}
-- DECOMPILER ERROR at PC55: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_MiniGame_Find.initialize = function(self)
  -- function num : 0_0
  self._dirTexture = {
[(self._dir).eLeft] = {123, 123, 183, 183}
, 
[(self._dir).eTop] = {62, 123, 122, 183}
, 
[(self._dir).eRight] = {184, 123, 244, 183}
, 
[(self._dir).eBottom] = {1, 123, 61, 183}
, 
[(self._dir).eLeft + (self._dir).eRight] = {62, 1, 122, 61}
, 
[(self._dir).eTop + (self._dir).eBottom] = {1, 1, 61, 61}
, 
[(self._dir).eLeft + (self._dir).eTop] = {306, 1, 366, 61}
, 
[(self._dir).eRight + (self._dir).eTop] = {245, 1, 305, 61}
, 
[(self._dir).eLeft + (self._dir).eBottom] = {184, 1, 244, 61}
, 
[(self._dir).eRight + (self._dir).eBottom] = {123, 1, 183, 61}
, 
[(self._dir).eLeft + (self._dir).eRight + (self._dir).eTop] = {123, 62, 183, 122}
, 
[(self._dir).eLeft + (self._dir).eRight + (self._dir).eBottom] = {184, 62, 244, 122}
, 
[(self._dir).eLeft + (self._dir).eTop + (self._dir).eBottom] = {62, 62, 122, 122}
, 
[(self._dir).eRight + (self._dir).eTop + (self._dir).eBottom] = {1, 62, 61, 122}
, 
[(self._dir).eLeft + (self._dir).eRight + (self._dir).eTop + (self._dir).eBottom] = {245, 62, 305, 122}
}
  self:createSlot()
  self:registEventHandler()
end

-- DECOMPILER ERROR at PC58: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_MiniGame_Find.close = function(self)
  -- function num : 0_1
  ToClient_MiniGameFindSetShow(false)
end

-- DECOMPILER ERROR at PC61: Confused about usage of register: R0 in 'UnsetPending'

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

-- DECOMPILER ERROR at PC64: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_MiniGame_Find.registEventHandler = function(self)
  -- function num : 0_3
  ((self._ui)._closeButton):addInputEvent("Mouse_LUp", "PaGlobal_MiniGame_Find:close()")
  registerEvent("FromClient_MiniGameFindSlotShow", "FromClient_MiniGameFindSlotShow")
  registerEvent("FromClient_MiniGameFindSetShow", "FromClient_MiniGameFindSetShow")
end

-- DECOMPILER ERROR at PC67: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_MiniGame_Find.clickCloseSlot = function(self, ii)
  -- function num : 0_4
  _PA_LOG("박규나_MiniGame_Find", "clickCloseSlot " .. tostring(ii))
  ToClient_MiniGameFindClick(ii)
end

-- DECOMPILER ERROR at PC70: Confused about usage of register: R0 in 'UnsetPending'

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

-- DECOMPILER ERROR at PC73: Confused about usage of register: R0 in 'UnsetPending'

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

FromClient_MiniGameFindSlotShow = function(idx, objType, value, feverGauge)
  -- function num : 0_7
  _PA_LOG("박규나_MiniGame_Find", "FromClient_MiniGameFindSlotShow " .. tostring(idx) .. " , " .. tostring(objType) .. " , " .. tostring(value))
  local self = PaGlobal_MiniGame_Find
  local slot = ((self._slots)[idx]).open
  if (self._objType).eObjectTypeEmpty == objType then
    slot:ChangeTextureInfoName("new_ui_common_forlua/window/minigame/minigame_00.dds")
    local xx1, yy1, xx2, yy2 = setTextureUV_Func(slot, 123, 184, 183, 244)
    ;
    (slot:getBaseTexture()):setUV(xx1, yy1, xx2, yy2)
    slot:setRenderTexture(slot:getBaseTexture())
  else
    do
      if (self._objType).eObjectTypeMain == objType then
        slot:ChangeTextureInfoName("new_ui_common_forlua/window/minigame/minigame_00.dds")
        local xx1, yy1, xx2, yy2 = setTextureUV_Func(slot, 1, 184, 61, 244)
        ;
        (slot:getBaseTexture()):setUV(xx1, yy1, xx2, yy2)
        slot:setRenderTexture(slot:getBaseTexture())
      else
        do
          if (self._objType).eObjectTypeSub == objType then
            local dst = (self._dirTexture)[value]
            slot:ChangeTextureInfoName("new_ui_common_forlua/window/minigame/minigame_00.dds")
            local xx1, yy1, xx2, yy2 = setTextureUV_Func(slot, dst[1], dst[2], dst[3], dst[4])
            ;
            (slot:getBaseTexture()):setUV(xx1, yy1, xx2, yy2)
            slot:setRenderTexture(slot:getBaseTexture())
          else
            do
              _PA_LOG("박규나_MiniGame_Find", "[ERROR] 에러�\188...")
              ;
              (((self._slots)[idx]).close):SetShow(false)
              ;
              (((self._slots)[idx]).open):SetShow(true)
              if feverGauge <= 0 then
                ((self._ui)._feverGauge):SetText(tostring(0))
                self:endGame()
              else
                ;
                ((self._ui)._feverGauge):SetText(tostring(feverGauge))
              end
            end
          end
        end
      end
    end
  end
end

FromClient_MiniGameFindSetShow = function(isShow, col, row)
  -- function num : 0_8
  PaGlobal_MiniGame_Find:refresh(col, row)
  Panel_MiniGame_Find:SetShow(isShow)
end

PaGlobal_MiniGame_Find:initialize()
minigamefind = function()
  -- function num : 0_9
  _PA_LOG("박규나_MiniGame_Find", "minigamefind ")
  ToClient_MiniGameFindSetShow(true)
end


