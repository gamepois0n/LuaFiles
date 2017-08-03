-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\widget\tutorial\panel_rescueshipbubble.luac 

-- params : ...
-- function num : 0
local UI_TM = CppEnums.TextMode
local VCK = CppEnums.VirtualKeyCode
local UI_color = Defines.Color
local UI_classType = CppEnums.ClassType
local IM = CppEnums.EProcessorInputMode
local _updateTime = 0
local _stepNo = 0
local _randomIndex = -1
local rescueShip_Texture = "UI_Artwork/gumumdal_rescueman.dds"
local ui = {_obsidian = (UI.getChildControl)(Panel_RescueShip, "Static_Obsidian"), _obsidian_B = (UI.getChildControl)(Panel_RescueShip, "Static_Obsidian_B"), _obsidian_B_Left = (UI.getChildControl)(Panel_RescueShip, "Static_Obsidian_B_Left"), _obsidian_Text = (UI.getChildControl)(Panel_RescueShip, "StaticText_Obsidian_B"), _obsidian_Text_2 = (UI.getChildControl)(Panel_RescueShip, "StaticText_Obsidian_B_2")}
;
(ui._obsidian):ChangeTextureInfoName(rescueShip_Texture)
local ui_Show = function(isShow)
  -- function num : 0_0 , upvalues : ui
  for v,control in pairs(ui) do
    control:SetShow(isShow)
  end
end

ui_Show(false)
local rescueShip_Desc = {
[401] = {
[0] = {PAGetString(Defines.StringSheet_GAME, "LUA_NPC_RESCUE_2"); [0] = PAGetString(Defines.StringSheet_GAME, "LUA_NPC_RESCUE_1")}
}
, 
[402] = {
[0] = {PAGetString(Defines.StringSheet_GAME, "LUA_NPC_RESCUESONG_02"), PAGetString(Defines.StringSheet_GAME, "LUA_NPC_RESCUESONG_03"), PAGetString(Defines.StringSheet_GAME, "LUA_NPC_RESCUESONG_04"), PAGetString(Defines.StringSheet_GAME, "LUA_NPC_RESCUESONG_END"); [0] = PAGetString(Defines.StringSheet_GAME, "LUA_NPC_RESCUESONG_01")}
, 
[1] = {PAGetString(Defines.StringSheet_GAME, "LUA_NPC_RESCUESONG_06"), PAGetString(Defines.StringSheet_GAME, "LUA_NPC_RESCUESONG_07"), PAGetString(Defines.StringSheet_GAME, "LUA_NPC_RESCUESONG_08"), PAGetString(Defines.StringSheet_GAME, "LUA_NPC_RESCUESONG_END"); [0] = PAGetString(Defines.StringSheet_GAME, "LUA_NPC_RESCUESONG_05")}
, 
[2] = {PAGetString(Defines.StringSheet_GAME, "LUA_NPC_RESCUESONG_10"), PAGetString(Defines.StringSheet_GAME, "LUA_NPC_RESCUESONG_11"), PAGetString(Defines.StringSheet_GAME, "LUA_NPC_RESCUESONG_12"), PAGetString(Defines.StringSheet_GAME, "LUA_NPC_RESCUESONG_END"); [0] = PAGetString(Defines.StringSheet_GAME, "LUA_NPC_RESCUESONG_09")}
, 
[3] = {PAGetString(Defines.StringSheet_GAME, "LUA_NPC_RESCUESONG_14"), PAGetString(Defines.StringSheet_GAME, "LUA_NPC_RESCUESONG_15"), PAGetString(Defines.StringSheet_GAME, "LUA_NPC_RESCUESONG_16"), PAGetString(Defines.StringSheet_GAME, "LUA_NPC_RESCUESONG_END"); [0] = PAGetString(Defines.StringSheet_GAME, "LUA_NPC_RESCUESONG_13")}
, 
[4] = {PAGetString(Defines.StringSheet_GAME, "LUA_NPC_RESCUESONG_18"), PAGetString(Defines.StringSheet_GAME, "LUA_NPC_RESCUESONG_19"), PAGetString(Defines.StringSheet_GAME, "LUA_NPC_RESCUESONG_20"), PAGetString(Defines.StringSheet_GAME, "LUA_NPC_RESCUESONG_END"); [0] = PAGetString(Defines.StringSheet_GAME, "LUA_NPC_RESCUESONG_17")}
}
, 
[403] = {
[0] = {PAGetString(Defines.StringSheet_GAME, "LUA_NPC_RESCUE_4"); [0] = PAGetString(Defines.StringSheet_GAME, "LUA_NPC_RESCUE_3")}
}
}
local isOpen = false
local descCount = 0
local basePosX = Panel_SelfPlayerExpGage:GetPosX() + Panel_SelfPlayerExpGage:GetSizeX() + 150
local basePosY = Panel_SelfPlayerExpGage:GetPosY() + Panel_SelfPlayerExpGage:GetSizeY() + 50
local updateDeltaTime_RescueShip = function(deltaTime, index)
  -- function num : 0_1 , upvalues : _updateTime, ui, rescueShip_Desc, _randomIndex, basePosX, basePosY
  _updateTime = _updateTime + deltaTime
  if index == 1 then
    if _updateTime < 4 then
      (ui._obsidian_Text):SetText(((rescueShip_Desc[401])[0])[0])
    else
      if _updateTime < 8 then
        (ui._obsidian_Text):SetText(((rescueShip_Desc[401])[0])[1])
      else
        Panel_RescueShip_Close()
        _updateTime = 0
      end
    end
  else
    if index == 2 then
      if _updateTime < 3 then
        (ui._obsidian_Text):SetText(((rescueShip_Desc[402])[_randomIndex])[0])
      else
        if _updateTime < 6 then
          (ui._obsidian_Text):SetText(((rescueShip_Desc[402])[_randomIndex])[1])
        else
          if _updateTime < 9 then
            (ui._obsidian_Text):SetText(((rescueShip_Desc[402])[_randomIndex])[2])
          else
            if _updateTime < 12 then
              (ui._obsidian_Text):SetText(((rescueShip_Desc[402])[_randomIndex])[3])
            else
              if _updateTime < 15 then
                (ui._obsidian_Text):SetText(((rescueShip_Desc[402])[_randomIndex])[4])
              else
                Panel_RescueShip_Close()
                _updateTime = 0
              end
            end
          end
        end
      end
    else
      if index == 3 then
        if _updateTime < 4 then
          (ui._obsidian_Text):SetText(((rescueShip_Desc[403])[0])[0])
        else
          if _updateTime < 8 then
            (ui._obsidian_Text):SetText(((rescueShip_Desc[403])[0])[1])
          else
            Panel_RescueShip_Close()
            _updateTime = 0
          end
        end
      else
        Panel_RescueShip_Close()
      end
    end
  end
  ;
  (ui._obsidian):SetPosX(basePosX - (ui._obsidian):GetSizeX())
  ;
  (ui._obsidian):SetPosY(basePosY - (ui._obsidian):GetSizeY() + 60)
  ;
  (ui._obsidian_B):SetPosX(basePosX)
  ;
  (ui._obsidian_B):SetPosY(basePosY)
  ;
  (ui._obsidian_Text):SetPosX(basePosX + 3)
  ;
  (ui._obsidian_Text):SetPosY(basePosY + 35)
  ;
  (ui._obsidian_B):SetSize((ui._obsidian_Text):GetTextSizeX() + 20, (ui._obsidian_Text):GetTextSizeY() + 55)
end

RescueShip_BubbleMessage_1 = function()
  -- function num : 0_2 , upvalues : _updateTime, _stepNo, ui_Show, ui
  _updateTime = 0
  _stepNo = 1
  ui_Show(true)
  ;
  (ui._obsidian_B_Left):SetShow(false)
  ;
  (ui._obsidian_Text_2):SetShow(false)
  Panel_RescueShip:SetShow(true)
end

RescueShip_BubbleMessage_2 = function()
  -- function num : 0_3 , upvalues : _randomIndex, _updateTime, _stepNo, ui_Show, ui
  _randomIndex = (math.floor)((math.random)(0, 4))
  _updateTime = 0
  _stepNo = 2
  ui_Show(true)
  ;
  (ui._obsidian_B_Left):SetShow(false)
  ;
  (ui._obsidian_Text_2):SetShow(false)
  Panel_RescueShip:SetShow(true)
end

RescueShip_BubbleMessage_3 = function()
  -- function num : 0_4 , upvalues : _updateTime, _stepNo, ui_Show, ui
  _updateTime = 0
  _stepNo = 3
  ui_Show(true)
  ;
  (ui._obsidian_B_Left):SetShow(false)
  ;
  (ui._obsidian_Text_2):SetShow(false)
  Panel_RescueShip:SetShow(true)
end

Panel_RescueShip_Close = function()
  -- function num : 0_5
  Panel_RescueShip:SetShow(false)
end

Panel_RescueShip_doStep = function(deltaTime)
  -- function num : 0_6 , upvalues : _stepNo, updateDeltaTime_RescueShip
  if _stepNo == 1 then
    updateDeltaTime_RescueShip(deltaTime, 1)
  else
    if _stepNo == 2 then
      updateDeltaTime_RescueShip(deltaTime, 2)
    else
      if _stepNo == 3 then
        updateDeltaTime_RescueShip(deltaTime, 3)
      end
    end
  end
end

RescueShip_ScreenRePosition = function()
  -- function num : 0_7 , upvalues : ui
  local scrX = getScreenSizeX()
  local scrY = getScreenSizeY()
  Panel_RescueShip:SetSize(scrX, scrY)
  Panel_RescueShip:SetPosX(0)
  Panel_RescueShip:SetPosY(0)
  for key,value in pairs(ui) do
    value:ComputePos()
  end
end

registerEvent("onScreenResize", "RescueShip_ScreenRePosition")
Panel_RescueShip:RegisterUpdateFunc("Panel_RescueShip_doStep")
ActionChartEventBindFunction(401, RescueShip_BubbleMessage_1)
ActionChartEventBindFunction(402, RescueShip_BubbleMessage_2)
ActionChartEventBindFunction(403, RescueShip_BubbleMessage_3)

