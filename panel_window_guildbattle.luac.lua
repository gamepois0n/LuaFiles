-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\guild\panel_window_guildbattle.luac 

-- params : ...
-- function num : 0
Panel_Window_GuildBattle:SetShow(false)
Panel_Window_GuildBattle:setGlassBackground(true)
Panel_Window_GuildBattle:ActiveMouseEventEffect(true)
PaGlobal_GuildBattle = {
_ui = {_guildBattleBG = (UI.getChildControl)(Panel_Window_Guild, "Static_Frame_GuildBattleBG"), _btn_Reservation = (UI.getChildControl)(Panel_Window_GuildBattle, "Button_Reservation"), _btn_Cancle = (UI.getChildControl)(Panel_Window_GuildBattle, "Button_ReservationCancel"), _btn_Join = (UI.getChildControl)(Panel_Window_GuildBattle, "Button_Join"), _btn_UnJoin = (UI.getChildControl)(Panel_Window_GuildBattle, "Button_UnJoin"), _btn_Start = (UI.getChildControl)(Panel_Window_GuildBattle, "Button_Start"), _txt_progress = (UI.getChildControl)(Panel_Window_GuildBattle, "Static_Text_Progress"), _txt_guildA = (UI.getChildControl)(Panel_Window_GuildBattle, "Static_Text_GuildA"), _txt_guildB = (UI.getChildControl)(Panel_Window_GuildBattle, "Static_Text_GuildB"), _txt_guildAScore = (UI.getChildControl)(Panel_Window_GuildBattle, "Static_Text_GuildAScore"), _txt_guildBScore = (UI.getChildControl)(Panel_Window_GuildBattle, "Static_Text_GuildBScore"), _edit_PriceInput = (UI.getChildControl)(Panel_Window_GuildBattle, "Edit_PriceInput")}
, _battingPrice = 0}
-- DECOMPILER ERROR at PC91: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_GuildBattle.Initialize = function(self)
  -- function num : 0_0
  ((self._ui)._guildBattleBG):MoveChilds(((self._ui)._guildBattleBG):GetID(), Panel_Window_GuildBattle)
  ;
  (UI.deletePanel)(Panel_Window_GuildBattle:GetID())
  Panel_Window_GuildBattle = nil
  ;
  ((self._ui)._edit_PriceInput):SetNumberMode(true)
  ;
  ((self._ui)._edit_PriceInput):SetPosY(200)
  ;
  ((self._ui)._txt_guildA):SetText("예약중인 길드�\128 없습니다")
  ;
  ((self._ui)._txt_guildB):SetText("예약중인 길드�\128 없습니다")
end

-- DECOMPILER ERROR at PC94: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_GuildBattle.Open = function(self)
  -- function num : 0_1
  self:SetProgressServer()
  ToClient_GuildBattleInfoUpdate()
  ;
  ((self._ui)._guildBattleBG):SetShow(true)
end

FGlobal_GuildBattle_Open = function()
  -- function num : 0_2
  PaGlobal_GuildBattle:Open()
end

-- DECOMPILER ERROR at PC99: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_GuildBattle.Close = function(self)
  -- function num : 0_3
  ((self._ui)._guildBattleBG):SetShow(false)
end

FGlobal_GuildBattle_Close = function()
  -- function num : 0_4
  PaGlobal_GuildBattle:Close()
end

-- DECOMPILER ERROR at PC104: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_GuildBattle.Reservation = function(self)
  -- function num : 0_5
  ToClient_ReserveGuildBattle(self._battingPrice)
end

-- DECOMPILER ERROR at PC107: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_GuildBattle.Reservation_Cancel = function(self)
  -- function num : 0_6
  ToClient_CancelGuildBattle()
end

-- DECOMPILER ERROR at PC110: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_GuildBattle.Join = function(self)
  -- function num : 0_7
  ToClient_JoinGuildBattle()
end

-- DECOMPILER ERROR at PC113: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_GuildBattle.UnJoin = function(self)
  -- function num : 0_8
  ToClient_UnjoinGuildBattle()
end

-- DECOMPILER ERROR at PC116: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_GuildBattle.Start = function(self)
  -- function num : 0_9
  ToClient_startGuildBattle()
end

-- DECOMPILER ERROR at PC119: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_GuildBattle.SetPrice = function(self)
  -- function num : 0_10
  local setEditText = function(inputNumber)
    -- function num : 0_10_0 , upvalues : self
    ((self._ui)._edit_PriceInput):SetText(makeDotMoney(inputNumber))
    -- DECOMPILER ERROR at PC12: Confused about usage of register: R1 in 'UnsetPending'

    self._battingPrice = Int64toInt32(inputNumber)
  end

  local myGuildInfo = ToClient_GetMyGuildInfoWrapper()
  local getGuildMoney = myGuildInfo:getGuildBusinessFunds_s64()
  Panel_NumberPad_Show(true, getGuildMoney, 0, setEditText)
end

-- DECOMPILER ERROR at PC122: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_GuildBattle.SetProgressServer = function(self)
  -- function num : 0_11
  progress = ToClient_getMyGuildBattleServer()
  if progress == nil then
    progress = "결전�\180 진행중이 아닙니다."
  end
  ;
  ((self._ui)._txt_progress):SetText(progress)
end

-- DECOMPILER ERROR at PC125: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_GuildBattle.UpdateGuildBattleInfo = function(self)
  -- function num : 0_12
  local guildA = ToClient_getCurrentServerGuildBattleInfo(0)
  local guildB = ToClient_getCurrentServerGuildBattleInfo(1)
  local betting = ToClient_guildBattleBetting()
  if guildA ~= nil then
    local name = guildA:getName()
    local rating = guildA:getRating()
    ;
    ((self._ui)._txt_guildA):SetText(name)
    ;
    ((self._ui)._txt_guildAScore):SetText(tostring(rating))
  else
    do
      ;
      ((self._ui)._txt_guildA):SetText("예약중인 길드�\128 없습니다")
      if guildB ~= nil then
        local name = guildB:getName()
        local rating = guildB:getRating()
        ;
        ((self._ui)._txt_guildB):SetText(name)
        ;
        ((self._ui)._txt_guildBScore):SetText(tostring(rating))
      else
        do
          ;
          ((self._ui)._txt_guildB):SetText("예약중인 길드�\128 없습니다")
          if betting ~= 0 then
            ((self._ui)._edit_PriceInput):SetText(makeDotMoney(betting))
            self._battingPrice = Int64toInt32(betting)
            ;
            ((self._ui)._edit_PriceInput):SetIgnore(true)
          else
            ;
            ((self._ui)._edit_PriceInput):SetText(makeDotMoney(0))
            self._battingPrice = Int64toInt32(0)
            ;
            ((self._ui)._edit_PriceInput):SetIgnore(false)
          end
        end
      end
    end
  end
end

-- DECOMPILER ERROR at PC128: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_GuildBattle.registMessageHandler = function(self)
  -- function num : 0_13
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

FromClient_ReserveGuildBattleSuccess = function()
  -- function num : 0_14
  PaGlobal_GuildBattle:SetProgressServer()
  ToClient_GuildBattleInfoUpdate()
end

FromClient_responseRequestGuildBattleInfo = function()
  -- function num : 0_15
  PaGlobal_GuildBattle:UpdateGuildBattleInfo()
end

registerEvent("FromClient_responseRequestGuildBattleInfo", "FromClient_responseRequestGuildBattleInfo")
registerEvent("FromClient_ReserveGuildBattleSuccess", "FromClient_ReserveGuildBattleSuccess")
PaGlobal_GuildBattle:registMessageHandler()
PaGlobal_GuildBattle:Initialize()

