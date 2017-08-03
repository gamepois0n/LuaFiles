-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\widget\gametips\panel_gametips.luac 

-- params : ...
-- function num : 0
Panel_GameTips:ActiveMouseEventEffect(true)
Panel_GameTips:setGlassBackground(true)
Panel_GameTips:SetShow(true)
Panel_GameTipMask:setMaskingChild(true)
Panel_GameTipMask:SetShow(true)
Panel_GameTips:SetDragEnable(false)
local msgCount = 319
local MessageData = {}
local txt_GameTip = (UI.getChildControl)(Panel_GameTips, "StaticText_Tip")
gameTip_setMessageData = function()
  -- function num : 0_0 , upvalues : msgCount, MessageData
  for idx = 1, msgCount do
    -- DECOMPILER ERROR at PC12: Confused about usage of register: R4 in 'UnsetPending'

    MessageData[idx] = PAGetString(Defines.StringSheet_GAME, "LUA_GAMETIPS_MESSAGE" .. idx)
  end
end

gameTip_setMessageData()
local gameTips_Message = {(UI.getChildControl)(Panel_GameTipMask, "StaticText_GameTips_Content1"), (UI.getChildControl)(Panel_GameTipMask, "StaticText_GameTips_Content2"), (UI.getChildControl)(Panel_GameTipMask, "StaticText_GameTips_Content3")}
;
(gameTips_Message[1]):SetText(MessageData[1])
;
(gameTips_Message[2]):SetText(MessageData[1])
;
(gameTips_Message[3]):SetText(MessageData[1])
local gameTipsBG = (UI.getChildControl)(Panel_GameTips, "Static_GameTipsBG")
local elapsedTime = 0
local nowPlayingIndex = 1
local textIndex = 1
local const = {textChangeTime = 60, controlCount = #gameTips_Message, textOffset = 100, fixStartPosX = 100}
gameTip_init = function()
  -- function num : 0_1 , upvalues : gameTips_Message, txt_GameTip
  for i = 1, #gameTips_Message do
    (gameTips_Message[i]):SetIgnore(true)
  end
  Panel_GameTipMask:addInputEvent("Mouse_LUp", "FGlobal_GameTipsShow()")
  txt_GameTip:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GAMETIPS_TIP"))
end

gameTip_aniPlay = function(deltaTime)
  -- function num : 0_2 , upvalues : gameTips_Message, nowPlayingIndex, const, MessageData, textIndex
  local firstControl = gameTips_Message[nowPlayingIndex]
  local posX = firstControl:GetPosX()
  posX = posX - const.fixStartPosX / 3 * deltaTime
  for index = 0, const.controlCount - 1 do
    local targetControl = gameTips_Message[(nowPlayingIndex + index - 1) % const.controlCount + 1]
    targetControl:SetPosX(posX)
    posX = posX + targetControl:GetTextSizeX() + const.textOffset
  end
  if firstControl:GetPosX() + firstControl:GetTextSizeX() < 0 then
    firstControl:SetText(MessageData[textIndex])
    nowPlayingIndex = nowPlayingIndex % const.controlCount + 1
  end
end

GameTips_MessageUpdate = function(deltaTime)
  -- function num : 0_3 , upvalues : elapsedTime, const, textIndex, MessageData
  if not Panel_GameTips:GetShow() then
    return 
  end
  elapsedTime = elapsedTime + deltaTime
  if const.textChangeTime < elapsedTime then
    elapsedTime = elapsedTime - const.textChangeTime
    textIndex = textIndex % #MessageData + 1
  end
  gameTip_aniPlay(deltaTime)
end

GameTips_Reposition = function()
  -- function num : 0_4
  Panel_GameTips:SetPosX(4)
  Panel_GameTips:SetPosY(getScreenSizeY() - Panel_GameTips:GetSizeY() + 12)
  Panel_GameTipMask:SetPosX(30)
  Panel_GameTipMask:SetPosY(getScreenSizeY() - Panel_GameTipMask:GetSizeY() - 8)
end

GameTips_Show = function()
  -- function num : 0_5
  Panel_GameTips:SetShow(true)
  Panel_GameTipMask:SetShow(true)
end

GameTips_Hide = function()
  -- function num : 0_6
  Panel_GameTips:SetShow(false)
  Panel_GameTipMask:SetShow(false)
end

gameTip_init()
GameTips_Reposition()
registerEvent("onScreenResize", "GameTips_Reposition")
changePositionBySever(Panel_GameTips, (CppEnums.PAGameUIType).PAGameUIPanel_GameTips, true, false, false)
changePositionBySever(Panel_GameTipMask, (CppEnums.PAGameUIType).PAGameUIPanel_GameTips, true, false, false)

