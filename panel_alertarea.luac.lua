-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\widget\z_alertarea\panel_alertarea.luac 

-- params : ...
-- function num : 0
Panel_AlertArea:SetShow(false)
Panel_AlertArea:setMaskingChild(true)
Panel_AlertArea:setGlassBackground(true)
Panel_AlertArea:SetDragAll(true)
PaGlobal_AlertArea = {
_ui = {_bg = (UI.getChildControl)(Panel_AlertArea, "Static_Bg"), 
_button = {}
, 
_textCount = {}
}
, 
_buttonType = {_spread = 0, _hunting = 1, _busterCall = 2, _warCall = 3, _summonParty = 4, _returnTown = 5, _coupon = 6, _learnableSkill = 7, _newStoryKnowledge = 8, _newKnowledge = 9, _blackSpirit = 10, _mail = 11, _challengeReward = 12, _pcRoomReward = 13, _batterEquipment = 14, _weightOver = 15, _endurancePc = 16, _enduranceHorse = 17, _enduranceCarriage = 18, _enduranceShip = 19, _count = 20}
, 
_isShowButton = {}
, 
_showControl = {}
, 
_tooltip = {}
, _isControlHide = false, 
_huntingMsg = {}
, _storyKnowledgeCount = 0, _normalKnowledgeCount = 0, _showCount = 0}
-- DECOMPILER ERROR at PC288: Confused about usage of register: R0 in 'UnsetPending'

;
(PaGlobal_AlertArea._ui)._button = {[(PaGlobal_AlertArea._buttonType)._spread] = (UI.getChildControl)((PaGlobal_AlertArea._ui)._bg, "Button_Spread"), [(PaGlobal_AlertArea._buttonType)._hunting] = (UI.getChildControl)((PaGlobal_AlertArea._ui)._bg, "Button_Hunting"), [(PaGlobal_AlertArea._buttonType)._busterCall] = (UI.getChildControl)((PaGlobal_AlertArea._ui)._bg, "Button_GuildBusterCall"), [(PaGlobal_AlertArea._buttonType)._warCall] = (UI.getChildControl)((PaGlobal_AlertArea._ui)._bg, "Button_SiegeWarCall"), [(PaGlobal_AlertArea._buttonType)._summonParty] = (UI.getChildControl)((PaGlobal_AlertArea._ui)._bg, "Button_PartySummon"), [(PaGlobal_AlertArea._buttonType)._returnTown] = (UI.getChildControl)((PaGlobal_AlertArea._ui)._bg, "Button_ReturnTown"), [(PaGlobal_AlertArea._buttonType)._coupon] = (UI.getChildControl)((PaGlobal_AlertArea._ui)._bg, "Button_Coupon"), [(PaGlobal_AlertArea._buttonType)._learnableSkill] = (UI.getChildControl)((PaGlobal_AlertArea._ui)._bg, "Button_LearnSkill"), [(PaGlobal_AlertArea._buttonType)._newStoryKnowledge] = (UI.getChildControl)((PaGlobal_AlertArea._ui)._bg, "Button_NewStoryKnowledge"), [(PaGlobal_AlertArea._buttonType)._newKnowledge] = (UI.getChildControl)((PaGlobal_AlertArea._ui)._bg, "Button_NewKnowledge"), [(PaGlobal_AlertArea._buttonType)._blackSpirit] = (UI.getChildControl)((PaGlobal_AlertArea._ui)._bg, "Button_BlackSpirit"), [(PaGlobal_AlertArea._buttonType)._mail] = (UI.getChildControl)((PaGlobal_AlertArea._ui)._bg, "Button_Mail"), [(PaGlobal_AlertArea._buttonType)._challengeReward] = (UI.getChildControl)((PaGlobal_AlertArea._ui)._bg, "Button_ChallengeReward"), [(PaGlobal_AlertArea._buttonType)._pcRoomReward] = (UI.getChildControl)((PaGlobal_AlertArea._ui)._bg, "Button_PcRoomReward"), [(PaGlobal_AlertArea._buttonType)._weightOver] = (UI.getChildControl)((PaGlobal_AlertArea._ui)._bg, "Button_WeightOver"), [(PaGlobal_AlertArea._buttonType)._endurancePc] = (UI.getChildControl)((PaGlobal_AlertArea._ui)._bg, "Button_EndurancePc"), [(PaGlobal_AlertArea._buttonType)._enduranceHorse] = (UI.getChildControl)((PaGlobal_AlertArea._ui)._bg, "Button_EnduranceHorse"), [(PaGlobal_AlertArea._buttonType)._enduranceCarriage] = (UI.getChildControl)((PaGlobal_AlertArea._ui)._bg, "Button_EnduranceCarriage"), [(PaGlobal_AlertArea._buttonType)._enduranceShip] = (UI.getChildControl)((PaGlobal_AlertArea._ui)._bg, "Button_EnduranceShip"), [(PaGlobal_AlertArea._buttonType)._batterEquipment] = (UI.getChildControl)((PaGlobal_AlertArea._ui)._bg, "Button_BatterEquipment")}
-- DECOMPILER ERROR at PC367: Confused about usage of register: R0 in 'UnsetPending'

;
(PaGlobal_AlertArea._ui)._textCount = {[(PaGlobal_AlertArea._buttonType)._hunting] = (UI.getChildControl)(((PaGlobal_AlertArea._ui)._button)[(PaGlobal_AlertArea._buttonType)._hunting], "StaticText_Count"), [(PaGlobal_AlertArea._buttonType)._coupon] = (UI.getChildControl)(((PaGlobal_AlertArea._ui)._button)[(PaGlobal_AlertArea._buttonType)._coupon], "StaticText_Count"), [(PaGlobal_AlertArea._buttonType)._learnableSkill] = (UI.getChildControl)(((PaGlobal_AlertArea._ui)._button)[(PaGlobal_AlertArea._buttonType)._learnableSkill], "StaticText_Count"), [(PaGlobal_AlertArea._buttonType)._newStoryKnowledge] = (UI.getChildControl)(((PaGlobal_AlertArea._ui)._button)[(PaGlobal_AlertArea._buttonType)._newStoryKnowledge], "StaticText_Count"), [(PaGlobal_AlertArea._buttonType)._newKnowledge] = (UI.getChildControl)(((PaGlobal_AlertArea._ui)._button)[(PaGlobal_AlertArea._buttonType)._newKnowledge], "StaticText_Count")}
-- DECOMPILER ERROR at PC370: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_AlertArea.Init = function(self)
  -- function num : 0_0
  for index = 0, (self._buttonType)._count - 1 do
    (((self._ui)._button)[index]):addInputEvent("Mouse_LUp", "PaGlobal_AlertArea:LClickFunc(" .. index .. ")")
    ;
    (((self._ui)._button)[index]):addInputEvent("Mouse_RUp", "PaGlobal_AlertArea:RClickFunc(" .. index .. ")")
    ;
    (((self._ui)._button)[index]):addInputEvent("Mouse_On", "PaGlobal_AlertArea:OverEvent(" .. index .. ")")
    ;
    (((self._ui)._button)[index]):addInputEvent("Mouse_Out", "PaGlobal_AlertArea:OutEvent(" .. index .. ")")
    -- DECOMPILER ERROR at PC51: Confused about usage of register: R5 in 'UnsetPending'

    ;
    (self._isShowButton)[index] = index == 0
    ;
    (((self._ui)._button)[index]):SetShow((self._isShowButton)[index])
  end
  -- DECOMPILER ERROR: 1 unprocessed JMP targets
end

-- DECOMPILER ERROR at PC373: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_AlertArea.Update = function(self)
  -- function num : 0_1
  self._showControl = {}
  do
    local showCount = 0
    for index = 0, (self._buttonType)._count - 1 do
      if (self._isShowButton)[index] then
        (((self._ui)._button)[index]):SetPosX(((self._ui)._bg):GetPosX() - ((((self._ui)._button)[index]):GetSizeX() + 2) * showCount)
        -- DECOMPILER ERROR at PC34: Confused about usage of register: R6 in 'UnsetPending'

        ;
        (self._showControl)[showCount] = ((self._ui)._button)[index]
        ;
        (((self._ui)._button)[index]):EraseAllEffect()
        if (self._buttonType)._batterEquipment == index then
          (((self._ui)._button)[index]):AddEffect("fUI_BetterItemAura01", true, -9, 0)
        end
        if (self._buttonType)._hunting == index then
          (((self._ui)._textCount)[index]):SetShow(false)
        end
        do
          if (self._buttonType)._learnableSkill == index then
            local skillCount = FGlobal_EnableSkillReturn()
            ;
            (((self._ui)._textCount)[index]):SetText(skillCount)
          end
          do
            if (self._buttonType)._coupon == index then
              local count = ToClient_GetCouponInfoUsableCount()
              ;
              (((self._ui)._textCount)[index]):SetText(count)
            end
            do
              if (self._buttonType)._newStoryKnowledge == index then
                local count = self._storyKnowledgeCount
                ;
                (((self._ui)._textCount)[index]):SetText(count)
              end
              do
                do
                  if (self._buttonType)._newKnowledge == index then
                    local count = self._normalKnowledgeCount
                    ;
                    (((self._ui)._textCount)[index]):SetText(count)
                  end
                  showCount = showCount + 1
                  -- DECOMPILER ERROR at PC110: LeaveBlock: unexpected jumping out DO_STMT

                  -- DECOMPILER ERROR at PC110: LeaveBlock: unexpected jumping out DO_STMT

                  -- DECOMPILER ERROR at PC110: LeaveBlock: unexpected jumping out DO_STMT

                  -- DECOMPILER ERROR at PC110: LeaveBlock: unexpected jumping out DO_STMT

                  -- DECOMPILER ERROR at PC110: LeaveBlock: unexpected jumping out IF_THEN_STMT

                  -- DECOMPILER ERROR at PC110: LeaveBlock: unexpected jumping out IF_STMT

                end
              end
            end
          end
        end
      end
    end
    self._showCount = showCount
    Panel_AlertArea:SetShow(showCount > 0)
    -- DECOMPILER ERROR: 1 unprocessed JMP targets
  end
end

-- DECOMPILER ERROR at PC376: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_AlertArea.LClickFunc = function(self, index)
  -- function num : 0_2
  -- DECOMPILER ERROR at PC10: Unhandled construct in 'MakeBoolean' P1

  if (self._buttonType)._spread == index and #self._showControl > 0 then
    self:Spread_Animation(self._isControlHide)
    self._isControlHide = not self._isControlHide
  end
  if (self._buttonType)._hunting ~= index or (self._buttonType)._busterCall == index then
    ToClient_RequestTeleportGuildBustCall()
  else
    if (self._buttonType)._warCall == index then
      ToClient_RequestTeleportToSiegeTentCall()
    else
      if (self._buttonType)._summonParty == index then
        local remainTime_s64 = ToClient_GetLeftUsableTeleportCompassTime()
        local remainTime = Int64toInt32(remainTime_s64)
        if remainTime > 0 then
          if IsSelfPlayerWaitAction() then
            ToClient_RequestTeleportPosUseCompass()
          else
            Proc_ShowMessage_Ack(Defines.StringSheet_GAME, "LUA_ALERTAREA_NOTUSEALERT")
          end
        end
      else
        do
          if (self._buttonType)._returnTown == index then
            local remainTime_s64 = ToClient_GetLeftReturnStoneTime()
            local remainTime = Int64toInt32(remainTime_s64)
            local returnPos3D = ToClient_GetPosUseReturnStone()
            local regionInfo = getRegionInfoByPosition(returnPos3D)
            if remainTime > 0 then
              if IsSelfPlayerWaitAction() then
                ToClient_RequestTeleportPosUseReturnStone()
              else
                Proc_ShowMessage_Ack(Defines.StringSheet_GAME, "LUA_ALERTAREA_NOTUSEALERT")
              end
            end
          else
            do
              if (self._buttonType)._coupon == index then
                IngameCashShopCoupon_Open()
              else
                if (self._buttonType)._learnableSkill == index then
                  HandleMLUp_SkillWindow_OpenForLearn()
                else
                  if (self._buttonType)._newStoryKnowledge == index then
                    HandleClicked_ShowNewKnowledgePopup(1)
                  else
                    if (self._buttonType)._newKnowledge == index then
                      HandleClicked_ShowNewKnowledgePopup(0)
                    else
                      if (self._buttonType)._blackSpirit == index then
                        GlobalKeyBinder_MouseKeyMap((CppEnums.UiInputType).UiInputType_BlackSpirit)
                      else
                        if (self._buttonType)._mail == index then
                          GlobalKeyBinder_MouseKeyMap((CppEnums.UiInputType).UiInputType_Mail)
                        else
                          if (self._buttonType)._challengeReward == index then
                            if Panel_Window_CharInfo_Status:GetShow() then
                              Panel_Window_CharInfo_Status:SetShow(false, true)
                            else
                              Panel_Window_CharInfo_Status:SetShow(true, true)
                              audioPostEvent_SystemUi(1, 34)
                              HandleClicked_CharacterInfo_Tab(3)
                              HandleClickedTapButton(5)
                            end
                          else
                            if (self._buttonType)._pcRoomReward == index then
                              HandleClicked_PcRoomJackPotBox()
                            else
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end
              if (((((self._buttonType)._weightOver ~= index or (self._buttonType)._endurancePc == index) and (self._buttonType)._enduranceHorse ~= index) or (self._buttonType)._enduranceCarriage == index) and (self._buttonType)._enduranceShip ~= index) or (self._buttonType)._batterEquipment == index then
                GlobalKeyBinder_MouseKeyMap((CppEnums.UiInputType).UiInputType_Inventory)
              end
            end
          end
        end
      end
    end
  end
end

-- DECOMPILER ERROR at PC379: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_AlertArea.RClickFunc = function(self, index)
  -- function num : 0_3
  if ((((((((((((((((((((self._buttonType)._spread ~= index or (self._buttonType)._hunting == index) and (self._buttonType)._busterCall ~= index) or (self._buttonType)._warCall == index) and (self._buttonType)._summonParty ~= index) or (self._buttonType)._returnTown == index) and (self._buttonType)._coupon ~= index) or (self._buttonType)._learnableSkill == index) and (self._buttonType)._newStoryKnowledge ~= index) or (self._buttonType)._newKnowledge == index) and (self._buttonType)._blackSpirit ~= index) or (self._buttonType)._mail == index) and (self._buttonType)._challengeReward ~= index) or (self._buttonType)._pcRoomReward == index) and (self._buttonType)._weightOver ~= index) or (self._buttonType)._endurancePc == index) and (self._buttonType)._enduranceHorse ~= index) or (self._buttonType)._enduranceCarriage == index) and (self._buttonType)._enduranceShip ~= index) or (self._buttonType)._batterEquipment == index) then
  end
end

-- DECOMPILER ERROR at PC382: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_AlertArea.OverEvent = function(self, index)
  -- function num : 0_4
  if (self._buttonType)._spread == index and self._isControlHide then
    if (self._buttonType)._hunting == index then
      TooltipSimple_Show(((self._ui)._button)[index], (self._huntingMsg).name, (self._huntingMsg).desc)
    else
      if (self._buttonType)._busterCall == index then
        local regionInfoWrapper = ToClient_getRegionInfoWrapperByPosition(ToClient_GetGuildBustCallPos())
        if regionInfoWrapper == nil then
          return 
        end
        local areaName = regionInfoWrapper:getAreaName()
        local usableTime64 = ToClient_GetGuildBustCallTime()
        local name = PAGetString(Defines.StringSheet_GAME, "LUA_MOVIEGUIDE_BUSTERCALL_TOOLTIP_NAME")
        local desc = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_MOVIEGUIDE_BUSTERCALL_TOOLTIP_DESC", "areaName", areaName, "time", convertStringFromDatetime(getLeftSecond_TTime64(usableTime64)))
        registTooltipControl(((self._ui)._button)[index], Panel_Tooltip_SimpleText)
        TooltipSimple_Show(((self._ui)._button)[index], name, desc)
      else
        do
          if (self._buttonType)._warCall == index then
            local regionInfoWrapper = ToClient_getRegionInfoWrapperByPosition(ToClient_GetTeleportToSiegeTentPos())
            if regionInfoWrapper == nil then
              return 
            end
            local areaName = regionInfoWrapper:getAreaName()
            local usableTime64 = ToClient_GetTeleportToSiegeTentTime()
            local descStr = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_MOVIEGUIDE_BUSTERCALL_TOOLTIP_DESC", "areaName", areaName, "time", convertStringFromDatetime(getLeftSecond_TTime64(usableTime64)))
            if _isVolunteer then
              descStr = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_MOVIEGUIDE_BUSTERCALL_TOOLTIP_DESC2", "time", convertStringFromDatetime(getLeftSecond_TTime64(usableTime64)))
            else
              descStr = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_MOVIEGUIDE_BUSTERCALL_TOOLTIP_DESC", "areaName", areaName, "time", convertStringFromDatetime(getLeftSecond_TTime64(usableTime64)))
            end
            local name, desc, uiControl = PAGetString(Defines.StringSheet_GAME, "LUA_WARCALL_TOOLTIP_NAME"), descStr, ((self._ui)._button)[index]
            registTooltipControl(uiControl, Panel_Tooltip_SimpleText)
            TooltipSimple_Show(uiControl, name, desc)
          else
            do
              if (self._buttonType)._summonParty == index then
                local partyActorKey = ToClient_GetCharacterActorKeyRawUseCompass()
                local playerActorKey = (getSelfPlayer()):getActorKey()
                local descStr = ""
                local usableTime64 = ToClient_GetLeftUsableTeleportCompassTime()
                if partyActorKey == playerActorKey then
                  descStr = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_COMPASS_DESC_1", "remainTime", convertStringFromDatetime(usableTime64))
                else
                  descStr = PAGetStringParam3(Defines.StringSheet_GAME, "LUA_COMPASS_DESC_2", "partyName", partyName, "partyName1", partyName, "remainTime", convertStringFromDatetime(usableTime64))
                end
                local name, desc, uiControl = PAGetString(Defines.StringSheet_GAME, "LUA_COMPASS_NAME"), descStr, ((self._ui)._button)[index]
                registTooltipControl(uiControl, Panel_Tooltip_SimpleText)
                TooltipSimple_Show(uiControl, name, desc)
              else
                do
                  if (self._buttonType)._returnTown == index then
                    local returnPos3D = ToClient_GetPosUseReturnStone()
                    local regionInfo = getRegionInfoByPosition(returnPos3D)
                    local regionName = ""
                    if regionInfo ~= nil then
                      regionName = regionInfo:getAreaName()
                    end
                    local returnTownRegionKey = ToClient_GetReturnStoneTownRegionKey()
                    local usableTime64 = ToClient_GetLeftReturnStoneTime()
                    local descStr = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_RETURNSTONE_DESC", "regionName", regionName, "remainTime", convertStringFromDatetime(usableTime64))
                    local name, desc, uiControl = PAGetString(Defines.StringSheet_GAME, "LUA_RETURNSTONE_NAME"), descStr, ((self._ui)._button)[index]
                    registTooltipControl(uiControl, Panel_Tooltip_SimpleText)
                    TooltipSimple_Show(uiControl, name, desc)
                  else
                    do
                      if (self._buttonType)._coupon == index then
                        local count = ToClient_GetCouponInfoUsableCount()
                        local name = PAGetString(Defines.StringSheet_GAME, "LUA_ALERTAREA_TOOLTIP_COUPONTITLE")
                        local desc = PAGetString(Defines.StringSheet_GAME, "LUA_ALERTAREA_TOOLTIP_COUPONDESC")
                        registTooltipControl(((self._ui)._button)[index], Panel_Tooltip_SimpleText)
                        TooltipSimple_Show(((self._ui)._button)[index], name, desc)
                      else
                        do
                          if (self._buttonType)._learnableSkill == index then
                            local skillCount = FGlobal_EnableSkillReturn()
                            local name = PAGetString(Defines.StringSheet_GAME, "LUA_ALERTAREA_TOOLTIP_SKILLTITLE")
                            local desc = PAGetString(Defines.StringSheet_GAME, "LUA_ALERTAREA_TOOLTIP_SKILLDESC")
                            registTooltipControl(((self._ui)._button)[index], Panel_Tooltip_SimpleText)
                            TooltipSimple_Show(((self._ui)._button)[index], name, desc)
                          else
                            do
                              if (self._buttonType)._newStoryKnowledge == index then
                                local name = PAGetString(Defines.StringSheet_GAME, "LUA_ALERTAREA_TOOLTIP_IMPORTANTKNOWLEDGETITLE")
                                local desc = PAGetString(Defines.StringSheet_GAME, "LUA_ALERTAREA_TOOLTIP_IMPORTANTKNOWLEDGEDESC")
                                registTooltipControl(((self._ui)._button)[index], Panel_Tooltip_SimpleText)
                                TooltipSimple_Show(((self._ui)._button)[index], name, desc)
                              else
                                do
                                  if (self._buttonType)._newKnowledge == index then
                                    local name = PAGetString(Defines.StringSheet_GAME, "LUA_ALERTAREA_TOOLTIP_NORMALKNOWLEDGETITLE")
                                    local desc = PAGetString(Defines.StringSheet_GAME, "LUA_ALERTAREA_TOOLTIP_IMPORTANTKNOWLEDGEDESC")
                                    registTooltipControl(((self._ui)._button)[index], Panel_Tooltip_SimpleText)
                                    TooltipSimple_Show(((self._ui)._button)[index], name, desc)
                                  else
                                    do
                                      if (self._buttonType)._blackSpirit == index then
                                        local name = PAGetString(Defines.StringSheet_GAME, "LUA_ALERTAREA_TOOLTIP_BLACKSPIRITTITLE")
                                        local desc = PAGetString(Defines.StringSheet_GAME, "LUA_ALERTAREA_TOOLTIP_BLACKSPIRITDESC")
                                        registTooltipControl(((self._ui)._button)[index], Panel_Tooltip_SimpleText)
                                        TooltipSimple_Show(((self._ui)._button)[index], name, desc)
                                      else
                                        do
                                          if (self._buttonType)._mail == index then
                                            local name = PAGetString(Defines.StringSheet_GAME, "LUA_ALERTAREA_TOOLTIP_MAILTITLE")
                                            local desc = PAGetString(Defines.StringSheet_GAME, "LUA_ALERTAREA_TOOLTIP_MAILDESC")
                                            registTooltipControl(((self._ui)._button)[index], Panel_Tooltip_SimpleText)
                                            TooltipSimple_Show(((self._ui)._button)[index], name, desc)
                                          else
                                            do
                                              if (self._buttonType)._challengeReward == index then
                                                local name = PAGetString(Defines.StringSheet_GAME, "LUA_ALERTAREA_TOOLTIP_CHALLENGETITLE")
                                                local desc = PAGetString(Defines.StringSheet_GAME, "LUA_ALERTAREA_TOOLTIP_CHALLENGEDESC")
                                                registTooltipControl(((self._ui)._button)[index], Panel_Tooltip_SimpleText)
                                                TooltipSimple_Show(((self._ui)._button)[index], name, desc)
                                              else
                                                do
                                                  if (self._buttonType)._pcRoomReward == index then
                                                    local name = PAGetString(Defines.StringSheet_GAME, "LUA_ALERTAREA_TOOLTIP_PCROOMTITLE")
                                                    local desc = PAGetString(Defines.StringSheet_GAME, "LUA_ALERTAREA_TOOLTIP_PCROOMDESC")
                                                    registTooltipControl(((self._ui)._button)[index], Panel_Tooltip_SimpleText)
                                                    TooltipSimple_Show(((self._ui)._button)[index], name, desc)
                                                  else
                                                    do
                                                      if (self._buttonType)._weightOver == index then
                                                        local name = PAGetString(Defines.StringSheet_GAME, "LUA_ALERTAREA_TOOLTIP_WIGHTOVERTITLE")
                                                        local desc = PAGetString(Defines.StringSheet_GAME, "LUA_ALERTAREA_TOOLTIP_WIGHTOVERDESC")
                                                        registTooltipControl(((self._ui)._button)[index], Panel_Tooltip_SimpleText)
                                                        TooltipSimple_Show(((self._ui)._button)[index], name, desc)
                                                      else
                                                        do
                                                          if (self._buttonType)._endurancePc == index then
                                                            Panel_Endurance:SetShow(true)
                                                            Panel_Endurance:SetPosX(Panel_AlertArea:GetPosX() + (((self._ui)._button)[index]):GetPosX() - Panel_Endurance:GetSizeX() / 3)
                                                            Panel_Endurance:SetPosY(Panel_AlertArea:GetPosY() - Panel_Endurance:GetSizeY() - 10)
                                                          else
                                                            if (self._buttonType)._enduranceHorse == index then
                                                              Panel_HorseEndurance:SetShow(true)
                                                              Panel_HorseEndurance:SetPosX(Panel_AlertArea:GetPosX() + (((self._ui)._button)[index]):GetPosX() - Panel_HorseEndurance:GetSizeX() / 3)
                                                              Panel_HorseEndurance:SetPosY(Panel_AlertArea:GetPosY() - Panel_HorseEndurance:GetSizeY() - 10)
                                                            else
                                                              if (self._buttonType)._enduranceCarriage == index then
                                                                Panel_CarriageEndurance:SetShow(true)
                                                                Panel_CarriageEndurance:SetPosX(Panel_AlertArea:GetPosX() + (((self._ui)._button)[index]):GetPosX() - Panel_CarriageEndurance:GetSizeX() / 3)
                                                                Panel_CarriageEndurance:SetPosY(Panel_AlertArea:GetPosY() - Panel_CarriageEndurance:GetSizeY() - 10)
                                                              else
                                                                if (self._buttonType)._enduranceShip == index then
                                                                  Panel_ShipEndurance:SetShow(true)
                                                                  Panel_ShipEndurance:SetPosX(Panel_AlertArea:GetPosX() + (((self._ui)._button)[index]):GetPosX() - Panel_ShipEndurance:GetSizeX() / 3)
                                                                  Panel_ShipEndurance:SetPosY(Panel_AlertArea:GetPosY() - Panel_ShipEndurance:GetSizeY() - 10)
                                                                else
                                                                  if (self._buttonType)._batterEquipment == index then
                                                                    Panel_NewEquip:SetShow(true)
                                                                    Panel_NewEquip:SetPosX(Panel_AlertArea:GetPosX() + (((self._ui)._button)[index]):GetPosX() - 50)
                                                                    Panel_NewEquip:SetPosY(Panel_AlertArea:GetPosY() - 50)
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

-- DECOMPILER ERROR at PC385: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_AlertArea.OutEvent = function(self, index)
  -- function num : 0_5
  TooltipSimple_Hide()
  Panel_NewEquip:SetShow(false)
  Panel_Endurance:SetShow(false)
  Panel_HorseEndurance:SetShow(false)
  Panel_CarriageEndurance:SetShow(false)
  Panel_ShipEndurance:SetShow(false)
end

-- DECOMPILER ERROR at PC388: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_AlertArea.Spread_Animation = function(self, isHide)
  -- function num : 0_6
  local self = PaGlobal_AlertArea
  local rotateAni = ((self._showControl)[0]):addRotateAnimation(0, 0.3, (CppEnums.PAUI_ANIM_ADVANCE_TYPE).PAUI_ANIM_ADVANCE_COS_HALF_PI)
  rotateAni:SetStartRotate(0)
  rotateAni:SetEndRotate(0)
  rotateAni:SetRotateCount(1)
  if isHide then
    for index = 1, self._showCount - 1 do
      local control = (self._showControl)[index]
      local MoveAni = control:addMoveAnimation(0, 0.3, (CppEnums.PAUI_ANIM_ADVANCE_TYPE).PAUI_ANIM_ADVANCE_COS_HALF_PI)
      MoveAni:SetStartPosition(0, 0)
      MoveAni:SetEndPosition((control:GetSizeX() + 2) * index * -1, 0)
      control:SetShow(true)
    end
  else
    do
      for index = 1, self._showCount - 1 do
        local control = (self._showControl)[index]
        local MoveAni = control:addMoveAnimation(0, 0.3, (CppEnums.PAUI_ANIM_ADVANCE_TYPE).PAUI_ANIM_ADVANCE_SIN_HALF_PI)
        MoveAni:SetStartPosition(control:GetPosX(), 0)
        MoveAni:SetEndPosition(0, 0)
        MoveAni:SetHideAtEnd(true)
        MoveAni:SetDisableWhileAni(true)
      end
    end
  end
end

-- DECOMPILER ERROR at PC391: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_AlertArea.ButtonShow = function(self, buttonType, isShow)
  -- function num : 0_7
  -- DECOMPILER ERROR at PC1: Confused about usage of register: R3 in 'UnsetPending'

  (self._isShowButton)[buttonType] = isShow
  if isShow then
    (((self._ui)._button)[buttonType]):SetShow(not self._isControlHide)
    ;
    (((self._ui)._button)[buttonType]):SetVertexAniRun("Ani_Color_New", true)
    self:Update()
  end
end

local msg = {name, desc}
local huntingButtonShow = false
-- DECOMPILER ERROR at PC401: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_AlertArea.HuntingCountCheck = function(self)
  -- function num : 0_8 , upvalues : msg, huntingButtonShow
  -- DECOMPILER ERROR at PC1: Confused about usage of register: R1 in 'UnsetPending'

  msg.name = ""
  -- DECOMPILER ERROR at PC3: Confused about usage of register: R1 in 'UnsetPending'

  msg.desc = ""
  local whaleCount = ToClient_worldmapActorManagerGetActorRegionList(2)
  if whaleCount > 0 then
    for index = 0, whaleCount - 1 do
      local areaName = ToClient_worldmapActorManagerGetActorRegionByIndex(index)
      local count = ToClient_worldmapActorManagerGetActorCountByIndex(index)
      -- DECOMPILER ERROR at PC38: Confused about usage of register: R8 in 'UnsetPending'

      if areaName ~= nil then
        if index == 0 then
          msg.desc = msg.desc .. PAGetStringParam2(Defines.StringSheet_GAME, "LUA_MOVIEGUIDE_WHALE_FIND", "areaName", tostring(areaName), "count", count)
        else
          -- DECOMPILER ERROR at PC56: Confused about usage of register: R8 in 'UnsetPending'

          msg.desc = msg.desc .. "\n" .. PAGetStringParam2(Defines.StringSheet_GAME, "LUA_MOVIEGUIDE_WHALE_FIND", "areaName", tostring(areaName), "count", count)
        end
      end
    end
    -- DECOMPILER ERROR at PC64: Confused about usage of register: R2 in 'UnsetPending'

    msg.name = PAGetString(Defines.StringSheet_GAME, "LUA_MOVIEGUIDE_WHALE_FIND_NAME")
  end
  local gargoyleCount = ToClient_worldmapActorManagerGetActorRegionList(3)
  if gargoyleCount > 0 then
    for index = 0, gargoyleCount - 1 do
      local areaName = ToClient_worldmapActorManagerGetActorRegionByIndex(index)
      local count = ToClient_worldmapActorManagerGetActorCountByIndex(index)
      -- DECOMPILER ERROR at PC102: Confused about usage of register: R9 in 'UnsetPending'

      if areaName ~= nil then
        if index == 0 then
          if whaleCount > 0 then
            msg.desc = msg.desc .. "\n" .. PAGetStringParam2(Defines.StringSheet_GAME, "LUA_MOVIEGUIDE_HUNTING_GARGOYLE", "areaName", tostring(areaName), "count", count)
          else
            -- DECOMPILER ERROR at PC119: Confused about usage of register: R9 in 'UnsetPending'

            msg.desc = msg.desc .. PAGetStringParam2(Defines.StringSheet_GAME, "LUA_MOVIEGUIDE_HUNTING_GARGOYLE", "areaName", tostring(areaName), "count", count)
          end
        else
          -- DECOMPILER ERROR at PC137: Confused about usage of register: R9 in 'UnsetPending'

          msg.desc = msg.desc .. "\n" .. PAGetStringParam2(Defines.StringSheet_GAME, "LUA_MOVIEGUIDE_HUNTING_GARGOYLE", "areaName", tostring(areaName), "count", count)
        end
      end
    end
    -- DECOMPILER ERROR at PC145: Confused about usage of register: R3 in 'UnsetPending'

    msg.name = PAGetString(Defines.StringSheet_GAME, "LUA_MOVIEGUIDE_WHALE_FIND_NAME")
  end
  -- DECOMPILER ERROR at PC155: Confused about usage of register: R3 in 'UnsetPending'

  if gargoyleCount + whaleCount == 0 then
    msg.name = PAGetString(Defines.StringSheet_GAME, "LUA_MOVIEGUIDE_WHALE")
    -- DECOMPILER ERROR at PC162: Confused about usage of register: R3 in 'UnsetPending'

    msg.desc = PAGetString(Defines.StringSheet_GAME, "LUA_MOVIEGUIDE_WHALE_NOT_FIND")
  end
  do
    local isHuntingButtonShow = gargoyleCount + whaleCount > 0
    if huntingButtonShow ~= isHuntingButtonShow then
      huntingButtonShow = isHuntingButtonShow
      PaGlobal_AlertArea:ButtonShow((PaGlobal_AlertArea._buttonType)._hunting, isHuntingButtonShow)
    end
    self._huntingMsg = msg
    -- DECOMPILER ERROR: 2 unprocessed JMP targets
  end
end

FGlobal_WhaleConditionCheck = function()
  -- function num : 0_9
  PaGlobal_AlertArea:HuntingCountCheck()
end

FGlobal_AlertArea_BusterCallShow = function(isShow)
  -- function num : 0_10
  local self = PaGlobal_AlertArea
  self:ButtonShow((self._buttonType)._busterCall, isShow)
end

FGlobal_AlertArea_WarCallShow = function(isShow)
  -- function num : 0_11
  local self = PaGlobal_AlertArea
  self:ButtonShow((self._buttonType)._warCall, isShow)
end

FGlobal_AlertArea_SummonPartyShow = function(isShow)
  -- function num : 0_12
  local self = PaGlobal_AlertArea
  self:ButtonShow((self._buttonType)._summonParty, isShow)
end

FGlobal_AlertArea_ReturnTownShow = function(isShow)
  -- function num : 0_13
  local self = PaGlobal_AlertArea
  self:ButtonShow((self._buttonType)._returnTown, isShow)
end

FGlobal_AlertArea_CouponShow = function(isShow)
  -- function num : 0_14
  local self = PaGlobal_AlertArea
  self:ButtonShow((self._buttonType)._coupon, isShow)
end

FGlobal_AlertArea_LearnablSkillShow = function(isShow)
  -- function num : 0_15
  local self = PaGlobal_AlertArea
  self:ButtonShow((self._buttonType)._learnableSkill, isShow)
end

FGlobal_AlertArea_ImportantKnowledge = function(isShow, count)
  -- function num : 0_16
  local self = PaGlobal_AlertArea
  if count ~= nil then
    self._storyKnowledgeCount = tonumber(count)
  end
  self:ButtonShow((self._buttonType)._newStoryKnowledge, isShow)
end

FGlobal_AlertArea_NewKnowledge = function(isShow, count)
  -- function num : 0_17
  local self = PaGlobal_AlertArea
  if count ~= nil then
    self._normalKnowledgeCount = tonumber(count)
  end
  self:ButtonShow((self._buttonType)._newKnowledge, isShow)
end

FGlobal_AlertArea_BlackSpirit = function(isShow)
  -- function num : 0_18
  local self = PaGlobal_AlertArea
  self:ButtonShow((self._buttonType)._blackSpirit, isShow)
end

FGlobal_AlertArea_Mail = function(isShow)
  -- function num : 0_19
  local self = PaGlobal_AlertArea
  self:ButtonShow((self._buttonType)._mail, isShow)
end

FGlobal_AlertArea_ChallengeReward = function(isShow)
  -- function num : 0_20
  local self = PaGlobal_AlertArea
  self:ButtonShow((self._buttonType)._challengeReward, isShow)
end

FGlobal_AlertArea_PcRoomReward = function(isShow)
  -- function num : 0_21
  local self = PaGlobal_AlertArea
  self:ButtonShow((self._buttonType)._pcRoomReward, isShow)
end

FGlobal_AlertArea_WeightOver = function(isShow, weightPercent)
  -- function num : 0_22
  local self = PaGlobal_AlertArea
  self:ButtonShow((self._buttonType)._weightOver, isShow)
  if weightPercent == nil then
    (((self._ui)._button)[(self._buttonType)._weightOver]):SetText("")
  else
    if tonumber(weightPercent) >= 100 then
      (((self._ui)._button)[(self._buttonType)._weightOver]):SetFontColor((Defines.Color).C_FFF26A6A)
      ;
      (((self._ui)._button)[(self._buttonType)._weightOver]):SetOverFontColor((Defines.Color).C_FFF26A6A)
    else
      if tonumber(weightPercent) < 100 then
        (((self._ui)._button)[(self._buttonType)._weightOver]):SetFontColor((Defines.Color).C_FFC4BEBE)
        ;
        (((self._ui)._button)[(self._buttonType)._weightOver]):SetOverFontColor((Defines.Color).C_FFC4BEBE)
      end
    end
    ;
    (((self._ui)._button)[(self._buttonType)._weightOver]):SetText(weightPercent .. "%")
  end
end

FGlobal_AlertArea_EnduranceButtonShow = function(enduranceType, isShow)
  -- function num : 0_23
  local self = PaGlobal_AlertArea
  if (CppEnums.EnduranceType).eEnduranceType_Player == enduranceType then
    self:ButtonShow((self._buttonType)._endurancePc, isShow)
  else
    if (CppEnums.EnduranceType).eEnduranceType_Horse == enduranceType then
      self:ButtonShow((self._buttonType)._enduranceHorse, isShow)
    else
      if (CppEnums.EnduranceType).eEnduranceType_Carriage == enduranceType then
        self:ButtonShow((self._buttonType)._enduranceCarriage, isShow)
      else
        if (CppEnums.EnduranceType).eEnduranceType_Ship == enduranceType then
          self:ButtonShow((self._buttonType)._enduranceShip, isShow)
        else
          return 
        end
      end
    end
  end
end

FGlobal_AlertArea_NewEquipShow = function(isShow)
  -- function num : 0_24
  local self = PaGlobal_AlertArea
  self:ButtonShow((self._buttonType)._batterEquipment, isShow)
end

AlertArea_Init = function()
  -- function num : 0_25
  PaGlobal_AlertArea:Init()
end

-- DECOMPILER ERROR at PC438: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_AlertArea.RegisterEvent = function(self)
  -- function num : 0_26
  registerEvent("FromClient_luaLoadComplete", "AlertArea_Init")
end

PaGlobal_AlertArea:RegisterEvent()

