-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\charactertag\panel_icon_charactertag.luac 

-- params : ...
-- function num : 0
local Button_CharacterTag = nil
local isOpenCharacterTag = ToClient_IsContentsGroupOpen("330")
local isAlreadyTaging = false
local hasAwakenCharacter = false
PaGlobal_CharacterTag_CheckShow = function()
  -- function num : 0_0
  local size = getCharacterDataCount()
  local isAlreadyTaging = 0
  local hasAwakenCharacter = false
  local returnBool = false
  local player = getSelfPlayer()
  if player == nil then
    return 
  end
  local curLevel = (player:get()):getLevel()
  for ii = 0, size - 1 do
    local characterData = getCharacterDataByIndex(ii)
    if characterData ~= nil then
      local duelChar_No_s32 = Int64toInt32(characterData._duelCharacterNo)
      local char_Level = characterData._level
      if char_Level > 55 then
        hasAwakenCharacter = true
      end
      if char_Level > 1 and duelChar_No_s32 ~= -1 then
        isAlreadyTaging = isAlreadyTaging + 1
      end
    end
  end
  do
    if isAlreadyTaging > 1 or hasAwakenCharacter == true or curLevel > 55 then
      returnBool = true
    end
    return returnBool
  end
end

PaGlobal_CharacterTag_SetPosIcon = function()
  -- function num : 0_1 , upvalues : Button_CharacterTag, isOpenCharacterTag
  if isFlushedUI() then
    return 
  end
  if Button_CharacterTag == nil then
    return 
  end
  if PaGlobal_TutorialManager:isDoingTutorial() == true then
    return 
  end
  if PaGlobal_CharacterTag_CheckShow() == false then
    Panel_Icon_CharacterTag:SetShow(false)
    return 
  end
  if isOpenCharacterTag == true then
    local posX, posY = nil, nil
    if Panel_Icon_Camp:GetShow() then
      posX = Panel_Icon_Camp:GetPosX() + Panel_Icon_Camp:GetSizeX() - 3
      posY = Panel_Icon_Camp:GetPosY()
    else
      if Panel_Icon_Duel:GetShow() then
        posX = Panel_Icon_Duel:GetPosX() + Panel_Icon_Duel:GetSizeX() - 3
        posY = Panel_Icon_Duel:GetPosY()
      else
        if Panel_Icon_Maid:GetShow() then
          posX = Panel_Icon_Maid:GetPosX() + Panel_Icon_Maid:GetSizeX() - 3
          posY = Panel_Icon_Maid:GetPosY()
        else
          if Panel_Window_PetIcon:GetShow() then
            posX = Panel_Window_PetIcon:GetPosX() + Panel_Window_PetIcon:GetSizeX() - 3
            posY = Panel_Window_PetIcon:GetPosY()
          else
            if Panel_Icon_Camp:GetShow() then
              posX = Panel_Icon_Camp:GetPosX() + Panel_Icon_Camp:GetSizeX() - 3
              posY = Panel_Icon_Camp:GetPosY()
            else
              if Panel_Blackspirit_OnOff:GetShow() then
                posX = Panel_Blackspirit_OnOff:GetPosX() + Panel_Blackspirit_OnOff:GetSizeX() - 3
                posY = Panel_Blackspirit_OnOff:GetPosY()
              else
                if FGlobal_HouseIconCount() > 0 and Panel_MyHouseNavi:GetShow() then
                  posX = Panel_MyHouseNavi:GetPosX() + 60 * FGlobal_HouseIconCount() - 3
                  posY = Panel_MyHouseNavi:GetPosY()
                else
                  if FGlobal_ServantIconCount() > 0 and Panel_Window_Servant:GetShow() then
                    posX = Panel_Window_Servant:GetPosX() + 60 * FGlobal_ServantIconCount() - 3
                    posY = Panel_Window_Servant:GetPosY()
                  else
                    posX = 0
                    posY = Panel_SelfPlayerExpGage:GetPosY() + Panel_SelfPlayerExpGage:GetSizeY() + 15
                  end
                end
              end
            end
          end
        end
      end
    end
    Panel_Icon_CharacterTag:SetShow(true)
    Panel_Icon_CharacterTag:SetPosX(posX)
    Panel_Icon_CharacterTag:SetPosY(posY)
  else
    do
      Panel_Icon_CharacterTag:SetShow(false)
      PaGlobal_Fairy_SetPosIcon()
    end
  end
end

PaGlobal_CharacterTag_IconMouseToolTip = function(isShow)
  -- function num : 0_2 , upvalues : Button_CharacterTag
  if not isShow then
    TooltipSimple_Hide()
    return 
  end
  local name, desc, control = nil, nil, nil
  name = PAGetString(Defines.StringSheet_GAME, "LUA_TAG")
  desc = PAGetString(Defines.StringSheet_GAME, "LUA_TAGCHAR_ICON_TOOLTIP_DESC")
  control = Button_CharacterTag
  TooltipSimple_Show(control, name, desc)
end

InitializeTagIcon = function()
  -- function num : 0_3 , upvalues : Button_CharacterTag
  Panel_Icon_CharacterTag:SetIgnore(false)
  Panel_Icon_CharacterTag:SetShow(true)
  Button_CharacterTag = (UI.getChildControl)(Panel_Icon_CharacterTag, "Button_TagIcon")
  Button_CharacterTag:ActiveMouseEventEffect(true)
  Button_CharacterTag:addInputEvent("Mouse_LUp", "PaGlobal_CharacterTag_Open()")
  Button_CharacterTag:addInputEvent("Mouse_RUp", "PaGlobal_TagCharacter_Change()")
  Button_CharacterTag:addInputEvent("Mouse_Out", "PaGlobal_CharacterTag_IconMouseToolTip(false)")
  Button_CharacterTag:addInputEvent("Mouse_On", "PaGlobal_CharacterTag_IconMouseToolTip(true)")
  PaGlobal_CharacterTag_SetPosIcon()
end

FromClient_Tag_SelfPlayerLevelUp = function()
  -- function num : 0_4
  local player = getSelfPlayer()
  if player == nil then
    return 
  end
  local curLevel = (player:get()):getLevel()
  if curLevel > 55 and Panel_Icon_CharacterTag:GetShow() == false then
    PaGlobal_CharacterTag_SetPosIcon()
  end
end

registerEvent("FromClient_luaLoadComplete", "InitializeTagIcon")
registerEvent("EventSelfPlayerLevelUp", "FromClient_Tag_SelfPlayerLevelUp")

