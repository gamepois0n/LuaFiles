-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\window\guild\panel_window_guildbattle.luac 

-- params : ...
-- function num : 0
Panel_Window_GuildBattle:SetShow(false)
Panel_Window_GuildBattle:setGlassBackground(true)
Panel_Window_GuildBattle:ActiveMouseEventEffect(true)
PaGlobal_GuildBattle = {
_ui = {_btn_Close = (UI.getChildControl)(Panel_Window_GuildBattle, "Button_Close"), _btn_Reservation = (UI.getChildControl)(Panel_Window_GuildBattle, "Button_Reservation"), _btn_Cancle = (UI.getChildControl)(Panel_Window_GuildBattle, "Button_ReservationCancel"), _btn_Join = (UI.getChildControl)(Panel_Window_GuildBattle, "Button_Join"), _btn_UnJoin = (UI.getChildControl)(Panel_Window_GuildBattle, "Button_UnJoin"), _btn_Start = (UI.getChildControl)(Panel_Window_GuildBattle, "Button_Start"), _edit_PriceInput = (UI.getChildControl)(Panel_Window_GuildBattle, "Edit_PriceInput")}
, _battingPrice = 0}
-- DECOMPILER ERROR at PC61: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_GuildBattle.Initialize = function(self)
  -- function num : 0_0
  ((self._ui)._edit_PriceInput):SetNumberMode(true)
end

-- DECOMPILER ERROR at PC64: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_GuildBattle.Open = function(self)
  -- function num : 0_1
  local isGuildMaster = ((getSelfPlayer()):get()):isGuildMaster()
  if isGuildMaster then
    Panel_Window_GuildBattle:SetShow(true)
  else
    Proc_ShowMessage_Ack("길드마스터만 이용 �\160 �\152 있습니다.")
  end
end

FGlobal_GuildBattle_Open = function()
  -- function num : 0_2
  PaGlobal_GuildBattle:Open()
end

-- DECOMPILER ERROR at PC69: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_GuildBattle.Close = function(self)
  -- function num : 0_3
  Panel_Window_GuildBattle:SetShow(false)
end

FGlobal_GuildBattle_Close = function()
  -- function num : 0_4
  PaGlobal_GuildBattle:Close()
end

-- DECOMPILER ERROR at PC74: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_GuildBattle.Reservation = function(self)
  -- function num : 0_5
  _PA_LOG("임승�\177", " 예약")
end

-- DECOMPILER ERROR at PC77: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_GuildBattle.Reservation_Cancel = function(self)
  -- function num : 0_6
  _PA_LOG("임승�\177", " 취소")
end

-- DECOMPILER ERROR at PC80: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_GuildBattle.Join = function(self)
  -- function num : 0_7
  _PA_LOG("임승�\177", " 입장")
end

-- DECOMPILER ERROR at PC83: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_GuildBattle.UnJoin = function(self)
  -- function num : 0_8
  _PA_LOG("임승�\177", " 퇴장")
end

-- DECOMPILER ERROR at PC86: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_GuildBattle.Start = function(self)
  -- function num : 0_9
  _PA_LOG("임승�\177", " 시작")
end

-- DECOMPILER ERROR at PC89: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_GuildBattle.SetPrice = function(self)
  -- function num : 0_10
  local setEditText = function(inputNumber)
    -- function num : 0_10_0 , upvalues : self
    ((self._ui)._edit_PriceInput):SetText(makeDotMoney(inputNumber))
    -- DECOMPILER ERROR at PC9: Confused about usage of register: R1 in 'UnsetPending'

    self._battingPrice = inputNumber
  end

  local myGuildInfo = ToClient_GetMyGuildInfoWrapper()
  local getGuildMoney = myGuildInfo:getGuildBusinessFunds_s64()
  Panel_NumberPad_Show(true, getGuildMoney, 0, setEditText)
end

-- DECOMPILER ERROR at PC92: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_GuildBattle.registMessageHandler = function(self)
  -- function num : 0_11
  ((self._ui)._btn_Close):addInputEvent("Mouse_LUp", "PaGlobal_GuildBattle:Close()")
  ;
  ((self._ui)._btn_Reservation):addInputEvent("Mouse_LUp", "PaGlobal_GuildBattle:Reservation()")
  ;
  ((self._ui)._btn_Cancle):addInputEvent("Mouse_LUp", "PaGlobal_GuildBattle:Reservation_Cancel()")
  ;
  ((self._ui)._btn_Join):addInputEvent("Mouse_LUp", "PaGlobal_GuildBattle:Join()")
  ;
  ((self._ui)._btn_UnJoin):addInputEvent("Mouse_LUp", "PaGlobal_GuildBattle:UnJoin()")
  ;
  ((self._ui)._btn_Start):addInputEvent("Mouse_LUp", "PaGlobal_GuildBattle:Start()")
  ;
  ((self._ui)._edit_PriceInput):addInputEvent("Mouse_LUp", "PaGlobal_GuildBattle:SetPrice()")
end

PaGlobal_GuildBattle:registMessageHandler()

