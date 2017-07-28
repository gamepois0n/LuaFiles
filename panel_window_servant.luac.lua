-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\window\servant\panel_window_servant.luac 

-- params : ...
-- function num : 0
Panel_Window_Servant:SetShow(false, false)
Panel_Window_Servant:ActiveMouseEventEffect(true)
Panel_Window_Servant:SetDragEnable(false)
Panel_Window_Servant:setGlassBackground(true)
Panel_Window_Servant:RegisterShowEventFunc(true, "ServantShowAni()")
Panel_Window_Servant:RegisterShowEventFunc(false, "ServantHideAni()")
Panel_Window_Servant:SetPosX(10)
Panel_Window_Servant:SetPosY(Panel_SelfPlayerExpGage:GetPosY() + Panel_SelfPlayerExpGage:GetSizeY() + 15)
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
local UI_PSFT = CppEnums.PAUI_SHOW_FADE_TYPE
local UI_color = Defines.Color
local UI_TM = CppEnums.TextMode
local UI_VT = CppEnums.VehicleType
local isContentsEnable = ToClient_IsContentsGroupOpen("41")
ServantShowAni = function()
  -- function num : 0_0
end

ServantHideAni = function()
  -- function num : 0_1
end

local servantIcon = {
config = {slotStartX = 0, slotStartY = 0, slotGapX = 60, hpStartX = 10, hpStartY = 61, mpStartX = 10, mpStartY = 69, hpStartXBackground = 8, hpStartYBackground = 57, mpStartXBackground = 8, mpStartYBackground = 67, slotCount = 4}
, 
const = {LandVehicle = 0, SeaVehicle = 1, TamerSummon = 2, Elephant = 3, AwakenSummon = 4}
, _baseIcon = (UI.getChildControl)(Panel_Window_Servant, "Static_Icon_Horse"), _baseStaticHp = (UI.getChildControl)(Panel_Window_Servant, "Static_Bar_BG"), _baseStaticMp = (UI.getChildControl)(Panel_Window_Servant, "Static_StaminaBG"), _baseProgressHp = (UI.getChildControl)(Panel_Window_Servant, "Progress2_HP"), _baseProgressMp = (UI.getChildControl)(Panel_Window_Servant, "Progress2_SP"), _statictext_MoveText = (UI.getChildControl)(Panel_Window_Servant, "StaticText_servantText"), _statictext_Help = (UI.getChildControl)(Panel_Window_Servant, "StaticText_Helper"), _txt_AttackAlert = (UI.getChildControl)(Panel_Window_Servant, "StaticText_AttackAlert"), _slots = (Array.new)(), posX = Panel_Window_Servant:GetPosX(), posY = Panel_Window_Servant:GetPosY(), _isTaming = false, _tamingLastNotifyTime = 0, _tamingCurrentTime = 0, _hitEffect = nil, _less10Effect = nil, _servant_BeforHP = 0, _servant_SummonCount = 4}
local horseRace = {_RaceInfo_btn_Info = (UI.getChildControl)(Panel_Window_Servant, "Race_Button_RaceInfo"), _RaceInfo_static_MainBG = (UI.getChildControl)(Panel_Window_HorseRace, "Race_MainBG"), _RaceInfo_txt_Title = (UI.getChildControl)(Panel_Window_HorseRace, "StaticText_RaceTitle"), _RaceInfo_static_BG = (UI.getChildControl)(Panel_Window_HorseRace, "Race_BG"), _RaceInfo_txt_PlayerIcon = (UI.getChildControl)(Panel_Window_HorseRace, "Race_Player_Icon"), _RaceInfo_txt_PlayerTitle = (UI.getChildControl)(Panel_Window_HorseRace, "Race_Player_Text"), _RaceInfo_txt_PlayerValue = (UI.getChildControl)(Panel_Window_HorseRace, "Race_Player_Value"), _RaceInfo_txt_RemainIcon = (UI.getChildControl)(Panel_Window_HorseRace, "Race_Time_Icon"), _RaceInfo_txt_RemainTitle = (UI.getChildControl)(Panel_Window_HorseRace, "Race_RemainTime_Text"), _RaceInfo_txt_RemainValue = (UI.getChildControl)(Panel_Window_HorseRace, "Race_RemainTime_Value"), _RaceInfo_txt_Tier = (UI.getChildControl)(Panel_Window_HorseRace, "Race_RegTier_Text"), _RaceInfo_txt_TierValue = (UI.getChildControl)(Panel_Window_HorseRace, "Race_RegTier_Value"), _RaceInfo_txt_Stat = (UI.getChildControl)(Panel_Window_HorseRace, "Race_RegStatus_Text"), _RaceInfo_btn_Join = (UI.getChildControl)(Panel_Window_HorseRace, "Race_Button_JoinRace"), _RaceInfo_btn_Cancel = (UI.getChildControl)(Panel_Window_HorseRace, "Race_Button_CancelRace"), _RaceInfo_txt_Desc = (UI.getChildControl)(Panel_Window_HorseRace, "StaticText_Desc")}
local raceRaedy = false
horseRace.Init = function(self)
  -- function num : 0_2
  (self._RaceInfo_txt_TierValue):SetPosX((self._RaceInfo_txt_Tier):GetPosX() + (self._RaceInfo_txt_Tier):GetTextSizeX() + 5)
  ;
  (self._RaceInfo_txt_Desc):SetShow(false)
  ;
  (self._RaceInfo_btn_Info):SetSize(70, 25)
  ;
  (self._RaceInfo_btn_Info):addInputEvent("Mouse_LUp", "HandelClicked_RaceInfo_Toggle()")
  ;
  (self._RaceInfo_btn_Join):addInputEvent("Mouse_LUp", "HandelClicked_RaceInfo_Join()")
  ;
  (self._RaceInfo_btn_Cancel):addInputEvent("Mouse_LUp", "HandelClicked_RaceInfo_Cancel()")
end

horseRace:Init()
Panel_Window_HorseRace:SetShow(false)
HandelClicked_RaceInfo_Toggle = function()
  -- function num : 0_3
  local isRaceChannel = ToClient_IsHorseRaceChannel()
  if isRaceChannel then
    if Panel_Window_HorseRace:GetShow() then
      FGlobal_RaceInfo_Hide()
    else
      ToClient_RequestMatchInfo((CppEnums.MatchType).Race)
    end
  else
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_SERVANT_MAINCHANNEL_HORSERACE"))
  end
end

FGlobal_RaceInfo_Hide = function()
  -- function num : 0_4
  Panel_Window_HorseRace:SetShow(false)
end

HandelClicked_RaceInfo_Join = function()
  -- function num : 0_5
  ToClient_RegisterRaceMatch()
  ToClient_RequestMatchInfo((CppEnums.MatchType).Race)
end

HandelClicked_RaceInfo_Cancel = function()
  -- function num : 0_6
  ToClient_UnRegisterRaceMatch()
  ToClient_RequestMatchInfo((CppEnums.MatchType).Race)
end

local matchStateMemo = "-"
local matchStateTime = "0"
local matchPlayer = "0"
local matchTier = "- "
FGlobal_RaceInfo_Open = function(isRegister, registerCount, remainedMinute, matchState, param1)
  -- function num : 0_7 , upvalues : matchStateMemo, matchStateTime, matchPlayer, matchTier, raceRaedy, horseRace
  Panel_Window_HorseRace:SetShow(true)
  local color = (Defines.Color).C_FF888888
  if matchState == 0 then
    matchStateMemo = "<PAColor0xFFDDCD82>" .. PAGetString(Defines.StringSheet_GAME, "LUA_SERVANT_RACEINFO_1") .. "<PAOldColor>\n" .. PAGetString(Defines.StringSheet_GAME, "LUA_SERVANT_RACE_IMPOSSIBLE")
    matchStateTime = remainedMinute + 1
    matchPlayer = "- "
    matchTier = "- "
  else
    if matchState == 1 then
      matchStateMemo = "<PAColor0xFFDDCD82>" .. PAGetString(Defines.StringSheet_GAME, "LUA_SERVANT_RACEINFO_2") .. "<PAOldColor>\n" .. PAGetString(Defines.StringSheet_GAME, "LUA_SERVANT_RACE_POSSIBLE")
      matchStateTime = remainedMinute + 1
      matchPlayer = registerCount
      matchTier = param1
    else
      if matchState == 2 then
        matchStateMemo = "<PAColor0xFFDDCD82>" .. PAGetString(Defines.StringSheet_GAME, "LUA_SERVANT_RACEINFO_3") .. "<PAOldColor>\n" .. PAGetString(Defines.StringSheet_GAME, "LUA_SERVANT_RACE_IMPOSSIBLE")
        matchStateTime = remainedMinute + 1
        matchPlayer = "- "
        matchTier = "- "
      else
        if matchState == 3 then
          matchStateMemo = "<PAColor0xFFDDCD82>" .. PAGetString(Defines.StringSheet_GAME, "LUA_SERVANT_RACEINFO_4") .. "<PAOldColor>\n" .. PAGetString(Defines.StringSheet_GAME, "LUA_SERVANT_RACE_IMPOSSIBLE")
          matchStateTime = "0"
          matchPlayer = "- "
          matchTier = "- "
        else
          if matchState == 4 then
            matchStateMemo = "<PAColor0xFFDDCD82>" .. PAGetString(Defines.StringSheet_GAME, "LUA_SERVANT_RACEINFO_5") .. "<PAOldColor>\n" .. PAGetString(Defines.StringSheet_GAME, "LUA_SERVANT_RACE_IMPOSSIBLE")
            matchStateTime = "0"
            matchPlayer = "- "
            matchTier = "- "
          end
        end
      end
    end
  end
  if isRegister then
    raceRaedy = true
    Panel_Window_HorseRace:SetShow(true)
    ;
    (horseRace._RaceInfo_txt_PlayerValue):SetText(tostring(registerCount) .. PAGetString(Defines.StringSheet_GAME, "LUA_SERVANT_RACEINFO_OPEN_PEOPLE"))
    ;
    (horseRace._RaceInfo_txt_RemainValue):SetText(matchStateTime .. PAGetString(Defines.StringSheet_GAME, "LUA_SERVANT_RACEINFO_OPEN_MINUTE"))
    ;
    (horseRace._RaceInfo_txt_TierValue):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_SERVANT_RACEINFO_OPEN_GENERATION", "param", param1))
    ;
    (horseRace._RaceInfo_txt_Stat):SetText(matchStateMemo)
    ;
    (horseRace._RaceInfo_btn_Join):SetShow(true)
    ;
    (horseRace._RaceInfo_btn_Join):SetMonoTone(false)
    ;
    (horseRace._RaceInfo_btn_Join):SetIgnore(false)
    ;
    (horseRace._RaceInfo_btn_Join):SetFontColor((Defines.Color).C_FFEFEFEF)
    ;
    (horseRace._RaceInfo_btn_Cancel):SetShow(true)
    ;
    (horseRace._RaceInfo_btn_Cancel):SetMonoTone(false)
    ;
    (horseRace._RaceInfo_btn_Cancel):SetIgnore(false)
    ;
    (horseRace._RaceInfo_btn_Cancel):SetFontColor((Defines.Color).C_FFEFEFEF)
  else
    raceRaedy = false
    Panel_Window_HorseRace:SetShow(true)
    ;
    (horseRace._RaceInfo_txt_PlayerValue):SetText(matchPlayer .. PAGetString(Defines.StringSheet_GAME, "LUA_SERVANT_RACEINFO_OPEN_PEOPLE"))
    ;
    (horseRace._RaceInfo_txt_RemainValue):SetText(matchStateTime .. PAGetString(Defines.StringSheet_GAME, "LUA_SERVANT_RACEINFO_OPEN_MINUTE"))
    ;
    (horseRace._RaceInfo_txt_TierValue):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_SERVANT_RACEINFO_OPEN_GENERATION", "param", param1))
    ;
    (horseRace._RaceInfo_txt_Stat):SetText(matchStateMemo)
    ;
    (horseRace._RaceInfo_btn_Join):SetShow(true)
    ;
    (horseRace._RaceInfo_btn_Join):SetMonoTone(true)
    ;
    (horseRace._RaceInfo_btn_Join):SetIgnore(true)
    ;
    (horseRace._RaceInfo_btn_Join):SetFontColor(color)
    ;
    (horseRace._RaceInfo_btn_Cancel):SetShow(true)
    ;
    (horseRace._RaceInfo_btn_Cancel):SetMonoTone(true)
    ;
    (horseRace._RaceInfo_btn_Cancel):SetIgnore(true)
    ;
    (horseRace._RaceInfo_btn_Cancel):SetFontColor(color)
  end
  Panel_Window_HorseRace:SetPosX(Panel_Window_Servant:GetPosX() + 10)
  Panel_Window_HorseRace:SetPosY(Panel_Window_Servant:GetPosY() + 100)
end

FGlobal_RaceInfo_MessageManager = function(msgType)
  -- function num : 0_8
  if msgType == 0 then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_SERVANT_HORSERACE_COMPLETE"))
  else
    if msgType == 1 then
      Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_SERVANT_HORSERACE_CANCEL"))
    end
  end
end

local iconPosY = Panel_SelfPlayerExpGage:GetPosY() + Panel_SelfPlayerExpGage:GetSizeY() + 20
servantIcon.init = function(self)
  -- function num : 0_9 , upvalues : iconPosY
  Panel_Window_Servant:SetPosX(10)
  Panel_Window_Servant:SetPosY(iconPosY)
  ;
  (UI.ASSERT)(self._baseIcon ~= nil and type(self._baseIcon) ~= "number", "Static_Icon_Horse")
  ;
  (UI.ASSERT)(self._baseStaticHp ~= nil and type(self._baseStaticHp) ~= "number", "Static_Bar_BG")
  ;
  (UI.ASSERT)(self._baseStaticMp ~= nil and type(self._baseStaticMp) ~= "number", "Static_StaminaBG")
  ;
  (UI.ASSERT)(self._baseProgressHp ~= nil and type(self._baseProgressHp) ~= "number", "Progress2_HP")
  ;
  (UI.ASSERT)(self._baseProgressMp ~= nil and type(self._baseProgressMp) ~= "number", "Progress2_SP")
  for ii = 0, (self.config).slotCount do
    local slot = {}
    slot.icon = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATIC, Panel_Window_Servant, "ServantIcon_Icon_" .. ii)
    slot.hpBackground = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATIC, slot.icon, "ServantIcon_HpBackground_" .. ii)
    slot.mpBackground = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATIC, slot.icon, "ServantIcon_MpBackground_" .. ii)
    slot.hp = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_PROGRESS2, slot.icon, "ServantIcon_Hp_" .. ii)
    slot.mp = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_PROGRESS2, slot.icon, "ServantIcon_Mp_" .. ii)
    CopyBaseProperty(self._baseIcon, slot.icon)
    CopyBaseProperty(self._baseStaticHp, slot.hpBackground)
    CopyBaseProperty(self._baseStaticMp, slot.mpBackground)
    CopyBaseProperty(self._baseProgressHp, slot.hp)
    CopyBaseProperty(self._baseProgressMp, slot.mp)
    ;
    (slot.icon):SetPosX((self.config).slotStartX + (self.config).slotGapX * ii)
    ;
    (slot.icon):SetPosY((self.config).slotStartY)
    ;
    (slot.hp):SetPosX((self.config).hpStartX)
    ;
    (slot.hp):SetPosY((self.config).hpStartY)
    ;
    (slot.mp):SetPosX((self.config).mpStartX)
    ;
    (slot.mp):SetPosY((self.config).mpStartY)
    ;
    (slot.hpBackground):SetPosX((self.config).hpStartXBackground)
    ;
    (slot.hpBackground):SetPosY((self.config).hpStartYBackground)
    ;
    (slot.mpBackground):SetPosX((self.config).mpStartXBackground)
    ;
    (slot.mpBackground):SetPosY((self.config).mpStartYBackground)
    ;
    (slot.icon):ActiveMouseEventEffect(true)
    ;
    (slot.icon):SetIgnore(false)
    ;
    (slot.hp):SetIgnore(true)
    ;
    (slot.mp):SetIgnore(true)
    ;
    (slot.hp):SetShow(true)
    ;
    (slot.mp):SetShow(true)
    ;
    (slot.hpBackground):SetShow(true)
    ;
    (slot.mpBackground):SetShow(true)
    ;
    (slot.icon):SetShow(false)
    ;
    (slot.icon):addInputEvent("Mouse_On", "Servant_SimpleTooltip( true, " .. ii .. " )")
    ;
    (slot.icon):addInputEvent("Mouse_Out", "Servant_SimpleTooltip( false )")
    ;
    (slot.icon):addInputEvent("Mouse_LUp", "Servant_Call(" .. ii .. ")")
    ;
    (slot.icon):addInputEvent("Mouse_RUp", "Servant_Navi(" .. ii .. ")")
    -- DECOMPILER ERROR at PC279: Confused about usage of register: R6 in 'UnsetPending'

    ;
    (self._slots)[ii] = slot
  end
  -- DECOMPILER ERROR: 9 unprocessed JMP targets
end

servantIcon.updateHp = function(self)
  -- function num : 0_10 , upvalues : servantIcon
  local self = servantIcon
  local temporaryWrapper = getTemporaryInformationWrapper()
  local landVehicleWrapper = temporaryWrapper:getUnsealVehicle((CppEnums.ServantType).Type_Vehicle)
  if landVehicleWrapper ~= nil and (((self._slots)[0]).icon):GetShow() == true then
    (((self._slots)[0]).hp):SetProgressRate(landVehicleWrapper:getHp() / landVehicleWrapper:getMaxHp() * 100)
    local servantInfo = temporaryWrapper:getUnsealVehicle((CppEnums.ServantType).Type_Vehicle)
    local regionInfo = getRegionInfoByPosition(servantInfo:getPosition())
    if (regionInfo:get()):isSafeZone() == false then
      Servant_HP_Chk(landVehicleWrapper:getHp(), landVehicleWrapper:getMaxHp(), landVehicleWrapper:getVehicleType())
    end
  end
  do
    local seaVehicleWrapper = temporaryWrapper:getUnsealVehicle((CppEnums.ServantType).Type_Ship)
    if seaVehicleWrapper ~= nil then
      (((self._slots)[1]).hp):SetProgressRate(seaVehicleWrapper:getHp() / seaVehicleWrapper:getMaxHp() * 100)
    end
    local summonCount = (getSelfPlayer()):getSummonListCount()
    for summon_idx = 0, summonCount - 1 do
      local summonInfo = (getSelfPlayer()):getSummonDataByIndex(summon_idx)
      local characterKey = summonInfo:getCharacterKey()
      local slotNo = -1
      if (characterKey >= 60028 and characterKey <= 60037) or characterKey == 60068 then
        slotNo = 2
      else
        if characterKey == 60134 or characterKey == 60137 or characterKey == 60136 or characterKey == 60135 then
          slotNo = 4
        end
      end
      if slotNo ~= -1 then
        local summonWrapper = summonInfo:getActor()
        if summonWrapper ~= nil then
          local hpRate = 100
          local hp = (summonWrapper:get()):getHp()
          local maxHp = (summonWrapper:get()):getMaxHp()
          hpRate = hp / maxHp * 100
          ;
          (((self._slots)[slotNo]).hp):SetProgressRate(hpRate)
        end
      end
    end
  end
end

servantIcon.updateMp = function(self)
  -- function num : 0_11 , upvalues : servantIcon
  local self = servantIcon
  local temporaryWrapper = getTemporaryInformationWrapper()
  local landVehicleWrapper = temporaryWrapper:getUnsealVehicle((CppEnums.ServantType).Type_Vehicle)
  if landVehicleWrapper ~= nil and (((self._slots)[0]).icon):GetShow() == true then
    (((self._slots)[0]).mp):SetProgressRate(landVehicleWrapper:getMp() / landVehicleWrapper:getMaxMp() * 100)
  end
  local seaVehicleWrapper = temporaryWrapper:getUnsealVehicle((CppEnums.ServantType).Type_Ship)
  if seaVehicleWrapper ~= nil then
    (((self._slots)[1]).mp):SetProgressRate(seaVehicleWrapper:getMp() / seaVehicleWrapper:getMaxMp() * 100)
  end
  local summonCount = (getSelfPlayer()):getSummonListCount()
  for summon_idx = 0, summonCount - 1 do
    local summonInfo = (getSelfPlayer()):getSummonDataByIndex(summon_idx)
    local characterKey = summonInfo:getCharacterKey()
    local slotNo = -1
    if (characterKey >= 60028 and characterKey <= 60037) or characterKey == 60068 then
      slotNo = 2
    else
      if characterKey == 60134 or characterKey == 60137 or characterKey == 60136 or characterKey == 60135 then
        slotNo = 4
      end
    end
    if slotNo ~= -1 then
      local summonWrapper = summonInfo:getActor()
      if summonWrapper ~= nil then
        local mpRate = 100
        local mp = (summonWrapper:get()):getMp()
        local maxMp = (summonWrapper:get()):getMaxMp()
        mpRate = mp / maxMp * 100
        ;
        (((self._slots)[slotNo]).mp):SetProgressRate(mpRate)
      end
    end
  end
end

local servantIconCount = 0
servantIcon.update = function(self)
  -- function num : 0_12 , upvalues : horseRace, UI_VT, isContentsEnable, servantIconCount
  if isFlushedUI() then
    return 
  end
  local icon_PosX = 0
  ;
  (((self._slots)[0]).icon):SetShow(false)
  ;
  (((self._slots)[1]).icon):SetShow(false)
  ;
  (((self._slots)[2]).icon):SetShow(false)
  ;
  (((self._slots)[3]).icon):SetShow(false)
  ;
  (((self._slots)[4]).icon):SetShow(false)
  ;
  (horseRace._RaceInfo_btn_Info):SetShow(false)
  local temporaryWrapper = getTemporaryInformationWrapper()
  local landVehicleWrapper = temporaryWrapper:getUnsealVehicle((CppEnums.ServantType).Type_Vehicle)
  if landVehicleWrapper ~= nil then
    (((self._slots)[0]).icon):ChangeTextureInfoName("New_UI_Common_forLua/Window/Horse/servant_icon_01.dds")
    if UI_VT.Type_Horse == landVehicleWrapper:getVehicleType() then
      local x1, y1, x2, y2 = 0, 0, 0, 0
      local temporaryPCRoomWrapper = getTemporaryInformationWrapper()
      local isPremiumPcRoom = temporaryPCRoomWrapper:isPremiumPcRoom()
      local isRussiaPremiumPack = ((getSelfPlayer()):get()):isApplyChargeSkill((CppEnums.UserChargeType).eUserChargeType_RussiaPack3)
      if isPremiumPcRoom or isRussiaPremiumPack then
        if doHaveContentsItem(16, UI_VT.Type_Horse) then
          x1 = setTextureUV_Func(((self._slots)[0]).icon, 62, 62, 122, 122)
          ;
          ((((self._slots)[0]).icon):getBaseTexture()):setUV(x1, y1, x2, y2)
        else
          ;
          (((self._slots)[0]).icon):ChangeTextureInfoName("New_UI_Common_forLua/Window/Horse/servant_icon_02.dds")
          -- DECOMPILER ERROR at PC130: Overwrote pending register: R7 in 'AssignReg'

          -- DECOMPILER ERROR at PC131: Overwrote pending register: R6 in 'AssignReg'

          -- DECOMPILER ERROR at PC132: Overwrote pending register: R5 in 'AssignReg'

          x1 = setTextureUV_Func(((self._slots)[0]).icon, 62, 1, 122, 61)
          ;
          ((((self._slots)[0]).icon):getBaseTexture()):setUV(x1, y1, x2, y2)
        end
      else
        -- DECOMPILER ERROR at PC162: Overwrote pending register: R7 in 'AssignReg'

        -- DECOMPILER ERROR at PC163: Overwrote pending register: R6 in 'AssignReg'

        -- DECOMPILER ERROR at PC164: Overwrote pending register: R5 in 'AssignReg'

        if doHaveContentsItem(16, UI_VT.Type_Horse) then
          x1 = setTextureUV_Func(((self._slots)[0]).icon, 62, 62, 122, 122)
          ;
          ((((self._slots)[0]).icon):getBaseTexture()):setUV(x1, y1, x2, y2)
        else
          -- DECOMPILER ERROR at PC187: Overwrote pending register: R7 in 'AssignReg'

          -- DECOMPILER ERROR at PC188: Overwrote pending register: R6 in 'AssignReg'

          -- DECOMPILER ERROR at PC189: Overwrote pending register: R5 in 'AssignReg'

          x1 = setTextureUV_Func(((self._slots)[0]).icon, 62, 1, 122, 61)
          ;
          ((((self._slots)[0]).icon):getBaseTexture()):setUV(x1, y1, x2, y2)
        end
      end
      if isContentsEnable then
        (horseRace._RaceInfo_btn_Info):SetShow(true)
      else
        ;
        (horseRace._RaceInfo_btn_Info):SetShow(false)
      end
    else
      do
        -- DECOMPILER ERROR at PC219: Overwrote pending register: R6 in 'AssignReg'

        -- DECOMPILER ERROR at PC219: Overwrote pending register: R5 in 'AssignReg'

        -- DECOMPILER ERROR at PC228: Overwrote pending register: R7 in 'AssignReg'

        if UI_VT.Type_Camel == y1(x2) then
          local x1, y1, x2, y2 = setTextureUV_Func(((self._slots)[0]).icon, 1, y2, 61, 122)
          ;
          ((((self._slots)[0]).icon):getBaseTexture()):setUV(x1, y1, x2, y2)
        else
          do
            if UI_VT.Type_Donkey == landVehicleWrapper:getVehicleType() then
              local x1, y1, x2, y2 = setTextureUV_Func(((self._slots)[0]).icon, 123, 1, 183, 61)
              ;
              ((((self._slots)[0]).icon):getBaseTexture()):setUV(x1, y1, x2, y2)
            else
              do
                if UI_VT.Type_RidableBabyElephant == landVehicleWrapper:getVehicleType() then
                  (((self._slots)[0]).icon):ChangeTextureInfoName("New_UI_Common_forLua/Window/Horse/servant_icon_02.dds")
                  local x1, y1, x2, y2 = setTextureUV_Func(((self._slots)[0]).icon, 1, 1, 61, 61)
                  ;
                  ((((self._slots)[0]).icon):getBaseTexture()):setUV(x1, y1, x2, y2)
                else
                  do
                    if UI_VT.Type_Carriage == landVehicleWrapper:getVehicleType() or UI_VT.Type_CowCarriage == landVehicleWrapper:getVehicleType() or UI_VT.Type_RepairableCarriage == landVehicleWrapper:getVehicleType() then
                      local x1, y1, x2, y2 = setTextureUV_Func(((self._slots)[0]).icon, 62, 123, 122, 183)
                      ;
                      ((((self._slots)[0]).icon):getBaseTexture()):setUV(x1, y1, x2, y2)
                    else
                      do
                        do
                          local x1, y1, x2, y2 = setTextureUV_Func(((self._slots)[0]).icon, 1, 1, 43, 43)
                          ;
                          ((((self._slots)[0]).icon):getBaseTexture()):setUV(x1, y1, x2, y2)
                          ;
                          (((self._slots)[0]).icon):setRenderTexture((((self._slots)[0]).icon):getBaseTexture())
                          ;
                          (((self._slots)[0]).hp):SetProgressRate(landVehicleWrapper:getHp() / landVehicleWrapper:getMaxHp() * 100)
                          ;
                          (((self._slots)[0]).mp):SetProgressRate(landVehicleWrapper:getMp() / landVehicleWrapper:getMaxMp() * 100)
                          ;
                          (((self._slots)[0]).icon):SetShow(true)
                          local servantInfo = temporaryWrapper:getUnsealVehicle((CppEnums.ServantType).Type_Vehicle)
                          local regionInfo = getRegionInfoByPosition(servantInfo:getPosition())
                          if (regionInfo:get()):isSafeZone() == false then
                            Servant_HP_Chk(landVehicleWrapper:getHp(), landVehicleWrapper:getMaxHp(), landVehicleWrapper:getVehicleType())
                          end
                          ;
                          (((self._slots)[0]).icon):SetPosX(icon_PosX)
                          icon_PosX = icon_PosX + (((self._slots)[0]).icon):GetSizeX()
                          local selfProxy = (getSelfPlayer()):get()
                          if selfProxy == nil then
                            return 
                          end
                          local actorKeyRaw = selfProxy:getRideVehicleActorKeyRaw()
                          do
                            local unsealCacheData = getServantInfoFromActorKey(actorKeyRaw)
                            if unsealCacheData ~= nil then
                              HorseHP_OpenByInteraction()
                              HorseMP_OpenByInteraction()
                            end
                            local seaVehicleWrapper = temporaryWrapper:getUnsealVehicle((CppEnums.ServantType).Type_Ship)
                            if seaVehicleWrapper ~= nil and UI_VT.Type_SailingBoat ~= seaVehicleWrapper:getVehicleType() then
                              (((self._slots)[1]).icon):ChangeTextureInfoName("New_UI_Common_forLua/Window/Horse/servant_icon_01.dds")
                              local x1, y1, x2, y2 = setTextureUV_Func(((self._slots)[1]).icon, 123, 123, 183, 183)
                              ;
                              ((((self._slots)[1]).icon):getBaseTexture()):setUV(x1, y1, x2, y2)
                              ;
                              (((self._slots)[1]).icon):setRenderTexture((((self._slots)[1]).icon):getBaseTexture())
                              ;
                              (((self._slots)[1]).hp):SetProgressRate(seaVehicleWrapper:getHp() / seaVehicleWrapper:getMaxHp() * 100)
                              ;
                              (((self._slots)[1]).mp):SetProgressRate(seaVehicleWrapper:getMp() / seaVehicleWrapper:getMaxMp() * 100)
                              ;
                              (((self._slots)[1]).mpBackground):SetShow(true)
                              ;
                              (((self._slots)[1]).mp):SetShow(true)
                              ;
                              (((self._slots)[1]).icon):SetShow(true)
                              ;
                              (((self._slots)[1]).icon):SetPosX(icon_PosX)
                              icon_PosX = icon_PosX + (((self._slots)[1]).icon):GetSizeX()
                              local selfProxy = (getSelfPlayer()):get()
                              if selfProxy == nil then
                                return 
                              end
                              if selfProxy:doRideMyVehicle() then
                                HorseHP_OpenByInteraction()
                                HorseMP_OpenByInteraction()
                              end
                            end
                            do
                              local summonCount = (getSelfPlayer()):getSummonListCount()
                              for summon_idx = 0, summonCount - 1 do
                                local summonInfo = (getSelfPlayer()):getSummonDataByIndex(summon_idx)
                                local characterKey = summonInfo:getCharacterKey()
                                if (characterKey >= 60028 and characterKey <= 60037) or characterKey == 60068 then
                                  local summonWrapper = summonInfo:getActor()
                                  local hpRate = 0
                                  local mpRate = 0
                                  if summonWrapper == nil then
                                    hpRate = 100
                                    mpRate = 100
                                  else
                                    local hp = (summonWrapper:get()):getHp()
                                    local maxHp = (summonWrapper:get()):getMaxHp()
                                    hpRate = hp / maxHp * 100
                                    local mp = (summonWrapper:get()):getMp()
                                    local maxMp = (summonWrapper:get()):getMaxMp()
                                    mpRate = mp / maxMp * 100
                                  end
                                  do
                                    ;
                                    (((self._slots)[2]).icon):ChangeTextureInfoName("New_UI_Common_forLua/Window/Horse/servant_icon_01.dds")
                                    do
                                      local x1, y1, x2, y2 = setTextureUV_Func(((self._slots)[2]).icon, 1, 1, 61, 61)
                                      ;
                                      ((((self._slots)[2]).icon):getBaseTexture()):setUV(x1, y1, x2, y2)
                                      ;
                                      (((self._slots)[2]).icon):setRenderTexture((((self._slots)[2]).icon):getBaseTexture())
                                      ;
                                      (((self._slots)[2]).hpBackground):SetShow(true)
                                      ;
                                      (((self._slots)[2]).hp):SetShow(true)
                                      ;
                                      (((self._slots)[2]).hp):SetProgressRate(hpRate)
                                      ;
                                      (((self._slots)[2]).mpBackground):SetShow(true)
                                      ;
                                      (((self._slots)[2]).mp):SetShow(true)
                                      ;
                                      (((self._slots)[2]).mp):SetProgressRate(mpRate)
                                      ;
                                      (((self._slots)[2]).icon):SetShow(true)
                                      ;
                                      (((self._slots)[2]).icon):SetPosX(icon_PosX)
                                      icon_PosX = icon_PosX + (((self._slots)[2]).icon):GetSizeX()
                                      do break end
                                      if characterKey == 60134 or characterKey == 60137 or characterKey == 60136 or characterKey == 60135 then
                                        local summonWrapper = summonInfo:getActor()
                                        local hpRate = 0
                                        local mpRate = 0
                                        if summonWrapper == nil then
                                          hpRate = 100
                                          mpRate = 100
                                        else
                                          local hp = (summonWrapper:get()):getHp()
                                          local maxHp = (summonWrapper:get()):getMaxHp()
                                          hpRate = hp / maxHp * 100
                                          local mp = (summonWrapper:get()):getMp()
                                          local maxMp = (summonWrapper:get()):getMaxMp()
                                          mpRate = mp / maxMp * 100
                                        end
                                        do
                                          ;
                                          (((self._slots)[4]).icon):ChangeTextureInfoName("New_UI_Common_forLua/Window/Horse/servant_icon_02.dds")
                                          do
                                            local x1, y1, x2, y2 = setTextureUV_Func(((self._slots)[4]).icon, 123, 1, 183, 61)
                                            ;
                                            ((((self._slots)[4]).icon):getBaseTexture()):setUV(x1, y1, x2, y2)
                                            ;
                                            (((self._slots)[4]).icon):setRenderTexture((((self._slots)[4]).icon):getBaseTexture())
                                            ;
                                            (((self._slots)[4]).hpBackground):SetShow(true)
                                            ;
                                            (((self._slots)[4]).hp):SetShow(true)
                                            ;
                                            (((self._slots)[4]).hp):SetProgressRate(hpRate)
                                            ;
                                            (((self._slots)[4]).mpBackground):SetShow(true)
                                            ;
                                            (((self._slots)[4]).mp):SetShow(true)
                                            ;
                                            (((self._slots)[4]).mp):SetProgressRate(mpRate)
                                            ;
                                            (((self._slots)[4]).icon):SetShow(true)
                                            ;
                                            (((self._slots)[4]).icon):SetPosX(icon_PosX)
                                            icon_PosX = icon_PosX + (((self._slots)[4]).icon):GetSizeX()
                                            do break end
                                            -- DECOMPILER ERROR at PC840: LeaveBlock: unexpected jumping out DO_STMT

                                            -- DECOMPILER ERROR at PC840: LeaveBlock: unexpected jumping out IF_THEN_STMT

                                            -- DECOMPILER ERROR at PC840: LeaveBlock: unexpected jumping out IF_STMT

                                            -- DECOMPILER ERROR at PC840: LeaveBlock: unexpected jumping out DO_STMT

                                            -- DECOMPILER ERROR at PC840: LeaveBlock: unexpected jumping out DO_STMT

                                            -- DECOMPILER ERROR at PC840: LeaveBlock: unexpected jumping out IF_THEN_STMT

                                            -- DECOMPILER ERROR at PC840: LeaveBlock: unexpected jumping out IF_STMT

                                          end
                                        end
                                      end
                                    end
                                  end
                                end
                              end
                              local elephantCount = guildstable_getUnsealGuildServantCount()
                              local isGuildMaster = ((getSelfPlayer()):get()):isGuildMaster()
                              local isGuildSubMaster = ((getSelfPlayer()):get()):isGuildSubMaster()
                              for index = 0, elephantCount - 1 do
                                local servantWrapper = guildStable_getUnsealGuildServantAt(index)
                                local vehicleType = servantWrapper:getVehicleType()
                                if UI_VT.Type_Elephant == vehicleType or UI_VT.Type_Train == vehicleType or UI_VT.Type_SailingBoat == vehicleType or UI_VT.Type_PersonalBattleShip == vehicleType or UI_VT.Type_SiegeTower == vehicleType or UI_VT.Type_LargeSiegeTower == vehicleType then
                                  (((self._slots)[3]).icon):ChangeTextureInfoName("New_UI_Common_forLua/Window/Horse/servant_icon_01.dds")
                                  local x1, y1, x2, y2 = setTextureUV_Func(((self._slots)[3]).icon, 123, 184, 183, 244)
                                  ;
                                  ((((self._slots)[3]).icon):getBaseTexture()):setUV(x1, y1, x2, y2)
                                  ;
                                  (((self._slots)[3]).icon):setRenderTexture((((self._slots)[3]).icon):getBaseTexture())
                                  ;
                                  (((self._slots)[3]).hp):SetShow(false)
                                  ;
                                  (((self._slots)[3]).mp):SetShow(false)
                                  ;
                                  (((self._slots)[3]).hpBackground):SetShow(false)
                                  ;
                                  (((self._slots)[3]).mpBackground):SetShow(false)
                                  ;
                                  (((self._slots)[3]).icon):SetShow(true)
                                  ;
                                  (((self._slots)[3]).icon):SetPosX(icon_PosX)
                                  icon_PosX = icon_PosX + (((self._slots)[3]).icon):GetSizeX()
                                  break
                                end
                              end
                              do
                                if icon_PosX == 0 then
                                  icon_PosX = 60
                                end
                                servantIconCount = 0
                                if (((self._slots)[0]).icon):GetShow() then
                                  servantIconCount = servantIconCount + 1
                                end
                                if (((self._slots)[1]).icon):GetShow() then
                                  servantIconCount = servantIconCount + 1
                                end
                                if (((self._slots)[2]).icon):GetShow() then
                                  servantIconCount = servantIconCount + 1
                                end
                                if (((self._slots)[3]).icon):GetShow() then
                                  servantIconCount = servantIconCount + 1
                                end
                                if (((self._slots)[4]).icon):GetShow() then
                                  servantIconCount = servantIconCount + 1
                                end
                                Panel_Window_Servant:SetSize(60 * servantIconCount, Panel_Window_Servant:GetSizeY())
                                if servantIconCount > 0 then
                                  Panel_Window_Servant:SetShow(true, true)
                                  ToClient_SaveUiInfo()
                                else
                                  Panel_Window_Servant:SetShow(false, false)
                                end
                                if servantIconCount > 0 and Panel_MyHouseNavi:GetShow() then
                                  Panel_MyHouseNavi_PositionReset()
                                end
                                FGlobal_Window_Servant_ColorBlindUpdate()
                                FGlobal_PetListNew_NoPet()
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

FGlobal_ServantIconCount = function()
  -- function num : 0_13 , upvalues : servantIconCount
  return servantIconCount
end

registerEvent("FromClient_luaLoadComplete", "FromClient_luaLoadComplete_ServantIcon")
servantIcon:init()
FromClient_luaLoadComplete_ServantIcon = function()
  -- function num : 0_14 , upvalues : servantIcon
  servantIcon:registEventHandler()
  servantIcon:registMessageHandler()
  FGlobal_Window_Servant_ColorBlindUpdate()
  ServantIcon_Resize()
end

servantIcon.registMessageHandler = function(self)
  -- function num : 0_15
  registerEvent("EventSelfServantUpdate", "Panel_Window_Servant_Update")
  registerEvent("EventSelfServantUpdateOnlyHp", "Panel_Window_Servant_UpdateHp")
  registerEvent("EventSelfServantUpdateOnlyMp", "Panel_Window_Servant_UpdateMp")
  registerEvent("FromClient_SummonChanged", "Panel_Window_Servant_Update")
  registerEvent("FromClient_SummonAddList", "Panel_Window_Servant_Update")
  registerEvent("FromClient_SummonDelList", "Panel_Window_Servant_Update")
  registerEvent("EventSelfServantClose", "ServantIcon_Close")
  registerEvent("FromClient_ServantTaming", "ServantIcon_TamingSuccess")
  registerEvent("onScreenResize", "ServantIcon_Resize")
end

servantIcon.registEventHandler = function(self)
  -- function num : 0_16
  Panel_Window_Servant:addInputEvent("Mouse_On", "Servant_ChangeTexture_On()")
  Panel_Window_Servant:addInputEvent("Mouse_Out", "Servant_ChangeTexture_Off()")
  Panel_Window_Servant:addInputEvent("Mouse_PressMove", "PanelWindowServant_RefreshPosition()")
  Panel_Window_Servant:addInputEvent("Mouse_LUp", "ResetPos_WidgetButton()")
end

ServantIcon_Resize = function()
  -- function num : 0_17 , upvalues : servantIcon
  local self = servantIcon
  screenX = getScreenSizeX()
  screenY = getScreenSizeY()
  if CppDefine.ChangeUIAndResolution == true then
    if Panel_Window_Servant:GetRelativePosX() == -1 and Panel_Window_Servant:GetRelativePosY() == -1 then
      local initPosX = 10
      local initPoxY = Panel_SelfPlayerExpGage:GetPosY() + Panel_SelfPlayerExpGage:GetSizeY() + 15
      if not changePositionBySever(Panel_Window_Servant, (CppEnums.PAGameUIType).PAGameUIPanel_ServantWindow, true, true, false) then
        Panel_Window_Servant:SetPosX(initPosX)
        Panel_Window_Servant:SetPosY(initPosY)
      end
      FGlobal_InitPanelRelativePos(Panel_Window_Servant, initPosX, initPosY)
    else
      do
        if Panel_Window_Servant:GetRelativePosX() == 0 and Panel_Window_Servant:GetRelativePosY() == 0 then
          Panel_Window_Servant:SetPosX(10)
          Panel_Window_Servant:SetPosY(Panel_SelfPlayerExpGage:GetPosY() + Panel_SelfPlayerExpGage:GetSizeY() + 15)
        else
          Panel_Window_Servant:SetPosX(getScreenSizeX() * Panel_Window_Servant:GetRelativePosX() - Panel_Window_Servant:GetSizeX() / 2)
          Panel_Window_Servant:SetPosY(getScreenSizeY() * Panel_Window_Servant:GetRelativePosY() - Panel_Window_Servant:GetSizeY() / 2)
        end
        if ToClient_GetUiInfo((CppEnums.PAGameUIType).PAGameUIPanel_ServantWindow, 0, (CppEnums.PanelSaveType).PanelSaveType_IsSaved) > 0 then
          Panel_Window_Servant:SetShow(ToClient_GetUiInfo((CppEnums.PAGameUIType).PAGameUIPanel_ServantWindow, 0, (CppEnums.PanelSaveType).PanelSaveType_IsShow))
        end
        if not changePositionBySever(Panel_Window_Servant, (CppEnums.PAGameUIType).PAGameUIPanel_ServantWindow, true, true, false) then
          Panel_Window_Servant:SetPosX(10)
          Panel_Window_Servant:SetPosY(Panel_SelfPlayerExpGage:GetPosY() + Panel_SelfPlayerExpGage:GetSizeY() + 15)
        end
        FGlobal_PanelRepostionbyScreenOut(Panel_Window_Servant)
      end
    end
  end
end

local isCheckLandNavi = false
local isCheckSeaNavi = false
local isCheckPetNavi = false
Servant_Call = function(index)
  -- function num : 0_18 , upvalues : servantIcon
  if Panel_UIControl:GetShow() then
    return 
  end
  if (servantIcon.const).SeaVehicle == index then
    return 
  end
  if (servantIcon.const).TamerSummon == index then
    return 
  end
  if (servantIcon.const).Elephant == index then
    FGlobal_GuildServantList_Open()
    return 
  end
  if (servantIcon.const).AwakenSummon == index then
    return 
  end
  local temporaryWrapper = getTemporaryInformationWrapper()
  local servantInfo = temporaryWrapper:getUnsealVehicle((CppEnums.ServantType).Type_Vehicle)
  if servantInfo == nil then
    return 
  end
  servant_callServant()
end

Servant_Navi = function(index)
  -- function num : 0_19 , upvalues : servantIcon, isCheckSeaNavi, isCheckLandNavi, isCheckPetNavi
  if Panel_UIControl:GetShow() then
    return 
  end
  if (servantIcon.const).TamerSummon == index then
    return 
  end
  if (servantIcon.const).AwakenSummon == index then
    return 
  end
  local temporaryWrapper = getTemporaryInformationWrapper()
  ToClient_DeleteNaviGuideByGroup(0)
  if (servantIcon.const).SeaVehicle == index and isCheckSeaNavi == false then
    local seaVehicleWrapper = temporaryWrapper:getUnsealVehicle((CppEnums.ServantType).Type_Ship)
    if seaVehicleWrapper == nil then
      return 
    end
    local position = float3(seaVehicleWrapper:getPositionX(), seaVehicleWrapper:getPositionY(), seaVehicleWrapper:getPositionZ())
    worldmapNavigatorStart(position, NavigationGuideParam(), false, true, true)
    audioPostEvent_SystemUi(0, 14)
    temporaryWrapper:refreshUnsealVehicle(seaVehicleWrapper, true)
    isCheckSeaNavi = true
    isCheckLandNavi = false
    isCheckPetNavi = false
  else
    do
      if (servantIcon.const).LandVehicle == index and isCheckLandNavi == false then
        local servantInfo = temporaryWrapper:getUnsealVehicle((CppEnums.ServantType).Type_Vehicle)
        if servantInfo == nil then
          return 
        end
        local position = float3(servantInfo:getPositionX(), servantInfo:getPositionY(), servantInfo:getPositionZ())
        worldmapNavigatorStart(position, NavigationGuideParam(), false, true, true)
        audioPostEvent_SystemUi(0, 14)
        temporaryWrapper:refreshUnsealVehicle(servantInfo, true)
        isCheckLandNavi = true
        isCheckSeaNavi = false
        isCheckPetNavi = false
      else
        do
          if (servantIcon.const).Pet == index and isCheckPetNavi == false then
            local servantInfo = temporaryWrapper:getUnsealVehicle((CppEnums.ServantType).Type_Pet)
            if servantInfo == nil then
              return 
            end
            local position = float3(servantInfo:getPositionX(), servantInfo:getPositionY(), servantInfo:getPositionZ())
            worldmapNavigatorStart(position, NavigationGuideParam(), false, true, true)
            audioPostEvent_SystemUi(0, 14)
            isCheckLandNavi = false
            isCheckSeaNavi = false
            isCheckPetNavi = true
          else
            do
              if (servantIcon.const).SeaVehicle == index and isCheckSeaNavi == true then
                ToClient_DeleteNaviGuideByGroup(0)
                isCheckSeaNavi = false
                isCheckLandNavi = false
                isCheckPetNavi = false
              else
                if (servantIcon.const).LandVehicle == index and isCheckLandNavi == true then
                  ToClient_DeleteNaviGuideByGroup(0)
                  isCheckLandNavi = false
                  isCheckSeaNavi = false
                  isCheckPetNavi = false
                else
                  if (servantIcon.const).Pet == index and isCheckPetNavi == true then
                    ToClient_DeleteNaviGuideByGroup(0)
                    isCheckLandNavi = false
                    isCheckSeaNavi = false
                    isCheckPetNavi = false
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

HandleClicked_Servant_VehicleInfoToggle = function(servantType)
  -- function num : 0_20 , upvalues : UI_VT
  local temporaryWrapper = getTemporaryInformationWrapper()
  local vehicleWrapper = temporaryWrapper:getUnsealVehicle(servantType)
  if vehicleWrapper == nil then
    return 
  end
  local actorKeyRaw = vehicleWrapper:getActorKeyRaw()
  local nearVehicle = getVehicleActor(actorKeyRaw)
  if nearVehicle == nil then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_SERVANT_ICON_TOOFAR"))
    return 
  end
  local targetType = vehicleWrapper:getVehicleType()
  if UI_VT.Type_Horse == targetType or UI_VT.Type_Camel == targetType or UI_VT.Type_Donkey == targetType or UI_VT.Type_Elephant == targetType then
    ServantInfo_OpenByActorKeyRaw(actorKeyRaw)
  else
    if UI_VT.Type_Carriage == targetType or UI_VT.Type_CowCarriage == targetType or UI_VT.Type_RepairableCarriage == targetType then
      CarriageInfo_OpenByActorKeyRaw(actorKeyRaw)
    else
      if UI_VT.Type_Boat == targetType or UI_VT.Type_Raft == targetType or UI_VT.Type_FishingBoat == targetType or UI_VT.Type_SailingBoat == targetType then
        ShipInfo_OpenByActorKeyRaw(actorKeyRaw)
      else
        CarriageInfo_OpenByActorKeyRaw(actorKeyRaw)
      end
    end
  end
end

PanelWindowServant_RefreshPosition = function()
  -- function num : 0_21 , upvalues : servantIcon
  -- DECOMPILER ERROR at PC4: Confused about usage of register: R0 in 'UnsetPending'

  servantIcon.posX = Panel_Window_Servant:GetPosX()
  -- DECOMPILER ERROR at PC9: Confused about usage of register: R0 in 'UnsetPending'

  servantIcon.posY = Panel_Window_Servant:GetPosY()
end

Panel_Window_Servant_ShowToggle = function()
  -- function num : 0_22
  local temporaryWrapper = getTemporaryInformationWrapper()
  local servantInfo = temporaryWrapper:getUnsealVehicle((CppEnums.ServantType).Type_Vehicle)
  local seaVehicleWrapper = temporaryWrapper:getUnsealVehicle((CppEnums.ServantType).Type_Ship)
  if servantInfo == nil and seaVehicleWrapper == nil then
    return 
  end
  if Panel_Window_Servant:GetShow() then
    Panel_Window_Servant:SetShow(false, false)
  else
    Panel_Window_Servant:SetShow(true, true)
  end
end

Panel_Window_Servant_Update = function()
  -- function num : 0_23 , upvalues : servantIcon
  local self = servantIcon
  self:update()
end

Panel_Window_Servant_UpdateHp = function()
  -- function num : 0_24 , upvalues : servantIcon
  local self = servantIcon
  self:updateHp()
end

Panel_Window_Servant_UpdateMp = function()
  -- function num : 0_25 , upvalues : servantIcon
  local self = servantIcon
  self:updateMp()
end

renderModeChange_Servant_Update = function(prevRenderModeList, nextRenderModeList)
  -- function num : 0_26
  if CheckRenderModebyGameMode(nextRenderModeList) == false then
    return 
  end
  Panel_Window_Servant_Update()
  ServantIcon_Resize()
end

registerEvent("FromClient_RenderModeChangeState", "renderModeChange_Servant_Update")
FGlobal_Window_Servant_Update = function()
  -- function num : 0_27 , upvalues : servantIcon
  local self = servantIcon
  self:update()
end

FGlobal_Window_Servant_ColorBlindUpdate = function()
  -- function num : 0_28 , upvalues : servantIcon, UI_color
  local self = servantIcon
  local isColorBlindMode = (ToClient_getGameUIManagerWrapper()):getLuaCacheDataListNumber((CppEnums.GlobalUIOptionType).ColorBlindMode)
  for index = 0, self._servant_SummonCount - 1 do
    (((self._slots)[index]).mp):SetColor(UI_color.C_FFFFCE22)
    if isColorBlindMode == 0 then
      (((self._slots)[index]).hp):ChangeTextureInfoName("new_ui_common_forlua/default/default_gauges.dds")
      local x1, y1, x2, y2 = setTextureUV_Func(((self._slots)[index]).hp, 1, 49, 232, 54)
      ;
      ((((self._slots)[index]).hp):getBaseTexture()):setUV(x1, y1, x2, y2)
      ;
      (((self._slots)[index]).hp):setRenderTexture((((self._slots)[index]).hp):getBaseTexture())
      ;
      (((self._slots)[index]).mp):SetColor(UI_color.C_FFFFCE22)
    else
      do
        if isColorBlindMode == 1 then
          (((self._slots)[index]).hp):ChangeTextureInfoName("new_ui_common_forlua/default/Default_Gauges_01.dds")
          local xx1, yy1, xx2, yy2 = setTextureUV_Func(((self._slots)[index]).hp, 1, 226, 256, 234)
          ;
          ((((self._slots)[index]).hp):getBaseTexture()):setUV(xx1, yy1, xx2, yy2)
          ;
          (((self._slots)[index]).hp):setRenderTexture((((self._slots)[index]).hp):getBaseTexture())
          ;
          (((self._slots)[index]).mp):SetColor(UI_color.C_FFEE9900)
        else
          do
            if isColorBlindMode == 2 then
              (((self._slots)[index]).hp):ChangeTextureInfoName("new_ui_common_forlua/default/Default_Gauges_01.dds")
              local xx1, yy1, xx2, yy2 = setTextureUV_Func(((self._slots)[index]).hp, 1, 226, 256, 234)
              ;
              ((((self._slots)[index]).hp):getBaseTexture()):setUV(xx1, yy1, xx2, yy2)
              ;
              (((self._slots)[index]).hp):setRenderTexture((((self._slots)[index]).hp):getBaseTexture())
              ;
              (((self._slots)[index]).mp):SetColor(UI_color.C_FFEE9900)
            end
            do
              -- DECOMPILER ERROR at PC157: LeaveBlock: unexpected jumping out DO_STMT

              -- DECOMPILER ERROR at PC157: LeaveBlock: unexpected jumping out IF_ELSE_STMT

              -- DECOMPILER ERROR at PC157: LeaveBlock: unexpected jumping out IF_STMT

              -- DECOMPILER ERROR at PC157: LeaveBlock: unexpected jumping out DO_STMT

              -- DECOMPILER ERROR at PC157: LeaveBlock: unexpected jumping out IF_ELSE_STMT

              -- DECOMPILER ERROR at PC157: LeaveBlock: unexpected jumping out IF_STMT

            end
          end
        end
      end
    end
  end
end

reset_ServantHP = function(BeforHP)
  -- function num : 0_29 , upvalues : servantIcon
  local self = servantIcon
  self._servant_BeforHP = BeforHP
end

Servant_HP_Chk = function(currentHp, currentMaxHp, vehicleType)
  -- function num : 0_30 , upvalues : servantIcon
  local self = servantIcon
  local isNowEquipCheck = IsNowEquipCheck()
  IsNowEquipCheck()
  local currentHp = currentHp
  local remainHp = currentHp / currentMaxHp * 100
  if currentHp < servantIcon._servant_BeforHP and servantIcon._servant_BeforHP ~= nil and isNowEquipCheck == false then
    if self._hitEffect ~= nil then
      (((self._slots)[0]).icon):EraseEffect(self._hitEffect)
    end
    self._hitEffect = (((self._slots)[0]).icon):AddEffect("fUI_Alarm_HorseAttack04", false, -0.1, -0.15)
    local sendMsg = {main = PAGetString(Defines.StringSheet_GAME, "LUA_SERVANT_SERVANT_ATTACK"), sub = "", addMsg = ""}
    Proc_ShowMessage_Ack_For_RewardSelect(sendMsg, 2, 25)
  end
  do
    -- DECOMPILER ERROR at PC52: Confused about usage of register: R7 in 'UnsetPending'

    servantIcon._servant_BeforHP = currentHp
    if self._less10Effect ~= nil then
      (((self._slots)[0]).icon):EraseEffect(self._less10Effect)
    end
    local effectName = nil
    if remainHp <= 10 then
      if vehicleType == 0 then
        effectName = "fUI_Alarm_HorseAttack05"
      else
        if vehicleType == 2 then
          effectName = "fUI_Alarm_CamelAttack01"
        else
          if vehicleType == 3 then
            effectName = "fUI_Alarm_DonkeyAttack01"
          else
            if vehicleType == 4 then
              effectName = "fUI_Alarm_ElephantAttack01"
            else
              if vehicleType == 9 then
                effectName = "fUI_Alarm_HorseAttack05"
              else
                effectName = "fUI_Alarm_HorseAttack05"
              end
            end
          end
        end
      end
      if effectName ~= nil then
        self._less10Effect = (((self._slots)[0]).icon):AddEffect(effectName, false, -0.1, -0.15)
      end
    end
  end
end

FGlobal_ServantIcon_IsNearMonster_Effect = function(_addEffect)
  -- function num : 0_31 , upvalues : servantIcon
  if (((servantIcon._slots)[0]).icon):GetShow() then
    if _addEffect == true then
      (((servantIcon._slots)[0]).icon):EraseAllEffect()
      ;
      (((servantIcon._slots)[0]).icon):AddEffect("fUI_Alarm_HorseAttack04", false, 0, 0)
    else
      ;
      (((servantIcon._slots)[0]).icon):EraseAllEffect()
    end
  end
end

Servant_CallHelp = function(posX, posY, slotNo)
  -- function num : 0_32 , upvalues : servantIcon, UI_TM
  if slotNo == 0 then
    (servantIcon._statictext_Help):SetShow(true)
    ;
    (servantIcon._statictext_Help):SetTextMode(UI_TM.eTextMode_AutoWrap)
    ;
    (servantIcon._statictext_Help):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_WINDOW_SERVANT_ICONHELP"))
    ;
    (servantIcon._statictext_Help):SetPosX(posX)
    ;
    (servantIcon._statictext_Help):SetPosY(posY + 60)
    if getEnableSimpleUI() then
      Servant_UpdateSimpleUI(true)
    end
  end
end

Servant_CallHelpout = function()
  -- function num : 0_33 , upvalues : servantIcon
  (servantIcon._statictext_Help):SetShow(false)
  if getEnableSimpleUI() then
    Servant_UpdateSimpleUI(false)
  end
end

Servant_SimpleTooltip = function(isShow, tipType)
  -- function num : 0_34 , upvalues : UI_VT, servantIcon
  local temporaryWrapper = getTemporaryInformationWrapper()
  if temporaryWrapper == nil then
    return TooltipSimple_Hide()
  end
  local vehicleWrapper = temporaryWrapper:getUnsealVehicle(tipType)
  if vehicleWrapper == nil then
    return TooltipSimple_Hide()
  end
  local temporaryPCRoomWrapper = getTemporaryInformationWrapper()
  local isPremiumPcRoom = temporaryPCRoomWrapper:isPremiumPcRoom()
  local targetType = vehicleWrapper:getVehicleType()
  if UI_VT.Type_Horse == targetType or UI_VT.Type_Camel == targetType or UI_VT.Type_Donkey == targetType or UI_VT.Type_Elephant == targetType or UI_VT.Type_Carriage == targetType or UI_VT.Type_CowCarriage == targetType or UI_VT.Type_RidableBabyElephant or UI_VT.Type_RepairableCarriage == targetType then
    if isPremiumPcRoom and UI_VT.Type_Horse == targetType then
      if doHaveContentsItem(16, UI_VT.Type_Horse) then
        ServantDesc = PAGetString(Defines.StringSheet_GAME, "LUA_WINDOW_SERVANT_ICONHELP")
      else
        ServantDesc = PAGetString(Defines.StringSheet_GAME, "LUA_WINDOW_SERVANT_ICONHELP_FORPCROOM")
      end
    else
      ServantDesc = PAGetString(Defines.StringSheet_GAME, "LUA_WINDOW_SERVANT_ICONHELP")
    end
  else
    ServantDesc = PAGetString(Defines.StringSheet_GAME, "LUA_WINDOW_SHIP_ICONHELP")
  end
  if tipType == nil then
    return TooltipSimple_Hide()
  end
  name = PAGetString(Defines.StringSheet_GAME, "LUA_SERVANT_SERVANT")
  desc = ServantDesc
  uiControl = ((servantIcon._slots)[tipType]).icon
  if isShow == true then
    TooltipSimple_Show(uiControl, name, desc)
    if getEnableSimpleUI() then
      Servant_UpdateSimpleUI(true)
    end
  else
    TooltipSimple_Hide()
    if getEnableSimpleUI() then
      Servant_UpdateSimpleUI(false)
    end
  end
end

local _servantSimpleUIAlpha = 0.7
Servant_UpdateSimpleUI = function(isOver)
  -- function num : 0_35 , upvalues : _servantSimpleUIAlpha
  _servantSimpleUIAlpha = 0.7
  if isOver then
    _servantSimpleUIAlpha = 1
  end
end

Servant_UpdateSimpleUI_Force_Out = function()
  -- function num : 0_36
  Servant_UpdateSimpleUI(false)
end

Servant_UpdateSimpleUI_Force_Over = function()
  -- function num : 0_37 , upvalues : servantIcon
  Servant_UpdateSimpleUI(true)
  for ii = 0, (servantIcon.config).slotCount do
    if (((servantIcon._slots)[ii]).icon):GetShow() then
      (((servantIcon._slots)[ii]).icon):SetAlpha(1)
      ;
      (((servantIcon._slots)[ii]).hpBackground):SetAlpha(1)
      ;
      (((servantIcon._slots)[ii]).mpBackground):SetAlpha(1)
      ;
      (((servantIcon._slots)[ii]).hp):SetAlpha(1)
      ;
      (((servantIcon._slots)[ii]).mp):SetAlpha(1)
    end
  end
end

registerEvent("EventSimpleUIEnable", "Servant_UpdateSimpleUI_Force_Out")
registerEvent("EventSimpleUIDisable", "Servant_UpdateSimpleUI_Force_Over")
Servant_SimpleUIUpdatePerFrame = function(deltaTime)
  -- function num : 0_38 , upvalues : servantIcon, _servantSimpleUIAlpha
  for ii = 0, (servantIcon.config).slotCount do
    if (((servantIcon._slots)[ii]).icon):GetShow() then
      (UIAni.perFrameAlphaAnimation)(_servantSimpleUIAlpha, ((servantIcon._slots)[ii]).icon, 2.8 * deltaTime)
      ;
      (UIAni.perFrameAlphaAnimation)(_servantSimpleUIAlpha, ((servantIcon._slots)[ii]).hpBackground, 2.8 * deltaTime)
      ;
      (UIAni.perFrameAlphaAnimation)(_servantSimpleUIAlpha, ((servantIcon._slots)[ii]).mpBackground, 2.8 * deltaTime)
      ;
      (UIAni.perFrameAlphaAnimation)(_servantSimpleUIAlpha, ((servantIcon._slots)[ii]).hp, 2.8 * deltaTime)
      ;
      (UIAni.perFrameAlphaAnimation)(_servantSimpleUIAlpha, ((servantIcon._slots)[ii]).mp, 2.8 * deltaTime)
    end
  end
end

registerEvent("SimpleUI_UpdatePerFrame", "Servant_SimpleUIUpdatePerFrame")
Servant_ChangeTexture_On = function()
  -- function num : 0_39 , upvalues : servantIcon
  local self = servantIcon
  Panel_Window_Servant:ChangeTextureInfoName("new_ui_common_forlua/default/window_sample_empty.dds")
  ;
  (self._statictext_MoveText):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_SERVANT_ICON_UI_MOVE"))
end

Servant_ChangeTexture_Off = function()
  -- function num : 0_40 , upvalues : servantIcon
  local self = servantIcon
  if Panel_UIControl:GetShow() then
    Panel_Window_Servant:ChangeTextureInfoName("new_ui_common_forlua/default/window_sample_isWidget.dds")
    ;
    (self._statictext_MoveText):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_SERVANT_ICON_UI"))
  else
    Panel_Window_Servant:ChangeTextureInfoName("new_ui_common_forlua/default/window_sample_empty.dds")
  end
end

ServantIcon_TamingSuccess = function(isTaming)
  -- function num : 0_41 , upvalues : servantIcon
  local self = servantIcon
  self._isTaming = isTaming
  if isTaming then
    ServantIcon_TamingNotify()
    Panel_FrameLoop_Widget:SetShow(true)
  else
    ServantIcon_TamingServant_Registed()
  end
end

ServantIcon_TamingNotify = function()
  -- function num : 0_42
  Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_TAMING_NOTIFY"))
end

ServantIcon_TamingServant_Registed = function()
  -- function num : 0_43 , upvalues : servantIcon
  local self = servantIcon
  _isTaming = false
  Panel_FrameLoop_Widget:SetShow(false)
end

TamingServant_Time = function(DeltaTime)
  -- function num : 0_44 , upvalues : servantIcon
  local self = servantIcon
  if not self._tamingSuccess then
    return 
  end
  self._tamingCurrentTime = self._tamingCurrentTime + DeltaTime
  if self._tamingCurrentTime < self._tamingLastNotifyTime + 20 then
    ServantIcon_TamingNotify()
    self._tamingLastNotifyTime = currentTime
  end
end

ServantIcon_Open = function()
  -- function num : 0_45 , upvalues : servantIcon
  if (Defines.UIMode).eUIMode_NpcDialog == GetUIMode() then
    return 
  end
  local temporaryWrapper = getTemporaryInformationWrapper()
  local landVehicleWrapper = temporaryWrapper:getUnsealVehicle((CppEnums.ServantType).Type_Vehicle)
  local seaVehicleWrapper = temporaryWrapper:getUnsealVehicle((CppEnums.ServantType).Type_Ship)
  local petWrapper = temporaryWrapper:getUnsealVehicle((CppEnums.ServantType).Type_Pet)
  if landVehicleWrapper ~= nil or seaVehicleWrapper ~= nil or petWrapper ~= nil then
    Panel_Window_Servant:SetShow(true, true)
    servantIcon:update()
  end
end

ServantIcon_Close = function()
  -- function num : 0_46 , upvalues : servantIcon
  local temporaryWrapper = getTemporaryInformationWrapper()
  local isShow = false
  if temporaryWrapper ~= nil then
    for ii = 0, (servantIcon.config).slotCount do
      local servantInfo = temporaryWrapper:getUnsealVehicle(ii)
      if servantInfo == nil then
        (((servantIcon._slots)[ii]).icon):SetShow(false)
      else
        isShow = true
      end
    end
  end
  do
    if not isShow then
      Panel_Window_Servant:SetShow(false, false)
    end
    servantIcon:update()
  end
end

changePositionBySever(Panel_Window_Servant, (CppEnums.PAGameUIType).PAGameUIPanel_ServantWindow, true, true, false)
FGlobal_PanelMove(Panel_Window_Servant, true)
Panel_FrameLoop_Widget:RegisterUpdateFunc("TamingServant_Time")

