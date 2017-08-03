-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\widget\fishing\panel_fishing.luac 

-- params : ...
-- function num : 0
local UI_TM = CppEnums.TextMode
local UI_color = Defines.Color
local gameOptionActionKey = {Forward = 0, Back = 1, Left = 2, Right = 3, Attack = 4, SubAttack = 5, Dash = 6, Jump = 7}
local uiPress = {_button_Space = (UI.getChildControl)(Panel_Fishing, "StaticText_Btn_Space_2"), _m1 = (UI.getChildControl)(Panel_Fishing, "StaticText_M1_2")}
local fishing_UI = {_fish_Icon_Title = (UI.getChildControl)(Panel_Fishing, "Static_Minigame_Fish_Title"), _purposeText = (UI.getChildControl)(Panel_Fishing, "StaticText_Purpose"), _fishBG = (UI.getChildControl)(Panel_Fishing, "Static_OnlyFishBG"), _fishPercent = (UI.getChildControl)(Panel_Fishing, "StaticText_OnlyFish"), _fishComment = (UI.getChildControl)(Panel_Fishing, "StaticText_OnlyFishComment"), _fishWpDesc = (UI.getChildControl)(Panel_Fishing, "StaticText_OnlyFishWpDesc"), _fishCheckBtn = (UI.getChildControl)(Panel_Fishing, "CheckBox_DropTrash"), _m0 = (UI.getChildControl)(Panel_Fishing, "StaticText_M0"), _mBody = (UI.getChildControl)(Panel_Fishing, "StaticText_Mouse_Body")}
local ui_Value = {isFirstTime_Manual_Fishing_Start = true, isFirstTime_Manual_Fishing_0 = true, isFirstTime_Manual_Fishing_1 = true, isFirstTime_Manual_Fishing_2 = true, isFirstTime_Manual_Fishing_3 = true, isFirstTime_Manual_Jaksal_0 = true, isFirstTime_Manual_Jaksal_1 = true, isFirstTime_Manual_Jaksal_2 = true, isFirstTime_Manual_Jaksal_3 = true, isFirstTime_Manual_Jaksal_4 = true, isFirstTime_Manual_Jaksal_5 = true}
HandleClicked_FishCheck = function()
  -- function num : 0_0 , upvalues : fishing_UI
  local itemGrade = 0
  if (fishing_UI._fishCheckBtn):IsCheck() then
    itemGrade = 1
  else
    itemGrade = 0
  end
  ;
  (getSelfPlayer()):setFishingAutoItemGrade(itemGrade)
  FGlobal_RemoteControl_FishCheck((fishing_UI._fishCheckBtn):IsCheck())
end

FGlobal_FishCheck = function()
  -- function num : 0_1 , upvalues : fishing_UI
  return (fishing_UI._fishCheckBtn):IsCheck()
end

FGlobal_SetFishCheck = function(check)
  -- function num : 0_2 , upvalues : fishing_UI
  (fishing_UI._fishCheckBtn):SetCheck(check)
  HandleClicked_FishCheck()
end

;
(fishing_UI._fishCheckBtn):addInputEvent("Mouse_LUp", "HandleClicked_FishCheck()")
local IsHideMiniGameManual = function()
  -- function num : 0_3
  do
    local uiMode = GetUIMode()
    do return (getCustomizingManager()):isShow() or uiMode == (Defines.UIMode).eUIMode_NpcDialog or uiMode == (Defines.UIMode).eUIMode_InGameCashShop or uiMode == (Defines.UIMode).eUIMode_Mental or uiMode == (Defines.UIMode).eUIMode_DyeNew end
    -- DECOMPILER ERROR: 2 unprocessed JMP targets
  end
end

fishingGame_Initialize = function()
  -- function num : 0_4 , upvalues : fishing_UI, uiPress
  Panel_Fishing:SetShow(false)
  local scrX = getScreenSizeX()
  local scrY = getScreenSizeY()
  Panel_Fishing:SetSize(scrX, scrY)
  Panel_Fishing:SetPosX(0)
  Panel_Fishing:SetPosY(50)
  for _,value in pairs(fishing_UI) do
    value:SetShow(false)
    value:ComputePos()
  end
  for _,value in pairs(uiPress) do
    value:SetShow(false)
    value:ComputePos()
  end
end

setFishingResourcePool_text = function()
  -- function num : 0_5 , upvalues : fishing_UI, UI_TM, uiPress
  local fishComment_head = PAGetString(Defines.StringSheet_GAME, "LUA_MINIGAME_FISH_POOL_HEAD")
  local fishingPercent = (math.floor)(ToClient_CurrentFishingData() * 100)
  if fishingPercent >= 71 and fishingPercent <= 100 then
    fishComment = fishComment_head .. " " .. PAGetString(Defines.StringSheet_GAME, "LUA_MINIGAME_FISH_POOL_VALUE_1")
  else
    if fishingPercent >= 46 and fishingPercent <= 70 then
      fishComment = fishComment_head .. " " .. PAGetString(Defines.StringSheet_GAME, "LUA_MINIGAME_FISH_POOL_VALUE_2")
    else
      if fishingPercent >= 15 and fishingPercent <= 45 then
        fishComment = fishComment_head .. " " .. PAGetString(Defines.StringSheet_GAME, "LUA_MINIGAME_FISH_POOL_VALUE_3")
      else
        if fishingPercent <= 14 and fishingPercent >= 0 then
          fishComment = fishComment_head .. " " .. PAGetString(Defines.StringSheet_GAME, "LUA_MINIGAME_FISH_POOL_VALUE_4")
        end
      end
    end
  end
  ;
  (fishing_UI._fishPercent):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GLOBALMANUAL_FISHING_FISHERY_RESOURCE", "FISHERY", fishComment))
  ;
  (fishing_UI._fishComment):SetAutoResize(true)
  ;
  (fishing_UI._fishComment):SetTextMode(UI_TM.eTextMode_AutoWrap)
  ;
  (fishing_UI._fishComment):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GLOBALMANUAL_FISHING_FISHERY_COMMENT"))
  local itemWrapper = getEquipmentItem(0)
  if itemWrapper == nil then
    (fishing_UI._fishWpDesc):SetShow(false)
    ;
    (fishing_UI._fishCheckBtn):SetShow(false)
    return 
  end
  local equipType = (itemWrapper:getStaticStatus()):getEquipType()
  if equipType == 44 then
    (fishing_UI._fishWpDesc):SetShow(true)
    ;
    (fishing_UI._fishCheckBtn):SetShow(true)
    HandleClicked_FishCheck()
  else
    if equipType == 48 then
      (fishing_UI._fishWpDesc):SetShow(false)
      ;
      (fishing_UI._fishCheckBtn):SetShow(false)
    end
  end
  local sizeX1 = (fishing_UI._fishPercent):GetTextSizeX()
  local sizeX2 = (fishing_UI._fishComment):GetTextSizeX()
  local maxSizeX = 0
  if sizeX2 < sizeX1 then
    maxSizeX = sizeX1
  else
    maxSizeX = sizeX2
  end
  local maxSizeY = (fishing_UI._fishComment):GetSizeY() + (fishing_UI._fishPercent):GetSizeY()
  ;
  (fishing_UI._fishBG):SetSize((fishing_UI._fishComment):GetTextSizeX() + 10, (fishing_UI._fishPercent):GetSizeY() + (fishing_UI._fishComment):GetSizeY() + 10)
  ;
  (fishing_UI._fishBG):SetPosX(getScreenSizeX() / 2 - (fishing_UI._fishBG):GetSizeX() / 2)
  ;
  (fishing_UI._fishCheckBtn):SetPosY((fishing_UI._fishBG):GetPosY() + (fishing_UI._fishBG):GetSizeY() + 10)
  ;
  (uiPress._button_Space):SetPosY((fishing_UI._fishCheckBtn):GetPosY() + (fishing_UI._fishCheckBtn):GetSizeY() + 10)
  ;
  (fishing_UI._fishWpDesc):SetPosY((uiPress._button_Space):GetPosY() + (uiPress._button_Space):GetSizeY() + 10)
end

fishingGame_Initialize()
local IsHideFishingGame = function()
  -- function num : 0_6
  do
    local uiMode = GetUIMode()
    do return (getCustomizingManager()):isShow() or uiMode == (Defines.UIMode).eUIMode_NpcDialog or uiMode == (Defines.UIMode).eUIMode_InGameCashShop or uiMode == (Defines.UIMode).eUIMode_Mental or uiMode == (Defines.UIMode).eUIMode_DyeNew end
    -- DECOMPILER ERROR: 2 unprocessed JMP targets
  end
end

local FishingGame_Manual_Fishing_Start = function(actorKeyRaw, isSelf)
  -- function num : 0_7 , upvalues : ui_Value, IsHideFishingGame, uiPress, fishing_UI, gameOptionActionKey
  if ui_Value.isFirstTime_Manual_Fishing_Start == true and not IsHideFishingGame() then
    for _,v in pairs(uiPress) do
      v:SetShow(false)
      v:ComputePos()
    end
    for _,v in pairs(fishing_UI) do
      v:SetShow(false)
      v:ComputePos()
    end
    Panel_Fishing:SetShow(true)
    Panel_Fishing:SetAlpha(0)
    ;
    (UIAni.AlphaAnimation)(1, Panel_Fishing, 0, 0.22)
    FGlobal_EquipFishingToolCheck()
    ;
    (fishing_UI._purposeText):SetShow(true)
    ;
    (fishing_UI._purposeText):AddEffect("UI_QustComplete01", false, 0, 0)
    local actionString = ""
    if getGamePadEnable() then
      actionString = keyCustom_GetString_ActionPad(gameOptionActionKey.Jump)
    else
      actionString = keyCustom_GetString_ActionKey(gameOptionActionKey.Jump)
    end
    ;
    (fishing_UI._purposeText):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GLOBALMANUAL_FISHING_START", "key", actionString))
    ;
    (uiPress._button_Space):SetShow(true)
    ;
    (uiPress._button_Space):SetText(actionString)
    ;
    (uiPress._button_Space):SetPosY(160)
    ;
    (fishing_UI._fishBG):SetShow(true)
    ;
    (fishing_UI._fishPercent):SetShow(true)
    ;
    (fishing_UI._fishComment):SetShow(true)
    setFishingResourcePool_text()
    ;
    (fishing_UI._fishBG):SetSize((fishing_UI._fishComment):GetTextSizeX() + 10, (fishing_UI._fishPercent):GetSizeY() + (fishing_UI._fishComment):GetSizeY() + 10)
    ;
    (fishing_UI._fish_Icon_Title):SetShow(true)
    -- DECOMPILER ERROR at PC144: Confused about usage of register: R3 in 'UnsetPending'

    ui_Value.isFirstTime_Manual_Fishing_Start = false
    MiniGame_Manual_Value_FishingStart = true
  end
end

local FishingGame_Manual_Fishing_0 = function(actorKeyRaw, isSelf)
  -- function num : 0_8 , upvalues : ui_Value, fishing_UI, uiPress
  FGlobal_PowerGauge_Close()
  if ui_Value.isFirstTime_Manual_Fishing_0 == true then
    for _,v in pairs(fishing_UI) do
      v:SetShow(false)
      v:ComputePos()
    end
    for _,v in pairs(uiPress) do
      v:SetShow(false)
      v:ComputePos()
    end
    Panel_Fishing:SetShow(true)
    Panel_Fishing:SetAlpha(0)
    ;
    (UIAni.AlphaAnimation)(1, Panel_Fishing, 0, 0.22)
    FGlobal_EquipFishingToolCheck()
    ;
    (fishing_UI._purposeText):SetShow(true)
    ;
    (fishing_UI._purposeText):AddEffect("UI_QustComplete01", false, 0, 0)
    ;
    (fishing_UI._purposeText):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GLOBALMANUAL_FISHING_0"))
    ;
    (fishing_UI._fishBG):SetShow(true)
    ;
    (fishing_UI._fishPercent):SetShow(true)
    ;
    (fishing_UI._fishComment):SetShow(true)
    setFishingResourcePool_text()
    ;
    (fishing_UI._fishBG):SetSize((fishing_UI._fishComment):GetTextSizeX() + 10, (fishing_UI._fishPercent):GetSizeY() + (fishing_UI._fishComment):GetSizeY() + 10)
    ;
    (fishing_UI._fish_Icon_Title):SetShow(true)
    ;
    (fishing_UI._fishWpDesc):SetShow(false)
    -- DECOMPILER ERROR at PC114: Confused about usage of register: R2 in 'UnsetPending'

    ui_Value.isFirstTime_Manual_Fishing_0 = false
  end
end

local FishingGame_Manual_Fishing_1 = function(actorKeyRaw, isSelf)
  -- function num : 0_9 , upvalues : ui_Value, uiPress, fishing_UI, gameOptionActionKey
  local selfplayer = getSelfPlayer()
  if selfplayer == nil then
    return 
  end
  local autoFishingEnalbe = (selfplayer:get()):isAutoFishingable()
  if ui_Value.isFirstTime_Manual_Fishing_1 == true then
    for _,v in pairs(uiPress) do
      v:SetShow(false)
      v:ComputePos()
    end
    for _,v in pairs(fishing_UI) do
      v:SetShow(false)
      v:ComputePos()
    end
    ;
    (fishing_UI._purposeText):SetShow(true)
    ;
    (fishing_UI._purposeText):AddEffect("UI_QustComplete01", false, 0, 0)
    local actionString = ""
    if getGamePadEnable() then
      actionString = keyCustom_GetString_ActionPad(gameOptionActionKey.Jump)
    else
      actionString = keyCustom_GetString_ActionKey(gameOptionActionKey.Jump)
    end
    ;
    (fishing_UI._purposeText):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GLOBALMANUAL_FISHING_1", "key", actionString))
    if autoFishingEnalbe then
      (fishing_UI._fishWpDesc):SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_GLOBAL_MANUAL_ONLYFISHWPDESC"))
    else
      ;
      (fishing_UI._fishWpDesc):SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_GLOBAL_MANUAL_ONLYFISHWPDESC_2"))
    end
    ;
    (fishing_UI._fish_Icon_Title):SetShow(true)
    ;
    (fishing_UI._fishBG):SetShow(true)
    ;
    (fishing_UI._fishPercent):SetShow(true)
    ;
    (fishing_UI._fishComment):SetShow(true)
    setFishingResourcePool_text()
    ;
    (fishing_UI._fishBG):SetSize((fishing_UI._fishComment):GetTextSizeX() + 10, (fishing_UI._fishPercent):GetSizeY() + (fishing_UI._fishComment):GetSizeY() + 10)
    ;
    (uiPress._button_Space):SetShow(true)
    ;
    (uiPress._button_Space):SetText(actionString)
    ;
    (uiPress._button_Space):SetAlpha(0)
    ;
    (uiPress._button_Space):SetFontAlpha(0)
    ;
    (uiPress._button_Space):SetPosY(160)
    ;
    (fishing_UI._fishWpDesc):SetShow(false)
    ;
    (UIAni.AlphaAnimation)(1, uiPress._button_Space, 0.75, 1)
    -- DECOMPILER ERROR at PC176: Confused about usage of register: R5 in 'UnsetPending'

    ui_Value.isFirstTime_Manual_Fishing_1 = false
  end
end

local FishingGame_Manual_Fishing_2 = function(actorKeyRaw, isSelf)
  -- function num : 0_10 , upvalues : ui_Value, uiPress, fishing_UI, gameOptionActionKey
  if ui_Value.isFirstTime_Manual_Fishing_2 == true then
    for _,v in pairs(uiPress) do
      v:SetShow(false)
      v:ComputePos()
    end
    ;
    (fishing_UI._purposeText):SetShow(true)
    ;
    (fishing_UI._purposeText):AddEffect("UI_QustComplete01", false, 0, 0)
    ;
    (fishing_UI._purposeText):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GLOBALMANUAL_FISHING_2"))
    ;
    (fishing_UI._fishWpDesc):SetShow(false)
    ;
    (fishing_UI._fish_Icon_Title):SetShow(true)
    ;
    (uiPress._button_Space):SetShow(false)
    ;
    (uiPress._button_W):SetShow(true)
    ;
    (uiPress._button_A):SetShow(true)
    ;
    (uiPress._button_S):SetShow(true)
    ;
    (uiPress._button_D):SetShow(true)
    ;
    (uiPress._button_W):SetText(gameOptionActionKey.Forward)
    ;
    (uiPress._button_A):SetText(gameOptionActionKey.Left)
    ;
    (uiPress._button_S):SetText(gameOptionActionKey.Back)
    ;
    (uiPress._button_D):SetText(gameOptionActionKey.Right)
    ;
    (uiPress._button_W):SetAlpha(0)
    ;
    (uiPress._button_A):SetAlpha(0)
    ;
    (uiPress._button_S):SetAlpha(0)
    ;
    (uiPress._button_D):SetAlpha(0)
    ;
    (uiPress._button_W):SetFontAlpha(0)
    ;
    (uiPress._button_A):SetFontAlpha(0)
    ;
    (uiPress._button_S):SetFontAlpha(0)
    ;
    (uiPress._button_D):SetFontAlpha(0)
    ;
    (UIAni.AlphaAnimation)(1, uiPress._button_W, 0.5, 0.75)
    ;
    (UIAni.AlphaAnimation)(1, uiPress._button_A, 0.5, 0.75)
    ;
    (UIAni.AlphaAnimation)(1, uiPress._button_S, 0.5, 0.75)
    ;
    (UIAni.AlphaAnimation)(1, uiPress._button_D, 0.5, 0.75)
    -- DECOMPILER ERROR at PC169: Confused about usage of register: R2 in 'UnsetPending'

    ui_Value.isFirstTime_Manual_Fishing_2 = false
  end
end

local FishingGame_Manual_Fishing_3 = function(actorKeyRaw, isSelf)
  -- function num : 0_11 , upvalues : ui_Value, uiPress, fishing_UI, gameOptionActionKey
  local selfplayer = getSelfPlayer()
  if selfplayer == nil then
    return 
  end
  local autoFishingEnalbe = (selfplayer:get()):isAutoFishingable()
  if ui_Value.isFirstTime_Manual_Fishing_3 == true then
    for _,v in pairs(uiPress) do
      v:SetShow(false)
      v:ComputePos()
    end
    audioPostEvent_SystemUi(11, 6)
    local leftTimeForAuto = ((math.floor)(Int64toInt32(((getSelfPlayer()):get()):getFishingAutoLeftTime()) / 1000))
    local leftMinute = nil
    if (math.floor)(leftTimeForAuto / 60) > 0 then
      leftMinute = " (" .. PAGetString(Defines.StringSheet_RESOURCE, "PANEL_PARTY_MATCH_TIME") .. " " .. PAGetStringParam1(Defines.StringSheet_GAME, "BUFF_MINUTE", "time_minute", (math.floor)(leftTimeForAuto / 60)) .. ")"
    else
      leftMinute = " (" .. PAGetString(Defines.StringSheet_RESOURCE, "PANEL_PARTY_MATCH_TIME") .. " " .. PAGetString(Defines.StringSheet_GAME, "LUA_TERRITORYAUTHORITY_AUCTION_UNDER_ONEMINUTE") .. ")"
    end
    ;
    (fishing_UI._purposeText):SetShow(true)
    ;
    (fishing_UI._purposeText):AddEffect("UI_QustComplete01", false, 0, 0)
    local actionString = ""
    if getGamePadEnable() then
      actionString = keyCustom_GetString_ActionPad(gameOptionActionKey.Jump)
    else
      actionString = keyCustom_GetString_ActionKey(gameOptionActionKey.Jump)
    end
    ;
    (fishing_UI._purposeText):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GLOBALMANUAL_FISHING_3", "key", actionString))
    ;
    (fishing_UI._fish_Icon_Title):SetShow(true)
    ;
    (uiPress._button_Space):SetShow(true)
    ;
    (uiPress._button_Space):SetText(actionString)
    ;
    (uiPress._button_Space):SetAlpha(0)
    ;
    (uiPress._button_Space):SetFontAlpha(0)
    ;
    (uiPress._button_Space):SetPosY(160)
    if autoFishingEnalbe then
      (fishing_UI._fishWpDesc):SetShow(true)
      ;
      (fishing_UI._fishWpDesc):SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_GLOBAL_MANUAL_ONLYFISHWPDESC") .. leftMinute)
    else
      ;
      (fishing_UI._fishWpDesc):SetShow(false)
      ;
      (fishing_UI._fishWpDesc):SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_GLOBAL_MANUAL_ONLYFISHWPDESC_2"))
    end
    ;
    (UIAni.AlphaAnimation)(1, uiPress._button_Space, 0.5, 0.75)
    -- DECOMPILER ERROR at PC193: Confused about usage of register: R7 in 'UnsetPending'

    ui_Value.isFirstTime_Manual_Fishing_2 = false
  end
end

local FishingGame_Manual_Fishing_Auto = function()
  -- function num : 0_12 , upvalues : uiPress, fishing_UI
  local selfplayer = getSelfPlayer()
  if selfplayer == nil then
    return 
  end
  local autoFishingEnalbe = (selfplayer:get()):isAutoFishingable()
  for _,v in pairs(uiPress) do
    v:SetShow(false)
    v:ComputePos()
  end
  if autoFishingEnalbe then
    (fishing_UI._fishWpDesc):SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_GLOBAL_MANUAL_ONLYFISHWPDESC"))
  else
    ;
    (fishing_UI._fishWpDesc):SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_GLOBAL_MANUAL_ONLYFISHWPDESC_2"))
  end
end

local FishingGame_Manual_CommonGaugeOpen = function()
  -- function num : 0_13
  FGlobal_PowerGuage_StatCheck()
end

local FishingGame_Manual_Fishing_Wait = function(aaa)
  -- function num : 0_14
  if not Panel_PowerGauge:GetShow() then
    FGlobal_PowerGauge_Open()
  end
end

FGlobal_MiniGame_FishingCheck = function()
  -- function num : 0_15 , upvalues : fishing_UI, uiPress
  (fishing_UI._purposeText):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GLOBALMANUAL_FISHING_2"))
  ;
  (uiPress._button_Space):SetShow(false)
end

MiniGame_FishingDescInit = function()
  -- function num : 0_16 , upvalues : fishing_UI, UI_TM
  (fishing_UI._fishWpDesc):SetTextMode(UI_TM.eTextMode_AutoWrap)
  ;
  (fishing_UI._fishWpDesc):SetSize((fishing_UI._fishWpDesc):GetTextSizeX() + 10, (fishing_UI._fishWpDesc):GetTextSizeY() + 10)
end

MiniGame_FishingDescInit()
local MiniGame_Manual_Jaksal_0 = function(actorKeyRaw, isSelf)
  -- function num : 0_17 , upvalues : ui_Value, IsHideMiniGameManual, fishing_UI, uiPress
  if ui_Value.isFirstTime_Manual_Jaksal_0 == true and not IsHideMiniGameManual() then
    for _,v in pairs(fishing_UI) do
      v:SetShow(false)
      v:ComputePos()
    end
    for _,v in pairs(uiPress) do
      v:SetShow(false)
      v:ComputePos()
    end
    Panel_Fishing:SetShow(true)
    Panel_Fishing:SetAlpha(0)
    ;
    (UIAni.AlphaAnimation)(1, Panel_Fishing, 0, 0.22)
    ;
    (fishing_UI._fishBG):SetShow(true)
    ;
    (fishing_UI._fishPercent):SetShow(true)
    ;
    (fishing_UI._fishComment):SetShow(true)
    setFishingResourcePool_text()
    ;
    (fishing_UI._fishBG):SetSize((fishing_UI._fishComment):GetTextSizeX() + 10, (fishing_UI._fishPercent):GetSizeY() + (fishing_UI._fishComment):GetSizeY() + 10)
    ;
    (fishing_UI._purposeText):SetShow(true)
    ;
    (fishing_UI._purposeText):AddEffect("UI_QustComplete01", false, 0, 0)
    ;
    (fishing_UI._purposeText):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GLOBALMANUAL_Fishing_Use"))
    ;
    (fishing_UI._fish_Icon_Title):SetShow(true)
    ;
    (uiPress._button_Space):SetShow(true)
    -- DECOMPILER ERROR at PC114: Confused about usage of register: R2 in 'UnsetPending'

    ui_Value.isFirstTime_Manual_Jaksal_0 = false
  end
  MiniGame_Manual_Value_FishingStart = true
end

local MiniGame_Manual_Jaksal_1 = function(actorKeyRaw, isSelf)
  -- function num : 0_18 , upvalues : ui_Value, uiPress, fishing_UI
  if ui_Value.isFirstTime_Manual_Jaksal_1 == true then
    for _,v in pairs(uiPress) do
      v:SetShow(false)
      v:ComputePos()
    end
    for _,v in pairs(fishing_UI) do
      v:SetShow(false)
      v:ComputePos()
    end
    Panel_Fishing:SetShow(true)
    Panel_Fishing:SetAlpha(0)
    ;
    (UIAni.AlphaAnimation)(1, Panel_Fishing, 0, 0.22)
    ;
    (fishing_UI._fishBG):SetShow(true)
    ;
    (fishing_UI._fishPercent):SetShow(true)
    ;
    (fishing_UI._fishComment):SetShow(true)
    setFishingResourcePool_text()
    ;
    (fishing_UI._fishBG):SetSize((fishing_UI._fishComment):GetTextSizeX() + 10, (fishing_UI._fishPercent):GetSizeY() + (fishing_UI._fishComment):GetSizeY() + 10)
    ;
    (fishing_UI._purposeText):SetShow(true)
    ;
    (fishing_UI._purposeText):AddEffect("UI_QustComplete01", false, 0, 0)
    ;
    (fishing_UI._purposeText):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GLOBALMANUAL_Fishing_Finding"))
    ;
    (fishing_UI._fish_Icon_Title):SetShow(true)
    ;
    (uiPress._button_Space):SetShow(false)
    ;
    (fishing_UI._m0):SetShow(true)
    ;
    (uiPress._m1):SetShow(true)
    ;
    (fishing_UI._mBody):SetShow(true)
    -- DECOMPILER ERROR at PC125: Confused about usage of register: R2 in 'UnsetPending'

    ui_Value.isFirstTime_Manual_Jaksal_0 = true
    -- DECOMPILER ERROR at PC127: Confused about usage of register: R2 in 'UnsetPending'

    ui_Value.isFirstTime_Manual_Jaksal_1 = false
  end
end

local MiniGame_Manual_Jaksal_2 = function(actorKeyRaw, isSelf)
  -- function num : 0_19 , upvalues : ui_Value, uiPress, fishing_UI
  if ui_Value.isFirstTime_Manual_Jaksal_2 == true then
    for _,v in pairs(uiPress) do
      v:SetShow(false)
      v:ComputePos()
    end
    for _,v in pairs(fishing_UI) do
      v:SetShow(false)
      v:ComputePos()
    end
    Panel_Fishing:SetShow(true)
    Panel_Fishing:SetAlpha(0)
    ;
    (UIAni.AlphaAnimation)(1, Panel_Fishing, 0, 0.22)
    ;
    (fishing_UI._fishBG):SetShow(true)
    ;
    (fishing_UI._fishPercent):SetShow(true)
    ;
    (fishing_UI._fishComment):SetShow(true)
    setFishingResourcePool_text()
    ;
    (fishing_UI._fishBG):SetSize((fishing_UI._fishComment):GetTextSizeX() + 10, (fishing_UI._fishPercent):GetSizeY() + (fishing_UI._fishComment):GetSizeY() + 10)
    ;
    (fishing_UI._purposeText):SetShow(true)
    ;
    (fishing_UI._purposeText):AddEffect("UI_QustComplete01", false, 0, 0)
    ;
    (fishing_UI._purposeText):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GLOBALMANUAL_Fishing_Find"))
    ;
    (fishing_UI._fish_Icon_Title):SetShow(true)
    ;
    (uiPress._button_Space):SetShow(true)
    -- DECOMPILER ERROR at PC110: Confused about usage of register: R2 in 'UnsetPending'

    ui_Value.isFirstTime_Manual_Jaksal_0 = true
    -- DECOMPILER ERROR at PC112: Confused about usage of register: R2 in 'UnsetPending'

    ui_Value.isFirstTime_Manual_Jaksal_1 = false
    -- DECOMPILER ERROR at PC114: Confused about usage of register: R2 in 'UnsetPending'

    ui_Value.isFirstTime_Manual_Jaksal_2 = false
  end
end

local MiniGame_Manual_Jaksal_3 = function(actorKeyRaw, isSelf)
  -- function num : 0_20 , upvalues : ui_Value, uiPress, fishing_UI
  if ui_Value.isFirstTime_Manual_Jaksal_3 == true then
    for _,v in pairs(uiPress) do
      v:SetShow(false)
      v:ComputePos()
    end
    for _,v in pairs(fishing_UI) do
      v:SetShow(false)
      v:ComputePos()
    end
    Panel_Fishing:SetShow(true)
    Panel_Fishing:SetAlpha(0)
    ;
    (UIAni.AlphaAnimation)(1, Panel_Fishing, 0, 0.22)
    ;
    (fishing_UI._fishBG):SetShow(true)
    ;
    (fishing_UI._fishPercent):SetShow(true)
    ;
    (fishing_UI._fishComment):SetShow(true)
    setFishingResourcePool_text()
    ;
    (fishing_UI._fishBG):SetSize((fishing_UI._fishComment):GetTextSizeX() + 10, (fishing_UI._fishPercent):GetSizeY() + (fishing_UI._fishComment):GetSizeY() + 10)
    ;
    (fishing_UI._purposeText):SetShow(true)
    ;
    (fishing_UI._purposeText):AddEffect("UI_QustComplete01", false, 0, 0)
    ;
    (fishing_UI._purposeText):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GLOBALMANUAL_Fishing_Sight"))
    ;
    (fishing_UI._fish_Icon_Title):SetShow(true)
    ;
    (uiPress._button_Space):SetShow(true)
    -- DECOMPILER ERROR at PC110: Confused about usage of register: R2 in 'UnsetPending'

    ui_Value.isFirstTime_Manual_Jaksal_0 = true
    -- DECOMPILER ERROR at PC112: Confused about usage of register: R2 in 'UnsetPending'

    ui_Value.isFirstTime_Manual_Jaksal_1 = false
    -- DECOMPILER ERROR at PC114: Confused about usage of register: R2 in 'UnsetPending'

    ui_Value.isFirstTime_Manual_Jaksal_2 = false
    -- DECOMPILER ERROR at PC116: Confused about usage of register: R2 in 'UnsetPending'

    ui_Value.isFirstTime_Manual_Jaksal_3 = false
  end
end

local MiniGame_Manual_Jaksal_4 = function(actorKeyRaw, isSelf)
  -- function num : 0_21 , upvalues : ui_Value, uiPress, fishing_UI
  if ui_Value.isFirstTime_Manual_Jaksal_4 == true then
    for _,v in pairs(uiPress) do
      v:SetShow(false)
      v:ComputePos()
    end
    for _,v in pairs(fishing_UI) do
      v:SetShow(false)
      v:ComputePos()
    end
    Panel_Fishing:SetShow(true)
    Panel_Fishing:SetAlpha(0)
    ;
    (UIAni.AlphaAnimation)(1, Panel_Fishing, 0, 0.22)
    ;
    (fishing_UI._fishBG):SetShow(true)
    ;
    (fishing_UI._fishPercent):SetShow(true)
    ;
    (fishing_UI._fishComment):SetShow(true)
    setFishingResourcePool_text()
    ;
    (fishing_UI._fishBG):SetSize((fishing_UI._fishComment):GetTextSizeX() + 10, (fishing_UI._fishPercent):GetSizeY() + (fishing_UI._fishComment):GetSizeY() + 10)
    ;
    (fishing_UI._purposeText):SetShow(true)
    ;
    (fishing_UI._purposeText):AddEffect("UI_QustComplete01", false, 0, 0)
    ;
    (fishing_UI._purposeText):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GLOBALMANUAL_Fishing_Success"))
    ;
    (fishing_UI._fish_Icon_Title):SetShow(true)
    ;
    (uiPress._button_Space):SetShow(true)
    -- DECOMPILER ERROR at PC110: Confused about usage of register: R2 in 'UnsetPending'

    ui_Value.isFirstTime_Manual_Jaksal_0 = true
    -- DECOMPILER ERROR at PC112: Confused about usage of register: R2 in 'UnsetPending'

    ui_Value.isFirstTime_Manual_Jaksal_1 = false
    -- DECOMPILER ERROR at PC114: Confused about usage of register: R2 in 'UnsetPending'

    ui_Value.isFirstTime_Manual_Jaksal_2 = false
    -- DECOMPILER ERROR at PC116: Confused about usage of register: R2 in 'UnsetPending'

    ui_Value.isFirstTime_Manual_Jaksal_3 = false
    -- DECOMPILER ERROR at PC118: Confused about usage of register: R2 in 'UnsetPending'

    ui_Value.isFirstTime_Manual_Jaksal_4 = false
  end
end

local MiniGame_Manual_Jaksal_5 = function(actorKeyRaw, isSelf)
  -- function num : 0_22 , upvalues : ui_Value, uiPress, fishing_UI
  if ui_Value.isFirstTime_Manual_Jaksal_5 == true then
    for _,v in pairs(uiPress) do
      v:SetShow(false)
      v:ComputePos()
    end
    for _,v in pairs(fishing_UI) do
      v:SetShow(false)
      v:ComputePos()
    end
    Panel_Fishing:SetShow(true)
    Panel_Fishing:SetAlpha(0)
    ;
    (UIAni.AlphaAnimation)(1, Panel_Fishing, 0, 0.22)
    ;
    (fishing_UI._fishBG):SetShow(true)
    ;
    (fishing_UI._fishPercent):SetShow(true)
    ;
    (fishing_UI._fishComment):SetShow(true)
    setFishingResourcePool_text()
    ;
    (fishing_UI._fishBG):SetSize((fishing_UI._fishComment):GetTextSizeX() + 10, (fishing_UI._fishPercent):GetSizeY() + (fishing_UI._fishComment):GetSizeY() + 10)
    ;
    (fishing_UI._purposeText):SetShow(true)
    ;
    (fishing_UI._purposeText):AddEffect("UI_QustComplete01", false, 0, 0)
    ;
    (fishing_UI._purposeText):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GLOBALMANUAL_Fishing_Fail"))
    ;
    (fishing_UI._fish_Icon_Title):SetShow(true)
    ;
    (uiPress._button_Space):SetShow(true)
    -- DECOMPILER ERROR at PC110: Confused about usage of register: R2 in 'UnsetPending'

    ui_Value.isFirstTime_Manual_Jaksal_0 = true
    -- DECOMPILER ERROR at PC112: Confused about usage of register: R2 in 'UnsetPending'

    ui_Value.isFirstTime_Manual_Jaksal_1 = false
    -- DECOMPILER ERROR at PC114: Confused about usage of register: R2 in 'UnsetPending'

    ui_Value.isFirstTime_Manual_Jaksal_2 = false
    -- DECOMPILER ERROR at PC116: Confused about usage of register: R2 in 'UnsetPending'

    ui_Value.isFirstTime_Manual_Jaksal_3 = false
    -- DECOMPILER ERROR at PC118: Confused about usage of register: R2 in 'UnsetPending'

    ui_Value.isFirstTime_Manual_Jaksal_4 = false
    -- DECOMPILER ERROR at PC120: Confused about usage of register: R2 in 'UnsetPending'

    ui_Value.isFirstTime_Manual_Jaksal_5 = false
  end
end

Panel_Fishing_End = function(actorKeyRaw, isSelf)
  -- function num : 0_23 , upvalues : uiPress, ui_Value
  if isSelf == false then
    return 
  end
  ;
  (uiPress._button_Space):ComputePos()
  Panel_Fishing:SetShow(false)
  FGlobal_EquipFishingToolCheck()
  -- DECOMPILER ERROR at PC14: Confused about usage of register: R2 in 'UnsetPending'

  ui_Value.isFirstTime_Manual_Fishing_Start = true
  -- DECOMPILER ERROR at PC16: Confused about usage of register: R2 in 'UnsetPending'

  ui_Value.isFirstTime_Manual_Fishing_0 = true
  -- DECOMPILER ERROR at PC18: Confused about usage of register: R2 in 'UnsetPending'

  ui_Value.isFirstTime_Manual_Fishing_1 = true
  -- DECOMPILER ERROR at PC20: Confused about usage of register: R2 in 'UnsetPending'

  ui_Value.isFirstTime_Manual_Fishing_2 = true
  -- DECOMPILER ERROR at PC22: Confused about usage of register: R2 in 'UnsetPending'

  ui_Value.isFirstTime_Manual_Fishing_3 = true
  -- DECOMPILER ERROR at PC24: Confused about usage of register: R2 in 'UnsetPending'

  ui_Value.isFirstTime_Manual_Jaksal_0 = true
  -- DECOMPILER ERROR at PC26: Confused about usage of register: R2 in 'UnsetPending'

  ui_Value.isFirstTime_Manual_Jaksal_1 = true
  -- DECOMPILER ERROR at PC28: Confused about usage of register: R2 in 'UnsetPending'

  ui_Value.isFirstTime_Manual_Jaksal_2 = true
  -- DECOMPILER ERROR at PC30: Confused about usage of register: R2 in 'UnsetPending'

  ui_Value.isFirstTime_Manual_Jaksal_3 = true
  -- DECOMPILER ERROR at PC32: Confused about usage of register: R2 in 'UnsetPending'

  ui_Value.isFirstTime_Manual_Jaksal_4 = true
  -- DECOMPILER ERROR at PC34: Confused about usage of register: R2 in 'UnsetPending'

  ui_Value.isFirstTime_Manual_Jaksal_5 = true
  MiniGame_Manual_Value_FishingStart = false
  if Panel_PowerGauge:GetShow() then
    FGlobal_PowerGauge_Close()
  end
  if Panel_CannonGauge:GetShow() then
    FGlobal_CannonGauge_Close()
  end
end

local MiniGame_Manual_CannonGaugeOpen = function()
  -- function num : 0_24
  if not Panel_Stamina:GetShow() then
    FGlobal_CannonGauge_Open()
  end
end

ActionChartEventBindFunction(211, FishingGame_Manual_Fishing_0)
ActionChartEventBindFunction(212, FishingGame_Manual_Fishing_1)
ActionChartEventBindFunction(213, FishingGame_Manual_Fishing_2)
ActionChartEventBindFunction(214, FishingGame_Manual_Fishing_Start)
ActionChartEventBindFunction(215, FishingGame_Manual_Fishing_3)
ActionChartEventBindFunction(216, FishingGame_Manual_CommonGaugeOpen)
ActionChartEventBindFunction(217, MiniGame_Manual_CannonGaugeOpen)
ActionChartEventBindFunction(218, FishingGame_Manual_Fishing_Auto)
ActionChartEventBindFunction(219, FishingGame_Manual_Fishing_Wait)
ActionChartEventBindFunction(281, MiniGame_Manual_Jaksal_0)
ActionChartEventBindFunction(282, MiniGame_Manual_Jaksal_1)
ActionChartEventBindFunction(283, MiniGame_Manual_Jaksal_2)
ActionChartEventBindFunction(284, MiniGame_Manual_Jaksal_3)
ActionChartEventBindFunction(285, MiniGame_Manual_Jaksal_4)
ActionChartEventBindFunction(286, MiniGame_Manual_Jaksal_5)

